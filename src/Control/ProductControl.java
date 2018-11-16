package Control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.*;
/**
 * Servlet implementation class ProductControl
 */

public class ProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/*private RequestDispatcher dispatcher;*/

	// ProductModelDS usa il DataSource
	// ProductModelDM usa il DriverManager	
	static boolean isDataSource = true;
	
	static ProductModel model;
	
	static {
		if (isDataSource) {
			model = new ProductModelDS();
	}
	}
	
	public ProductControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Home.jsp");
		Cart cart = (Cart)request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		
		boolean rip=false;
		String action = request.getParameter("action");
		String tipo=(String) request.getSession().getAttribute("tipo");
		
		String occhiali=(String) request.getSession().getAttribute("occhiali");
		

		try {
			if (action != null) {
				
				if (action.equalsIgnoreCase("AddCarrello")) {
					String id = request.getParameter("id");
					for(int j=0;j<cart.getProducts().size();j++){
						if(cart.getProducts().get(j).getCodice().equalsIgnoreCase(id))
							rip=true;
					}
					if(!rip){
						cart.addProduct(model.doRetrieveByKey(id));
					}
					dispatcher = getServletContext().getRequestDispatcher("/Catalogo.jsp");
				}
				else if(action.equalsIgnoreCase("deleteC")){
					String id=request.getParameter("id");
					cart.deleteProduct(model.doRetrieveByKey(id));
					dispatcher = getServletContext().getRequestDispatcher("/Carrello.jsp");
				}
				else if(action.equalsIgnoreCase("deleteAll")){
					cart.deleteProducts(model.doRetrieveAll(""));
					dispatcher = getServletContext().getRequestDispatcher("/Carrello.jsp");
					
				}
				
				else if(action.equalsIgnoreCase("catalogo")){
					String id = request.getParameter("id");
					String glasses=request.getParameter("glasses");
					 tipo=id;
					 occhiali=glasses;
					request.getSession().setAttribute("tipo",tipo);
					request.setAttribute("tipo",tipo);
					
					request.getSession().setAttribute("occhiali",occhiali);
					request.setAttribute("occhiali",occhiali);
					
					dispatcher = getServletContext().getRequestDispatcher("/Catalogo.jsp");
				}
				else if(action.equalsIgnoreCase("infoProdotto")){
					String id = request.getParameter("id");
					ProductBean infoProdotto=model.doRetrieveByKey(id);
					request.getSession().setAttribute("infoProdotto",infoProdotto);
					request.setAttribute("infoProdotto",infoProdotto);
					dispatcher = getServletContext().getRequestDispatcher("/ProductWindow.jsp");
				}
				else if(action.equalsIgnoreCase("addInfo")){
					String id = request.getParameter("id");
					for(int j=0;j<cart.getProducts().size();j++){
						if(cart.getProducts().get(j).getCodice().equalsIgnoreCase(id))
							rip=true;
					}
					if(!rip){
						cart.addProduct(model.doRetrieveByKey(id));
					}
					
					dispatcher = getServletContext().getRequestDispatcher("/ProductWindow.jsp");
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
			request.setAttribute("products", model.doRetrieveAll(sort));
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
