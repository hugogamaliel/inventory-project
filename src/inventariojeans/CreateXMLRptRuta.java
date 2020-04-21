package inventariojeans;

import java.io.FileWriter;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CreateXMLRptRuta 
{
	public String createReporte(int id_ruta) throws SQLException
	{
		
		DBHelper dbHelper = new DBHelper();
		
		String consListaVentas="";
		String consUltimoAbono="";
		List<String> lstVentas = new ArrayList<String>();
		String xml="", partidas="";
		String header="";
		String fechaAbono = "";
		ProjectTasks myTasks = new ProjectTasks();
		//double preci=0, importe=0;
		
		int noTarjetas = 0;
		
		ResultSet rs=null;
		
		//Header
		//Obtener número de tarjetas
		
		//Partidas - Lista de ventas por ruta
		consListaVentas = "SELECT v.id_venta FROM inv_ventas AS v INNER JOIN inv_clientes AS c ON v.id_cliente = c.id_cliente "
				+ "WHERE c.id_ruta = " + id_ruta + " AND v.saldo > 0";
		
		System.out.println("Consulta: " + consListaVentas);
		
		//Guardar en un arreglo la lista de ventas
		try
		{
			rs = dbHelper.getRecords(consListaVentas, 2);
		}
		catch (Exception e)
		{
			System.out.println("Error: " + e);
		}
		
		while(rs.next())
		{
			lstVentas.add(rs.getString(1));
		}
		
		int sizeL = lstVentas.size();
		
		for(int i=0; i<sizeL; i++)
		{
			consUltimoAbono="SELECT TOP 1 c.id_cliente, c.nombre, c.direccion, v.id_venta, "
					+ "CASE WHEN a.saldo IS NULL THEN v.saldo ELSE a.saldo END, " 
					+ "CASE WHEN a.cantidad IS NULL THEN '0.00' ELSE a.cantidad END, " 
					+ "CASE WHEN a.fecha IS NULL THEN ' ' ELSE FORMAT(a.fecha, 'dd-MM-yyyy') END "
					+ "FROM inv_clientes AS c "
					+ "INNER JOIN inv_ventas AS v ON c.id_cliente =  v.id_cliente "
					+ "LEFT JOIN inv_abonos AS a ON a.id_venta = v.id_venta "
					+ "WHERE v.id_venta = "
					+ lstVentas.get(i) + " ORDER BY a.fecha DESC";
			
			rs = null;
			
			noTarjetas = noTarjetas + 1;
			
			try
			{
				rs = dbHelper.getRecords(consUltimoAbono, 2);
			}
			catch (Exception e)
			{
				System.out.println("Error: " + e);
			}
			
			while(rs.next())
			{
				//Agregar al XML el último abono de ese ID venta
				partidas = partidas + "<partida id_cliente ='" + rs.getString(1)+ "' "
						+ "nombre='" + rs.getString(2)+ "' "
						+ "direccion='" + rs.getString(3)+ "' "
						+ "id_tarjeta='" + rs.getString(4)+ "' "
						+ "saldo='" + rs.getString(5)+ "' "
						+ "abono='" + rs.getString(6)+ "' "
						+ "fecha='" + rs.getString(7).replace("00:00:00.0", "")+ "' "
								+ "/>";
			}
		}
		
		//Obtener la fecha del reporte (hoy)
		Date today = new Date();
		fechaAbono = myTasks.turnDateTOSQLFormat(today);
		
		xml = "<?xml version = '1.0' encoding = 'ISO-8859-1'?><reporte_ruta><header ruta='" + id_ruta+"' no_tarjetas='" + noTarjetas+ "' fecha_reporte='" + fechaAbono+ "' />";
		xml = xml + partidas + "</reporte_ruta>";
		
		System.out.println("xml: " + xml);
		rs = null;
		
		xml = xml.replaceAll("'", "\"");
		
		System.out.println("XML completo: " + xml);
		//Create the file from a String
		try
		{
				FileWriter fw=new FileWriter("c://InventarioJeans//tarjetasXML//reporte_ruta_"+ id_ruta +".xml");
		        fw.write(xml);
		        fw.close(); 
		}
		catch(IOException e)
		{
		    System.out.println("Error E/S: "+e);
		}
		
		return "";
	}

}
