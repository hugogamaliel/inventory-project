package inventariojeans;

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
        
        String consultaSaveCliente = "INSERT INTO inv_clientes " +  
        		"([id_cliente] , [nombre] , [direccion] , [colonia], [telefono], [lugar], [id_ruta], [referencias]) " + 
        		"VALUES (" + cliente.id + ", '" + cliente.nombre + "', '" + cliente.direccion + "', '" + cliente.colonia + "', '" + 
        		cliente.celular + "','" + cliente.lugar + "', " + cliente.ruta + ", '"+ cliente.referencias +"')";
        
        System.out.println("consultaSaveCliente" + consultaSaveCliente);

    	myDBHelper.updateRecords(consultaSaveCliente); //Ejecutar consulta para guardar el cliente
    	
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
	public Response postVenta(Ventas venta)
	{
		String resp="";
		//System.out.println("Nombre: " + venta.header.nombre);
		
		return Response.status(200).entity(resp).build();
		
	}

}
