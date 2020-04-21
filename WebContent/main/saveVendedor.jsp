<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="inventariojeans.*"%>

<%
	//******
	//txtAction = 1 ---> Agregar nuevo vendedor
	//txtAction = 2 ---> Cambiar vendedor a status Inactivo - activo = 0
	
	String txtAction = request.getParameter("txtAction");
	String txtIDVendedor = request.getParameter("txtIDVendedor");
	String txtNombre = request.getParameter("txtNombre");
	
	System.out.println("Datos");
	System.out.println("txtAction: " + txtAction);
	System.out.println("txtIDVendedor: " + txtIDVendedor);
	System.out.println("txtNombre: " + txtNombre);
	
	String consultaVendedor = "";
	
	DBHelper myDBHelper = new DBHelper();
	
	int action = Integer.parseInt(txtAction);
	
	if (action == 1)
	{
		//Crear consulta para guardar el vendedor
		consultaVendedor = "INSERT INTO inv_vendedores ([nombre], [activo]) values ('" + txtNombre + "', 1)";  
		
		System.out.println("consultaVendedor: " + consultaVendedor);

		myDBHelper.updateRecords(consultaVendedor); //Ejecutar consulta
	}
	
	if (action == 2)
	{
		//Crear consulta para cambiar status del vendedor
		consultaVendedor = "UPDATE inv_vendedores SET activo = 0 WHERE id_vendedor = " + txtIDVendedor;  
		
		System.out.println("consultaVendedor: " + consultaVendedor);

		myDBHelper.updateRecords(consultaVendedor); //Ejecutar consulta
	}
	
	response.sendRedirect("vendedores.jsp");
	
%>
