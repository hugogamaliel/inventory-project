<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="inventariojeans.*"%>

<%

	String txtAbono = request.getParameter("txtAbono");
	String txtNvoSaldo = request.getParameter("txtNvoSaldo");
	String txtIDVenta = request.getParameter("txtIDVenta");
	String txtIsEnganche = request.getParameter("txtIsEnganche");
	int id_venta = 0, id_ruta=0;
	String phoneNumber="";
	
	//Estas lineas siempre las pongo solo para asegurarme que los datos se estan pasando al JSP correctamente
	System.out.println("Datos");
	System.out.println("txtAbono: " + txtAbono);
	System.out.println("txtNvoSaldo: " + txtNvoSaldo);
	System.out.println("txtIDVenta: " + txtIDVenta);
	System.out.println("txtIsEnganche: " + txtIsEnganche);

	String fechaAbono = "";
	ProjectTasks myTasks = new ProjectTasks();

	Date today = new Date();
	fechaAbono = myTasks.turnDateTOSQLFormat(today);

	System.out.println("Fecha devuelta: " + fechaAbono);

	DBHelper dbHelper = new DBHelper();
	ResultSet rs=null;
	double saldo = 0;

	//Crear consulta para guardar el abono
	
	String consultaSaveAbono = "insert into inv_abonos ([id_venta], [cantidad], [saldo], [fecha], [isEnganche]) values (" + txtIDVenta + ", " + txtAbono + ", " + txtNvoSaldo + ", '" + fechaAbono + "', " + txtIsEnganche + ")";

	System.out.println("consultaSaveAbono: " + consultaSaveAbono);

	dbHelper.updateRecords(consultaSaveAbono); //Ejecutar consulta para guardar el abono

	//Consulta para actualizar el saldo

	String consultaActualizarSaldo = "update inv_ventas set saldo = " + txtNvoSaldo + " where id_venta = " + txtIDVenta;

	System.out.println("consultaActualizarSaldo: " + consultaActualizarSaldo);

	dbHelper.updateRecords(consultaActualizarSaldo); //Ejecutar consulta para actualizar el saldo
	
	//Consultar si el saldo quedó en 0
	String consulta ="";
	
	consulta = "select saldo from inv_ventas where id_venta = " + txtIDVenta;
	
	try
	{
		rs = dbHelper.getRecords(consulta, 1);
		saldo = rs.getDouble(1);
	}
	catch (Exception e)
	{
		System.out.println("Error: " + e);
	}
	
	if (saldo==0.0)
	{
		//Cambiar estado de la venta a 'Pagada'
		consulta = "update inv_ventas set estado = 4 where id_venta = " + txtIDVenta;
		dbHelper.updateRecords(consulta); //Ejecutar consulta para actualizar el estado
		
		//Obtener el número de celular del cliente
		rs=null;
		
		consulta = "SELECT c.telefono FROM inv_clientes AS c " 
		+ "INNER JOIN inv_ventas AS v ON c.id_cliente = v.id_cliente WHERE v.id_venta = " + txtIDVenta;
		
		try
		{
			rs = dbHelper.getRecords(consulta, 1);
			phoneNumber = rs.getString(1);
		}
		catch (Exception e)
		{
			System.out.println("Error: " + e);
		}
		
		//Enviar notificacion de cuenta liquidada
		SendSMS smsservices = new SendSMS();
		
		//smsservices.sendSMS("Su cuenta número " + txtIDVenta + " con Alexis Jeans ha sido liquidada", "0.00", phoneNumber);
		
		//smsservices.sendSMSToMe("Su liquidó la cuenta número " + txtIDVenta + "","");
		
		//smsservices.sendSMSToMe("Su cuenta número " + txtIDVenta + " ha sido liquidada","0.00");
	}
	
	id_venta = Integer.parseInt(txtIDVenta);
	
	//Obtener el id_ruta
	consulta="SELECT c.id_ruta FROM inv_clientes AS C INNER JOIN inv_ventas AS v ON v.id_cliente = c.id_cliente WHERE v.id_venta = " + id_venta;

	try
	{
		rs = dbHelper.getRecords(consulta, 1);
		id_ruta = rs.getInt(1);
	}
	catch (Exception e)
	{
		System.out.println("Error: " + e);
	}
	
	
	//Actualizar PDF de tarjeta
	CreateXMLTarjeta createXML = new CreateXMLTarjeta();
	createXML.createTarjeta(id_venta);
	
	//Ejecutar FOP
	RunFOP runFOP=new RunFOP();
	runFOP.createPDF(id_venta);
	
	/*
	//Se elimina crear reporte de ruta - 11-feb-2020
	//Crear reporte Ruta
	CreateXMLRptRuta crearXMLRuta = new CreateXMLRptRuta();
	crearXMLRuta.createReporte(id_ruta);
		
	runFOP.createPDFRuta(id_ruta);
	*/
	response.sendRedirect("registrar_abono.jsp");
	
	
	
%>
