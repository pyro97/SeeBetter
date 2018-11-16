package Control;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
public class UserControl extends HttpServlet {
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
	
	public UserControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Home.jsp");
		Cart cart = (Cart)request.getSession().getAttribute("cart");
		UserBean userLog = (UserBean)request.getSession().getAttribute("userLog");
	    List<OrdineBean> ordini=(List<OrdineBean>)request.getSession().getAttribute("ordini");
	    List<OrdineBean> listaOrdini=(List<OrdineBean>)request.getSession().getAttribute("listaOrdini");
	    List<ProductBean> prodottis=(List<ProductBean>)request.getSession().getAttribute("prodottis");
	    String mod=(String)request.getAttribute("mod");

		String azione="";
		String loggato="";
		String logout=request.getParameter("logout");
	    String infoOrdini=(String)request.getSession().getAttribute("infoOrdini");
		
		if(cart == null) {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		if(userLog == null) {
			userLog = new UserBean();
			request.getSession().setAttribute("userLog", userLog);
		}
	
			azione=(String) request.getSession().getAttribute("azione");
			loggato=(String) request.getSession().getAttribute("loggato");

			System.out.println(azione+azione+loggato);
			
		
		if(logout!=null && logout.compareTo("si")==0){

			azione="niente";
			request.getSession().setAttribute("azione",azione);
			request.setAttribute("azione",azione);

			loggato="no";
			request.getSession().setAttribute("loggato",loggato);
			request.setAttribute("loggato",loggato);
			userLog=null;
			request.getSession().setAttribute("userLog",userLog);
			
			
			try {
				cart.deleteProducts(model1.doRetrieveAll(""));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			dispatcher = getServletContext().getRequestDispatcher("/Accesso.jsp");
		}
		
			if(loggato!=null && loggato.compareTo("si")==0 ){
				loggato="si";
				request.getSession().setAttribute("loggato",loggato);
				request.setAttribute("loggato",loggato);
				
				request.getSession().setAttribute("userLog", userLog);
				request.setAttribute("userLog", userLog);
					dispatcher = getServletContext().getRequestDispatcher("/Profilo.jsp");
			}
			String idOrdine = request.getParameter("idOrdine");

	if(idOrdine!=null){
				
				infoOrdini=idOrdine;
				System.out.println(infoOrdini);
				
				request.getSession().setAttribute("infoOrdini", infoOrdini);
				try {
					prodottis=(List<ProductBean>) model1.doRetrieveAll("");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.getSession().setAttribute("prodottis",prodottis);
				dispatcher = getServletContext().getRequestDispatcher("/infoOrdini.jsp");
			}
			try {
				
					if (azione != null) {
						
						if (azione.equalsIgnoreCase("AddUser")) {
							
							String name = request.getParameter("na");
							String surname = request.getParameter("sur");
							String username = request.getParameter("newuname");
							String password = request.getParameter("newpsw");
							String startDate=request.getParameter("newdate");
							System.out.println(startDate);
							DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
							java.util.Date parsed = format.parse(startDate);
							Date data = new Date (parsed.getTime());
							String citta = request.getParameter("newcity");
							String indirizzo = request.getParameter("indirizzo");
							UserBean bean=model.doRetrieveByKey(username);
							if(bean.getUsername().compareTo(username)==0){
								System.out.println("sbagliato");

								azione="doppione";
								request.getSession().setAttribute("azione",azione);
								request.setAttribute("azione",azione);
								dispatcher = getServletContext().getRequestDispatcher("/Registrazione.jsp");
								//esiste gia
							}
							else{
								System.out.println("perfetto");
								azione="ok";
								
								request.getSession().setAttribute("azione",azione);
								request.setAttribute("azione",azione);
								String codice=model.doRetrieveAll("").size()+"a";
								UserBean bean1=new UserBean(username,password,codice,name,surname,data,citta,indirizzo);
								model.doSave(bean1);
								//si puo aggiungere
								loggato="si";
								request.getSession().setAttribute("loggato",loggato);
								request.setAttribute("loggato",loggato);
								userLog = bean1;
								request.getSession().setAttribute("userLog", userLog);
								request.setAttribute("userLog", userLog);

								dispatcher = getServletContext().getRequestDispatcher("/Profilo.jsp");
								//pagina after registrazione
							}
							
						}
						else if(azione.equalsIgnoreCase("AddLogin")){
							String ans="";

							String username = request.getParameter("uname");
							String password = request.getParameter("psw");
							if(username!=null&&password!=null){
								if(username.equalsIgnoreCase("admin")){
									if(username.equalsIgnoreCase("admin")&&password.equalsIgnoreCase("password")){
										System.out.println("verificate3");

										azione="ok";
										request.getSession().setAttribute("azione",azione);
										request.setAttribute("azione",azione);
									
										loggato="si";
										request.getSession().setAttribute("loggato",loggato);
										request.setAttribute("loggato",loggato);
										try {
											prodottis=(List<ProductBean>) model1.doRetrieveAll("");
										} catch (SQLException e) {
											// TODO Auto-generated catch block
											e.printStackTrace();
										}
										request.getSession().setAttribute("prodottis",prodottis);
										dispatcher = getServletContext().getRequestDispatcher("/Admin.jsp");
									}
										else if(!username.equalsIgnoreCase("admin") || !password.equalsIgnoreCase("password")){
											azione="ok";
											request.getSession().setAttribute("azione",azione);
											request.setAttribute("azione",azione);
										
											dispatcher = getServletContext().getRequestDispatcher("/AdminError.jsp");

										}
								}
								
							
						
						
						
								else {
								UserBean bean=model.doRetrieveByKey(username);
								System.out.println(bean.getPass()+"pass"+bean.getUsername());
								if(bean.getUsername().compareTo(username)==0 && bean.getPass().compareTo(password)==0){
									azione="ok";
									request.getSession().setAttribute("azione",azione);
									request.setAttribute("azione",azione);
									System.out.println("wee");

									loggato="si";
									request.getSession().setAttribute("loggato",loggato);
									request.setAttribute("loggato",loggato);
									userLog = bean;
									request.getSession().setAttribute("userLog", userLog);
									request.setAttribute("userLog", userLog);
									dispatcher = getServletContext().getRequestDispatcher("/Profilo.jsp");

									//accedi
								}
								else if(bean.getUsername().compareTo(password)!=0 || bean.getPass().compareTo(password)!=0){
									azione="error";
									System.out.println("no");
									request.getSession().setAttribute("azione",azione);
									request.setAttribute("azione",azione);
									dispatcher = getServletContext().getRequestDispatcher("/Accesso.jsp");
									//sbagliato qualcosa
								}
								}
							}
							
						}
						
					
						
				}
						
			} catch (SQLException e) {
				System.out.println("Error:" + e.getMessage());
		
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		request.getSession().setAttribute("cart", cart);
		request.setAttribute("cart", cart);
		
		
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
