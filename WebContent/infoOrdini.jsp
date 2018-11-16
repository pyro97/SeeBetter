<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%


String azione=(String)request.getSession().getAttribute("azione");
UserBean userLog=(UserBean)request.getSession().getAttribute("userLog");
Collection<?> products = (Collection<?>) request.getSession().getAttribute("products");
ProductBean product = (ProductBean) request.getSession().getAttribute("product");
Cart cart = (Cart) request.getSession().getAttribute("cart");
String loggato=(String)request.getSession().getAttribute("loggato"); 
List<OrdineBean> listaOrdini=(List<OrdineBean>)request.getSession().getAttribute("listaOrdini");
String infoOrdini=(String)request.getSession().getAttribute("infoOrdini");
List<ProductBean> prodottis=(List<ProductBean>)request.getSession().getAttribute("prodottis");

 %> 
<!DOCTYPE html >
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,Model.ProductBean,Model.UserBean,Model.OrdineBean, Model.Cart,javax.servlet.RequestDispatcher"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="./css/header.css" rel="stylesheet" type="text/css">
	
			<link href="./css/infoOrdini.css" rel="stylesheet" type="text/css">
		
		
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
	<h1>Informazioni dell'Ordine "<%=infoOrdini %>"</h1>
	<div class="account">
	<p>Destinatario: <b><%=userLog.getNome()+" "+userLog.getCognome() %></b></p>
	<p>Città di Destinazione:<b><%=userLog.getCitta()%></b> </p>
	<p>Indirizzo:<b><%=userLog.getIndirizzo()%></b> </p>
	<%boolean dop=false;
		for(int i=0;i<listaOrdini.size();i++){ 
		if(!dop && listaOrdini.get(i).getId().equalsIgnoreCase(infoOrdini)){%>
	<p>Data emissione ordine: <b><%=listaOrdini.get(i).getDataOrdine()%></b> </p>
	<%dop=true; %>
	<%}} %>
	
</div>
	<table class="tabella">
	<tr>
		<th>Foto</th> 
		<th>Articolo</th>
		
		<th>Quantità</th>
		<th>Prezzo</th>
		<th></th>
	</tr>
	<%
	List<OrdineBean> infox=new ArrayList<>();
	double totale=0;

	List<String> infos=new ArrayList<>();
	for(int i=0;i<listaOrdini.size();i++){ 
		if(listaOrdini.get(i).getId().equalsIgnoreCase(infoOrdini)){
			infox.add(listaOrdini.get(i));
			infos.add(listaOrdini.get(i).getCodiceProdotto());
		}
	
	
	
	}
	OrdineBean bean1=new OrdineBean();
	if(prodottis!=null){
		int itera=0;
		Iterator<?> it = prodottis.iterator();
		while(it.hasNext()){
			itera++;
			ProductBean bean=(ProductBean)it.next();
			for(int ax=0;ax<infox.size();ax++){
				bean1=infox.get(ax);

			}
			
			if(bean!=null){
					for(int i=0;i<infos.size();i++){
						if(bean.getCodice().equalsIgnoreCase(infos.get(i))){%>
						
						<tr>
			<td ><img src="<%=bean.getImmagineC()%>" alt="nessuna immagine"></td>
			<td ><%=bean.getMarca()+" "+bean.getCodice()%></td>
			<td><%=bean1.getQuantita()%></td>
			<%if(bean.getSconto()>0){ %>
			<td class="tab"><%=" €" %><%=(bean.getPrezzo()-((bean.getPrezzo()*bean.getSconto())/100))*bean1.getQuantita()%></td>
			<%totale+=(bean.getPrezzo()-((bean.getPrezzo()*bean.getSconto())/100))*bean1.getQuantita(); %>
			<%}else{ %>
			<td class="tab"><%=bean.getPrezzo()*bean1.getQuantita()%><%=" €" %></td>
			<%totale+=bean.getPrezzo()*bean1.getQuantita(); %>
			<%} %>
	
	</tr>
					<% }
				}
			}
		}
		
	}%>
	
	</table>
	<%totale=Math.floor(totale*100)/100 ;%>
	
	<h3>Totale Ordine=<%="€"+totale %></h3>
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