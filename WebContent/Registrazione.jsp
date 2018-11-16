<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

Collection<?> products = (Collection<?>) request.getAttribute("products");
ProductBean product = (ProductBean) request.getAttribute("product");
Cart cart = (Cart) request.getAttribute("cart");
String azione=(String)request.getAttribute("azione");

String loggato=(String)request.getAttribute("loggato"); 
 %> 

<!DOCTYPE html >
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,Model.ProductBean, Model.Cart,javax.servlet.RequestDispatcher"%>
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
<%@include file="./header.jsp" %>
	<section>
	<script>
	<%if(azione!=null){%>
	<%if(azione.compareTo("error")==0){%>
		alert("Password o Username sbagliato");
		<%}else if(azione.compareTo("doppione")==0){%>
		alert("username già presente");
		<%}}%>
	</script>

<h2 id="r">Registrazione</h2>
<div class="regi">
		

<form name="formReg"action="users" method="POST" onsubmit="return validateFormReg()">

  <ul class="griglia">
   <li>
   <label for="na"><b>Nome</b></label> 
    <input type="text" placeholder="Mario" name="na" ></br>

    <label for="sur"><b>Cognome</b></label>
    <input type="text" placeholder="Rossi" name="sur" ></br>
    
     <label for="newdate"><b>Data di Nascita</b></label>
    <input type="date" placeholder="Enter Username" name="newdate" ></br>
    
     <label for="newcity"><b>Città</b></label>
    <input type="text" placeholder="Milano" name="newcity" ></br>
    
    <label for="indirizzo"><b>Indirizzo</b></label>
    <input type="text" placeholder="Via Roma,12" name="indirizzo" ></br>
    
     <label for="newuname"><b>Username</b></label>
    <input type="text" placeholder="Inserisci Username" name="newuname" ></br>
    
    
     <label for="newpsw"><b>Password</b></label>
    <input type="password" placeholder="Inserisci Password" name="newpsw" ></br>
    
     <label for="psw-repeat"><b>Repeat Password</b></label>
    <input type="password" placeholder="Ripeti Password" name="psw-repeat" ><//br>
    
   
        
    <button id="reg" type="submit">Registrati</button>
       <h3>Se sei già registrato <a href="Accesso.jsp">Accedi qui</a></h3>
  
   </li>
  
  
  </ul>
   
</form>
</div>
<script>
function validateFormReg(){
	var n=0;
	var s="";
	var res="";
	var a = document.forms["formReg"]["na"].value;
	var b = document.forms["formReg"]["sur"].value;
	var c = document.forms["formReg"]["newuname"].value;
	var d = document.forms["formReg"]["newpsw"].value;
	var e = document.forms["formReg"]["psw-repeat"].value;
	var f = document.forms["formReg"]["newdate"].value;
	var g = document.forms["formReg"]["newcity"].value;
	var h = document.forms["formReg"]["indirizzo"].value;
    if (a == ""|| b=="" || c==""|| d==""|| e=="" || f=="" || g=="" || h==""){
    	alert("Tutti i campi sono obbligatori")
    	return false;
    }
    else if(d!=e){
    	alert("Le password non corrispondono")
    	return false;
    }
    else if(d==e && d!="" && e!=""){
    	<%azione="AddUser";%>
    	<%request.getSession().setAttribute("azione", azione);%>
    	
    }  
		
}




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