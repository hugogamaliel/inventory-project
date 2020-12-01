package inventariojeans;

import java.io.FileWriter;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

public class CreateXMLTarjeta 
{
	public String createTarjeta(int id_venta) throws SQLException
	{
		
		DBHelper dbHelper = new DBHelper();
		
		String consVenta="";
		String xml="", row="", partidas="", abonos="", abonos_n="";
		String header="";
		double precio=0, importe=0;
		
		int rsCount = 0;
		
		ResultSet rs=null;
		
		//consVenta = "SELECT * FROM v_tarjeta WHERE id_venta = " + id_venta; 08-04-2020
		consVenta = "SELECT v.id_venta, c.id_cliente, c.id_ruta, c.nombre AS nombre_cliente, c.direccion, c.colonia, c.telefono, "
				+ "c.lugar, c.referencias, FORMAT(v.fecha, 'dd-MM-yyyy') AS fecha, v.total, v.saldo, vd.nombre AS nombre_vendedor "
				+ "FROM dbo.inv_clientes AS c "
				+ "INNER JOIN dbo.inv_ventas AS v ON c.id_cliente = v.id_cliente "
				+ "INNER JOIN dbo.inv_vendedores AS vd ON vd.id_vendedor = v.id_vendedor "
				+ "WHERE v.id_venta = " + id_venta;
				
		//Header
		System.out.println("Consulta: " + consVenta);
		try
		{
			rs = dbHelper.getRecords(consVenta, 1);
			
			header = "<header ruta='" + rs.getString(3) +"' id_cliente='" + rs.getString(2) 
					+ "' nombre='" + rs.getString(4) + "' direccion='" + rs.getString(5) + "' colonia='" 
					+ rs.getString(6) + "' celular='" + rs.getString(7) + "' lugar='" + rs.getString(8) 
					+ "' notas='" + rs.getString(9) + "' fecha='" + rs.getString(10).replace(" 00:00:00.0", "") + "' vendedor='" 
					+ rs.getString(13) + "' id_venta='" + id_venta +"' total='" + rs.getString(11) + "' saldo='" + rs.getString(12)+"'/>";
			System.out.println("Header: " + header);
		}
		catch (Exception e)
		{
			System.out.println("Error: " + e);
		}
		
		xml = "<?xml version = '1.0' encoding = 'ISO-8859-1'?><tarjeta>";
		xml = xml + header;
		
		System.out.println("xml: " + xml);
		rs = null;
		
		//partidas
		consVenta="SELECT dt.id_venta, a.descripcion, dt.cantidad, dt.precio, "
				+ "dt.importe, dt.actual FROM dbo.inv_ventas_detalle AS dt "
				+ "INNER JOIN dbo.inv_articulos AS a ON dt.id_articulo = a.id_articulo WHERE (dt.actual = 1) "
				+ "AND dt.id_venta = " + id_venta;

		try
		{
			rs = dbHelper.getRecords(consVenta, 2);
		}
		catch (Exception e)
		{
			System.out.println("Error: " + e);
		}
		
		while(rs.next())
		{
			//cantidad = Double.parseDouble(rs.getString(3));
			precio = Double.parseDouble(rs.getString(4));
			System.out.println("precio: " + precio);
			importe = Double.parseDouble(rs.getString(5));
			System.out.println("importe: " + importe);
			
			row = "<partida cantidad='" + rs.getString(3) + "' descripcion='" + rs.getString(2) 
					+ "' precio='" + String.format( "%,.2f", precio) + "' importe='" + String.format( "%,.2f", importe) + "'/>";
				
			partidas = partidas + row;
					
		}
		
		xml = xml + partidas;
		
		//abonos
		consVenta = "SET language 'spanish'select day(fecha), DateName(month,fecha), year(fecha), cantidad, saldo, "
				+ "CASE isEnganche WHEN 1 THEN 'Enganche' ELSE ' ' END from inv_abonos where id_venta = " + id_venta;
		rs=null; row="";
		
		try
		{
			rs = dbHelper.getRecords(consVenta, 2);
		}
		catch (Exception e)
		{
			System.out.println("Error: " + e);
		}
		
		//2020-07-20
		/*
		 * Split the credit rows in two different blocks in the PDF file
		 * Determine the number of rows retrieved
		 * Put the first 7 rows in an XML node and the rest of them in another node
		 * Put both groups into Array Lists. Iterate the lists to populate the XML nodes
		 */
		
		//ArrayList<String> nAbonos = new ArrayList<String>();
		
		while(rs.next())
		{
			rsCount = rsCount + 1;
			
			if (rsCount <= 7)
			{
				row = "<abono dia='" + rs.getString(1) 
						+ "' mes='" + rs.getString(2) 
						+ "' year='" + rs.getString(3)
						+ "' abono='" + rs.getString(4)
						+ "' saldo='" + rs.getString(5)
						+ "' enganche='" + rs.getString(6)
						+ "'/>";
				
				abonos = abonos + row;
			}
			else
			{
				row = "<abono_n dia='" + rs.getString(1) 
						+ "' mes='" + rs.getString(2) 
						+ "' year='" + rs.getString(3)
						+ "' abono='" + rs.getString(4)
						+ "' saldo='" + rs.getString(5)
						+ "' enganche='" + rs.getString(6)
						+ "'/>";
				
				abonos_n = abonos_n + row;
			}
		}
		
		//Add an element to the node abonos_n in the XML file, otherwise Apache FOP throws an error because is expecting that element - 2020-07-24
		row = "<abono_n dia='' mes='' year='' abono='' saldo='' enganche=''/>";
		abonos_n = abonos_n + row;
		
		System.out.println("How many rows: " + rsCount);
		
		xml = xml + abonos + abonos_n; //Include the second node of credits (abonos_n) to the XML file - 2020-07-20
			
		//blank rows to the borders
		for (int i=0; i<=5; i++)
		{
			xml = xml + "<partidat cantidad=''/>";
		}
			
		//Incluir un abono en blanco
		xml = xml + "<abono dia='' mes='' year='' abono='' saldo='' enganche=''/>";
			
		for (int i=0; i<=28; i++)
		{
			xml = xml + "<abonot dia='24' mes='Abril' year='2019' abono='50.00' saldo='520.00' enganche=' '/>";
		}
			
		for (int i=0; i<=6; i++)
		{
			xml = xml + "<abonot2 dia='24' mes='Abril' year='2019' abono='50.00' saldo='520.00' enganche=' '/>";
		}
		
		
		xml = xml + "</tarjeta>";
		xml = xml.replaceAll("'", "\"");
		
		System.out.println("XML completo: " + xml);
		//Create the file from a String
		try
		{
				FileWriter fw=new FileWriter("c://InventarioJeans//tarjetasXML//tarjeta_"+ id_venta +".xml");
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
