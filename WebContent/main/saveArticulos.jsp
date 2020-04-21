<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="inventariojeans.*"%>

<%
	//******
	//txtAction = 1 ---> Agregar nuevo articulo
	//txtAction = 2 ---> Modificar articulo
	//txtAction = 3 ---> Eliminar articulo
	
	String txtAction = request.getParameter("txtAction");
	String txtDescripcion = request.getParameter("txtDescripcion");
	String txtPrecio = request.getParameter("txtPrecio");
	String txtIDArticulo = request.getParameter("txtIDArticulo");
	
	System.out.println("Datos");
	System.out.println("txtAction: " + txtAction);
	System.out.println("txtDescripcion: " + txtDescripcion);
	System.out.println("txtPrecio: " + txtPrecio);
	System.out.println("txtIDArticulo: " + txtIDArticulo);
	
	String consultaArticulos = "";
	int id_articulo=0;
	
	DBHelper myDBHelper = new DBHelper();
	ResultSet rs=null;
	
	int action = Integer.parseInt(txtAction);
	
	if (action == 1)
	{
		//Determinar max id_articulo
		consultaArticulos = "SELECT MAX(id_articulo) FROM inv_articulos";

		try
		{
			rs = myDBHelper.getRecords(consultaArticulos, 1);
			id_articulo = rs.getInt(1)+1;
		}
		catch (Exception e)
		{
			System.out.println(e);
		}

		System.out.println("id_articulo: " + id_articulo);
		//Crear consulta para guardar el nuevo articulo
		consultaArticulos = "INSERT INTO inv_articulos ([descripcion], [precio], [activo], [id_articulo]) values ('" 
		+ txtDescripcion + "', " + txtPrecio +", 1, " + id_articulo +")";  
		
		System.out.println("consultaVendedor: " + consultaArticulos);

		myDBHelper.updateRecords(consultaArticulos); //Ejecutar consulta
	
	}
	
	if (action == 2)
	{
		//Crear consulta para modificar articulo
		consultaArticulos = "UPDATE inv_articulos SET descripcion = '" + txtDescripcion + "', precio = " + txtPrecio + " WHERE id_articulo = " + txtIDArticulo;  
		
		System.out.println("consultaVendedor: " + consultaArticulos);

		myDBHelper.updateRecords(consultaArticulos); //Ejecutar consulta
	}
	
	if (action == 3)
	{
		//Crear consulta para cambiar articulo activo = 0
		consultaArticulos = "UPDATE inv_articulos SET activo = 0 WHERE id_articulo = " + txtIDArticulo;  
		
		System.out.println("consultaVendedor: " + consultaArticulos);

		myDBHelper.updateRecords(consultaArticulos); //Ejecutar consulta
	}
	
	response.sendRedirect("articulos.jsp");
	
%>
