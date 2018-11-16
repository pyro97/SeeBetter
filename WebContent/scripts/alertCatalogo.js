function mex(codice){
	var cod=codice;
	var con="double";
	if(cod==con){
		window.alert("\t\t\t\tATTENZIONE!\nIl prodotto selezionato è già presente nel carrello");
		
		
	}
	else{
		window.alert("Aggiunto al Carrello!");

		window.location.href='product?action=AddCarrello&id='+cod;
	}
	

   
}
