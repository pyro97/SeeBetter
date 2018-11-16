<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%


	Collection<?> products = (Collection<?>) request.getSession().getAttribute("products");
	ProductBean product = (ProductBean) request.getSession().getAttribute("product");
	Cart cart = (Cart) request.getSession().getAttribute("cart");
	String loggato=(String)request.getSession().getAttribute("loggato"); 
	
%>
<!DOCTYPE html >
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,Model.ProductBean, Model.Cart,javax.servlet.RequestDispatcher"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="./scripts/jquery.js"></script>
	
	
	<link href="./css/HomePage.css" rel="stylesheet" type="text/css">
	<link href="./css/header.css" rel="stylesheet" type="text/css">

	
	
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
	
	<section class="sezione1">
	<h1>Benvenuto su SeeBetter!</h1>
	<!-- Slideshow container -->
<div class="slideshow-container">

  <!-- Full-width images with number and caption text -->
  <div class="mySlides fade">
    <div class="numbertext">1 / 3</div>
   <img id="img1" src="https://assets.ray-ban.com/is/image/RayBan/Banner_hp_At_Collection_desktop?$jpeg-full$" style="width:100%">
    <div class="text"></div>
  </div>

  <div class="mySlides fade">
    <div class="numbertext">2 / 3</div>
    <img src="https://assets.ray-ban.com/is/image/RayBan/Banner_HP_marshal_steven_klein_desktop?$jpeg-full$" style="width:100%">
    <div class="text"></div>
  </div>

  <div class="mySlides fade">
    <div class="numbertext">3 / 3</div>
    <img src="https://assets.ray-ban.com/is/image/RayBan/Banner_hp_ferrari_collection_2018_desktop_ESltd?$jpeg-full$" style="width:100%">
    <div class="text"></div>
  </div>

 </div>
 
 <script src="./scripts/home.js" type="text/javascript"></script>  <!-- HEADER -->

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