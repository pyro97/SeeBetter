<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

Collection<?> products = (Collection<?>) request.getSession().getAttribute("products");
ProductBean product = (ProductBean) request.getSession().getAttribute("product");
Cart cart = (Cart) request.getSession().getAttribute("cart");
String loggato=(String)request.getSession().getAttribute("loggato"); 
String azione=(String)request.getSession().getAttribute("azione");

	ProductBean info=(ProductBean)request.getSession().getAttribute("infoProdotto");
	
	
%>
<!DOCTYPE html >
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,Model.ProductBean, Model.Cart,javax.servlet.RequestDispatcher"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="./css/ProductWindow.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="./css/header.css" rel="stylesheet" type="text/css">
	
	
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

<div class="container1">
	<ul class="griglia1">
		<li>
		<img id="img1"src="<%=info.getImmagineInfo() %>">
		 </li>
		
	</ul>
	
</div>

<div class="container2">
	<ul class="griglia2">
		<li>
		<p class="titolo"><%=info.getMarca() %></p>
		<h1><%=info.getMarca() %> <%=info.getCodice() %></h1>
		<%if(info.getSconto()>0){ %>
			<h1><%="€"+(info.getPrezzo()-(((info.getPrezzo())*(info.getSconto()))/100))%>  <%="(-"+info.getSconto()+"%)" %></h1>
			<h3 class="exInfo">€<%=info.getPrezzo()%></h3>
			
			<%}else{ %>
		<h1><%="€"+info.getPrezzo()%></h1>
		<%} %>
		<p class="subcaract">Colore Montatura:<b><%=info.getColoreMontatura() %> </b></p>
		<p class="subcaract">Genere:<b><%=info.getGenere() %> </b></p>
		<p class="subcaract">Disponiibili:<b><%=info.getQuantita() %></b> </p>
		<p class="subcaract">Tipologia:<b><%=info.getTipo() %> </b></p>
						
				
		
		<%if(info.getQuantita()>0){ %>
		<button class="button1"onclick="window.location='product?action=addInfo&id=<%=info.getCodice()%>'">AGGIUNGI AL CARRELLO</button>
		<%}else{ %>
		<button class="button2">PRODOTTO ESAURITO</button>
		<%} %>
		
		 </li>
		
	</ul>
	
</div>

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