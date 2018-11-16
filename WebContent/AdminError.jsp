<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%


String azione=(String)request.getSession().getAttribute("azione");
UserBean userLog=(UserBean)request.getSession().getAttribute("userLog");
Collection<?> products = (Collection<?>) request.getSession().getAttribute("products");
ProductBean product = (ProductBean) request.getSession().getAttribute("product");
Cart cart = (Cart) request.getSession().getAttribute("cart");
String loggato=(String)request.getSession().getAttribute("loggato"); 
 %> 
<!DOCTYPE html >
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,Model.ProductBean,Model.UserBean, Model.Cart,javax.servlet.RequestDispatcher"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="./css/header.css" rel="stylesheet" type="text/css">
	
			<link href="./css/Profilo.css" rel="stylesheet" type="text/css">
		
		
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
	
	<title>Benvenuto su SeeBetter</title>
	<style type="text/css">
	</style>
	
</head>

<body>

<%@include file="./header3.jsp" %>

<h3 class="cred">Non hai le credenziali necessarie per accedere a questa paginia</h3>

	<section>
	<ul>
	<li>
			<a href="Accesso.jsp">Torna al Login</a> </br></br>
	
	
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