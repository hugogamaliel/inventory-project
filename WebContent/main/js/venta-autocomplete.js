$(function(){

	var clientes = [];

  $.ajax({
		  type: "GET", 
		  async: false,
	    url: "http://54.144.154.41:8180/inventariojeans/rest/services/nombres_clientes",
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
	   			"', 'correo': '" + data.clientes[i].correo +
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

        $('#txtId').append("ID: " + suggestion.data);
        $('#txtNombre').append("Nombre: " + suggestion.value);
        $('#txtDireccion').append("Direccion: " + suggestion.direccion);
        $('#txtColonia').append("Colonia: " + suggestion.colonia);
        $('#txtCelular').append("Celular: " + suggestion.telefono);
        $('#txtLugar').append("Lugar: " + suggestion.lugar);
        
        document.getElementById("txtIDCliente").value = suggestion.data;
      	//Llener sel de descripciones de articulos

      	$.ajax(
			{
				type: "GET",  
				url: "http://54.144.154.41:8180/inventariojeans/rest/services/articulos",
				dataType: "json",  
				success: function(data)
				{
					var sizeArticulos = Object.keys(data.articulos).length;

					var selArticulos = document.getElementById('selArticulos'); //Get the select element
					
					//Se limpia el dropdown
					while (selArticulos.options.length > 0) 
		    		{                
		    			selArticulos.remove(0);
					}
					
					//insertar un articulo antes que las de la BD
					var opt = document.createElement('option');
					opt.innerHTML = " "; //Add a value to the option	
					selArticulos.appendChild(opt); //Add the option to the select element	

					//insertar un precio antes que las de la BD
					var opt = document.createElement('option');
					opt.innerHTML = " "; //Add a value to the option	
					selPrecios.appendChild(opt); //Add the option to the select element	
					
					//insertar un ID antes que las de la BD
					var opt3 = document.createElement('option');
					opt3.innerHTML = " "; //Add a value to the option	
					selIDArticulo.appendChild(opt3); //Add the option to the select element	
					
					for (i=0; i<sizeArticulos; i++)
					{
					 	var opt = document.createElement('option'); //Create option element
						opt.innerHTML = data.articulos[i].descripcion; //Add a value to the option	
						selArticulos.appendChild(opt); //Add the option to the select element

						var opt = document.createElement('option'); //Create option element
						opt.innerHTML = data.articulos[i].precio; //Add a value to the option	
						selPrecios.appendChild(opt); //Add the option to the select element

						var opt = document.createElement('option'); //Create option element
						opt.innerHTML = data.articulos[i].id_articulo; //Add a value to the option	
						selIDArticulo.appendChild(opt); //Add the option to the select element
					}
					
					document.getElementById("selArticulos").disabled=false;
	

				   	},
					error: function(e)
					{  
						alert('Error al recuperar articulos: ' + e);   
					} 
			});

        
    }
  });
  

});
