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
 %> 
<!DOCTYPE html >
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,Model.ProductBean,Model.UserBean,Model.OrdineBean, Model.Cart,javax.servlet.RequestDispatcher"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="./css/header.css" rel="stylesheet" type="text/css">
	
			<link href="./css/ListaOrdini.css" rel="stylesheet" type="text/css">
		
		
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
	
	<title>Benvenuto su SeeBetter</title>
	<style type="text/css">
	</style>
	
</head>

<body>
<%System.out.println(loggato+" Lista oridini"); %>
<%if(loggato!=null && loggato.compareTo("si")==0){ %>
<%@include file="./header2.jsp" %>
<%}else {%>
<%@include file="./header.jsp" %>

<%} %>
	<section>
	<h1 class="effettuati">Lista Ordini effettuati</h1>
	<script>
	
	<%if(userLog!=null && loggato!=null && listaOrdini==null){
		azione="listaOrdini";
		System.out.println(azione+"dentro");

		request.getSession().setAttribute("azione", azione);
		listaOrdini=new ArrayList<OrdineBean>();
		request.getSession().setAttribute("listaOrdini",listaOrdini);
		%>
		window.location.href='orders?azione=listaOrdini';
	

		<%
	}%>
	
	
	
	</script>
	<% List<OrdineBean> list=new ArrayList<>();
	List<OrdineBean> finale=new ArrayList<>();
	list=listaOrdini;
	boolean doppio=false;
	if(listaOrdini!=null && listaOrdini.size()>0 ){ 
			for(int j=0;j<listaOrdini.size();j++){
				System.out.println("j");
				for(int k=0;k<list.size();k++){
					System.out.println("k");
					if(listaOrdini.get(j).getId().equalsIgnoreCase(list.get(k).getId())){
						System.out.println("uguale");
						if(finale.size()>0){
							doppio=false;
							for(int f=0;f<finale.size();f++){
								if(listaOrdini.get(j).getId().equalsIgnoreCase(finale.get(f).getId())){
									doppio=true;
									
								}
							}
							if(!doppio){
								System.out.println("aggiungo");
								finale.add(finale.size(),listaOrdini.get(j));
							}
						}
						else if(finale.size()==0){
							System.out.println("vuoto");
							finale.add(finale.size(),listaOrdini.get(j));
						}
						
					}
				}
				
			}
			
		if(finale!=null && finale.size()>0){
			for(int n=0;n<finale.size();n++){%>
				<h3 class="h3Lista">Ordine del <%=finale.get(n).getDataOrdine()%> - n°<%=n %>: <a class="listaOrdini" href="users?idOrdine=<%=finale.get(n).getId()%>"><%=finale.get(n).getId() %></a></h3> 
			<% }
		}
		else{%>
			<a>nessun ordine</a>
		<% }
			
			
	}	

		%>
	
	
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