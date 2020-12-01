package inventariojeans;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

public class MaintenanceTools {

	public static void main(String[] args) throws IOException 
	{
		String fileContent = "";
		
		//Tomcat
		String Path = "C:\\Users\\hugog\\eclipse-workspace\\inventory-project\\WebContent\\main\\";
		String PathProd = "C:\\Users\\hugog\\eclipse-workspace\\inventory-project\\WebContent\\main\\";
		
		String next = "localhost:8080"; //hr
		String current = "DESKTOP-SI86HH8:8280"; //noe
		
		replaceFile(Path, PathProd, fileContent, current, next);
		
		//DB
		Path = "C:\\Users\\hugog\\eclipse-workspace\\inventory-project\\src\\inventariojeans\\";
		PathProd = "C:\\Users\\hugog\\eclipse-workspace\\inventory-project\\src\\inventariojeans\\";
		
		next = "hugo321."; //hr
		current = "hugo321."; //noe
		
		replaceFile(Path, PathProd, fileContent, current, next);
		
		Path = "C:\\Users\\hugog\\eclipse-workspace\\inventory-project\\src\\inventariojeans\\";
		PathProd = "C:\\Users\\hugog\\eclipse-workspace\\inventory-project\\src\\inventariojeans\\";
		
		next = "jdbc:sqlserver://DESKTOP-RHRBFDR:1433"; //hr
		current = "jdbc:sqlserver://DESKTOP-RHRBFDR:1433"; //noe
		
		replaceFile(Path, PathProd, fileContent, current, next);
		
		//JS
		Path = "C:\\Users\\hugog\\eclipse-workspace\\inventory-project\\WebContent\\main\\js\\";
		PathProd = "C:\\Users\\hugog\\eclipse-workspace\\inventory-project\\WebContent\\main\\js\\";
		
		next = "localhost:8080"; //hr
		current = "DESKTOP-SI86HH8:8280"; //noe
		
		replaceFile(Path, PathProd, fileContent, current, next);
		
		//Apache
		Path = "C:\\Users\\hugog\\eclipse-workspace\\inventory-project\\WebContent\\main\\";
		PathProd = "C:\\Users\\hugog\\eclipse-workspace\\inventory-project\\WebContent\\main\\";
		
		next = "localhost:8180"; //hr
		current = "DESKTOP-SI86HH8:8180"; //noe
	}
	
	public static void replaceFile(String Path, String PathProd, String fileContent, String current, String next) throws IOException
	{
		System.out.println("Path: " + Path);
		File f = new File(Path);
		//String fileContent = "";
		
		if (f.exists())
		{
		    File[] ficheros = f.listFiles();
		    for (int x=0;x<ficheros.length;x++)
		    {
		    	if (ficheros[x].isFile())
		    	{
		    		fileContent = "";
		    		
		    		Path path = FileSystems.getDefault().getPath(Path + ficheros[x].getName());
		    		List<String> lines = Files.readAllLines(path, Charset.defaultCharset());
		    		for (String line : lines) {
		    			fileContent = fileContent + line + "\n";
		    		    //System.out.println(line);
		    		}
		    		
		    		fileContent = fileContent.replaceAll(current, next);
		    		
		    		System.out.println("Current: " + current);
		    		System.out.println("Next: " + next);
		    		
		    		String filename= PathProd + ficheros[x].getName();
		    			
		    		String text = fileContent;
		    	    BufferedWriter output = null;
		    	    try 
		    	    {
		    	            File file = new File(filename);
		    	            output = new BufferedWriter(new FileWriter(file));
		    	            output.write(text);
		    	    } 
		    	    catch ( IOException e ) 
		    	    {
		    	    	e.printStackTrace();
		    	    } 
		    	    finally 
		    	    {
		    	         if ( output != null ) {
		    	            output.close();
		    	          }
		    	    }
		    	}
		    }
		}
		else
		{
			System.out.println("El directorio no existe");
		}
	}

}
