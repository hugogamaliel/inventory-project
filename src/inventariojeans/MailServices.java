package inventariojeans;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.Map.Entry;
import java.util.logging.Level;
import java.util.logging.Logger;
 
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import java.sql.*;
import java.util.Date;
import java.util.Calendar;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.Map.Entry;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class MailServices 
{

	public void sendMailInJava(String mensaje, String emailAddress, String emailSubject)
	{
		
		//String c_pedido = Integer.toString(id_pedido);
	
	 try {
	       
	           //Email data 
	           String Email_Id = "alexis.jeans.moda@gmail.com";
	           String password = "h02925109";                 
	           //String recipient_mail_id = emailAddress; 
	           String recipient_mail_id = emailAddress; 
	           //String mail_subject = emailSubject;
	           String mail_subject = emailSubject;
	            
	           //Set mail properties
	            Properties props = System.getProperties();
	            String host_name = "smtp.gmail.com";
	            props.put("mail.smtp.starttls.enable", "true");
	            props.put("mail.smtp.host", host_name);
	            props.put("mail.smtp.user", Email_Id);
	            props.put("mail.smtp.password", password);
	            props.put("mail.smtp.port", "587");
	            props.put("mail.smtp.auth", "true");
	 
	        Session session = Session.getDefaultInstance(props);
	        MimeMessage message = new MimeMessage(session);
	 
	         try {
	            //Set email data 
	            message.setFrom(new InternetAddress(Email_Id));
	            message.addRecipient(Message.RecipientType.TO,new InternetAddress(recipient_mail_id));
	            message.setSubject(mail_subject);
	            MimeMultipart multipart = new MimeMultipart();
	            BodyPart messageBodyPart = new MimeBodyPart();
	            
	            //Set key values
	            Map<String, String> input = new HashMap<String, String>();
	            
	            //crear un HTML con StringBuilder
	            StringBuilder email = new StringBuilder();
	            
	            /*
	            email.append("<table>");
	            
	            //No. de Pedido
	            email.append("<tr>"
	    				+"<td class='no_pedido_title'>No. Pedido</td>"
	    				+"<td class='no_pedido_value' colspan='4'>" + ("0000" + c_pedido).substring(c_pedido.length())+"</td>"
	    				+"</tr>");
	            
	            //Titulos
				email.append("<tr>"
				+"<td class='header'>Cantidad</td>"
				+"<td class='header' colspan='2'>Descripcion</td>"
				+"<td class='header'>Precio unitario</td>"
				+"<td class='header'>Importe</td>"
				+"</tr>");
				*/
				//Partidas
				
				/*
				DBHelper dbHelper = new DBHelper();
	        	ResultSet rs=null;
	        	float subtotal = 0;
	        	
	        	Date fechaPedido = new Date();
	        	ProjectTasks myTask = new ProjectTasks();
	        	
	        	String fechaReporte = "";
	        	
	        	//Consulta para extraer la fecha
	        	String consulta = "SELECT fecha_estimada_entrega FROM od_pedidos WHERE id_pedido = " + id_pedido;
	        	//int id_pedido=0;
	        	
	        	try
	    		{
	    			rs = dbHelper.getRecords(consulta, 1);		
	    		}
	    		catch (Exception e)
	    		{
	    			System.out.println("Error: " + e);
	    		}
	         
	        	fechaPedido = rs.getDate(1);
	        	fechaReporte = myTask.turnDateToFriendlyFormat(fechaPedido);
	        	
	        	rs=null;
	        	//Consulta para obtener los artículos
	        	consulta = "select o.cantidad, a.descripcion, o.precio, o.importe "
	        			+ "from od_detalle_pedido_original as o "
	        			+ "inner join od_articulos as a "
	        			+ "on o.id_articulo = a.id_articulo where o.id_pedido = " + id_pedido;
	        	//int id_pedido=0;
	        	
	        	try
	    		{
	    			rs = dbHelper.getRecords(consulta, 2);		
	    		}
	    		catch (Exception e)
	    		{
	    			System.out.println("Error: " + e);
	    		}
	        	
	        	double doubPrecioUnitario = 0.0;
	        	double doubImporte = 0.0;
	        	
	        	//Convertir valores a formato moneda - 8-mar-18
	        	
	        	
	        	NumberFormat nf = NumberFormat.getCurrencyInstance(Locale.getDefault());
	        	
	        	while(rs.next())
	    		{
	        		doubPrecioUnitario = Double.parseDouble(rs.getString(3));
	        		doubImporte = Double.parseDouble(rs.getString(4));
	        		
	        		email.append("<tr>");
	        		email.append("<td>");
	        		email.append(rs.getString(1)); //cantidad
	        		email.append("</td>");
	        		email.append("<td class='descripcion' colspan='2'>");
	        		email.append(rs.getString(2)); //descripcion
	        		email.append("</td>");
	        		email.append("<td class='cantidad'>");
	        		email.append(nf.format(doubPrecioUnitario)); //precio
	        		email.append("</td>");
	        		email.append("<td class='cantidad'>");
	        		email.append(nf.format(doubImporte)); //importe
	        		email.append("</td>");
	        		email.append("</tr>");
	        		
	        		subtotal = subtotal + Float.parseFloat(rs.getString(4)); 
	    		}
	        	
	        	//Linea en blanco
        		
	        	email.append("<tr>");
	        	email.append("<td>");
        		email.append("");
        		email.append("</td>");
        		email.append("<td colspan='2'>");
        		email.append(" ");
        		email.append("</td>");
        		email.append("<td>");
        		email.append("");
        		email.append("</td>");
        		email.append("<td>");
        		email.append("");
        		email.append("</td>");
        		email.append("</tr>");
        		
	        	email.append("<tr>");
	        	email.append("<td>");
        		email.append("");
        		email.append("</td>");
        		email.append("<td colspan='2'>");
        		email.append("DESCUENTOS AUTORIZADOS");
        		email.append("</td>");
        		email.append("<td>");
        		email.append("");
        		email.append("</td>");
        		email.append("<td>");
        		email.append("");
        		email.append("</td>");
        		email.append("</tr>");
        		
        		//Lineas para descuentos y totales 
        		
        		rs=null;
        		int lineas = 0;
	        	
        		//Borrar tablas od_mail_pedido
        		consulta = "delete from od_mail_pedido";
        		try
	    		{lineas = dbHelper.updateRecords(consulta);}
	    		catch (Exception e)
        		{System.out.println("Error: " + e);}
        		
        		//Limpiar los registros de od_aux_mail
        		consulta = "UPDATE od_aux_mail SET descripcion = '', porcentaje = '', valor = ''";
        		try
	    		{lineas = dbHelper.updateRecords(consulta);}
	    		catch (Exception e)
        		{System.out.println("Error: " + e);}
        		
	        	//Insertar a tabla temporal
        		consulta = "INSERT INTO [dbo].[od_mail_pedido] "
        				+ "([id_row],[descripcion],[porcentaje],[descuento],[importe]) "
        				+ "select rank() over(order by importe desc), d.descripcion as descripcion, "
        				+ "d.porcentaje as porcentaje,d.descuento as decuento,d.importe as importe "
        				+ "from od_descuentos as d where d.id_pedido = " + id_pedido + " group by "
        						+ "descripcion, porcentaje, importe, descuento order by importe desc;";
        		
	        	try
	    		{
	    			lineas = dbHelper.updateRecords(consulta);		
	    		}
	    		catch (Exception e)
	    		{
	    			System.out.println("Error: " + e);
	    		}
	        	
	        	//Actualizar tabla aux
	        	
	        	rs = null;
	        	consulta = "select * from od_mail_pedido";
	        	int cRows = 0;
	        	
	        	//SELECT
	        	try
	    		{rs = dbHelper.getRecords(consulta, 2);}
	    		catch (Exception e)
	    		{System.out.println("Error: " + e);}
	        	
	        	String porcentaje = "";
	        	while(rs.next())
	    		{
	        		cRows = cRows + 1;
	        		porcentaje = rs.getString(3) + "%";
	        		
	        		consulta = "UPDATE od_aux_mail SET descripcion = '" + rs.getString(2)+ "',"
	        				+ "porcentaje = '" + porcentaje
	        				+ "' WHERE id_row = " + cRows;
	        		System.out.println("Consulta Update by row: " + consulta);
	        		System.out.println("cRows: " + cRows);
	        		try//UPDATE
		    		{lineas = dbHelper.updateRecords(consulta);}
		    		catch (Exception e)
		    		{System.out.println("Error: " + e);}
	        		
	    		}
	        	
	        	//Llenar los totales
	        	rs = null;
	        	consulta = "SELECT (SELECT sum(importe) FROM od_detalle_pedido_original WHERE id_pedido = " + id_pedido + ") AS subtotal,"
	        			+ "(SELECT sum(descuento) FROM od_descuentos WHERE id_pedido = " + id_pedido + ") AS descuento,"
	        			+ "(SELECT total FROM od_pedidos WHERE id_pedido = " + id_pedido + ") AS total";
	        	
	        	//SELECT
	        	try
	    		{rs = dbHelper.getRecords(consulta, 1);}
	    		catch (Exception e)
	    		{System.out.println("Error: " + e);}
	        	
	        	String strSubtotal = rs.getString(1);
	        	String strDescuento = rs.getString(2);
	        	String strTotal = rs.getString(3);
	        	
	        	//Convertir valores a formato moneda - 8-mar-18
	        	double dbSubtotal = Double.parseDouble(strSubtotal);
	        	double dbDescuento = Double.parseDouble(strDescuento);
	        	double dbTotal = Double.parseDouble(strTotal);
	        	
	        	consulta = "UPDATE od_aux_mail SET valor = '" + nf.format(dbSubtotal) + "' WHERE id_row = 1";
	        	
	        	try//UPDATE
	    		{lineas = dbHelper.updateRecords(consulta);}
	    		catch (Exception e)
	    		{System.out.println("Error: " + e);}
	        	
	        	consulta = "UPDATE od_aux_mail SET valor = '" + nf.format(dbDescuento) + "' WHERE id_row = 2";
	        	
	        	try//UPDATE
	    		{lineas = dbHelper.updateRecords(consulta);}
	    		catch (Exception e)
	    		{System.out.println("Error: " + e);}
	        	
	        	consulta = "UPDATE od_aux_mail SET valor = '" + nf.format(dbTotal) + "' WHERE id_row = 3";
	        	
	        	try//UPDATE
	    		{lineas = dbHelper.updateRecords(consulta);}
	    		catch (Exception e)
	    		{System.out.println("Error: " + e);}
	        	
	        	//Llenar reporte desde tabla aux
	        	rs = null;
	        	consulta = "select * from od_aux_mail";
	        	
	        	//SELECT
	        	try
	    		{rs = dbHelper.getRecords(consulta, 2);}
	    		catch (Exception e)
	    		{System.out.println("Error: " + e);}
	        	
	        	while(rs.next())
	    		{
		        	email.append("<tr>");
		        	email.append("<td>");
	        		email.append(rs.getString(3)); //porcentaje
	        		email.append("</td>");
	        		email.append("<td class='descripcion' colspan='2'>");
	        		email.append(rs.getString(2)); //descripcion
	        		email.append("</td>");
	        		email.append("<td class='cantidad'>");
	        		email.append(rs.getString(4)); //leyenda
	        		email.append("</td>");
	        		email.append("<td class='cantidad'>");
	        		email.append(rs.getString(5)); //valor
	        		email.append("</td>");
	        		email.append("</tr>");
	    		}
	        	
	        	email.append("<tr>");
	        	email.append("<td>");
        		email.append("<img src='https://image.flaticon.com/icons/png/512/416/416755.png' alt='Envio DeOMuebles' style='width:50px;height:50px;'>");
        		email.append("</td>");
        		email.append("<td class='date_legend'>");
        		email.append("Fecha estimada de entrega:");
        		email.append("</td>");
        		email.append("<td class='date_value'>");
        		email.append(fechaReporte);
        		email.append("</td>");
        		email.append("<td>");
        		email.append("");
        		email.append("</td>");
           		email.append("<td>");
        		email.append("");
        		email.append("</td>");
        		email.append("</tr>");
        		
	        	//email.append("<p class='legend'> Fecha estimada de entrega: FechaEntrega</p>");
	            email.append("</table>");
			
	            System.out.println("Nombre: " + nombreCliente);
	            input.put("NombreCliente", nombreCliente);
	            input.put("tablaPartidas", email.toString());
	            

	            //HTML mail content
	            if (template==1)
	            {
	            	String htmlText = readEmailFromHtml("C:/mail/HTMLTemplate.html",input);
	            	messageBodyPart.setContent(htmlText, "text/html");
	            }

	            if (template==2)
	            {
	            	String htmlText = readEmailFromHtml("C:/mail/HTMLTemplate_modif.html",input);
	            	messageBodyPart.setContent(htmlText, "text/html");
	            }
				*/

	            input.put("Mensaje", mensaje);

	            String htmlText = readEmailFromHtml("C:/mail/HTMLTemplate_jeans.html",input);
	            messageBodyPart.setContent(htmlText, "text/html");

	            multipart.addBodyPart(messageBodyPart); 
	            message.setContent(multipart);
	 
	            //Conect to smtp server and send Email
	            Transport transport = session.getTransport("smtp");            
	            transport.connect(host_name, Email_Id, password);
	            transport.sendMessage(message, message.getAllRecipients());
	            transport.close();
	            System.out.println("Mail sent successfully..."); 
	         
	        }
	        catch (MessagingException ex) 
	        {
	                //Logger.getLogger(EmailHtmlTemp.class.getName()).log(Level.SEVERE, null, ex);
	        	System.out.println("Error al enviar correo: " + ex);
	        }        
	        catch (Exception ae) 
	        {
	            ae.printStackTrace();
	            System.out.println("Error al enviar correo 2: " + ae);
	        }    
	      }   
	      catch(Exception exception)
	      {
	            exception.printStackTrace();
	      }
	}
	//Method to replace the values for keys
	protected String readEmailFromHtml(String filePath, Map<String, String> input)
	{
	    String msg = readContentFromFile(filePath);
	    try
	    {
	    Set<Entry<String, String>> entries = input.entrySet();
	    for(Map.Entry<String, String> entry : entries) {
	        msg = msg.replace(entry.getKey().trim(), entry.getValue().trim());
	    }
	    }
	    catch(Exception exception)
	    {
	        exception.printStackTrace();
	    }
	    return msg;
	}
	//Method to read HTML file as a String 
	private String readContentFromFile(String fileName)
	{
	    StringBuffer contents = new StringBuffer();
	    
	    try {
	      //use buffering, reading one line at a time
	      BufferedReader reader =  new BufferedReader(new FileReader(fileName));
	      try {
	        String line = null; 
	        while (( line = reader.readLine()) != null){
	          contents.append(line);
	          contents.append(System.getProperty("line.separator"));
	        }
	      }
	      finally {
	          reader.close();
	      }
	    }
	    catch (IOException ex){
	      ex.printStackTrace();
	    }
	    return contents.toString();
	}
}
