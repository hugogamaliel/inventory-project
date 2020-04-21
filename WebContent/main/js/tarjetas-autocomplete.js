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
		 alert('Error al recuperar nombres: ' + e);   
	   }
	  });
	
  $('#autocomplete').autocomplete({
    lookup: clientes,
    onSelect: function (suggestion) 
    {
    	
        $('#txtId').append("ID: " + suggestion.data);
        $('#txtNombre').append("Nombre: " + suggestion.value);
        $('#txtDireccion').append("Direccion: " + suggestion.direccion);
        $('#txtColonia').append("Colonia: " + suggestion.colonia);
        $('#txtLugar').append("Lugar: " + suggestion.lugar);
        
      	//Llenar tabla de ventas-tarjetas existentes para ese cliente

        var IDCliente = suggestion.data;

      	$.ajax(
			{
				type: "GET",  
				url: "http://localhost:8080/inventariojeans/rest/services/tarjetas/id_cliente=" + IDCliente,
				dataType: "json",  
				success: function(data)
				{
					
					var tTarjetas = document.getElementById("tTarjetas");  
					var sizeTarjetas = Object.keys(data.tarjetas).length;

					var j=0;
                    //var total=0;
					
					
                    //partidas tarjetas
                    for (i=0; i<sizeTarjetas; i++)
                    {
                        var row = tTarjetas.insertRow(i);
						var x = row.insertCell(0);
						x.innerHTML = data.tarjetas[i].id_cliente;
						x.className = "id_cliente"; 

                        var x = row.insertCell(1);
                        x.innerHTML = data.tarjetas[i].fecha;
                        x.className = "fecha";  

                        var x = row.insertCell(2);
                        x.innerHTML = data.tarjetas[i].total;
                        x.className = "total";

                        var x = row.insertCell(3);
                        x.innerHTML = data.tarjetas[i].id_venta;
                        x.className = "id_venta";

                        var x = row.insertCell(4);
                        x.innerHTML = data.tarjetas[i].vendedor;
                        x.className = "vendedor";

                        var x = row.insertCell(5);
                        var t1 = document.createElement("button");
				        t1.id = "btnVerPDF"+i;
				        var t = document.createTextNode("Abrir");
				        t1.appendChild(t); 
				        x.appendChild(t1);
				        foo = document.getElementById("btnVerPDF"+i);
				        foo.setAttribute("onclick","javascript:verPDF("+data.tarjetas[i].id_venta+");");

				        
				        x = row.insertCell(6);
                        t1 = document.createElement("button");
				        t1.id = "btnGenerarPDF"+i;
				        t = document.createTextNode("Generar");
				        t1.appendChild(t); 
				        x.appendChild(t1);
				        foo = document.getElementById("btnGenerarPDF"+i);
				        foo.setAttribute("onclick","javascript:generarPDF(" + data.tarjetas[i].id_venta + ");");
				        
				        
                        j=j+1;
                                
                    }

                    //Titulos
					var row = tTarjetas.insertRow(0);
					
					var x = row.insertCell(0);
					x.innerHTML = "ID Cliente";
					x.className="titulo";

					var x = row.insertCell(1);
					x.innerHTML = "Fecha";
					x.className="titulo";

					var x = row.insertCell(2);
					x.innerHTML = "Total";
					x.className="titulo";

					var x = row.insertCell(3);
					x.innerHTML = "ID Venta";
					x.className="titulo";

					var x = row.insertCell(4);
					x.innerHTML = "Vendedor";
					x.className="titulo";

					var x = row.insertCell(5);
					x.innerHTML = "";
					x.className="titulo";

				},
				error: function(e)
				{  
					alert('Error al recuperar tarjetas: ' + e);   
				} 
			});
        
    }
  });
  

});
