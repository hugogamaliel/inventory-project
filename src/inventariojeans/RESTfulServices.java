package inventariojeans;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.sql.*;

import javax.ws.rs.core.Response;

import inventariojeans.*;

@Path("/services")
public class RESTfulServices 
{	
	@GET
	@Path("/datos_cliente/{id_cliente}")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response getDatos_cliente(@PathParam("id_cliente") String id_cliente) throws SQLException 
	{
		String consulta="", resp="";
		
		id_cliente = id_cliente.replace("id_cliente=", "");
		
		ResultSet rs=null;
		
		consulta = "select c.id_cliente, c.nombre, c.direccion, c.colonia, c.telefono, c.lugar, v.saldo from inv_clientes as c inner join inv_ventas as v on c.id_cliente = v.id_cliente where c.id_cliente = " + id_cliente;
		
		DBHelper dbHelper = new DBHelper();
		
		System.out.println("Consulta: " + consulta);
		try
		{
			rs = dbHelper.getRecords(consulta, 1);
			resp = "{'cliente': {'id_cliente': '" + rs.getInt(1) + 
					"', 'nombre': '" + rs.getString(2) + 
					"','direccion':'" + rs.getString(3) + 
					"','colonia':'" + rs.getString(4) + 
					"', 'telefono':'" + rs.getString(5) +
					"', 'lugar':'" + rs.getString(6) +
					"', 'saldo':'" + rs.getString(7) +
					"'}}";
		}
		catch (Exception e)
		{
			System.out.println("Error: " + e);
		}

		resp = resp.replaceAll("'", "\"");
		System.out.println(resp);
	    return Response.status(200).entity(resp).build();
	}
	
	@GET
	@Path("/get_cliente/{id_cliente}")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response getCliente(@PathParam("id_cliente") String id_cliente) throws SQLException 
	{
		String consulta="", resp="";
		
		id_cliente = id_cliente.replace("id_cliente=", "");
		
		ResultSet rs=null;
		
		consulta = "SELECT id_cliente, nombre, direccion, colonia, telefono, lugar, referencias FROM inv_clientes WHERE id_cliente = " + id_cliente;
		
		DBHelper dbHelper = new DBHelper();
		
		System.out.println("Consulta: " + consulta);
		try
		{
			rs = dbHelper.getRecords(consulta, 1);
			resp = "{'cliente': {'id_cliente': '" + rs.getInt(1) + 
					"', 'nombre': '" + rs.getString(2) + 
					"','direccion':'" + rs.getString(3) + 
					"','colonia':'" + rs.getString(4) + 
					"', 'telefono':'" + rs.getString(5) +
					"', 'lugar':'" + rs.getString(6) +
					"', 'referencias':'" + rs.getString(7) +
					"'}}";
		}
		catch (Exception e)
		{
			System.out.println("Error: " + e);
		}

		resp = resp.replaceAll("'", "\"");
		System.out.println(resp);
	    return Response.status(200).entity(resp).build();
	}
	
	@GET
	@Path("/datos_cliente_by_id/{id_cuenta}")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response getClienteByID(@PathParam("id_cuenta") String id_cuenta) throws SQLException 
	{
		String consulta="", resp="";
		
		id_cuenta = id_cuenta.replace("id_cuenta=", "");
		
		ResultSet rs=null;
		
		consulta = "SELECT c.id_cliente, c.nombre, c.direccion, c.colonia, c.telefono, c.lugar, v.saldo, v.estado "
				+ "from inv_clientes AS c INNER JOIN inv_ventas AS v ON c.id_cliente = v.id_cliente WHERE v.id_venta = " + id_cuenta;
		
		DBHelper dbHelper = new DBHelper();
		
		System.out.println("Consulta: " + consulta);
		try
		{
			rs = dbHelper.getRecords(consulta, 1);
			resp = "{'cliente': {'id_cliente': '" + rs.getInt(1) + 
					"', 'nombre': '" + rs.getString(2) + 
					"','direccion':'" + rs.getString(3) + 
					"','colonia':'" + rs.getString(4) + 
					"', 'telefono':'" + rs.getString(5) +
					"', 'lugar':'" + rs.getString(6) +
					"', 'saldo':'" + rs.getString(7) +
					"', 'estado':'" + rs.getString(8) +
					"'}}";
		}
		catch (Exception e)
		{
			System.out.println("Error: " + e);
		}

		resp = resp.replaceAll("'", "\"");
		System.out.println(resp);
	    return Response.status(200).entity(resp).build();
	}
	
