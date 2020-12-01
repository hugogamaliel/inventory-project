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
    	
    	//alert("hello");
        $('#txtId').append("ID: " + suggestion.data);
        $('#txtNombre').append("Nombre: " + suggestion.value);
        $('#txtDireccion').append("Direccion: " + suggestion.direccion);
        $('#txtColonia').append("Colonia: " + suggestion.colonia);
        $('#txtCelular').append("Celular: " + suggestion.telefono);
        $('#txtLugar').append("Lugar: " + suggestion.lugar);
        //$('#txtEmailAddress').append(suggestion.correo);
        document.getElementById("txtCellPhone").value = suggestion.telefono;
        //document.getElementById("txtEmailAddress").value = suggestion.correo;

        
    }
  });
  

});
