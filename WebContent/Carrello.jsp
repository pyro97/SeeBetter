 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Collection<?> products = (Collection<?>) request.getSession().getAttribute("products");
    ProductBean product = (ProductBean) request.getSession().getAttribute("product");
    Cart cart = (Cart) request.getSession().getAttribute("cart");
    String loggato=(String)request.getSession().getAttribute("loggato"); 
    List<ProductBean> prodotti=(List<ProductBean>)request.getSession().getAttribute("carrello");
    String azione=(String)request.getSession().getAttribute("azione");
    List<String> quantita=(List<String>)request.getSession().getAttribute("quantita");
    UserBean userLog=(UserBean)request.getSession().getAttribute("userLog");
    List<OrdineBean> ordini=(List<OrdineBean>)request.getSession().getAttribute("ordini");
    double price=0;


    %>
<!DOCTYPE html >
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.sql.*,java.text.*,java.sql.Date,java.util.*,Model.ProductBean,Model.UserBean,Model.OrdineBean, Model.Cart"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="./css/Carrello.css" rel="stylesheet" type="text/css">
	<link href="./css/header.css" rel="stylesheet" type="text/css">
	
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

int totale=0;
if(cart.getProducts()==null || cart.getProducts().size()==0){%>

	<h3>IL TUO CARRELLO</h3>
	<p>Non hai nessun articolo nel carrello</p>
	<h2></h2></br>
<h2></h2></br>
<h2></h2></br>
<h2></h2></br>
<h2></h2></br>
<h2></h2></br>
<h2></h2></br>
<h2></h2></br>
<h2></h2></br>
<h2></h2></br>
<h2></h2></br>
<h2></h2></br>
<h2></h2></br>

<%	
}
else{
	%>
	 
	<h3>IL TUO CARRELLO</h3>
	<table >
	<tr>
		<th>Foto</th> 
		<th>Articolo</th>
		<th>Quantità</th>
		<th>Prezzo</th>
		<th></th>
	</tr>
	<% 
	   for(int num=0;num<cart.getProducts().size();num++) {
		   if(cart.getProducts().get(num).getQuantita()==0){
	%>
	<tr>
	<td><img class="img1" src="<%=cart.getProducts().get(num).getImmagineC()%>" alt="nessuna immagine"></td>
		<td><%=cart.getProducts().get(num).getMarca()+"  "+cart.getProducts().get(num).getCodice()%></td>

		<td>0</td>
		<td >Prodotto terminato</td>
		<td><a href="product?action=deleteC&id=<%=cart.getProducts().get(num).getCodice()%>">Rimuovi</a></td>
	
	</tr>
	<%}else{
		
	
		%>
	
	<tr> 
	<td><img  class="img1" src="<%=cart.getProducts().get(num).getImmagineC()%>" alt="nessuna immagine"></td>
		<td><%=cart.getProducts().get(num).getMarca()+"  "+cart.getProducts().get(num).getCodice()%></td>
	
		<td>
		<input value="1"class="inserisci"type="number" min="1" max="<%=cart.getProducts().get(num).getQuantita()%>" onchange="myfunction()"> 
		<%} %>
		
		<script>
			function myfunction(){
				var x=document.getElementsByClassName("inserisci");
				var y=document.getElementsByClassName("totale");
				var z=document.getElementById("fulltotale");
				var sommeTotali=0;
					<%for(int dim1=0;dim1<cart.getProducts().size();dim1++){ %>
				
					
					<%if(cart.getProducts().get(dim1).getSconto()>0){ %>
						
						var tot=x[<%=dim1%>].value*<%=(cart.getProducts().get(dim1).getPrezzo()-(((cart.getProducts().get(dim1).getPrezzo())*(cart.getProducts().get(dim1).getSconto()))/100))%>;
						<%}else{%>
						
						var tot=x[<%=dim1%>].value*<%=cart.getProducts().get(dim1).getPrezzo()%>;
						<%}%>
						
					
					var totale="€"+tot;
					sommeTotali+=tot;
					
					y[<%=dim1%>].innerHTML=totale;
					
					<%}%>
					z.innerHTML="Totale= €"+sommeTotali;
					
			}
		 </script>
		 </td>
		 <% if(cart.getProducts().get(num).getSconto()>0 ){ %>
			 <td class="totale"><%="€"+(cart.getProducts().get(num).getPrezzo()-(((cart.getProducts().get(num).getPrezzo())*(cart.getProducts().get(num).getSconto()))/100))%></td>
	<% }else{%>

		<td class="totale"><%="€"+cart.getProducts().get(num).getPrezzo()%></td>
		<%} %>
		<td><button class="buttonRemove"onclick="window.location='product?action=deleteC&id=<%=cart.getProducts().get(num).getCodice()%>'">RIMUOVI</button></td>
	</tr>
	<%}%> 
	</table>

<%

for(int i=0;i<cart.getProducts().size();i++){
	if(cart.getProducts().get(i).getSconto()>0 ){
		price+=(cart.getProducts().get(i).getPrezzo()-(((cart.getProducts().get(i).getPrezzo())*(cart.getProducts().get(i).getSconto()))/100));
		price=Math.floor(price * 100) / 100;
	}
	else
	 price+=cart.getProducts().get(i).getPrezzo();
	
}
%>
<div id="we">

</div>
<h3 id="fulltotale">Totale= €<%=price%></h3> 
<button id="com" onclick="mex()" id="compra" >Esegui Ordine</button>



<h2></h2></br>
<h2></h2></br>
<h2></h2></br>
<h2></h2></br>
<h2></h2></br>
<h2></h2></br>
<h2></h2></br>
<h2></h2></br>
<h2></h2></br>

<%}%>






<script>

function mex(){
	<%if(loggato!=null && loggato.compareTo("si")==0){
		System.out.println("ok1");
		Random r=new Random();
		int id=r.nextInt(5000);
		String idBean="id"+id;
	ordini=new ArrayList<OrdineBean>();
	request.getSession().setAttribute("ordini", ordini);
	
	for(int i=0;i<cart.getProducts().size();i++){
		
		System.out.println("ok3");
		
		int next=r.nextInt(5000);
		System.out.println("codice da dare"+prodotti.get(i).getCodice());
		
		
		String timeStamp = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date parsed = format.parse(timeStamp);
		Date data = new Date (parsed.getTime());
	
		OrdineBean bean=new OrdineBean(userLog.getUsername(),next,idBean,cart.getProducts().get(i).getCodice(),1,data,price);
		System.out.println(bean.getCodiceProdotto());
		ordini.add(bean);
		System.out.println(ordini.size());
		
	}
	azione="ordine";
	request.getSession().setAttribute("ordini", ordini);
	request.getSession().setAttribute("azione", azione);
	System.out.println(ordini.size());%>
	<%String ok="L'ordine seguente verrà inviato a "+userLog.getNome()+" "+userLog.getCognome()+"  presso "+userLog.getIndirizzo()+" ,"+userLog.getCitta()+"."; %>
	var conf=confirm("<%=ok%>\nSei sicuro di voler continuare?");
	if(conf==true){
		alert("Ordine effettuato con successo");
		window.location.href='orders?azione=ordine';
	}
	
	

	
	<%}else{%>
	alert("Devi prima accedere per effettuare l'ordine");
	
	<%}%>
	
   
}

</script>	
<%

 %>
 
 		
 
<%@include file="./footer.jsp" %>

</body>
</html>