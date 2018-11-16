<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%


String azione=(String)request.getSession().getAttribute("azione");

Collection<?> products = (Collection<?>) request.getSession().getAttribute("products");
ProductBean product = (ProductBean) request.getSession().getAttribute("product");
Cart cart = (Cart) request.getSession().getAttribute("cart");
String loggato=(String)request.getSession().getAttribute("loggato"); 
String authorization=(String)request.getAttribute("authorization");
String nuovi=(String)request.getSession().getAttribute("nuovi");
String modificato=(String)request.getSession().getAttribute("modificato");
String rimosso=(String)request.getSession().getAttribute("rimosso");

 %> 
<!DOCTYPE html >
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,Model.ProductBean,Model.UserBean, Model.Cart,javax.servlet.RequestDispatcher"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="./css/header.css" rel="stylesheet" type="text/css">
	
			<link href="./css/Admin.css" rel="stylesheet" type="text/css">
		
		
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
	
	<title>Benvenuto su SeeBetter</title>
	<style type="text/css">
	</style>
	
</head>

<body>

<%@include file="./header3.jsp" %>


<script>
	<%if(nuovi!=null && nuovi.equalsIgnoreCase("si")){%>
		alert("Prodotto inserito con successo nel database");
		<%nuovi=null;%>
		<%request.getSession().setAttribute("nuovi",nuovi);%>

	<%}else if(nuovi!=null && nuovi.equalsIgnoreCase("no")){%>
		alert("Errore nell'inserimento");
		<%nuovi=null;%>
		<%request.getSession().setAttribute("nuovi",nuovi);%>
	<%}%>
	
	<%if(modificato!=null && modificato.equalsIgnoreCase("si")){%>
	alert("Prodotto modificato con successo nel database");
	<%modificato=null;%>
	<%request.getSession().setAttribute("modificato",modificato);%>

<%}else if(modificato!=null && modificato.equalsIgnoreCase("no")){%>
	alert("Errore nella modifica");
	<%modificato=null;%>
	<%request.getSession().setAttribute("modificato",modificato);%>
<%}%>

<%if(rimosso!=null && rimosso.equalsIgnoreCase("si")){%>
alert("Prodotto rimosso con successo dal database");
<%rimosso=null;%>
<%request.getSession().setAttribute("rimosso",rimosso);%>

<%}else if(rimosso!=null && rimosso.equalsIgnoreCase("no")){%>
alert("Errore nella rimozione");
<%rimosso=null;%>
<%request.getSession().setAttribute("rimosso",rimosso);%>
<%}%>
	</script>
<h1>Benvenuto Admin</h1>

	<section>
	<ul id="adm">
	<li>
	<a href="AdminInserisci.jsp">Inserisci Prodotto</a> </br></br>
			<a href="AdminModifica.jsp">Modifica Prodotto</a> </br></br>
						
			
						<a href="AdminRimuovi.jsp">Rimuovi Prodotto</a> </br></br>
			
	
				<button onclick="logout()">Logout</button>
	
	</li>

	
	</ul>

	 <script src="./scripts/logg.js" type="text/javascript"></script>  <!-- HEADER -->

	
	</section>
		<%@include file="./footer.jsp" %>

	<%	
		if(cart != null) { 
		 List<ProductBean> prodcart = cart.getProducts(); 
		request.getSession().setAttribute("carrello",prodcart);
		request.getSession().setAttribute("products",products);
		request.getSession().setAttribute("product",product);
		request.getSession().setAttribute("cart",cart);
		}   
		%>

</body>
</html>