package inventariojeans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.Date;

public class DBHelper 
{
	private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static final String USER = "sa";
	private static final String PASS = "mbge321.";
	
	public int updateRecords(String consultaUpdate)
	{
		Connection conexion = null;
		Statement sentencia = null;
		int nFilas = 0;
		
		Calendar cal = Calendar.getInstance();
		
		try
		{
			Class.forName(DRIVER);
		    conexion = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-IAN63DL:1433;DatabaseName=inventariojeans",USER,PASS);
		    sentencia=conexion.createStatement();

		    nFilas = sentencia.executeUpdate(consultaUpdate);
		    
		    System.out.println("Consulta updateRecords: " + consultaUpdate);
		    System.out.println("FROM DBHelper.updateRecords(): Modified rows: " + nFilas);
		}
		catch (ClassNotFoundException e)
		{
			System.out.println("Error driver: " + e.getMessage());
		}
		catch (SQLException e) 
		{
			System.out.println("Error de SQL: [updateRecords] " + e.getMessage());
		}
		finally 
		{
			if (sentencia != null) 
			{
				try {sentencia.close();} catch (SQLException e) {}
			}
			if (conexion != null) 
			{
				try {conexion.close();} catch (SQLException e) {}
			}
		}
		return nFilas;
	}
	
	public ResultSet getRecords(String consultaSelect, int module)
	{
		Connection conexion = null;
		Statement sentencia = null;
		ResultSet dataSet=null;
		
		if (module==1)
		{
			try 
			{
				Class.forName(DRIVER);
				conexion = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-IAN63DL:1433;DatabaseName=inventariojeans",USER, PASS);
				sentencia = conexion.createStatement();
				dataSet = sentencia.executeQuery(consultaSelect);
				System.out.println("Consulta getRecords: " + consultaSelect);
				System.out.println("FROM DBHelper.getRecords()[1]: Query succesfully executed, Module: " + module);
				dataSet.next();
				
			} 
			catch (ClassNotFoundException e) 
			{
				System.out.println("Error Driver" + e.getMessage());
			} 
			catch (SQLException e) 
			{
				System.out.println("Error de SQL: [getRecords] " + e.getMessage());
			}
		}
		else
		{
			try 
			{
				Class.forName(DRIVER);
				conexion = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-IAN63DL:1433;DatabaseName=inventariojeans",USER, PASS);
				sentencia = conexion.createStatement();
				dataSet = sentencia.executeQuery(consultaSelect);
				System.out.println("Consulta getRecords: " + consultaSelect);
				System.out.println("FROM DBHelper.getRecords()[2]: Query succesfully executed, Module: " + module);
			} 
			catch (ClassNotFoundException e) 
			{
				System.out.println("Error Driver" + e.getMessage());
			} 
			catch (SQLException e) 
			{
				System.out.println("Error de SQL: [getRecords] " + e.getMessage());
			}
		}
		
		return dataSet;
	}

}
