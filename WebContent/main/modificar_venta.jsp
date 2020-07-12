<!DOCTYPE html>
<html lang="en">

<head>
<title>Ventas</title>
<meta charset="utf-8">    
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="description" content="Your description">
<meta name="keywords" content="Your keywords">
<meta name="author" content="Your name">
<meta name = "format-detection" content = "telephone=no" />
<!--CSS-->
<link rel="stylesheet" href="css/bootstrap.css" >
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/modificar-venta.css">
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
<script src="/js/pdfobject.js"></script>
<!--
<script type="text/javascript" src="js/modif-autocomplete.js"></script>
-->

<script>

    window.onload = function() 
    {
        document.getElementById("inIDCliente").focus();
    }
    
    function abonarCuenta(id_venta,estado)
    {
        //Borrar el contenido de las 3 tablas
        document.getElementById("tPartidas").innerHTML = "";
        document.getElementById("tPartidasH").innerHTML = "";
        document.getElementById("tPartidasModificar").innerHTML = "";

        document.getElementById("tPartidasModFormOriginal").innerHTML = "";
        document.getElementById("tPartidasModFormPorActualizar").innerHTML = "";

        document.getElementById("divBtnModificar").hidden=true;
        
        //Obtener partidas actuales
        $.ajax(
        {
            type: "GET",  
            url: "http://localhost:8080/inventariojeans/rest/services/ventas_detalle_actual/id_venta=" + id_venta,
            dataType: "json",  
            success: function(data)
            {
                var tPartidas = document.getElementById("tPartidas");            
                var sizeDTVenta = Object.keys(data.ventas_detalle).length;
                var j=0;
                var total=0;
                //PARTIDAS
                for (i=0; i<sizeDTVenta; i++)
                {
                    var row = tPartidas.insertRow(i);
                    var x = row.insertCell(0);
                    x.innerHTML = data.ventas_detalle[i].descripcion;
                    x.className = "descripcion"; 

                    var x = row.insertCell(1);
                    x.innerHTML = data.ventas_detalle[i].cantidad;
                    x.className = "cantidad"; 

                    var x = row.insertCell(2);
                    x.innerHTML = data.ventas_detalle[i].precio;
                    x.className = "importe"; 

                    var x = row.insertCell(3);
                    x.innerHTML = data.ventas_detalle[i].importe;
                    x.className = "importe";

                    j=j+1;
                    total = total + Number(accounting.unformat(data.ventas_detalle[i].importe));
                }

                document.getElementById("txtTotal").value = total
                document.getElementById("txtIDVenta").value = data.ventas_detalle[0].id_venta;

                if (estado=="Modificada" || estado=="Pendiente")
                {
                    document.getElementById("divBtnModificar").hidden=false;
                    document.getElementById("divBtnRegresar").hidden=false;
                }

            },
            error: function(e)
            {  
                alert('Error al recuperar articulos: ' + e);   
            } 
        });

        //Partidas historicas
        $.ajax(
        {
            type: "GET",  
            url: "http://localhost:8080/inventariojeans/rest/services/ventas_detalle_general/id_venta=" + id_venta,
            dataType: "json",  
            success: function(data)
            {
                var tPartidas = document.getElementById("tPartidasH");            
                var sizeDTVenta = Object.keys(data.ventas_detalle).length;
                var j=0;
                var total=0;
                //PARTIDAS
                for (i=0; i<sizeDTVenta; i++)
                {
                    var row = tPartidas.insertRow(i);
                    var x = row.insertCell(0);
                    x.innerHTML = data.ventas_detalle[i].descripcion;
                    x.className = "descripcion"; 

                    var x = row.insertCell(1);
                    x.innerHTML = data.ventas_detalle[i].cantidad;
                    x.className = "cantidad"; 

                    var x = row.insertCell(2);
                    x.innerHTML = data.ventas_detalle[i].precio;
                    x.className = "importe"; 

                    var x = row.insertCell(3);
                    x.innerHTML = data.ventas_detalle[i].importe;
                    x.className = "importe";
                                
                    var x = row.insertCell(4);
                    x.innerHTML = data.ventas_detalle[i].estado;
                    x.className = "estado";
                                
                    j=j+1;
                    total = total + Number(accounting.unformat(data.ventas_detalle[i].importe));
                }

                var row = tPartidas.insertRow(0);
                    
                var x = row.insertCell(0);
                x.innerHTML = "Historial";
                x.className="header_partidas";

            },
            error: function(e)
            {  
                alert('Error al recuperar articulos: ' + e);   
            } 
        });

        verTarjeta(id_venta);
    }

    //Accionada con el boton "Modificar"
    function partidasModificar()
    {
        var id_venta;

        id_venta = document.getElementById("txtIDVenta").value;

        $.ajax(
        {
            type: "GET",  
            url: "http://localhost:8080/inventariojeans/rest/services/ventas_detalle_actual/id_venta=" + id_venta,
            dataType: "json",  
            success: function(data)
            {
                var tPartidas = document.getElementById("tPartidasModificar");            
                var sizeDTVenta = Object.keys(data.ventas_detalle).length;
                var j=0;
                var total=0;
                //PARTIDAS
                for (i=0; i<sizeDTVenta; i++)
                {
                    var row = tPartidas.insertRow(i);
                    var x = row.insertCell(0);
                    x.innerHTML = data.ventas_detalle[i].descripcion;
                    x.className = "descripcion"; 

                    //Insertar caja de texto editable con la cantidad original
                    var x = row.insertCell(1);
                    var t1 = document.createElement("input");
                    t1.id = "myInput"+i;
                    t1.size = 3;
                            
                    x.appendChild(t1);
                            
                    var textbox = document.getElementById("myInput"+i);
                    textbox.value = data.ventas_detalle[i].cantidad;
                    x.className = "cantidad";

                    var x = row.insertCell(2);
                    x.innerHTML = data.ventas_detalle[i].precio;
                    x.className = "importe";

                    var x = row.insertCell(3);
                    x.innerHTML = data.ventas_detalle[i].importe;
                    x.className = "importe";

                    j=j+1;
                    total = total + Number(accounting.unformat(data.ventas_detalle[i].importe));
                }

                //Agregar fila para total - 23-dic-2019
                var tPartidasT = document.getElementById("tPartidasTotal");
                
                var row = tPartidasT.insertRow(0);

                var x = row.insertCell(0);
                x.innerHTML = data.ventas_detalle[0].descripcion;
                x.className = "descripcion_black";

                x = row.insertCell(1);
                x.innerHTML = "1";
                x.className = "cantidad_black";

                x = row.insertCell(2);
                x.innerHTML = "TOTAL";
                x.className = "importe_black"; 

                x = row.insertCell(3);
                x.innerHTML = accounting.formatMoney(total);
                x.className = "total_black";          

                //Duplicar todo en la tabla del formulario
                //Original
                var tPartidasModFormOriginal = document.getElementById("tPartidasModFormOriginal");            
                sizeDTVenta = Object.keys(data.ventas_detalle).length;
                j=0;
                total=0;
                //PARTIDAS
                for (i=0; i<sizeDTVenta; i++)
                {
                    var row = tPartidasModFormOriginal.insertRow(i);
                
                    var x = row.insertCell(0);
                    x.innerHTML = data.ventas_detalle[i].id_ventas_detalle;
                    x.className = "cantidad";

                    j=j+1;
                    total = total + Number(accounting.unformat(data.ventas_detalle[i].importe));
                }

                //Actualizar
                //Todos estos serán nuevos registros en la tabla inv_ventas_detalle que en el campo actual tendrán el valor 1
                var tPartidasModFormPorActualizar = document.getElementById("tPartidasModFormPorActualizar");            
                sizeDTVenta = Object.keys(data.ventas_detalle).length;
                j=0;
                total=0;
                //PARTIDAS
                for (i=0; i<sizeDTVenta; i++)
                {
                    var row = tPartidasModFormPorActualizar.insertRow(i);
                    var x = row.insertCell(0);
                    x.innerHTML = id_venta;
                    x.className = "importe"; 

                    var x = row.insertCell(1);
                    x.innerHTML = data.ventas_detalle[i].cantidad;
                    x.className = "cantidad";

                    var x = row.insertCell(2);
                    x.innerHTML = accounting.unformat(data.ventas_detalle[i].precio);
                    x.className = "cantidad";

                    var x = row.insertCell(3);
                    x.innerHTML = accounting.unformat(data.ventas_detalle[i].importe);
                    x.className = "importe";

                    var x = row.insertCell(4);
                    x.innerHTML = data.ventas_detalle[i].id_articulo;
                    x.className = "cantidad";

                    j=j+1;
                    total = total + Number(accounting.unformat(data.ventas_detalle[i].importe));
                }
                //document.getElementById("txtTotal").value = total
                document.getElementById("txtIDVenta").value = data.ventas_detalle[0].id_venta;

                document.getElementById("divBtnAceptar").hidden=false;
                document.getElementById("hNuevasCantidades").hidden=false;

                document.getElementById("divBtnModificar").hidden=true;
                document.getElementById("divBtnCancelar").hidden=true;
            },
            error: function(e)
            {  
                alert('Error al recuperar articulos: ' + e);   
            } 
        });
        
    }

    function cancelar()
    {

        document.getElementById("txtAction").value = 2;

        var txtIDVenta = document.getElementById("txtIDVenta");
        var txtAction = document.getElementById("txtAction");

        var miformulario = document.getElementById("inv_form");
        miformulario.submit();
    }

    function calcular_resumen()
    {
        //Se tiene que recalcular el importe de todas las líneas y el total
        //Se tienen que actualizar las nuevas cantidades - 6-mar-19
        //Validar que solo se inserten números
        //Recorrer tabla para actualizar los importes a partir de las nuevas cantidades
        var sizeTPartidasModificar = Number(document.getElementById("tPartidasModificar").getElementsByTagName("tr").length);
        var cantidad;
        var precio;
        var importe;
        var total=0;
        //var t = 0;

        for (i=0; i<sizeTPartidasModificar; i++)
        {
            cantidad = Number(document.getElementById("myInput"+i).value);
            precio = Number(accounting.unformat(document.getElementById("tPartidasModificar").rows[i].cells.item(2).innerHTML));
            importe = cantidad * precio;
            total = total + importe;
            //alert("cantidad: " + cantidad + " * precio: " + precio + " = importe: " + importe);
            document.getElementById("tPartidasModificar").rows[i].cells.item(3).innerHTML = accounting.formatMoney(importe);

            document.getElementById("tPartidasModFormPorActualizar").rows[i].cells.item(1).innerHTML=cantidad;
            document.getElementById("tPartidasModFormPorActualizar").rows[i].cells.item(3).innerHTML=accounting.unformat(importe);
        }
        //23-dic-2019 alert("total: " +  total);
        document.getElementById("tPartidasTotal").rows[0].cells.item(3).innerHTML = accounting.formatMoney(total);
        document.getElementById("txtTotal").value = total;
        document.getElementById("txtAction").value = 1;
        document.getElementById("divBtnGuardar").hidden=false;
    }

    function guardarModificaciones()
    {
        //Pending to change to JSON payload - 2020-07-11

        var txtTotal = document.getElementById("txtTotal");
        var txtIDVenta = document.getElementById("txtIDVenta");
        //var txtIsEnganche = document.getElementById("txtIsEnganche");
        var txtAction = document.getElementById("txtAction");

        var miformulario = document.getElementById("inv_form");

        var sizeTPartidas = Number(document.getElementById("tPartidasModFormOriginal").getElementsByTagName("tr").length);

        for (i=0;i<sizeTPartidas; i++)
        { 
            document.getElementById("clmIDSOriginal").value = document.getElementById("clmIDSOriginal").value + document.getElementById('tPartidasModFormOriginal').rows[i].cells[0].innerHTML + "-";
        }

        sizeTPartidas = Number(document.getElementById("tPartidasModFormPorActualizar").getElementsByTagName("tr").length);

        for (i=0;i<sizeTPartidas; i++)
        { 
            document.getElementById("clmIDVenta").value = document.getElementById("clmIDVenta").value + document.getElementById('tPartidasModFormPorActualizar').rows[i].cells[0].innerHTML + "-";
            document.getElementById("clmCantidad").value = document.getElementById("clmCantidad").value + document.getElementById('tPartidasModFormPorActualizar').rows[i].cells[1].innerHTML + "-";
            document.getElementById("clmPrecio").value = document.getElementById("clmPrecio").value + document.getElementById('tPartidasModFormPorActualizar').rows[i].cells[2].innerHTML + "-";
            document.getElementById("clmImporte").value = document.getElementById("clmImporte").value + document.getElementById('tPartidasModFormPorActualizar').rows[i].cells[3].innerHTML + "-";
            document.getElementById("clmIDArticulo").value = document.getElementById("clmIDArticulo").value + document.getElementById('tPartidasModFormPorActualizar').rows[i].cells[4].innerHTML + "-";
        }

        miformulario.submit();

    }

    function getVentas(event)
    {
        var x = event.keyCode;

        if (x==13)
        {
            var id_cliente = document.getElementById("inIDCliente").value;
            
            //Obtener datos del cliente
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
                    alert('Error al recuperar información del cliente: ' + e);   
                } 
            }); 

            //Obtener las tarjetas
            $.ajax(
            {
                type: "GET",  
                url: "http://localhost:8080/inventariojeans/rest/services/tarjetas/id_cliente=" + id_cliente,
                dataType: "json",  
                success: function(data)
                {
                    
                    var tTarjetas = document.getElementById("tTarjetas");  
                    var sizeTarjetas = Object.keys(data.tarjetas).length;

                    var j=0;

                    //partidas tarjetas
                    for (i=0; i<sizeTarjetas; i++)
                    {
                        var row = tTarjetas.insertRow(i);

                        var x = row.insertCell(0);
                        x.innerHTML = data.tarjetas[i].fecha;
                        x.className = "fecha";  

                        var x = row.insertCell(1);
                        x.innerHTML = data.tarjetas[i].total;
                        x.className = "total";

                        var x = row.insertCell(2);
                        x.innerHTML = data.tarjetas[i].saldo;
                        x.className = "total";

                        var x = row.insertCell(3);
                        x.innerHTML = data.tarjetas[i].id_venta;
                        x.className = "id_venta";

                        var x = row.insertCell(4);
                        x.innerHTML = data.tarjetas[i].vendedor;
                        x.className = "vendedor";

                        var x = row.insertCell(5);
                        x.innerHTML = data.tarjetas[i].estado;
                        x.className = "vendedor";

                        //Que todas las ventas se puedan abrir para poder revisar cuáles fueron los cambios
                        var x = row.insertCell(6);
                        var t1 = document.createElement("button");
                        t1.id = "btnAbonar"+i;
                        var t = document.createTextNode("Abrir");
                        t1.appendChild(t); 
                        x.appendChild(t1);
                        foo = document.getElementById("btnAbonar"+i);
                        foo.setAttribute("onclick","javascript:abonarCuenta(" + data.tarjetas[i].id_venta + ",'" + data.tarjetas[i].estado +"');");
                            x.className = "boton";

                        //Botón para visualizar la tarjeta
                        var y = row.insertCell(7);
                        var t2 = document.createElement("button");
                        t2.id = "btnTarjeta"+i;
                        var tN = document.createTextNode("Tarjeta");
                        t2.appendChild(tN); 
                        y.appendChild(t2);
                        foo = document.getElementById("btnTarjeta"+i);
                        foo.setAttribute("onclick","javascript:verTarjeta(" + data.tarjetas[i].id_venta + ");");
                            y.className = "boton";

                        j=j+1;
                                
                    }
                    
                    //Titulos
                    var row = tTarjetas.insertRow(0);
                   
                    var x = row.insertCell(0);
                    x.innerHTML = "Fecha";
                    x.className="titulo";

                    var x = row.insertCell(1);
                    x.innerHTML = "Total";
                    x.className="titulo";

                    var x = row.insertCell(2);
                    x.innerHTML = "Saldo";
                    x.className="titulo";

                    var x = row.insertCell(3);
                    x.innerHTML = "ID Venta";
                    x.className="titulo";

                    var x = row.insertCell(4);
                    x.innerHTML = "Vendedor";
                    x.className="titulo";

                    var x = row.insertCell(5);
                    x.innerHTML = "Estado";
                    x.className="titulo";

                    var x = row.insertCell(6);
                    x.innerHTML = "";
                    x.className="titulo";

                },
                error: function(e)
                {  
                    alert('Error al recuperar tarjetas: ' + e);   
                } 
            });       
        }
    }

    function changeInIDCliente()
    {   //
        //Borrar el contenido de las 3 tablas
        document.getElementById("tTarjetas").innerHTML = "";
        document.getElementById("tPartidas").innerHTML = "";
        document.getElementById("tPartidasH").innerHTML = "";
        document.getElementById("tPartidasModificar").innerHTML = "";

        document.getElementById("tPartidasModFormOriginal").innerHTML = "";
        document.getElementById("tPartidasModFormPorActualizar").innerHTML = "";

        document.getElementById("divBtnModificar").hidden=true;
        document.getElementById("pdf_file").hidden=true;

        //$('embed#pdf_file').remove();
    }

    function verTarjeta(id_venta)
    {
        //alert("hello");
        
        var parent = $('embed#pdf_file').parent();
       
        var newElement = "<embed src='http://localhost/pdf/tarjeta_" + id_venta +".pdf' id='pdf_file' type='application/pdf' height='570px' width='100%'>";

        $('embed#pdf_file').remove();
        parent.append(newElement);

    }

