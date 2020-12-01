<!DOCTYPE html>
<html lang="en">

<head>
<title>Nueva venta</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="description" content="Your description">
<meta name="keywords" content="Your keywords">
<meta name="author" content="Your name">
<meta name = "format-detection" content = "telephone=no" />
<!--CSS-->
<link rel="stylesheet" href="css/bootstrap.css" >
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/nueva-venta.css">
<link rel="stylesheet" href="fonts/font-awesome.css">
<link rel="stylesheet" type="text/css" href="style.css">

<!--JS-->
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/superfish.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.mobilemenu.js"></script>
<script src="js/jquery.ui.totop.js"></script>
<script src="js/accounting.js"></script>

<!--
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/jquery.autocomplete.min.js"></script>
-->

<script>

    window.onload = function() 
    {
        //Obtener el número de ID consecutivo
         $.ajax(
            {
                type: "GET",  
                url: "http://localhost:8080/inventariojeans/rest/services/max_id_venta",
                dataType: "json",  
                success: function(data)
                {     
                    var max_id_venta = data.max_id_venta;
                    document.getElementById("txtIDVenta").value = max_id_venta;
                },  
               error: function(e)
               {  
                 alert('Error getting MAX max_id_venta: ' + e);
               }  
            });

        document.getElementById("inIDCliente").focus();
    }

    function selChangeArticulos()
    {
        var posc = $("#selArticulos")[0].selectedIndex;
            
        document.getElementById("selArticulos").selectedIndex = posc;
        document.getElementById("selPrecios").selectedIndex = posc;
        document.getElementById("selIDArticulo").selectedIndex = posc;
            
        var x = document.getElementById("selPrecios").selectedIndex;
        var y = document.getElementById("selPrecios").options;
            
        document.getElementById("txtPrecio").value = accounting.formatMoney(y[x].text);
        document.getElementById("txtCantidad").disabled=false;

        x = document.getElementById("selIDArticulo").selectedIndex;
        y = document.getElementById("selIDArticulo").options;

        document.getElementById("txtIDArticulo").value = accounting.formatMoney(y[x].text);

        //Corregir: el cursor no se posicionaba en el campo cantidad cuando se elegía una artículo
        //2020-07-24
        document.getElementById("txtCantidad").focus();

        //Corregir error: txtImporte no se actualizaba si había un cambio en el selector de articulos
        //Se actualizaba el precio pero no el importe
        //29-03-19
        
        var cantidad = accounting.unformat(document.getElementById("txtCantidad").value);
        var precio = accounting.unformat(document.getElementById("txtPrecio").value);
        var importe;

        //alert("Cantidad: " + cantidad + " Precio: " + precio);
        importe = cantidad * precio;

        document.getElementById("txtImporte").value = accounting.formatMoney(importe);
    }

    function selChangeVendedores()
    {
    	var posc = $("#selVendedores")[0].selectedIndex;
            
        document.getElementById("selIDVendedor").selectedIndex = posc;

        var x = document.getElementById("selIDVendedor").selectedIndex;
        var y = document.getElementById("selIDVendedor").options;

     	document.getElementById("txtIDVendedor").value = (y[x].text);

        document.getElementById("btnGuardar").hidden=false; 
    }

    function calcularImporte()
    {
        var cantidad = Number(document.getElementById("txtCantidad").value);
        var precio = accounting.unformat(document.getElementById("txtPrecio").value);

        document.getElementById("txtImporte").value = accounting.formatMoney(cantidad * precio);   
    }

    function addRow()
    {

        var precio = accounting.unformat(document.getElementById("txtPrecio").value);
        var cantidad = document.getElementById("txtCantidad").value;
        var importe = document.getElementById("txtImporte").value;
        var descripcion = document.getElementById("selArticulos").value;
        var idArticulo = document.getElementById("txtIDArticulo").value;
            
        if (precio == "" || cantidad == "")
        {
            if (precio == "")
            {
                alert("Indique precio");
                //document.getElementById("txtPrecio").focus();
            }
            if (cantidad == "")
            {
                alert("Indique cantidad");
                document.getElementById("txtCantidad").focus();
            }
        }
        else
        {
        	//calcular el número de líneas de la tabla tPartidas
	        var rwsTPartidas = document.getElementById("tPartidas").getElementsByTagName("tr").length;

            //calcular el número de líneas de la tabla tTotal
            var rwsTTotal = document.getElementById("tTotal").getElementsByTagName("tr").length;

	        if (rwsTPartidas==0&&rwsTTotal==0)
	        {
	        	
	        	var tTotal = document.getElementById("tTotal");

	        	var tTotalRow = tTotal.insertRow(-1);

	            var x = tTotalRow.insertCell(0);
	            x.className = "descripcion";
	            x.innerHTML = descripcion;

	            var x = tTotalRow.insertCell(1);
	            x.className = "cantidad";
	            x.innerHTML = cantidad;
	                                
	            var x = tTotalRow.insertCell(2);
	            x.className = "precio";
	            x.innerHTML = "TOTAL";
	                            
	            var x = tTotalRow.insertCell(3);
	            x.className = "importe";
	            x.innerHTML = 0;

	            //solo para que midan lo mismo
	            var x = tTotalRow.insertCell(4);
				x.innerHTML = "";	
				
				//ocultar las dos primeras celdas
				document.getElementById("tTotal").rows[0].cells.item(0).style.visibility = "hidden";
                document.getElementById("tTotal").rows[0].cells.item(1).style.visibility = "hidden";

                /*				
                var y = document.createElement("INPUT");
				y.setAttribute("type", "radio");
				y.id = "rdoItem";
				x.appendChild(y);
				
				document.getElementById("rdoItem").style.visibility = "hidden"; 
                */
				
	        }

	        //si ya estamos calculando el total de las rows, esta linea nueva deberia tener como ID ese total + 1
	        rwsTPartidas = rwsTPartidas + 1;

            var tRows = document.getElementById("tPartidas");

            var rwPActual = tRows.insertRow(-1);

            var x = rwPActual.insertCell(0);
            x.className = "descripcion";
            x.innerHTML = descripcion;

            var x = rwPActual.insertCell(1);
            x.className = "cantidad";
            x.innerHTML = cantidad;
                                
            var x = rwPActual.insertCell(2);
            x.className = "precio";
            x.innerHTML = accounting.formatMoney(precio);
                            
            var x = rwPActual.insertCell(3);
            x.className = "importe";
            x.innerHTML = accounting.formatMoney(importe);

            //Insertar radio button
			var x = rwPActual.insertCell(4);
						
			var y = document.createElement("input");
			y.type = "checkbox";
			y.name="chkbox[]";
			x.appendChild(y);
			
			 //celda ID articulo
			var x = rwPActual.insertCell(5);
            x.className = "importe";
            x.innerHTML = accounting.unformat(idArticulo);

            rwsTPartidas = document.getElementById("tPartidas").getElementsByTagName("tr").length;
            rwsTPartidas = rwsTPartidas - 1;

            document.getElementById("tPartidas").rows[rwsTPartidas].cells.item(5).style.visibility = "hidden"; //ocultar la columna del ID de articulo

			//actualizar el total
			var totalBolsa = document.getElementById("tTotal").rows[0].cells.item(3).innerHTML;
			
			totalBolsa = Number(accounting.unformat(totalBolsa)) + Number(accounting.unformat(importe));

			document.getElementById("tTotal").rows[0].cells.item(3).innerHTML = accounting.formatMoney(totalBolsa);
			document.getElementById("txtTotal").value = totalBolsa; //actualizar el total en el formulario

            //Insertar en tabla de formulario
            var tRowsForm = document.getElementById("tPartidasForm");

            rwPActual = tRowsForm.insertRow(-1);
            rwPActual.className = "item";

            var x = rwPActual.insertCell(0);
            x.className = "descripcion";
            x.innerHTML = descripcion;

            var x = rwPActual.insertCell(1);
            x.className = "cantidad";
            x.innerHTML = cantidad;
                                
            var x = rwPActual.insertCell(2);
            x.className = "precio";
            x.innerHTML = accounting.unformat(precio);
                            
            var x = rwPActual.insertCell(3);
            x.className = "importe";
            x.innerHTML = accounting.unformat(importe);

            var x = rwPActual.insertCell(4);
            x.className = "idArt";
            x.innerHTML = accounting.unformat(idArticulo);

            //Llenar el sel de vendedores
            $.ajax(
			{
				type: "GET",  
				url: "http://localhost:8080/inventariojeans/rest/services/vendedores",
				dataType: "json",  
				success: function(data)
				{
					var sizeVendedores = Object.keys(data.vendedores).length;

					var selVendedores = document.getElementById('selVendedores'); //Get the select element
					var selIDVendedor = document.getElementById('selIDVendedor'); //Get the select element
					
					//Se limpia el dropdown
					while (selVendedores.options.length > 0) 
		    		{                
		    			selVendedores.remove(0);
					}
					
					while (selIDVendedor.options.length > 0) 
		    		{                
		    			selIDVendedor.remove(0);
					}

					//insertar un vendedor antes que las de la BD
					var opt = document.createElement('option');
					opt.innerHTML = " "; //Add a value to the option	
					selVendedores.appendChild(opt); //Add the option to the select element	

					//insertar un ID vendedor antes que las de la BD
					var opt = document.createElement('option');
					opt.innerHTML = " "; //Add a value to the option	
					selIDVendedor.appendChild(opt); //Add the option to the select element	
					
					for (i=0; i<sizeVendedores; i++)
					{
					 	var opt = document.createElement('option'); //Create option element
						opt.innerHTML = data.vendedores[i].nombre; //Add a value to the option	
						selVendedores.appendChild(opt); //Add the option to the select element

						var opt = document.createElement('option'); //Create option element
						opt.innerHTML = data.vendedores[i].id_vendedor; //Add a value to the option	
						selIDVendedor.appendChild(opt); //Add the option to the select element

					}
					
					document.getElementById("selArticulos").disabled=false;
	
				   	},
					error: function(e)
					{  
						alert('Error al recuperar articulos: ' + e);   
					} 
			});
        }
    }

    function deleteRow(tableID)
    {
		try 
		{
			var table = document.getElementById(tableID);
			var tableForm = document.getElementById("tPartidasForm"); //tabla formulario
			var rowCount = table.rows.length;

			var totalDescontar = 0;
			var totalRow = 0;
			
            //Ciclo para recorrer la tabla y eliminar todas las rows con el check seleccionado
			for(var i=0; i<rowCount; i++) 
			{
				var row = table.rows[i]; //La row completa de la posición "i".
				var chkbox = row.cells[4].childNodes[0]; //Este es una celda de la columna 4.
				
				if(true == chkbox.checked) 
				{
					totalRow = document.getElementById("tPartidas").rows[i].cells.item(3).innerHTML;

					totalDescontar = totalDescontar + Number(accounting.unformat(totalRow));
					table.deleteRow(i);
					tableForm.deleteRow(i);
					rowCount--;
					i--;
				}
				else
				{}
			}
		}
		catch(e) 
		{
			alert(e);
		}

		//Aplicar el descuento al total
		var totalForm = document.getElementById("txtTotal").value;
		totalForm = accounting.unformat(totalForm);
		totalForm = Number(totalForm) - Number(totalDescontar);
		document.getElementById("txtTotal").value = totalForm;
		document.getElementById("tTotal").rows[0].cells.item(3).innerHTML = accounting.formatMoney(totalForm);

    }

    function guardarVenta()
    {
    
        //Create JSON
        var items = []; 
       
        var table = $("#tPartidasForm");

        table.find('tr').each(function (i) 
        {
            var $tds = $(this).find('td'),
            descripcion = $tds.eq(0).text(),
            cantidad = $tds.eq(1).text(),
            precio = $tds.eq(2).text();
            importe = $tds.eq(3).text();
            idArticulo = $tds.eq(4).text();
      
            items.push({"descripcion": descripcion, "cantidad": cantidad, "precio": precio, "importe": importe, "idArticulo": idArticulo});
        });

        var itemsObj = {};
        itemsObj = items;

        var id = document.getElementById("txtIDCliente").value;
        var total = document.getElementById("txtTotal").value;
        var idVendedor = document.getElementById("txtIDVendedor").value;
        var nombreCliente = document.getElementById("txtNombre").innerHTML;
        
        var bodyObj = {};
        
        bodyObj.id = id;
        bodyObj.total = total;
        bodyObj.nombreCliente = nombreCliente;
        bodyObj.idVendedor = idVendedor;
        bodyObj.items = items;

        var ventaJSON = JSON.stringify(bodyObj); 
    
        //POST
        $.ajax(
            {
                type: "POST",
                url: "http://localhost:8080/inventariojeans/rest/postservices/post-venta",
                data: JSON.stringify(bodyObj),
                headers: 
                {
                    "Content-Type": "application/json"
                },
                success: function(data) 
                {//alert("Ok!");
                    window.location.replace("nueva_ventaJSON.jsp");
                },
                error : function(e)
                {
                    alert("Error");
                }
            });
    }

    function nuevaVenta(event)
    {
         var x = event.keyCode;
        if (x == 13) 
        {
            document.getElementById("selArticulos").focus();

            var id_cliente = document.getElementById("inIDCliente").value;
            //alert(id_cliente);
            $.ajax(
            {
                type: "GET",  
                url: "http://localhost:8080/inventariojeans/rest/services/get_cliente/id_cliente=" + id_cliente,
                dataType: "json",  
                success: function(data)
                {
                    document.getElementById("txtId").innerHTML = "ID: " + data.cliente.id_cliente;
                    document.getElementById("txtNombre").innerHTML = data.cliente.nombre;
                    document.getElementById("txtDireccion").innerHTML = data.cliente.direccion;
                    document.getElementById("txtColonia").innerHTML = data.cliente.colonia;
                    document.getElementById("txtTelefono").innerHTML = data.cliente.telefono;
                    document.getElementById("txtLugar").innerHTML = data.cliente.lugar;

                    document.getElementById("txtIDCliente").value = data.cliente.id_cliente;
                },
                error: function(e)
                {  
                    alert('Error al recuperar articulos: ' + e);   
                } 
            });

            //Llener sel de descripciones de articulos
            $.ajax(
            {
                type: "GET",  
                url: "http://localhost:8080/inventariojeans/rest/services/articulos",
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
                    document.getElementById("selArticulos").focus();
    
                },
                error: function(e)
                {  
                    alert('Error al recuperar articulos: ' + e);   
                } 

            });
        }
    }

    function pressArt(event)
    {
        var x = event.keyCode;
        if (x == 13) 
        {
            document.getElementById("txtCantidad").focus();
        }
    }

    function pressCan(event)
    {
        var x = event.keyCode;
        if(x == 13)
        {
            document.getElementById("txtPrecio").disabled=false;
            document.getElementById("txtPrecio").focus();
        }
    }

    function pressPre(event)
    {
        var x = event.keyCode;
        if(x == 13)
        {
            calcularImporte()
            addRow();
            document.getElementById("selArticulos").focus();
        }
    }


