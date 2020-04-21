<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="inventariojeans.*"%>

<%

	String clmIdArticulo = request.getParameter("clmIdArticulo");
	String clmCantidad = request.getParameter("clmCantidad");
	String clmPrecio = request.getParameter("clmPrecio");
	String clmImporte = request.getParameter("clmImporte");

	String txtTotal = request.getParameter("txtTotal");
	String txtIDCliente = request.getParameter("txtIDCliente");
	String txtIDVendedor = request.getParameter("txtIDVendedor");

	//Estas lineas siempre las pongo solo para asegurarme que los datos se estan pasando al JSP correctamente
	System.out.println("Datos");
	System.out.println("clmIdArticulo: " + clmIdArticulo);
	System.out.println("clmCantidad " + clmCantidad);
	System.out.println("clmPrecio: " + clmPrecio);
	System.out.println("clmImporte: " + clmImporte);

	System.out.println("txtTotal: " + txtTotal);
	System.out.println("txtIDCliente: " + txtIDCliente);
	System.out.println("txtIDVendedor: " + txtIDVendedor);

	String[] aClmIdArticulo = clmIdArticulo.split("-");
	String[] aClmCantidad = clmCantidad.split("-");
	String[] aClmPrecio = clmPrecio.split("-");
	String[] aClmImporte = clmImporte.split("-");

	//Se crean listas dinámicas
	List<String> a1 = new ArrayList<String>(); //IDArticulo
	List<String> a2 = new ArrayList<String>(); //Cantidad
	List<String> a3 = new ArrayList<String>(); //Precio
	List<String> a4 = new ArrayList<String>(); //Importe

	//Se rellenan las listas con el contenido de los arreglos
	for(int i=0; i<aClmIdArticulo.length; i++)
	{	
		if(aClmIdArticulo[i].equals("|")){}
		else
		{
			//Se elimina el guion(-) que aparece el final de cada item
			aClmIdArticulo[i] = aClmIdArticulo[i].replace("-", "");
			a1.add(aClmIdArticulo[i]);
		}
	}
	
	//Se rellenan las listas con el contenido de los arreglos - Cantidad
	for(int i=0; i<aClmCantidad.length; i++)
	{	
		if(aClmCantidad[i].equals("|")){}
		else
		{
			a2.add(aClmCantidad[i]);
		}
	}
	
	//Se rellenan las listas con el contenido de los arreglos - Precio
	for(int i=0; i<aClmPrecio.length; i++)
	{	
		if(aClmPrecio[i].equals("|")){}
		else
		{
			a3.add(aClmPrecio[i]);
		}
	}
	
	//Se rellenan las listas con el contenido de los arreglos - Importe
	for(int i=0; i<aClmImporte.length; i++)
	{	
		if(aClmImporte[i].equals("|")){}
		else
		{
			a4.add(aClmImporte[i]);
		}
	}
	
	int sizeL = a1.size();
	int id_venta = 0;

	String fechaVenta = "";
	ProjectTasks myTasks = new ProjectTasks();

	Date today = new Date();
	fechaVenta = myTasks.turnDateTOSQLFormat(today);

	System.out.println("Fecha devuelta: " + fechaVenta);

	DBHelper dbHelper = new DBHelper();
	ResultSet rs=null;
	String consultaSaveVenta = "";

	//Determinar el no. de venta mas grande - 2019-09-27
	String consultaUltimaVenta = "SELECT MAX(id_venta) FROM inv_ventas";

	try
	{
		rs = dbHelper.getRecords(consultaUltimaVenta, 1);
		id_venta = rs.getInt(1)+1;
		//nombreCliente = rs.getString(2);
	}
	catch (Exception e)
	{
		System.out.println(e);
	}

	System.out.println("id_venta: " + id_venta);

	//Crear consulta para guardar la venta
	consultaSaveVenta = "insert into inv_ventas ([id_venta], [id_cliente], [total], [saldo], [fecha], [id_vendedor], [estado]) values (" + id_venta + ", " + txtIDCliente + ", " + txtTotal + ", " + txtTotal + ", '" + fechaVenta + "', " + txtIDVendedor +", " + 1 + ")";

	System.out.println("consultaSaveVenta" + consultaSaveVenta);

	dbHelper.updateRecords(consultaSaveVenta); //Ejecutar consulta para guardar la venta

	//Obtener la última venta para ese cliente
	consultaUltimaVenta = "select max(v.id_venta) from inv_ventas as v inner join inv_clientes as c on v.id_cliente = c.id_cliente where c.id_cliente = " + txtIDCliente;

	try
	{
		rs = dbHelper.getRecords(consultaUltimaVenta, 1);
		id_venta = rs.getInt(1);
		//nombreCliente = rs.getString(2);
	}
	catch (Exception e)
	{
		System.out.println(e);
	}

	System.out.println("id_venta: " + id_venta);
	String consultaSaveDetallesVenta = "";
	
	//Insertar partidas de la venta Original
	for(int i=0; i<sizeL; i++)
	{
		consultaSaveDetallesVenta = "INSERT INTO inv_ventas_detalle ([id_venta], [id_articulo], [cantidad], [precio], [importe], [actual]) VALUES (" + id_venta + ", " + a1.get(i) +", " + a2.get(i) +", " + a3.get(i) +", " + a4.get(i) + ", 0)";

		System.out.println("consultaSaveDetallesVenta: " + consultaSaveDetallesVenta);
		dbHelper.updateRecords(consultaSaveDetallesVenta); 
	}

	//Insertar partidas de la venta actual
	for(int i=0; i<sizeL; i++)
	{
		consultaSaveDetallesVenta = "INSERT INTO inv_ventas_detalle ([id_venta], [id_articulo], [cantidad], [precio], [importe], [actual]) VALUES (" + id_venta + ", " + a1.get(i) +", " + a2.get(i) +", " + a3.get(i) +", " + a4.get(i) + ", 1)";

		System.out.println("consultaSaveDetallesVenta: " + consultaSaveDetallesVenta);
		dbHelper.updateRecords(consultaSaveDetallesVenta); 
	}
	
	//dbHelper.updateRecords(consultaSaveVenta); //Ejecutar consulta para guardar el cliente

	//Generar tarjeta en ruta de servidor Apache
	//Generar XML
	CreateXMLTarjeta createXML = new CreateXMLTarjeta();
	createXML.createTarjeta(id_venta);
	
	//Ejecutar FOP
	RunFOP runFOP=new RunFOP();
	runFOP.createPDF(id_venta);
	
	response.sendRedirect("nueva_venta.jsp");

	
%>
