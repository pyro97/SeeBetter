var x=$("#test").val();
var y="";
if(x==1)
	y="Occhiali da Sole per Uomo";
else if (x==2)
	y="Occhiali da Vista per Uomo";
else if (x==3)
	y="Occhiali da Sole per Donna";
else if (x==4)
	y="Occhiali da Vista per Donna";
else
	y="";
$("#first").html(y);