	@GET
	@Path("/abonos/{id_venta}")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response getAbonos(@PathParam ("id_venta") String id_venta) throws SQLException 
	{
		String consulta="", resp="", row="";
		
		id_venta = id_venta.replace("id_venta=", "");
		
		ResultSet rs=null;
		
		//consulta = "select * from v_abonos where id_venta  = " + id_venta;
		consulta = "SELECT c.id_cliente, a.id_venta, FORMAT(a.fecha, 'dd-MM-yyyy') AS fecha, a.cantidad, a.saldo, "
				+ "CASE WHEN a.isEnganche = 1 THEN 'Enganche' ELSE '' END AS enganche "
				+ "FROM dbo.inv_abonos AS a "
				+ "INNER JOIN dbo.inv_ventas AS v ON a.id_venta = v.id_venta "
				+ "INNER JOIN dbo.inv_clientes AS c ON v.id_cliente = c.id_cliente WHERE a.id_venta = " + id_venta;
		
		DBHelper dbHelper = new DBHelper();
		
		System.out.println("Consulta: " + consulta);
		try
		{
			rs = dbHelper.getRecords(consulta, 2);		
		}
		catch (Exception e)
		{
			System.out.println("Error: " + e);
		}
	
		int rsCount = 0;

		while(rs.next())
		{
			row = "{'fecha':'" + rs.getString(3).replace(" 00:00:00.0", "") + 
					"', 'cantidad': '" + rs.getString(4)+
					"', 'saldo': '" + rs.getString(5)+
					"', 'enganche': '" + rs.getString(6)+
					"'},";
			
			resp = resp + row;
		    rsCount = rsCount + 1;
		}
				
		resp = "{'abonos':["+ resp + "]}";
		resp = resp.replaceAll(",]}", "]}");
		resp = resp.replaceAll("'", "\"");
		System.out.println(resp);
	    return Response.status(200).entity(resp).build();
	}
	
	@GET
	@Path("/ventas_detalle_general/{id_venta}")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response getVentasDetalle(@PathParam ("id_venta") String id_venta) throws SQLException 
	{
		String consulta="", resp="", row="";
		
		id_venta = id_venta.replace("id_venta=", "");
		
		ResultSet rs=null;
		
		//consulta = "select * from v_ventas_detalle where id_venta  = " + id_venta + " and actual = 1";
		
		consulta = "select * from v_ventas_detalle where id_venta = " + id_venta + " and actual <> 1";
		
		DBHelper dbHelper = new DBHelper();
		
		System.out.println("Consulta: " + consulta);
		try
		{
			rs = dbHelper.getRecords(consulta, 2);		
		}
		catch (Exception e)
		{
			System.out.println("Error: " + e);
		}
	
		int rsCount = 0;

		while(rs.next())
		{
			row = "{'id_venta':'" + rs.getString(1) +
					"', 'descripcion': '" + rs.getString(4) +
					"', 'cantidad': '" + rs.getString(5) +
					"', 'precio': '" + rs.getString(6) +
					"', 'importe': '" + rs.getString(7) +
					"', 'id_articulo': '" + rs.getString(8) +
					"', 'id_ventas_detalle': '" + rs.getString(3) +
					"', 'estado': '" + rs.getString(10) +
					"'},";
			
			resp = resp + row;
		    rsCount = rsCount + 1;
		}
				
		resp = "{'ventas_detalle':["+ resp + "]}";
		resp = resp.replaceAll(",]}", "]}");
		resp = resp.replaceAll("'", "\"");
		System.out.println(resp);
	    return Response.status(200).entity(resp).build();
	}
	
