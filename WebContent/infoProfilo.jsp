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
	
			<link href="./css/infoProfilo.css" rel="stylesheet" type="text/css">
		
		
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
	
<%if(userLog!=null){ %>
<h1 class="infoProfilo">Informazioni dell' account</h1>
<div class="account">
	<p>Nome: <b><%=userLog.getNome() %></b></p>
	<p>Cognome: <b><%=userLog.getCognome() %></b> </p>
	<p>Data di Nascita:<b><%=userLog.getData()%></b> </p>
	<p>Città:<b><%=userLog.getCitta()%></b> </p>
	<p>Indirizzo:<b><%=userLog.getIndirizzo()%></b> </p>
	<p>Username: <b><%=userLog.getUsername() %></b> </p>
	<p>Codice Utente:<b><%=userLog.getCodice()%></b> </p>
	
	<h2></h2></br>
<h2></h2></br>
<h2></h2></br>


</div>
<%} %>

	
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