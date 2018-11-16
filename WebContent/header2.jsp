<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<header>
	
		
		<div class="menu">
		
		<img src="./img/logo/image.png"> 
	
	 		
	 		
	 			<a href="users" class="account">Account</a>
	 			<a href="Carrello.jsp" class="carrello">Carrello</a> 
	 		
		</div>
<div class="navbar" id="myNavbar">

  <a href="Home.jsp">Home</a>

  <div class="dropdown">
    <button class="dropbtn" id="mydrop" >Occhiali per Uomo<i class="fa fa-caret-down"></i> </button>
    <div class="dropdown-content" >
      <a href="product?action=catalogo&id=uomo&glasses=da sole">Da Sole</a>
      <a href="product?action=catalogo&id=uomo&glasses=da vista"> Da Vista</a>
    </div>
  </div> 
  
    <div class="dropdown">
    <button class="dropbtn" >Occhiali per Donna<i class="fa fa-caret-down"></i> </button>
    <div class="dropdown-content" >
      <a href="product?action=catalogo&id=donna&glasses=da sole">Da Sole</a>
      <a href="product?action=catalogo&id=donna&glasses=da vista"> Da Vista</a>
    </div>
  </div> 
  
  <a href="Marche.jsp">Marche</a>
 <a href="Servizio.jsp">Servizio Clienti</a>
<a href="ChiSiamo.jsp">Chi Siamo</a> 
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"><%="\t\t" %>Menù </i>
  </a>
</div>
		 	
	 <script>
function myFunction() {
    var x = document.getElementById("myNavbar");
    var y = document.getElementById("mydrop");
    if (x.className === "navbar") {
        x.className += " responsive";
    } else {
        x.className = "navbar";
    }
   
}
</script>	
	</header>