	@GET
	@Path("/ventas_detalle_actual/{id_venta}")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response getVentasDetalleAbonos(@PathParam ("id_venta") String id_venta) throws SQLException 
	{
		String consulta="", resp="", row="";
		
		id_venta = id_venta.replace("id_venta=", "");
		
		ResultSet rs=null;
		
		consulta = "SELECT * FROM v_ventas_detalle WHERE id_venta  = " + id_venta + " AND actual = 1";
		
		//consulta = "select * from v_ventas_detalle where id_venta  = " + id_venta;
		
		DBHelper dbHelper = new DBHelper();
		
		System.out.println("Consulta: " + consulta);
		try
		{
			rs = dbHelper.getRecords(consulta, 2);		
		}
		catch (Exception e)
		{
			System.out.println("Error: " + e);
		}
	
		int rsCount = 0;

		while(rs.next())
		{
			row = "{'id_venta':'" + rs.getString(1) +
					"', 'descripcion': '" + rs.getString(4) +
					"', 'cantidad': '" + rs.getString(5) +
					"', 'precio': '" + rs.getString(6) +
					"', 'importe': '" + rs.getString(7) +
					"', 'id_articulo': '" + rs.getString(8) +
					"', 'id_ventas_detalle': '" + rs.getString(3) +
					"'},";
			
			resp = resp + row;
		    rsCount = rsCount + 1;
		}
				
		resp = "{'ventas_detalle':["+ resp + "]}";
		resp = resp.replaceAll(",]}", "]}");
		resp = resp.replaceAll("'", "\"");
		System.out.println(resp);
	    return Response.status(200).entity(resp).build();
	}
	
	@GET
	@Path("/busquedas/{nombre}/{direccion}")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response getBusquedas(@PathParam ("nombre") String nombre, @PathParam ("direccion") String direccion) throws SQLException 
	{
		String consulta="", resp="", row="";
		
		nombre = nombre.replace("nombre=", "");
		direccion = direccion.replace("direccion=", "");
		
		ResultSet rs=null;
		
		/*
		consulta = "SELECT id_cliente, nombre, direccion, colonia, telefono, lugar, id_ruta FROM inv_clientes "
				+ "WHERE nombre LIKE '%" + nombre + "%' OR direccion LIKE '%" + direccion + "%' OR colonia LIKE '%" + colonia + "%'";
		*/
		consulta = "SELECT id_cliente, nombre, direccion, colonia, telefono, lugar, id_ruta FROM inv_clientes "
				+ "WHERE nombre LIKE '%" + nombre + "%' OR direccion LIKE '%" + direccion + "%'";
		
		DBHelper dbHelper = new DBHelper();
		
		System.out.println("Consulta: " + consulta);
		try
		{
			rs = dbHelper.getRecords(consulta, 2);		
		}
		catch (Exception e)
		{
			System.out.println("Error: " + e);
		}
	
		int rsCount = 0;

		while(rs.next())
		{
			row = "{'id_cliente':'" + rs.getString(1) +
					"', 'nombre': '" + rs.getString(2) +
					"', 'direccion': '" + rs.getString(3) +
					"', 'colonia': '" + rs.getString(4) +
					"', 'telefono': '" + rs.getString(5) +
					"', 'lugar': '" + rs.getString(6) +
					"', 'id_ruta': '" + rs.getString(7) +
					"'},";
			
			resp = resp + row;
		    rsCount = rsCount + 1;
		}
				
		resp = "{'clientes':["+ resp + "]}";
		resp = resp.replaceAll(",]}", "]}");
		resp = resp.replaceAll("'", "\"");
		System.out.println(resp);
	    return Response.status(200).entity(resp).build();
	}
	
	@GET
	@Path("/busquedasAND/{nombre}/{direccion}")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response getBusquedasAND(@PathParam ("nombre") String nombre, @PathParam ("direccion") String direccion) throws SQLException 
	{
		String consulta="", resp="", row="";
		
		nombre = nombre.replace("nombre=", "");
		direccion = direccion.replace("direccion=", "");
		
		ResultSet rs=null;
		
		/*
		consulta = "SELECT id_cliente, nombre, direccion, colonia, telefono, lugar, id_ruta FROM inv_clientes "
				+ "WHERE nombre LIKE '%" + nombre + "%' OR direccion LIKE '%" + direccion + "%' OR colonia LIKE '%" + colonia + "%'";
		*/
		consulta = "SELECT id_cliente, nombre, direccion, colonia, telefono, lugar, id_ruta FROM inv_clientes "
				+ "WHERE nombre LIKE '%" + nombre + "%' AND direccion LIKE '%" + direccion + "%'";
		
		DBHelper dbHelper = new DBHelper();
		
		System.out.println("Consulta: " + consulta);
		try
		{
			rs = dbHelper.getRecords(consulta, 2);		
		}
		catch (Exception e)
		{
			System.out.println("Error: " + e);
		}
	
		int rsCount = 0;

		while(rs.next())
		{
			row = "{'id_cliente':'" + rs.getString(1) +
					"', 'nombre': '" + rs.getString(2) +
					"', 'direccion': '" + rs.getString(3) +
					"', 'colonia': '" + rs.getString(4) +
					"', 'telefono': '" + rs.getString(5) +
					"', 'lugar': '" + rs.getString(6) +
					"', 'id_ruta': '" + rs.getString(7) +
					"'},";
			
			resp = resp + row;
		    rsCount = rsCount + 1;
		}
				
		resp = "{'clientes':["+ resp + "]}";
		resp = resp.replaceAll(",]}", "]}");
		resp = resp.replaceAll("'", "\"");
		System.out.println(resp);
	    return Response.status(200).entity(resp).build();
	}
	
