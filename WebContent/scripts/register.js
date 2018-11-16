function validateFormReg(){
			var n=0;
			var s="";
			var res="";
			var x = document.forms["formReg"]["na"].value;
			var y = document.forms["formReg"]["sur"].value;
			var z = document.forms["formReg"]["newuname"].value;
			var a = document.forms["formReg"]["newpsw"].value;
			var b = document.forms["formReg"]["psw-repeat"].value;
		    if (x == "") {
		        n++;
		        s=s.concat("Nome-");
		    }
		    if(y==""){
		    	  n++;
			      s=s.concat("Cognome-");
		    }
		    if(z==""){
		    	  n++;
			      s=s.concat("Username-");
		    }
		    if(a==""){
		    	  n++;
			      s=s.concat("Password-");
		    }
		    if(b==""){
		    	  n++;
			      s=s.concat("Ripeti Password");
		    }
		   if(n>0){
			   res=res.concat("Dati Mancanti:"+s);
			   alert(res);
			   
		   }
		   else if(n==0){
			   if(b!=a){
				   alert("La Password ripetuta non corrisponde")
				   

			   }
			   else {
				   window.location.href='users?azione=AddUser';
			    	
			   }
			
		   }
		}
	