</script>

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
                                    <li><a href="modificar_venta.jsp">Ventas</a></li>
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

                    <h3>Ventas</h3>
                    <p></p>
                   
                    <h2>Cliente</h2>
                    <input type="text" name="inIDCliente" id="inIDCliente" onkeypress="getVentas(event)" onchange="changeInIDCliente()" />

                    <table id="tTarjetas">
                    </table>              
                    
                    <p></p>

                     <table id="tMotor">

                        <tr>
                            <th class="header_des">Descripcion</th>
                            <th class="header_can">Cantidad</th>
                            <th class="header_can">Precio</th>
                            <th class="header_imp">Importe</th>
                        </tr>
                         
                    </table>

                    <table id="tPartidas">
                    </table>

                    

                    <p></p>
                    <div id="main">
                        <table id="tPartidasH">
                        </table>
                    </div>
                    <p></p>
                    <div id="divBtnModificar" hidden>
                        <a class="btn-default btn6" onclick="partidasModificar()">Modificar</a> <a> &nbsp</a>
                        <a class="btn-default btn6" onclick="cancelar()">Cancelar venta</a> <a> &nbsp</a>
                    </div>
                    <p></p>
                    <h2 id="hNuevasCantidades" hidden>Nuevas cantidades</h2>
                    <p></p>
                    <table id="tPartidasModificar">
                    </table>

                    <table id="tPartidasTotal">
                    </table>

                    <p></p>
                    <p></p>

                    <div id="divBtnAceptar" hidden><a class="btn-default btn6" onclick="calcular_resumen()">Aceptar</a> <a> &nbsp</a></div>
                    <p></p>
                    <p></p>
                    <table id="tResumen">
                    </table>

                    <form id="inv_form" action="saveModificarVenta.jsp">
    
                        <table id="tPartidasModFormOriginal" hidden>
                        </table>

                        <table id="tPartidasModFormPorActualizar" hidden>
                        </table>

                        <input name="txtTotal" id="txtTotal" hidden/>
                        <input name="txtIDVenta" id="txtIDVenta" hidden/>

                        <input name="txtAction" id="txtAction" hidden/>

                        <!-- Columnas -->
                        <input name="clmIDSOriginal" id="clmIDSOriginal" hidden/>

                        <input name="clmIDVenta" id="clmIDVenta" hidden/>
                        <input name="clmCantidad" id="clmCantidad" hidden/>
                        <input name="clmPrecio" id="clmPrecio" hidden/>
                        <input name="clmImporte" id="clmImporte" hidden/>
                        <input name="clmIDArticulo" id="clmIDArticulo" hidden/>
                      
                        <div id="divBtnGuardar" hidden><a class="btn-default btn5" onclick="guardarModificaciones()">Guardar</a> <a> &nbsp</a></div>
                         <p></p>
                         
                        <embed id="pdf_file" src="" type="application/pdf" height="800px" width="1000px">
                
                        <div id="divBtnRegresar" hidden><a class="btn-default btn5" href="index.jsp">Regresar</a></div>
                        
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