	@GET
	@Path("/nombres_clientes")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response getNombresClientes() throws SQLException 
	{
		String consulta="", resp="", row="";
		
		//id_ruta = id_ruta.replace("id_ruta=", "");
		
		ResultSet rs=null;
		
		consulta = "select id_cliente, nombre, direccion, colonia, telefono, lugar from inv_clientes";
		
		DBHelper dbHelper = new DBHelper();
		
		System.out.println("Consulta: " + consulta);
		try
		{
			rs = dbHelper.getRecords(consulta, 2);		
		}
		catch (Exception e)
		{
			System.out.println("Error: " + e);
		}
	
		int rsCount = 0;

		while(rs.next())
		{
			row = "{'id_cliente':'" + rs.getString(1) + 
					"', 'nombre': '" + rs.getString(2)+
					"', 'direccion': '" + rs.getString(3)+
					"', 'colonia': '" + rs.getString(4)+
					"', 'telefono': '" + rs.getString(5)+
					"', 'lugar': '" + rs.getString(6)+
					"'},";
			
			resp = resp + row;
		    rsCount = rsCount + 1;
		}
				
		resp = "{'clientes':["+ resp + "]}";
		resp = resp.replaceAll(",]}", "]}");
		resp = resp.replaceAll("'", "\"");
		System.out.println(resp);
	    return Response.status(200).entity(resp).build();
	}
	
	@GET
	@Path("/rutas")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response getRutas() throws SQLException 
	{
		String consulta="", resp="", row="";
		
		//id_ruta = id_ruta.replace("id_ruta=", "");
		
		ResultSet rs=null;
		
		consulta = "select * from inv_rutas";
		
		DBHelper dbHelper = new DBHelper();
		
		System.out.println("Consulta: " + consulta);
		try
		{
			rs = dbHelper.getRecords(consulta, 2);		
		}
		catch (Exception e)
		{
			System.out.println("Error: " + e);
		}
	
		int rsCount = 0;

		while(rs.next())
		{
			row = "{'id_ruta':'" + rs.getInt(1) + 
					"', 'descripcion': '" + rs.getString(2)+
					"', 'lugar': '" + rs.getString(3)+
					"', 'id_cobrador': '" + rs.getInt(4)+
					"'},";
			
			resp = resp + row;
		    rsCount = rsCount + 1;
		}
				
		resp = "{'rutas':["+ resp + "]}";
		resp = resp.replaceAll(",]}", "]}");
		resp = resp.replaceAll("'", "\"");
		System.out.println(resp);
	    return Response.status(200).entity(resp).build();
	}
	
	@GET
	@Path("/articulos")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response getArticulos() throws SQLException 
	{
		String consulta="", resp="", row="";
		
		ResultSet rs=null;
		
		consulta = "SELECT * FROM inv_articulos WHERE activo = 1";
		
		DBHelper dbHelper = new DBHelper();
		
		System.out.println("Consulta: " + consulta);
		try
		{
			rs = dbHelper.getRecords(consulta, 2);		
		}
		catch (Exception e)
		{
			System.out.println("Error: " + e);
		}
	
		int rsCount = 0;

		while(rs.next())
		{
			row = "{'id_articulo':'" + rs.getInt(1) + 
					"', 'descripcion': '" + rs.getString(2)+
					"', 'precio': '" + rs.getDouble(3)+
					"'},";
			
			resp = resp + row;
		    rsCount = rsCount + 1;
		}
				
		resp = "{'articulos':["+ resp + "]}";
		resp = resp.replaceAll(",]}", "]}");
		resp = resp.replaceAll("'", "\"");
		System.out.println(resp);
	    return Response.status(200).entity(resp).build();
	}
	
