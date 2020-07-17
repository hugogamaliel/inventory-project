package inventariojeans;

import java.util.Date;
import java.io.IOException;
import java.sql.*;

import javax.ws.rs.Consumes;
//import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
//import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import inventariojeans.Cliente;
import inventariojeans.Ventas;

@Path("/postservices")
public class RESTfulPOSTServices 
{
	@POST
    @Path("/post-cliente")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response postCliente(Cliente cliente){
        
        System.out.println("ID: " + cliente.id);
        System.out.println("Cliente: " + cliente);
        System.out.println("Nombre: " + cliente.nombre);
        System.out.println("Direccion: " + cliente.direccion);
        System.out.println("Colonia: " + cliente.colonia);
        System.out.println("Celular: " + cliente.celular);
        System.out.println("Lugar: " + cliente.lugar);
        System.out.println("Ruta: " + cliente.ruta);
        System.out.println("Referencias: " + cliente.referencias);
        
        String result = "";
        //Guardar cliente
        DBHelper myDBHelper = new DBHelper();
        
        try
        {
        	String consultaSaveCliente = "INSERT INTO inv_clientes " +  
            		"([id_cliente] , [nombre] , [direccion] , [colonia], [telefono], [lugar], [id_ruta], [referencias]) " + 
            		"VALUES (" + cliente.id + ", '" + cliente.nombre + "', '" + cliente.direccion + "', '" + cliente.colonia + "', '" + 
            		cliente.celular + "','" + cliente.lugar + "', " + cliente.ruta + ", '"+ cliente.referencias +"')";
            
            System.out.println("consultaSaveCliente" + consultaSaveCliente);

        	myDBHelper.updateRecords(consultaSaveCliente); //Ejecutar consulta para guardar el cliente
        	
        	result = "Record entered: "+ cliente;
        }
        catch(Exception e)
        {
        	System.out.println("Error: " + e);
        }
        
    	
        return Response.status(201).entity(result).build();
    }
	
	@POST
    @Path("/post-modificar-cliente")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response postModificarCliente(Cliente cliente){
        String result = "Record entered: "+ cliente;
        System.out.println("ID: " + cliente.id);
        System.out.println("Cliente: " + cliente);
        System.out.println("Nombre: " + cliente.nombre);
        System.out.println("Direccion: " + cliente.direccion);
        System.out.println("Colonia: " + cliente.colonia);
        System.out.println("Celular: " + cliente.celular);
        System.out.println("Lugar: " + cliente.lugar);
        System.out.println("Ruta: " + cliente.ruta);
        System.out.println("Referencias: " + cliente.referencias);
        
        //Guardar cliente
        DBHelper myDBHelper = new DBHelper();
        
        String consultaSaveModificarCliente = "UPDATE inv_clientes SET " +  
        		"nombre = '" + cliente.nombre +"', " +
        		"direccion = '" + cliente.direccion +"', " +
        		"colonia = '" + cliente.colonia +"', " +
        		"telefono = '" + cliente.celular +"', " +
        		"lugar = '" + cliente.lugar +"', " +
        		"id_ruta = '" + cliente.ruta + "', " +
        		"referencias = '" + cliente.referencias +"' " +
        		"WHERE id_cliente = " + cliente.id + "";
        
        System.out.println("consultaSaveModificarCliente" + consultaSaveModificarCliente);

    	myDBHelper.updateRecords(consultaSaveModificarCliente); //Ejecutar consulta para modificar cliente
    	
        return Response.status(201).entity(result).build();
    }
	
