package inventariojeans;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

public class RunFOP {
	
	public String createPDF(int id_venta) throws IOException
	{
		String myCommand="";
		
			myCommand = "'C:\\FOP\\fop' -xml 'C:\\InventarioJeans\\tarjetasXML\\tarjeta_" + id_venta + ".xml' -xsl 'C:\\InventarioJeans\\bat\\tarjeta.xsl'"
					+ " -pdf "
					+ "'C:\\Program Files (x86)\\Apache Software Foundation\\Apache2.2"
					+ "\\htdocs\\pdf\\tarjeta_" + id_venta+ ".pdf'\n'exit'" ;
				
			myCommand = myCommand.replaceAll("'", "\"");
			System.out.println("myCommand: " + myCommand);
			
			File file = new File("C:\\InventarioJeans\\bat\\run_" + id_venta + ".bat");
			file.createNewFile();
			PrintWriter writer = new PrintWriter(file, "UTF-8");
			writer.println(myCommand);
			writer.close();

			try
			{    
				Runtime.getRuntime().exec("cmd.exe /C C:\\InventarioJeans\\bat\\run_" + id_venta + ".bat");

			}catch( IOException ex ){
			    //Validate the case the file can't be accesed (not enought permissions)
			}
			
			System.out.println("Creado el formato de tarjeta");
		
		return "";
	}

	public String createPDFRuta(int id_ruta) throws IOException
	{
		String myCommand="";
		
			myCommand = "'C:\\FOP\\fop' -xml 'C:\\InventarioJeans\\tarjetasXML\\reporte_ruta_" + id_ruta + ".xml' -xsl 'C:\\InventarioJeans\\bat\\reporte_ruta.xsl'"
					+ " -pdf "
					+ "'C:\\Program Files (x86)\\Apache Software Foundation\\Apache2.2\\"
					+ "htdocs\\pdf\\reporte_ruta_" + id_ruta+ ".pdf'\n'exit'" ;
				
			myCommand = myCommand.replaceAll("'", "\"");
			System.out.println("myCommand: " + myCommand);
			
			File file = new File("C:\\InventarioJeans\\bat\\run_reporte_ruta_" + id_ruta + ".bat");
			file.createNewFile();
			PrintWriter writer = new PrintWriter(file, "UTF-8");
			writer.println(myCommand);
			writer.close();

			try
			{    
				Runtime.getRuntime().exec("cmd.exe /C C:\\InventarioJeans\\bat\\run_reporte_ruta_" + id_ruta + ".bat");
				System.out.println("Creado el formato de reporte de ruta");

			}catch( IOException ex ){
				System.out.println("Error al crear el reporte de ruta");
			}
			
		return "";
	}
}