	@GET
	@Path("/vendedores")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response getVendedores() throws SQLException 
	{
		String consulta="", resp="", row="";
		
		ResultSet rs=null;
		
		consulta = "SELECT * FROM inv_vendedores WHERE activo = 1";
		
		DBHelper dbHelper = new DBHelper();
		
		System.out.println("Consulta: " + consulta);
		try
		{
			rs = dbHelper.getRecords(consulta, 2);		
		}
		catch (Exception e)
		{
			System.out.println("Error: " + e);
		}
	
		int rsCount = 0;

		while(rs.next())
		{
			row = "{'id_vendedor':'" + rs.getInt(1) + 
					"', 'nombre': '" + rs.getString(2)+
					"'},";
			
			resp = resp + row;
		    rsCount = rsCount + 1;
		}
				
		resp = "{'vendedores':["+ resp + "]}";
		resp = resp.replaceAll(",]}", "]}");
		resp = resp.replaceAll("'", "\"");
		System.out.println(resp);
	    return Response.status(200).entity(resp).build();
	}
	
	@GET
	@Path("/max_cliente")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response getNoCliente() throws SQLException 
	{
		
		String consulta="", resp="", row="";
		
		//id_ruta = id_ruta.replace("id_ruta=", "");
		
		ResultSet rs=null;
		//consulta = "select id_cliente, nombre from inv_clientes where id_ruta=" + id_ruta;
		consulta = "SELECT MAX(id_cliente) AS id_cliente FROM inv_clientes";
		
		DBHelper dbHelper = new DBHelper();
		
		int id_cliente=0;
		
		try
		{
			rs = dbHelper.getRecords(consulta, 1);
			id_cliente = rs.getInt(1);	
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		
		resp = Integer.toString(id_cliente+1);
		resp = "{'max_cliente':'"+ resp + "'}";
		//resp = resp.replaceAll(",]}", "]}");
		resp = resp.replaceAll("'", "\"");
		System.out.println(resp);
	    return Response.status(200).entity(resp).build();
		
	}
	
	@GET
	@Path("/max_id_venta")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response getMaxIDCuentae() throws SQLException 
	{
		
		String consulta="", resp="";
		
		ResultSet rs=null;
		consulta = "select max(id_venta) as id_venta from inv_ventas";
		
		DBHelper dbHelper = new DBHelper();
		
		int id_cuenta=0;
		
		try
		{
			rs = dbHelper.getRecords(consulta, 1);
			id_cuenta = rs.getInt(1);	
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		
		resp = Integer.toString(id_cuenta+1);
		resp = "{'max_id_venta':'"+ resp + "'}";
		resp = resp.replaceAll("'", "\"");
		System.out.println(resp);
	    return Response.status(200).entity(resp).build();
		
	}
	
	@GET
	@Path("/tarjetas/{id_cliente}")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response getTarjetas(@PathParam ("id_cliente") String id_cliente) throws SQLException 
	{
		String consulta="", resp="", row="";
		
		id_cliente = id_cliente.replace("id_cliente=", "");
		
		ResultSet rs=null;
		
		consulta = "SELECT v.id_cliente, FORMAT(v.fecha, 'dd-MM-yyyy') AS fecha, v.total, v.saldo, v.id_venta, "
				+ "CASE v.estado WHEN 1 THEN 'Pendiente' WHEN 2 THEN 'Modificada' WHEN 3 THEN 'Cancelada' WHEN 4 THEN 'Pagada' END "
				+ "AS estado, vd.nombre FROM dbo.inv_ventas AS v INNER JOIN dbo.inv_vendedores AS vd "
				+ "ON v.id_vendedor = vd.id_vendedor WHERE v.id_cliente = " + id_cliente;
		
		DBHelper dbHelper = new DBHelper();
		
		System.out.println("Consulta: " + consulta);
		try
		{
			rs = dbHelper.getRecords(consulta, 2);		
		}
		catch (Exception e)
		{
			System.out.println("Error: " + e);
		}
	
		int rsCount = 0;

		while(rs.next())
		{
			row = "{'id_cliente':'" + rs.getString(1) + 
					"', 'fecha': '" + rs.getString(2).replace(" 00:00:00.0", "") +
					"', 'total': '" + rs.getString(3)+
					"', 'saldo': '" + rs.getString(4)+
					"', 'id_venta': '" + rs.getString(5) +
					"', 'estado': '" + rs.getString(6) +
					"', 'vendedor': '" + rs.getString(7) +
					"'},";
			
			resp = resp + row;
		    rsCount = rsCount + 1;
		}
				
		resp = "{'tarjetas':["+ resp + "]}";
		resp = resp.replaceAll(",]}", "]}");
		resp = resp.replaceAll("'", "\"");
		System.out.println(resp);
	    return Response.status(200).entity(resp).build();
	}
	
	@GET
	@Path("/tarjetas_by_vendedor/{id_vendedor}")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response getTarjetasByVendedor(@PathParam ("id_vendedor") String id_vendedor) throws SQLException 
	{
		String consulta="", resp="", row="";
		
		id_vendedor = id_vendedor.replace("id_vendedor=", "");
		
		ResultSet rs=null;
		
		consulta = "SELECT v.id_venta, c.nombre, v.id_cliente, FORMAT(v.fecha, 'dd-MM-yy') AS fecha, v.total, v.saldo, "
				+ "CASE v.estado WHEN 1 THEN 'Pendiente' WHEN 2 THEN 'Modificada' WHEN 3 THEN 'Cancelada' WHEN 4 THEN 'Pagada' END AS estado "
				+ "FROM dbo.inv_ventas AS v "
				+ "INNER JOIN dbo.inv_vendedores AS vd ON v.id_vendedor = vd.id_vendedor "
				+ "INNER JOIN dbo.inv_clientes AS c ON v.id_cliente = c.id_cliente "
				+ "WHERE vd.id_vendedor = " + id_vendedor;
		
		DBHelper dbHelper = new DBHelper();
		
		System.out.println("Consulta: " + consulta);
		try
		{
			rs = dbHelper.getRecords(consulta, 2);		
		}
		catch (Exception e)
		{
			System.out.println("Error: " + e);
		}
	
		int rsCount = 0;

		while(rs.next())
		{
			row = "{'id_venta':'" + rs.getString(1) + 
					"', 'nombre': '" + rs.getString(2) +
					"', 'id_cliente': '" + rs.getString(3)+
					"', 'fecha': '" + rs.getString(4)+
					"', 'total': '" + rs.getString(5) +
					"', 'saldo': '" + rs.getString(6) +
					"', 'estado': '" + rs.getString(7) +
					"'},";
			
			resp = resp + row;
		    rsCount = rsCount + 1;
		}
				
		resp = "{'tarjetas':["+ resp + "]}";
		resp = resp.replaceAll(",]}", "]}");
		resp = resp.replaceAll("'", "\"");
		System.out.println(resp);
	    return Response.status(200).entity(resp).build();
	}
	
	@GET
	@Path("/reporte_ruta/{id_ruta}")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response generateReporte(@PathParam ("id_ruta") String id_ruta) throws SQLException, IOException 
	{
		String resp="", output="";
		
		id_ruta = id_ruta.replace("id_ruta=", "");
		System.out.println("id_ruta: " + id_ruta);
		
		int id=0;
		id = Integer.parseInt(id_ruta);
		//Crear reporte Ruta
		CreateXMLRptRuta crearXMLRuta = new CreateXMLRptRuta();
		crearXMLRuta.createReporte(id);
		
		try
		{
			RunFOP runFOP=new RunFOP();
			runFOP.createPDFRuta(id);
			output = "1";
		}
		catch (Exception e)
		{
			System.out.println("Error creando el PDF de la ruta: " + e);
			output = "0";
		}
		
		//resp = "{'reporte_ruta':["+ resp + "]}";
		resp = "{'reporte_ruta':'"+ output + "'}";
		resp = resp.replaceAll(",]}", "]}");
		resp = resp.replaceAll("'", "\"");
		System.out.println(resp);
	    return Response.status(200).entity(resp).build();
	}
}
