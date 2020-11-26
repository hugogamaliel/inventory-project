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
		
		String Path = "C:\\Users\\HReyes\\new_workspace\\omueblesj\\WebContent\\recursos\\";
		String PathProd = "C:\\Users\\HReyes\\new_workspace\\omueblesj\\WebContent\\recursos\\";
		String current = "administrador:8180";
		String next = "localhost:8180";
		replaceFile(Path, PathProd, fileContent, current, next);
		
		Path = "C:\\Users\\HReyes\\new_workspace\\omueblesj\\src\\omueblesj\\";
		PathProd = "C:\\Users\\HReyes\\new_workspace\\omueblesj\\src\\omueblesj\\";
		current = "Password0.";
		next = "mbge321.";
		replaceFile(Path, PathProd, fileContent, current, next);
		
		Path = "C:\\Users\\HReyes\\new_workspace\\omueblesj\\src\\omueblesj\\";
		PathProd = "C:\\Users\\HReyes\\new_workspace\\omueblesj\\src\\omueblesj\\";
		current = "jdbc:sqlserver://administrador:1433"; 
		next = "jdbc:sqlserver://LAPTOP-E57S71TA:1433";
		replaceFile(Path, PathProd, fileContent, current, next);
		
		Path = "C:\\Users\\HReyes\\new_workspace\\omueblesj\\WebContent\\recursos\\js\\";
		PathProd = "C:\\Users\\HReyes\\new_workspace\\omueblesj\\WebContent\\recursos\\js\\";
		current = "administrador:8180";
		next = "localhost:8180";
		replaceFile(Path, PathProd, fileContent, current, next);

	}
	
	public static void replaceFile(String Path, String PathProd, String fileContent, String current, String next) throws IOException
	{
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
