<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

Collection<?> products = (Collection<?>) request.getAttribute("products");
ProductBean product = (ProductBean) request.getAttribute("product");
Cart cart = (Cart) request.getAttribute("cart");
String azione=(String)request.getAttribute("azione");
String nuovi=(String)request.getSession().getAttribute("nuovi");
List<ProductBean> prodottis=(List<ProductBean>)request.getSession().getAttribute("prodottis");
String codMod=(String)request.getSession().getAttribute("codMod");


 %> 
<!DOCTYPE html >
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,Model.*,javax.servlet.RequestDispatcher"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="./css/header.css" rel="stylesheet" type="text/css">
	
			<link href="./css/Accesso.css" rel="stylesheet" type="text/css">
		
		
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
	
	<title>Benvenuto su SeeBetter</title>
	<style type="text/css">
	</style>
</head>
<body>
<%@include file="./header3.jsp" %>
	<section>

	
<div class="login">
		
		
	

	<form name="formLogin"action="admins?action=rimuovi" method="POST" >

  <ul class="griglia">
   <li>
   <h2>Rimuovi un prodotto</h2>
   <a href="Admin.jsp">Admin Page</a></br></br>
   <label for="codrim"><b>Inserisci codice del prodotto da rimuovere</b></label> 
    <input type="text" placeholder="GDSFDS1341" name="codrim" ></br>
      <button id="log" type="submit" >Rimuovi</button>
    </li>
    </ul>
    </form>
</div>


<h2></h2></br>
<h2></h2></br>
<h2></h2></br>



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