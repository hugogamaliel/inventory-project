package inventariojeans;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Ventas 
{

	String id;
	String total;
	String nombreCliente;
	String idVendedor;
	private List<Item> items = null;
	private Map<String, Object> additionalProperties = new HashMap<String, Object>();
	
	public String getId() 
	{
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

		public String getNombreCliente() {
		return nombreCliente;
		}

		public void setNombreCliente(String nombreCliente) {
		this.nombreCliente = nombreCliente;
		}

		public String getIdVendedor() {
		return idVendedor;
		}

		public void setIdVendedor(String idVendedor) {
		this.idVendedor = idVendedor;
		}

		public List<Item> getItems() {
		return items;
		}

		public void setItems(List<Item> items) {
		this.items = items;
		}

		public Map<String, Object> getAdditionalProperties() {
		return this.additionalProperties;
		}

		public void setAdditionalProperty(String name, Object value) {
		this.additionalProperties.put(name, value);
		}
}