</script>

</head>
<body>
<!--header-->
<header>
   <div class="container">
        <div class="row">
            <article class="col-lg-12 col-md-12 col-sm-12">
                <h1 class="navbar-brand navbar-brand_"><a href="index.jsp">Inventario de Alexis</a></h1>
                <div class="menuBox clearfix">
                    <nav class="navbar navbar-default navbar-static-top my_navbar clearfix" role="navigation">
                        <ul class="nav sf-menu clearfix">
                            <li class="active"><a href="index.jsp">Inicio</a></li>
                            <li class="sub-menu"><a href="about.html">Clientes<span></span></a>
                                <ul class="submenu">
                                    <li><a href="nuevoClienteJSON.jsp">Nuevo</a></li><!-- 03-04-2020 -->
                                    <li><a href="modificar_cliente.jsp">Modificar</a></li>
                                    <li><a href="busquedas.jsp">Buscar</a></li>
                                    <li><a href="vendedores.jsp">Vendedores</a></li>
                                    <li><a href="articulos.jsp">Articulos</a></li>
                                    <li class="tr1"></li>
                                </ul>
                            </li>
                            <li class="sub-menu"><a href="modificar_venta.jsp">Ventas<span></span></a>
                                <ul class="submenu">
                                    <li><a href="nueva_ventaJSON.jsp">Nueva venta</a></li>
                                    <li><a href="modificar_ventaJSON.jsp">Ventas</a></li>
                                    <li><a href="registrar_abono.jsp">Abonos</a></li>
                                    <li><a href="tarjeta.jsp">Tarjetas</a></li>
                                    <li class="tr1"></li>
                                </ul>
                            </li>
                            <li class="sub-menu"><a href="about.html">Reportes<span></span></a>
                                <ul class="submenu">
                                    <li><a href="reporte_ruta.jsp">Rutas</a></li>
                                    <li><a href="#">Saldos menores</a></li>
                                    <li class="tr1"></li>
                                </ul>
                            </li>
                            <li class="sub-menu"><a href="#">Notificaciones<span></span></a>
                                <ul class="submenu">
                                    <li><a href="#">Mensaje SMS</a></li>
                                    <li><a href="#">Correo electronico</a></li>
                                    <li class="tr1"></li>
                                </ul>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/logout">Salir</a></li>
                        </ul>
                    </nav>
                </div>
            </article>
        </div>
    </div>
