<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="inventariojeans.*"%>

<%

	String clmIDSOriginal = request.getParameter("clmIDSOriginal");

	String clmIDVenta = request.getParameter("clmIDVenta");
	String clmCantidad = request.getParameter("clmCantidad");
	String clmPrecio = request.getParameter("clmPrecio");
	String clmImporte = request.getParameter("clmImporte");
	String clmIDArticulo = request.getParameter("clmIDArticulo");

	String txtTotal = request.getParameter("txtTotal");
	String txtIDVenta = request.getParameter("txtIDVenta");
	String txtAction = request.getParameter("txtAction");
	
	int totalAbonado = 0;
	int total = 0;
	int saldo = 0;
	int id_venta = 0;
	
	//Estas lineas siempre las pongo solo para asegurarme que los datos se estan pasando al JSP correctamente
	System.out.println("Datos");
	System.out.println("clmIDSOriginal: " + clmIDSOriginal);
	
	System.out.println("clmIDVenta " + clmIDVenta);
	System.out.println("clmCantidad: " + clmCantidad);
	System.out.println("clmPrecio: " + clmPrecio);
	System.out.println("clmImporte: " + clmImporte);
	System.out.println("clmIDArticulo: " + clmIDArticulo);

	System.out.println("txtTotal: " + txtTotal);
	System.out.println("txtIDVenta: " + txtIDVenta);
	System.out.println("txtAction: " + txtAction);

	String[] aClmIDSOriginal = clmIDSOriginal.split("-");
	
	String[] aClmIDVenta = clmCantidad.split("-");
	String[] aClmCantidad = clmCantidad.split("-");
	String[] aClmPrecio = clmPrecio.split("-");
	String[] aClmImporte = clmImporte.split("-");
	String[] aClmIDArticulo = clmIDArticulo.split("-");

	//Se crean listas dinÃ¡micas
	List<String> a1 = new ArrayList<String>(); //ID's
	List<String> a2 = new ArrayList<String>(); //Cantidad
	List<String> a3 = new ArrayList<String>(); //Precio
	List<String> a4 = new ArrayList<String>(); //Importe
	List<String> a5 = new ArrayList<String>(); //IDArticulo

	//Se rellenan las listas con el contenido de los arreglos
	for(int i=0; i<aClmIDSOriginal.length; i++)
	{	
		if(aClmIDSOriginal[i].equals("|")){}
		else
		{
			//Se elimina el guion(-) que aparece el final de cada item
			aClmIDSOriginal[i] = aClmIDSOriginal[i].replace("-", "");
			a1.add(aClmIDSOriginal[i]);
		}
	}
	
	//Se rellenan las listas con el contenido de los arreglos
	for(int i=0; i<aClmCantidad.length; i++)
	{	
		if(aClmCantidad[i].equals("|")){}
		else
		{
			a2.add(aClmCantidad[i]);
		}
	}
	
	//Se rellenan las listas con el contenido de los arreglos
	for(int i=0; i<aClmPrecio.length; i++)
	{	
		if(aClmPrecio[i].equals("|")){}
		else
		{
			a3.add(aClmPrecio[i]);
		}
	}
	
	//Se rellenan las listas con el contenido de los arreglos
	for(int i=0; i<aClmImporte.length; i++)
	{	
		if(aClmImporte[i].equals("|")){}
		else
		{
			a4.add(aClmImporte[i]);
		}
	}
	
	//Se rellenan las listas con el contenido de los arreglos
		for(int i=0; i<aClmIDArticulo.length; i++)
		{	
			if(aClmIDArticulo[i].equals("|")){}
			else
			{
				a5.add(aClmIDArticulo[i]);
			}
		}
	
	/* 23-dic-19 NO SE HA NECESITADO ESTE CÓDIGO
	String fechaVenta = "";
	ProjectTasks myTasks = new ProjectTasks();

	Date today = new Date();
	fechaVenta = myTasks.turnDateTOSQLFormat(today);

	System.out.println("Fecha devuelta: " + fechaVenta);
	*/
	
	DBHelper dbHelper = new DBHelper();
	ResultSet rs=null;
	String consulta = "";

	if (txtAction.equals("1"))
	{
		int sizeL = a1.size();
		//Modificar las partidas a actual=0 de todos los IDs
		for(int i=0; i<sizeL; i++)
		{
			if (a3.get(i).equals("0"))
			{
				consulta = "UPDATE inv_ventas_detalle SET actual = 2, cantidad = "+ a2.get(i) + " WHERE id_ventas_detalle = " + a1.get(i);
			}
			else
			{
				consulta = "UPDATE inv_ventas_detalle SET actual = 3, cantidad = "+ a2.get(i) + " WHERE id_ventas_detalle = " + a1.get(i);	
			}
			

			System.out.println("consulta: " + consulta);
			dbHelper.updateRecords(consulta); 
		}
		
		//Insertar las nuevas partidas con valor actual = 1
		sizeL = a3.size();
		for(int i=0; i<sizeL; i++)
		{
			consulta = "INSERT INTO inv_ventas_detalle ([id_venta], [id_articulo], [cantidad], [precio], [importe], [actual])" +
					" VALUES (" + txtIDVenta + ", " + a5.get(i) + ", " + a2.get(i) + ", " + a3.get(i) + ", " + a4.get(i) + ", 1)";

			System.out.println("consulta: " + consulta);
			dbHelper.updateRecords(consulta); 
		}
				
		//Modificar el total y el estado en la venta
		
		//Sumar el monto total abonado para descontarlo del nuevo saldo
		consulta = "select sum(cantidad) from inv_abonos where id_venta = " + txtIDVenta;//Consulta para sumar abonos
		try
		{
			rs = dbHelper.getRecords(consulta, 1);
			totalAbonado = rs.getInt(1);
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		
		total = Integer.parseInt(txtTotal);
		saldo = total - totalAbonado;
		System.out.println("Nuevo saldo: " + saldo);
		
		consulta = "UPDATE inv_ventas SET total = " + txtTotal + ", saldo = " + saldo + ", estado = 2 WHERE id_venta = " + txtIDVenta;
		System.out.println("consulta: " + consulta);
		dbHelper.updateRecords(consulta);
		
		
	}
	
	if (txtAction.equals("2"))
	{
		consulta = "update inv_ventas set estado = 3 where id_venta = " + txtIDVenta;
		System.out.println("consulta: " + consulta);
		dbHelper.updateRecords(consulta);
		
		consulta = "update inv_ventas_detalle set actual = 2 where id_venta = " + txtIDVenta;
		System.out.println("consulta: " + consulta);
		dbHelper.updateRecords(consulta);
	}
	
	id_venta= Integer.parseInt(txtIDVenta);
	
	//Generar tarjeta en ruta de servidor Apache
	//Generar XML
	CreateXMLTarjeta createXML = new CreateXMLTarjeta();
	createXML.createTarjeta(id_venta);
		
	//Ejecutar FOP
	RunFOP runFOP=new RunFOP();
	runFOP.createPDF(id_venta);
	
	runFOP.createPDF(id_venta);
	
	response.sendRedirect("modificar_venta.jsp");
	
%>
