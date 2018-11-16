<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

Collection<?> products = (Collection<?>) request.getAttribute("products");
ProductBean product = (ProductBean) request.getAttribute("product");
Cart cart = (Cart) request.getAttribute("cart");
String azione=(String)request.getAttribute("azione");
String auth=(String)request.getAttribute("auth");


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
<%@include file="./header.jsp" %>
	<section>
	<script>
	<%if(azione!=null){%>
	<%if(azione.compareTo("error")==0){%>
		alert("Password o Username non corretto/i");
		<%}else if(azione.compareTo("doppione")==0){%>
		alert("Username già utilizzato");
		<%}}%>
	</script>
	<h2 id="l">Login</h2>
<div class="login">
		

<form name="formLogin"action="users" method="POST" onsubmit="return validateFormLog()">

  <ul class="griglia">
   <li>
   <label for="uname"><b>Username</b></label> 
    <input type="text" placeholder="Enter Username" name="uname" ></br>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" >
    
    
        
    <button id="log" type="submit" >Login</button>
    	<h2></h2></br>
       <h3>Se non sei ancora registrato <a href="Registrazione.jsp">Registrati qui</a></h3>
   </li>
   <li>

   </li>
  </ul>
</form>
</div>

<script>
function validateFormLog(){
	var x = document.forms["formLogin"]["uname"].value;
	var y = document.forms["formLogin"]["psw"].value;
	
    if (x == "" && y!="") {
        alert("Username mancante");
        return false;
    }
    else if(y=="" && x!=""){
    	alert("Password mancante");
        return false;

    }
    else if(x==""  && y==""){
    	alert("Username e Password mancante");
        return false;

    }
    else if(x!="" && y!="") {
    
    		<%azione="AddLogin";%>
        	<%request.getSession().setAttribute("azione", azione);%>
    	}
    
    }


</script>
<h2></h2></br>
<h2></h2></br>
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