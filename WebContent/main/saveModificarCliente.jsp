<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="inventariojeans.*"%>

<%
	String inIDCliente = request.getParameter("inIDCliente");
	String txtNombre = request.getParameter("txtNombre");
	String txtDireccion = request.getParameter("txtDireccion");
	String txtColonia = request.getParameter("txtColonia");
	String txtCelular = request.getParameter("txtCelular");
	String txtLugar = request.getParameter("txtLugar");
	String txtIdRuta = request.getParameter("txtIdRuta");
	String txtReferencias = request.getParameter("txtReferencias");
	
	System.out.println("Datos");
	System.out.println("inIDCliente: " + inIDCliente);
	System.out.println(txtNombre);
	System.out.println(txtDireccion);
	System.out.println(txtColonia);
	System.out.println(txtCelular);
	System.out.println(txtLugar);
	System.out.println("txtIdRuta: " + txtIdRuta); //29-05-19
	System.out.println("txtReferencias: " + txtReferencias);
	
	DBHelper myDBHelper = new DBHelper();
	
	//Crear consulta para guardar el cliente
	String consultaSaveModificarCliente = "UPDATE inv_clientes SET " +  
	"nombre = '" + txtNombre +"', " +
	"direccion = '" + txtDireccion +"', " +
	"colonia = '" + txtColonia +"', " +
	"telefono = '" + txtCelular +"', " +
	"lugar = '" + txtLugar +"', " +
	"id_ruta = '" + txtIdRuta + "', " +
	"referencias = '" + txtReferencias +"' " +
	"WHERE id_cliente = " + inIDCliente + "";
	
	/*
	, [direccion] , [colonia], [telefono], [lugar], [id_ruta], [correo] ,[referencias]) " + 
	"values (" + id_cliente + ", '" + txtNombre + "', '" + txtDireccion + "', '" + txtColonia + "', '" + txtTelefono + "','" + txtLugar + "', " + txtIdRuta + ", '" + txtCorreo + "', '"+ txtReferencias +"')";
	*/
	System.out.println("consultaSaveModificarCliente: " + consultaSaveModificarCliente);

	myDBHelper.updateRecords(consultaSaveModificarCliente); //Ejecutar consulta para guardar el cliente
	
	response.sendRedirect("modificar_cliente.jsp");
	
%>
