<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	ProductBean product = (ProductBean) request.getAttribute("product");
	Cart cart = (Cart) request.getAttribute("cart");
	List<ProductBean> prodotti=(List<ProductBean>)request.getSession().getAttribute("carrello");
	String stringa=(String)request.getSession().getAttribute("tipo");
	String stringa1=(String)request.getSession().getAttribute("occhiali");
	String loggato=(String)request.getSession().getAttribute("loggato"); 


	
%>
<!DOCTYPE html >
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,Model.ProductBean, Model.Cart,javax.servlet.RequestDispatcher"%>
<head >
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="./css/Marche.css" rel="stylesheet" type="text/css">
	<link href="./css/header.css" rel="stylesheet" type="text/css">

		<script src="./scripts/jquery.js"></script>
		
		
	
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<title>Benvenuto su SeeBetter</title>
	<style type="text/css">
	</style>
</head>
<body>
<%if(loggato!=null && loggato.compareTo("si")==0){ %>
<%@include file="./header2.jsp" %>
<%}else {%>
<%@include file="./header.jsp" %>

<%} %>
	
<section >

	<h2 id="first" >Marche degli Occhiali in catalogo  </h2>

	

	


	
<div class="container">
	<ul class="griglia">
	
	
		<li>
		
		<a ><img id="img1"src="./img/immaginiMarche/155x155-carrera.jpg" alt="nessuna immagine" > </a>
		</li>
		<li>
				<a><img id="img2"src="./img/immaginiMarche/155x155-gucci.jpg" alt="nessuna immagine" > </a>
				</li>
				<li>
				<a><img id="img3"src="./img/immaginiMarche/155x155-moncler.jpg" alt="nessuna immagine" > </a>
				</li>
				<li>
				<a><img id="img4"src="./img/immaginiMarche/155x155-ray-ban.jpg" alt="nessuna immagine" > </a>
				</li>
				<li>
				<a><img id="img5"src="./img/immaginiMarche/155x155-timberland.jpg" alt="nessuna immagine" > </a>
		

		 </li>
		 
		
		
	</ul>
</div>
<h2></h2></br>
<h2></h2></br>
<h2></h2></br>
<h2></h2></br>
	<script src="./scripts/anim.js"></script>


</section>
	
<%
	
		if(cart != null) { 
		 List<ProductBean> prodcart = cart.getProducts(); 
		request.getSession().setAttribute("carrello",prodcart);
		request.getSession().setAttribute("products",products);
		request.getSession().setAttribute("product",product);
		request.getSession().setAttribute("cart",cart);
		}   
		%>
		
		
<%@include file="./footer.jsp" %>
	
</body>
</html>