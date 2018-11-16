package Control;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import com.google.gson.*;


import Model.*;

/**
 * Servlet implementation class ProductControl
 */
public class AdminControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/*private RequestDispatcher dispatcher;*/

	// ProductModelDS usa il DataSource
	// ProductModelDM usa il DriverManager	
	static boolean isDataSource = true;
	
	static UserModel model;
	static ProductModel model1;
	static OrdineModel model2;
	static {
		if (isDataSource) {
			model = new UserModelDS();
			model1 = new ProductModelDS();
			model2= new OrdineModelDS();
		}
	}
	
	public AdminControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin.jsp");
		 String nuovi=(String)request.getSession().getAttribute("nuovi");
		 String modificato=(String)request.getSession().getAttribute("modificato");
		 String rimosso=(String)request.getSession().getAttribute("rimosso");

		 String action = request.getParameter("action");
		 List<ProductBean> prodottis=(List<ProductBean>)request.getSession().getAttribute("prodottis");

			if (action != null) {
				if(action.equalsIgnoreCase("inserisci")){
					String cod = request.getParameter("cod");
					String mar = request.getParameter("mar");
					String col = request.getParameter("col");
					String gen = request.getParameter("gen");
					String tip = request.getParameter("tip");
					String pre1 = request.getParameter("pre");
					String sco1 = request.getParameter("sco");
					String qua1 = request.getParameter("qua");
					String cat = request.getParameter("cat");
					String car = request.getParameter("car");
					String inf = request.getParameter("inf");
					int pre=0,sco=0,qua=0;
					if(pre1!="" && sco1!="" && qua1!=""){
						pre=Integer.parseInt(pre1);
						sco=Integer.parseInt(sco1);

						qua=Integer.parseInt(qua1);

					}
					if(cod!=null && !cod.equalsIgnoreCase("") ){
						try {
							ProductBean bean=model1.doRetrieveByKey(cod);
							System.out.println(bean);
							if(bean.getCodice().equalsIgnoreCase("")){
								ProductBean nuovo=new ProductBean(cod,mar,col,gen,tip,pre,sco,qua,cat,car,inf);
								model1.doSave(nuovo);
								nuovi="si";
								request.getSession().setAttribute("nuovi", nuovi);
								System.out.println("si");
								dispatcher = getServletContext().getRequestDispatcher("/Admin.jsp");
							}
							else{
								nuovi="no";
								System.out.println("si1");

								request.getSession().setAttribute("nuovi", nuovi);
								dispatcher = getServletContext().getRequestDispatcher("/Admin.jsp");
							}
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
							
						}
					}
					else{
						nuovi="no";
						System.out.println("siewqwqe1");
						request.getSession().setAttribute("nuovi", nuovi);
						dispatcher = getServletContext().getRequestDispatcher("/AdminInserisci.jsp");
					}
				}
				else if(action.equalsIgnoreCase("modifica")){
					
					String codmod = request.getParameter("codmod");
					List<String> valori=new ArrayList<>();

					String cod = request.getParameter("cod");
					valori.add(cod);
					String mar = request.getParameter("mar");
					valori.add(mar);

					String col = request.getParameter("col");
					valori.add(col);

					String gen = request.getParameter("gen");
					valori.add(gen);

					String tip = request.getParameter("tip");
					valori.add(tip);

					String pre1 = request.getParameter("pre");
					valori.add(pre1);

					String sco1 = request.getParameter("sco");
					valori.add(sco1);

					String qua1 = request.getParameter("qua");
					valori.add(qua1);

					String cat = request.getParameter("cat");
					valori.add(cat);

					String car = request.getParameter("car");
					valori.add(car);

					String inf = request.getParameter("inf");
					valori.add(inf);

					
					double pre=0;
					int sco=0,qua=0;
					if(pre1!="" ){
						pre=Double.parseDouble(pre1);
					}
					if(sco1!="" ){
						sco=Integer.parseInt(sco1);
					}
					if(qua1!="" ){
						qua=Integer.parseInt(qua1);
					}
						
					ProductBean bean=new ProductBean();
					try {
						bean = model1.doRetrieveByKey(codmod);
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
						System.out.println("stackq");

					}
					
							if(bean.getCodice().equalsIgnoreCase("")){
								System.out.println("non trovo");
								modificato="no";
								request.getSession().setAttribute("modificato", modificato);
								System.out.println("si");
								dispatcher = getServletContext().getRequestDispatcher("/Admin.jsp");
							}
							else if(!bean.getCodice().equalsIgnoreCase("")){
									if(valori.get(0).equalsIgnoreCase(""))
										cod=bean.getCodice();
									if(valori.get(1).equalsIgnoreCase(""))
										mar=bean.getMarca();
									if(valori.get(2).equalsIgnoreCase(""))
										col=bean.getColoreMontatura();
									if(valori.get(3).equalsIgnoreCase(""))
										gen=bean.getGenere();
									if(valori.get(4).equalsIgnoreCase(""))
										tip=bean.getTipo();
									if(valori.get(5).equalsIgnoreCase(""))
										pre=bean.getPrezzo();
									if(valori.get(6).equalsIgnoreCase(""))
										sco=bean.getSconto();
									if(valori.get(7).equalsIgnoreCase(""))
										qua=bean.getQuantita();
									if(valori.get(8).equalsIgnoreCase(""))
										cat=bean.getImmagine();
									if(valori.get(9).equalsIgnoreCase(""))
										car=bean.getImmagineC();
									if(valori.get(10).equalsIgnoreCase(""))
										inf=bean.getImmagineInfo();
									try {
										model1.doDelete(codmod);
									} catch (SQLException e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
										System.out.println("stack111");

									}
									ProductBean edit1=new ProductBean(cod,mar,col,gen,tip,pre,sco,qua,cat,car,inf);
									try {
										model1.doSave(edit1);
									} catch (SQLException e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
										System.out.println("stack");

									}
									modificato="si";
									request.getSession().setAttribute("modificato", modificato);
									System.out.println("sifine");
									dispatcher = getServletContext().getRequestDispatcher("/Admin.jsp");
								
							}
						

					
					
					
				
				
					
				}
				else if(action.equalsIgnoreCase("rimuovi")){
					String codrim = request.getParameter("codrim");
					if(codrim!=null && !codrim.equalsIgnoreCase("")){
						ProductBean bean=new ProductBean();
						try {
							bean = model1.doRetrieveByKey(codrim);
						} catch (SQLException e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
							System.out.println("stackq");

						}
						if(bean.getCodice().equalsIgnoreCase("")){
							System.out.println("non trovo");
							rimosso="no";
							request.getSession().setAttribute("rimosso", rimosso);
							System.out.println("si");
							dispatcher = getServletContext().getRequestDispatcher("/Admin.jsp");
						}
						else if(!bean.getCodice().equalsIgnoreCase("")){
							try {
								model1.doDelete(codrim);
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							rimosso="si";
							request.getSession().setAttribute("rimosso", rimosso);
							System.out.println("si");
							dispatcher = getServletContext().getRequestDispatcher("/Admin.jsp");
						}
					}
					else if(codrim!=null && codrim.equalsIgnoreCase("")){
					
						rimosso="no";
						request.getSession().setAttribute("rimosso", rimosso);
						System.out.println("si");
						dispatcher = getServletContext().getRequestDispatcher("/Admin.jsp");
					}

				}
			}
		
		
		String sort = request.getParameter("sort");

		try {
			request.setAttribute("products", model1.doRetrieveAll(""));
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		
		
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
