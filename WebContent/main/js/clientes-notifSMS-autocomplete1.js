$(function(){

	var clientes = [];

  $.ajax({
		  type: "GET", 
		  async: false,
	    url: "http://localhost:8080/inventariojeans/rest/services/nombres_clientes",
	    dataType: "json",
	    success:  function(data) 
	    {
	    	var sizeNombres = Object.keys(data.clientes).length;
	    	
	    	var valor;
	   		for (i=0; i<sizeNombres; i++)
	   		{
	   			valor =  "{'value': '" + data.clientes[i].nombre + 
	   			"', 'data': '" + data.clientes[i].id_cliente +
	   			"', 'direccion': '" + data.clientes[i].direccion +
	   			"', 'colonia': '" + data.clientes[i].colonia +
	   			"', 'telefono': '" + data.clientes[i].telefono +
	   			"', 'lugar': '" + data.clientes[i].lugar +
	   			"'}";
	   			
	   			valor = valor.replace(/'/g, "\"");
	   			var myobj = JSON.parse(valor);
	   			clientes.push(myobj);
	   		}
	    },
	  error: function(e)
	   {  
		 alert('Error: ' + e);   
	   }
	  });
	
  // setup autocomplete function pulling from currencies[] array
  //alert(currencies);
  $('#autocomplete').autocomplete({
    lookup: clientes,
    onSelect: function (suggestion) 
    {
    	
    	var id_cliente = suggestion.data;
    	//alert("ID cliente: " + id_cliente);

    	$.ajax(
                {
                    type: "GET",  
                    url: "http://localhost:8080/inventariojeans/rest/services/datos_cliente/id_cliente=" + id_cliente,
                    dataType: "json",  
                    success: function(data)
                    {
                        //alert(data.cliente.id_cliente);

                        document.getElementById("txtId").innerHTML = "ID: " + data.cliente.id_cliente;
                        document.getElementById("txtNombre").innerHTML = "Nombre: " + data.cliente.nombre;
                        document.getElementById("txtDireccion").innerHTML = "Direccion: " + data.cliente.direccion;
                        document.getElementById("txtColonia").innerHTML = "Colonia: " + data.cliente.colonia;
                        document.getElementById("txtTelefono").innerHTML = "Telefono: " + data.cliente.telefono;
                        document.getElementById("txtLugar").innerHTML = "Lugar: " + data.cliente.lugar; 
                        document.getElementById("txtSaldo").innerHTML = "Saldo: " + data.cliente.saldo; 
                        document.getElementById("txtSaldoForm").value = data.cliente.saldo; 

                    },
                    error: function(e)
                    {  
                        alert('Error al recuperar datos del cliente: ' + e);   
                    } 
                });
    }
  });
  

});
