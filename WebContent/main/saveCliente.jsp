<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="inventariojeans.*"%>

<%

	String txtNombre = request.getParameter("txtNombre");
	String txtDireccion = request.getParameter("txtDireccion");
	String txtColonia = request.getParameter("txtColonia");
	String txtCelular = request.getParameter("txtCelular");
	String txtLugar = request.getParameter("txtLugar");
	String txtIdRuta = request.getParameter("txtIdRuta");
	String selIdRuta = request.getParameter("selIdRuta");
	String txtReferencias = request.getParameter("txtReferencias");
	
	System.out.println("Nombre: " + txtNombre);
	
	//txtNombre = txtNombre.replace("\?", "Ñ");
	txtDireccion = txtDireccion.replace("?", "Ñ");
	txtColonia = txtColonia.replace("?", "Ñ");
	txtReferencias = txtReferencias.replace("?", "Ñ");
	
	System.out.println("Datos");
	System.out.println(txtNombre);
	System.out.println(txtDireccion);
	System.out.println(txtColonia);
	System.out.println("txtCelular:" + txtCelular);
	System.out.println(txtLugar);
	System.out.println("selIdRuta: " + txtIdRuta);
	System.out.println("txtReferencias: " + txtReferencias);
	//Para pasar el valor de id de la ruta fue un problema ya que viene de un combo
	//Lo que se hizo fue poner el valor en una caja de texto
	
	DBHelper myDBHelper = new DBHelper();
	
	//Determinar el ultimo numero de cliente
	String consultaNoCliente = "select max(id_cliente) as id_cliente from inv_clientes";
	DBHelper dbHelper = new DBHelper();
	ResultSet rs=null;
	int id_cliente=0;
	
	try
	{
		rs = myDBHelper.getRecords(consultaNoCliente, 1);
		id_cliente = rs.getInt(1);	
	}
	catch (Exception e)
	{
		System.out.println(e);
	}
	
	id_cliente = id_cliente + 1;
	
	//Crear consulta para guardar el cliente
	String consultaSaveCliente = "insert into inv_clientes " +  
	"([id_cliente] , [nombre] , [direccion] , [colonia], [telefono], [lugar], [id_ruta], [referencias]) " + 
	"values (" + id_cliente + ", '" + txtNombre + "', '" + txtDireccion + "', '" + txtColonia + "', '" + txtCelular + "','" + txtLugar + "', " + txtIdRuta + ", '"+ txtReferencias +"')";
	
	System.out.println("consultaSaveCliente" + consultaSaveCliente);

	myDBHelper.updateRecords(consultaSaveCliente); //Ejecutar consulta para guardar el cliente
	
	response.sendRedirect("nuevo_cliente.jsp");
	
%>
