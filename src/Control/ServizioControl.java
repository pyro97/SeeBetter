package Control;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import com.google.gson.*;


import Model.*;

/**
 * Servlet implementation class ProductControl
 */
public class ServizioControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/*private RequestDispatcher dispatcher;*/

	// ProductModelDS usa il DataSource
	// ProductModelDM usa il DriverManager	

	
	public ServizioControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
						
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String risultato="";
		String to="simonepirozzi97@gmail.com";
		String from = "";
		String host = "localhost";
		 
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		String fullmail = request.getParameter("mailJson");
		String fullbody= request.getParameter("bodyJson");
		Pattern pattern = Pattern.compile("[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}");
        
		if(fullmail!=null && fullbody!=null && fullmail!=""&&fullbody!=""){
			Matcher mat = pattern.matcher(fullmail);
			if(mat.matches()){
				from=fullmail;
				  Properties properties = System.getProperties();
			      // Setup mail server
			      properties.setProperty("mail.smtp.host", host);
			      properties.put ( "mail.smtp.starttls.enable", "true" );
			        properties.put ( "mail.smtp.port", "587" );
			      
			      // Get the default Session object.
			      Session session = Session.getDefaultInstance(properties);
			      try {
			         // Create a default MimeMessage object.
			         MimeMessage message = new MimeMessage(session);
			         // Set From: header field of the header.
			         message.setFrom(new InternetAddress(from));
			         // Set To: header field of the header.
			         message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			         // Set Subject: header field
			         message.setSubject("");
			         // Now set the actual message
			         message.setText(fullbody);
			         // Send message
			         Transport.send(message);
			         
			         
			         
			      } catch (MessagingException mex) {
			         mex.printStackTrace();
			      }
				risultato="E-mail inviata con successo";
			}else{
				risultato="E-mail non valida";
			}
			
		}
		else{
			 
			risultato="Errore nell'invio";
		}
		 System.out.println("ciao"+fullbody+fullmail);

		out.print(risultato);
		doGet(request, response);
	}

}