</header>
<div class="global indent no-padd">
    <!--content-->
    <section class="formBox">
        <div class="container">
            <div class="row">
                <article class="col-lg-4 col-md-4 col-sm-4">
                    <h3>Datos del cliente</h3>
                    
                    <h2 id="txtId"></h2>
                    <h2 id="txtNombre"></h2>
                    <h2 id="txtDireccion"></h2>
                    <h2 id="txtColonia"></h2>
                    <h2 id="txtTelefono"></h2>
                    <h2 id="txtLugar"></h2>
                          
                </article>
                <article class="col-lg-8 col-md-8 col-sm-8 contactBox2">
                    <h3>Nueva venta</h3>

                    <h2>ID Venta/Tarjeta</h2>
                    <input name="txtIDVenta" id="txtIDVenta" class="txtIDVenta" type="text" disabled/>
                    <h2>Cliente</h2>
                    <input type="text" name="inIDCliente" id="inIDCliente" onkeypress="nuevaVenta(event)"/>

                    <a data-type="submit" class="btn-default btn6" onclick="addRow()">+ Agregar</a> <a> &nbsp</a>
                    <a data-type="submit" class="btn-default btn6" onclick="deleteRow('tPartidas')">- Eliminar</a>

                    <p></p>

                    <table id="tMotor">

                        <tr class="header">
                            <th>Descripcion</th>
                            <th>Cantidad</th>
                            <th>Precio</th>
                            <th>Importe</th>
                        </tr>
                        <tr>
                            <th><select id="selArticulos" class="sel" onclick="" onchange="selChangeArticulos()" placeholder="Descripcion" onkeypress="pressArt(event)"></select></th>
                            <th><input name="txtCantidad" id="txtCantidad" class="myId" type="text" onchange="calcularImporte()" disabled="disabled" onkeypress="pressCan(event)" /></th>
                            <th><input name="txtPrecio" id="txtPrecio" class="cantidad" type="text" onkeypress="pressPre(event)" disabled/></th>
                            <th><input name="txtImporte" id="txtImporte" class="cantidad" type="text" disabled/></th>
                            <th><input name="txtIDArticulo" id="txtIDArticulo" class="cantidad" type="text" disabled hidden /></th>
                        </tr>
                    </table>
                    
                    <select id="selPrecios" class="sel" onclick="" onchange="" placeholder="" hidden></select>
                    <select id="selIDArticulo" class="sel" onclick="" onchange="" placeholder="" hidden></select>

                    <p></p>
                    <h2>Bolsa</h2>

                    <table id="tPartidas">
                    </table>

                    <table id="tTotal">
                    </table>

                    <table id="tVendedor">

                        <tr class="header">
                            <th>Vendedor</th>
                            
                        </tr>
                        <tr>
                            <th><select id="selVendedores" class="sel" onclick="" onchange="selChangeVendedores()" placeholder="Descripcion"></select></th>
                            <th><select id="selIDVendedor" hidden></select></th>
                           
                        </tr>
                    </table>

                    <form id="inv_form" action="saveVenta.jsp">
    
                        <table id="tPartidasForm" hidden>
                        </table>

                        <input name="txtTotal" id="txtTotal" hidden/>
                        <input name="txtIDCliente" id="txtIDCliente" hidden/>
                        <input name="txtIDVendedor" id="txtIDVendedor" hidden/>

                        <input id="clmIdArticulo" name="clmIdArticulo" value="" size="7" hidden/>
                        <input name="clmCantidad" id="clmCantidad" hidden/>
                        <input name="clmPrecio" id="clmPrecio" hidden/>
                        <input name="clmImporte" id="clmImporte" hidden/>

                        <div id="btnGuardar" class="btns" hidden>
                            <a data-type="submit" class="btn-default btn5" onclick="guardarVenta()">Guardar</a>
                            <p></p>
                        </div>

                        <div id="btnRegresar" class="btns">
                            <a data-type="submit" class="btn-default btn5" href="index.jsp">Regresar</a>
                            <p></p>
                        </div> 

                    </form>
                </article>


            </div>
        </div>
    </section>
