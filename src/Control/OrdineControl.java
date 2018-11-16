package Control;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.SQLException;
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
public class OrdineControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/*private RequestDispatcher dispatcher;*/

	// ProductModelDS usa il DataSource
	// ProductModelDM usa il DriverManager	
	static boolean isDataSource = true;
	
	static OrdineModel model;
	static ProductModel modelP;
	static {
		if (isDataSource) {
			
			model= new OrdineModelDS();
			modelP=new ProductModelDS();
		}
	}
	
	public OrdineControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Home.jsp");
		
		UserBean userLog = (UserBean)request.getSession().getAttribute("userLog");
	    List<OrdineBean> ordini=(List<OrdineBean>)request.getSession().getAttribute("ordini");
	    List<OrdineBean> listaOrdini=(List<OrdineBean>)request.getSession().getAttribute("listaOrdini");
	    List<ProductBean> prodotti=(List<ProductBean>)request.getSession().getAttribute("carrello");
	    String infoOrdini=(String)request.getSession().getAttribute("infoOrdini");
		Cart cart = (Cart)request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		String azione="";
		String loggato="";
		
	
		if(userLog == null) {
			userLog = new UserBean();
			request.getSession().setAttribute("userLog", userLog);
		}
	
			azione=(String) request.getSession().getAttribute("azione");
			loggato=(String) request.getSession().getAttribute("loggato");
			String idOrdine = request.getParameter("idOrdine");
			System.out.println(idOrdine);
		
			try {
				if(loggato!=null && loggato.compareTo("si")==0 &&azione.compareTo("ordine")!=0&&azione.compareTo("listaOrdini")!=0){
					loggato="si";
					request.getSession().setAttribute("loggato",loggato);
					request.setAttribute("loggato",loggato);
					System.out.println(azione);

					request.getSession().setAttribute("userLog", userLog);
					request.setAttribute("userLog", userLog);
						dispatcher = getServletContext().getRequestDispatcher("/Profilo.jsp");
				}
			System.out.println(azione);
					if (azione != null) {
						
						
						if(azione.equalsIgnoreCase("ordine")){
							azione="niente";
							request.getSession().setAttribute("azione",azione);
							request.setAttribute("azione",azione);
							System.out.println("1778");
							System.out.println("1878");
							listaOrdini=null;
							
							request.getSession().setAttribute("listaOrdini",listaOrdini);
							if(ordini!=null ){
								for(int z=0;z<ordini.size();z++){
									model.doSave(ordini.get(z));
									System.out.println("ciaooo");
								}
							}
							for(int i=0;i<cart.getProducts().size();i++){
								cart.getProducts().get(i).setMenoQuantita(1);
								modelP.doDelete(cart.getProducts().get(i).getCodice());
								modelP.doSave(cart.getProducts().get(i));
							}
							cart.getProducts().removeAll(prodotti);
							request.getSession().removeAttribute("cart");
							System.out.println("non va bene");

							dispatcher = getServletContext().getRequestDispatcher("/Profilo.jsp");
						}
						else if(azione.equalsIgnoreCase("listaOrdini")){
							azione="lista";
							request.getSession().setAttribute("azione",azione);
							request.setAttribute("azione",azione);
							System.out.println("193"+azione+userLog.getUsername());
							
							listaOrdini=model.doRetrieveAll(userLog.getUsername());
							request.getSession().setAttribute("listaOrdini",listaOrdini);
							dispatcher = getServletContext().getRequestDispatcher("/ListaOrdini.jsp");
						}
					
					}	
				
						
			} catch (SQLException e) {
				System.out.println("Error:" + e.getMessage());
			}
		
		
	
			request.getSession().setAttribute("cart", cart);
			request.setAttribute("cart", cart);
		String sort = request.getParameter("sort");

		try {
			request.removeAttribute("products");
			request.setAttribute("products", modelP.doRetrieveAll(""));
			
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
