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
	
			<link href="./css/ChiSiamo.css" rel="stylesheet" type="text/css">
		
		
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
	<section>
	<h1>Chi Siamo</h1>
	<p><b>SeeBetter</b> è il nuovissimo store dedicato <b>alla vendita di occhiali online.</b></p>


<p>Dal <b>2012 SeeBetter è l’E-commerce</b> di riferimento nella vendita online di occhiali da sole e da vista per uomo e per donna.</p>

<p>La vasta gamma di articoli che proponiamo, e l’impegno con cui ricerchiamo i prodotti più innovativi, ci permettono di soddisfare le esigenze di ogni singolo cliente.</p>

<p>I nostri<b> punti di forza</b> sono:</p>

  <p>-Soddisfazione del cliente offrendo qualità e convenienza allo stesso tempo</p>
   <p>-Selezionare i migliori prodotti in commercio presenti su mercato nazionale ed internazionale
</p>
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