</div>
<!--footer-->
<footer>
    <div class="container">
        <div class="row">
            <article class="col-lg-4 col-md-4 col-sm-4">
                <figure><img src="img/foo_icon1.png" alt=""></figure>
                <div class="extra-wrap">
                    <p>Hugo Reyes|Soluciones en la nube 2018<br>Ocotlan, JAL<br />
                </div>
            </article>
            <article class="col-lg-4 col-md-4 col-sm-4">
                <figure><img src="img/foo_icon2.png" alt=""></figure>
                <div class="extra-wrap">
                    <p>Telefono: +52 33 1690 9205<br>E-mail: <a href="#">hugogamaliel@hotmail.com</a></p>
                </div>
            </article>
            <article class="col-lg-4 col-md-4 col-sm-4">
                <p class="priv"><strong>metamorph_tribop</strong> &copy; <em id="copyright-year"></em> </p>
                <ul>
                    <li><a href="#"><img src="img/follow_icon1.png" alt=""></a></li>
                    <li><a href="#"><img src="img/follow_icon2.png" alt=""></a></li>
                    <li><a href="#"><img src="img/follow_icon3.png" alt=""></a></li>
                    <li><a href="#"><img src="img/follow_icon4.png" alt=""></a></li>
                </ul>
            </article>
        </div>
    </div>
    <div id="foot_cp">Website Design: <a href="http://www.metamorphozis.com" class="foot_lk">metamorphozis</a></div>
</footer>
<script src="js/bootstrap.min.js"></script>
<script src="js/scripts.js"></script>
</body>
</html>