	@POST
	@Path("/post-venta")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response postVenta(Ventas venta) throws SQLException, IOException
	{
		int idVenta = 0;
		
		String fechaVenta = "";
		ProjectTasks myTasks = new ProjectTasks();

		Date today = new Date();
		fechaVenta = myTasks.turnDateTOSQLFormat(today, 1);

		System.out.println("Fecha devuelta: " + fechaVenta);

		DBHelper dbHelper = new DBHelper();
		ResultSet rs=null;
		String consultaSaveVenta = "";

		//Determinar el no. de venta mas grande en la tabla - 2019-09-27
		String consultaUltimaVenta = "SELECT MAX(id_venta) FROM inv_ventas";

		try
		{
			rs = dbHelper.getRecords(consultaUltimaVenta, 1);
			idVenta = rs.getInt(1)+1;
		}
		catch (Exception e)
		{
			System.out.println(e);
		}

		System.out.println("idVenta: " + idVenta);

		//Crear consulta para guardar la venta
		consultaSaveVenta = "INSERT INTO inv_ventas ([id_venta], [id_cliente], [total], [saldo], [fecha], [id_vendedor], [estado]) "
				+ "VALUES (" + idVenta + ", " + venta.id + ", " + venta.total + ", " + venta.total + ", '" + fechaVenta + "', " 
				+ venta.idVendedor +", " + 1 + ")";

		System.out.println("consultaSaveVenta" + consultaSaveVenta);

		dbHelper.updateRecords(consultaSaveVenta); //Ejecutar consulta para guardar la venta

		String consultaSaveDetallesVenta = "";
		
		//Insertar partidas de la venta Original
		for (Item myItems : venta.getItems())
		{
			consultaSaveDetallesVenta = "INSERT INTO inv_ventas_detalle ([id_venta], [id_articulo], [cantidad], [precio], [importe], [actual])"
					+ " VALUES (" + idVenta + ", " + myItems.idArticulo +", " + myItems.cantidad +", " + myItems.precio +", " 
					+ myItems.importe + ", 0)";
			
			System.out.println("consultaSaveDetallesVenta: " + consultaSaveDetallesVenta);
			dbHelper.updateRecords(consultaSaveDetallesVenta);
		}
		//Insertar partidas de la venta actual
		for (Item myItems : venta.getItems())
		{
			consultaSaveDetallesVenta = "INSERT INTO inv_ventas_detalle ([id_venta], [id_articulo], [cantidad], [precio], [importe], [actual])"
					+ " VALUES (" + idVenta + ", " + myItems.idArticulo +", " + myItems.cantidad +", " + myItems.precio +", " 
					+ myItems.importe + ", 1)";
			
			System.out.println("consultaSaveDetallesVenta: " + consultaSaveDetallesVenta);
			dbHelper.updateRecords(consultaSaveDetallesVenta);
		}

		//Generar tarjeta en ruta de servidor Apache
		//Generar XML
		
		CreateXMLTarjeta createXML = new CreateXMLTarjeta();
		createXML.createTarjeta(idVenta);
		
		//Ejecutar FOP
		
		RunFOP runFOP=new RunFOP();
		runFOP.createPDF(idVenta);
		
		//response.sendRedirect("nueva_venta.jsp");
		String result = "Record entered: "+ venta;
		
		System.out.println("Result: " + result);
		return Response.status(201).entity(result).build();
		
	}
	
	//18-jun-2020
	@POST
    @Path("/post-abono")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response postAbono(Abono abono) throws SQLException, IOException{
        
        System.out.println("IdVenta: " + abono.idVenta);
        System.out.println("Cantidad: " + abono.cantidad);
        System.out.println("Nuevo Saldo: " + abono.saldo);
        System.out.println("IsEnganche: " + abono.isEnganche);
        
        int idVenta = 0;
        String result = "";
        DBHelper myDBHelper = new DBHelper();
        
        //Calculate fecha
        String fechaAbono = "";
    	ProjectTasks myTasks = new ProjectTasks();

    	Date today = new Date();
    	fechaAbono = myTasks.turnDateTOSQLFormat(today, 1);

    	System.out.println("Fecha devuelta: " + fechaAbono);
    	
        try
        {
        	String consultaSaveAbono = "INSERT INTO inv_abonos " +  
            		"([id_venta] , [cantidad] , [saldo] , [fecha], [isEnganche]) " + 
            		"VALUES (" + abono.idVenta + ", " + abono.cantidad + ", " + abono.saldo + ", '" + fechaAbono + "', " + 
            		abono.isEnganche + ")";
            
            System.out.println("consultaSaveAbono " + consultaSaveAbono);

        	myDBHelper.updateRecords(consultaSaveAbono); //Ejecutar consulta para guardar el abono
        	
        	result = "Record entered: "+ abono;
        }
        catch(Exception e)
        {
        	System.out.println("Error: " + e);
        }
        
        //Consulta para actualizar el saldo

    	String consultaActualizarSaldo = "UPDATE inv_ventas SET saldo = " + abono.saldo + " WHERE id_venta = " + abono.idVenta;

    	System.out.println("consultaActualizarSaldo: " + consultaActualizarSaldo);
    	
    	myDBHelper.updateRecords(consultaActualizarSaldo); //Ejecutar consulta para actualizar el saldo
    	
    	//Actualizar status de cuenta - 2020-07-17
    	int nvoSaldo = Integer.parseInt(abono.saldo);
    	System.out.println("Saldo que quedaría: " + nvoSaldo);
    	
    	//Si el saldo quedaría en 0 la cuenta quedaría pagada, entonces cambiar su status a 'Pagada'
    	if (nvoSaldo==0)
    	{
    		String consultaCambiarStatus = "UPDATE inv_ventas SET estado = 4 WHERE id_venta = " + abono.idVenta;
    		
    		try
            {
                System.out.println("consultaCambiarStatus: " + consultaCambiarStatus);
            	myDBHelper.updateRecords(consultaCambiarStatus); //Ejecutar consulta para cambiar status a 'Pagada'
            }
            catch(Exception e)
            {
            	System.out.println("Error: " + e);
            }
    	}
    
    	//Actualizar PDF de tarjeta
    	
    	idVenta = Integer.parseInt(abono.idVenta);
    	
    	CreateXMLTarjeta createXML = new CreateXMLTarjeta();
    	createXML.createTarjeta(idVenta);
    	
    	//Ejecutar FOP
    	RunFOP runFOP=new RunFOP();
    	runFOP.createPDF(idVenta);
        
        return Response.status(201).entity(result).build();
    }

}
