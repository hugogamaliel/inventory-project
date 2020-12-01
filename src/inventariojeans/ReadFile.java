package inventariojeans;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class ReadFile 
{

	public String leer(String filePath)
	{
		try
		{
			File f;
			FileReader lectorArchivo;
				 
			f = new File(filePath);
				 
			lectorArchivo = new FileReader(f);
	
			BufferedReader br = new BufferedReader(lectorArchivo);
			String l="";
			String aux="";/*variable auxiliar*/
			while(true)
			{
				aux=br.readLine();
				if(aux!=null)
					l=l+aux;
				else
					break;
			}
			br.close();
			lectorArchivo.close();
			return l;
		}
		catch(IOException e)
		{
			System.out.println("Error:"+e.getMessage());
		}
		return null;
	}
}
