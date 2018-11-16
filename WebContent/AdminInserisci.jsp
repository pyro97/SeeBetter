<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

Collection<?> products = (Collection<?>) request.getAttribute("products");
ProductBean product = (ProductBean) request.getAttribute("product");
Cart cart = (Cart) request.getAttribute("cart");
String azione=(String)request.getAttribute("azione");
String nuovi=(String)request.getSession().getAttribute("nuovi");


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
	<script>
	<%if(nuovi!=null && nuovi.equalsIgnoreCase("si")){%>
		alert("Prodotto inserito con successo nel database");

	<%}else if(nuovi!=null && nuovi.equalsIgnoreCase("no")){%>
		alert("Errore nell'inserimento");
	<%}%>
	</script>

	
<div class="login">
		<h2>Inserisci nuovo prodotto</h2>
		<a href="Admin.jsp">Admin Page</a>

<form name="formLogin"action="admins?action=inserisci" method="POST" >

  <ul class="griglia">
   <li>
   <label for="cod"><b>Codice Prodotto</b></label> 
    <input type="text" placeholder="GDSFDS1341" name="cod" ></br>

  <label for="mar"><b>Marca</b></label> 
    <input type="text" placeholder="Gucci" name="mar" ></br>
    
    <label for="col"><b>Colore Montatura</b></label> 
    <input type="text" placeholder="rosso-blu" name="col" ></br>
    
    <label for="gen"><b>Genere</b></label> 
    <input type="text" placeholder="Uomo" name="gen" ></br>
    
    <label for="tip"><b>Tipo</b></label> 
    <input type="text" placeholder="da sole" name="tip" ></br>
    
    <label for="pre"><b>Prezzo</b></label> 
    <input type="text" placeholder="85.50" name="pre" ></br>
    
    <label for="sco"><b>Sconto</b></label> 
    <input type="text" placeholder="20" name="sco" ></br>
    
    <label for="qua"><b>Quantità</b></label> 
    <input type="text" placeholder="100" name="qua" ></br>
    
    <label for="cat"><b>Immagine Catalogo Url</b></label> 
    <input type="text" placeholder="url" name="cat" ></br>
    
    <label for="car"><b>Immagine Carrello Url</b></label> 
    <input type="text" placeholder="url" name="car" ></br>
    
    <label for="inf"><b>Immagine Info Url</b></label> 
    <input type="text" placeholder="url" name="inf" ></br>
    
    
        
    <button id="log" type="submit" >Inserisci</button>
    	<h2></h2></br>
      
   </li>
   <li>

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