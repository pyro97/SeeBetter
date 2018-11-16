function validateFormLog(){
			var x = document.forms["formLogin"]["uname"].value;
			var y = document.forms["formLogin"]["psw"].value;
		    if (x == "") {
		        alert("Username mancante");
		        
		    }
		    else if(y==""){
		    	alert("Password mancante");
		    	
		    }
		    else if(x==""  && y==""){
		    	alert("Username e Password mancante");
		    	
		    }
		    else {
		    	window.location.href='users?azione=AddLogin';
		    			
		    }
		}