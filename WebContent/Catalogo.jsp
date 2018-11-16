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
	<link href="./css/Catalogo.css" rel="stylesheet" type="text/css">
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
	<%
int t=0;
	
if(stringa.equalsIgnoreCase("uomo")&&stringa1.equalsIgnoreCase("da sole")){
	t=1;
}
else if(stringa.equalsIgnoreCase("uomo")&&stringa1.equalsIgnoreCase("da vista")){
	t=2;
}
else if(stringa.equalsIgnoreCase("donna")&&stringa1.equalsIgnoreCase("da sole")){
	t=3;
}
else if(stringa.equalsIgnoreCase("donna")&&stringa1.equalsIgnoreCase("da vista")){
	t=4;
}
	
%>
	
<section >
	

<h1><input type="text" id="test" value="<%=t%>"></h1>
	<h2 id="first" >Occhiali da Vista  </h2>

	
				<script src="./scripts/genereTitle.js" ></script>

	


	<%
		int x=0;
			if (products != null ) {
				Iterator<?> it = products.iterator();
				
				
		%>
	
<div class="container">
	<ul class="griglia">
	
	<%	while(it.hasNext()){
			ProductBean bean=(ProductBean)it.next();
			if(bean!=null){
			if(bean.getTipo().compareTo(stringa1)==0 && bean.getGenere().compareTo(stringa)==0){
			if(bean.getQuantita()==0){
				if(bean.getSconto()>0){
					
		%>
		<li>
		<h3><%=bean.getMarca()%> </h3> 
		<a href="product?action=infoProdotto&id=<%=bean.getCodice()%>"><img src="<%=bean.getImmagine()%>" alt="nessuna immagine" > </a>
		
		 	<p><%=bean.getCodice()%> </p>
		 	<h3><%="€"+(bean.getPrezzo()-(((bean.getPrezzo())*(bean.getSconto()))/100))%>  <%="(-"+bean.getSconto()+"%)" %> </h3>
		 	<p class="exPrezzo"><%="€"+(bean.getPrezzo())%> <p>
		<button class="buttonDisabled">PRODOTTO ESAURITO</button>

		 </li>
		 <%}else{ %>
		
		 
		 	<li>
		<h3><%=bean.getMarca()%> </h3> 
		<a href="product?action=infoProdotto&id=<%=bean.getCodice()%>"><img src="<%=bean.getImmagine()%>" alt="nessuna immagine" > </a>
		
		 	<p><%=bean.getCodice()%> </p>
		 	<h3><%="€"+bean.getPrezzo()%>  </h3> 
		 	<p class="nessunoSconto"><%="€"+bean.getPrezzo()%><p>
		 			 	
		 	
		<button class="buttonDisabled">PRODOTTO ESAURITO</button>

		 </li>
		 <%} %>
		
		<%}else{  
			if(bean.getSconto()>0){
				

		%>
		<li>
			<h3><%=bean.getMarca()%> </h3> 
			<a href="product?action=infoProdotto&id=<%=bean.getCodice()%>"><img id="img1"src="<%=bean.getImmagine()%>" alt="nessuna immagine" > </a>
			<p><%=bean.getCodice()%> </p>
		 	<h3><%="€"+(bean.getPrezzo()-(((bean.getPrezzo())*(bean.getSconto()))/100))%>  <%="(-"+bean.getSconto()+"%)" %> </h3>
		 	<p class="exPrezzo"><%="€"+bean.getPrezzo()%> <p>
		 	<% boolean doppio=false;
		 		for(int i=0;i<cart.getProducts().size();i++){
		 		if(cart.getProducts().get(i).getCodice().compareTo(bean.getCodice())==0){
		 			doppio=true;
		 			}
		 		}
		 		if(doppio){
		 	%>
		 	<button class="button1"onclick="mex('<%="double"%>')">AGGIUNGI AL CARRELLO</button>
		 	<%}else{ %>
		 	<button class="button1"onclick="mex('<%=bean.getCodice()%>')">AGGIUNGI AL CARRELLO</button>
		 	<%} %>
		 	
		 </li>
		 <% } else{ %>
		 	<li>
			<h3><%=bean.getMarca()%> </h3> 
			<a href="product?action=infoProdotto&id=<%=bean.getCodice()%>"><img src="<%=bean.getImmagine()%>" alt="nessuna immagine" > </a>
			<p><%=bean.getCodice()%> </p>
		 	<h3><%="€"+(bean.getPrezzo()-(((bean.getPrezzo())*(bean.getSconto()))/100))%></h3>
		 	<p class="nessunoSconto"><%="€"+bean.getPrezzo()%><p>
		 	<% boolean doppio1=false;
		 		for(int i=0;i<cart.getProducts().size();i++){
		 		if(cart.getProducts().get(i).getCodice().compareTo(bean.getCodice())==0){
		 			doppio1=true;

		 		}
		 		}
		 		if(doppio1){
		 	%>
		 	<button class="button1"onclick="mex('<%="double"%>')">AGGIUNGI AL CARRELLO</button>
		 	<%}else{ %>
		 	<button class="button1"onclick="mex('<%=bean.getCodice()%>')">AGGIUNGI AL CARRELLO</button>
		 	<%} %>
		 	
		 </li>
		 
		
		
	</ul>
</div>
<%}}}}/*agg*/} %>


<script src="./scripts/jqueryHidePrice.js" type="text/javascript"></script>
<script src="./scripts/alertCatalogo.js"  type="text/javascript"></script>



</section>
	<%		
			} else {
		%>
<div class="container">
	<ul class="griglia">
		<li> <img src=<%="cd"%> alt="nessuna immagine">
		 	<h3>Nessun Prodotto </h3>
		 </li>	 
	</ul>
</div>
<%
	}	
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