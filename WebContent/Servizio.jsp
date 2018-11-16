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
	<link href="./css/header.css" rel="stylesheet" type="text/css">
	
			<link href="./css/Servizio.css" rel="stylesheet" type="text/css">
		
		
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<script src="./scripts/jquery.js"></script>
	
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
	<section>
	
	<h1>Servizio Clienti</h1>
	<p id="prob">Per qualsiasi problema o richiesta può contattarci alla presente mail <mark>simonepirozzi97@gmail.com</mark></p>
<form>
<ul class="griglia">
<li>
Email:<input type="text" id="fullmail"></br></br>
Testo:<textarea cols="40" rows="5" id="fullbody"></textarea></br></br>
<input type="button" value="Invia" id="btnSend">
<br>
<span id="result1"></span>
</li>
</ul>
</form>
	
<script>
$(document).ready(function(){
	$('#btnSend').click(function(){
		var fullmail=$('#fullmail').val();
		var fullbody=$('#fullbody').val();
		$.ajax({
			type:'POST',
			
			data:{
				mailJson : fullmail,
				bodyJson : fullbody
				},
			url:'ServizioControl',
			success:function(result){
				$('#result1').html(result);
			}
		});
	});
});


</script>
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