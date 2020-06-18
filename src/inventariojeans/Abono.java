package inventariojeans;

public class Abono 
{
	
	String idVenta;
	String cantidad;
	String saldo;
	int isEnganche;
	
	public void setIdVenta(String idVenta)
	{
		this.idVenta = idVenta;
	}
	
	public String getIdVenta()
	{
		return idVenta;
	}
	
	public String getCantidad() {
        return cantidad;
    }
	
    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }
    
    public String getSaldo() {
        return saldo;
    }
	
    public void setSaldo(String saldo) {
        this.saldo = saldo;
    }
    
    public int getIsEnganche() {
        return isEnganche;
    }
	
    public void setIsEnganche(int isEnganche) {
        this.isEnganche = isEnganche;
    }
	

}
