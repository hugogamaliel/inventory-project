package inventariojeans;

import java.util.HashMap;
import java.util.Map;

public class Item 
{
	String id;
	String descripcion;
	String cantidad;
	String precio;
	String importe;
	String idArticulo;
	Map<String, Object> additionalProperties = new HashMap<String, Object>();
	
	public String getId()
	{
		return id;
	}
	
	public void setID(String id)
	{
		this.id = id;
	}
	
	public String getDescripcion() {
		return descripcion;
		}

		public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
		}

		public String getCantidad() {
		return cantidad;
		}

		public void setCantidad(String cantidad) {
		this.cantidad = cantidad;
		}

		public String getPrecio() {
		return precio;
		}

		public void setPrecio(String precio) {
		this.precio = precio;
		}

		public String getImporte() {
		return importe;
		}

		public void setImporte(String importe) {
		this.importe = importe;
		}

		public String getIdArticulo() {
		return idArticulo;
		}

		public void setIdArticulo(String idArticulo) {
		this.idArticulo = idArticulo;
		}

		public Map<String, Object> getAdditionalProperties() {
		return this.additionalProperties;
		}

		public void setAdditionalProperty(String name, Object value) {
		this.additionalProperties.put(name, value);
		}

}
