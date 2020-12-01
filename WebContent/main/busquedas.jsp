<!DOCTYPE html>
<html lang="en">

<head>
<title>Busquedas</title>
<meta charset="utf-8">    
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="description" content="Your description">
<meta name="keywords" content="Your keywords">
<meta name="author" content="Your name">
<meta name = "format-detection" content = "telephone=no" />
<!--CSS-->
<link rel="stylesheet" href="css/bootstrap.css" >
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/busquedas.css">
<link rel="stylesheet" href="fonts/font-awesome.css">
<!--JS-->
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/superfish.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.mobilemenu.js"></script>
<script src="js/jquery.ui.totop.js"></script>
<!--
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.3.js"></script>
-->
<script>

    function fnBuscar()
    {
        document.getElementById("tPartidas").innerHTML = "";

        var nombre = document.getElementById("txtNombre").value;
        var direccion = document.getElementById("txtDireccion").value;
        //var colonia = document.getElementById("txtColonia").value;

        var valido = 1;


        if (document.getElementById("txtNombre").validity.valueMissing) 
        {
            valido=0;
            nombre = "non-value";
        }
        
        if (document.getElementById("txtDireccion").validity.valueMissing) 
        {
            valido=0;
            direccion = "non-value";
        }

        /*
        if (document.getElementById("txtColonia").validity.valueMissing) 
        {
            valido=0;
            colonia = "non-value";
        }
        */

        if (valido==0)
        {
            getClientes(nombre,direccion);
        }

        if (valido==1)
        {
            getClientesAND(nombre,direccion);
        }
        

    }

    function getClientes(nombre, direccion)
    {
        

        $.ajax(
        {
            type: "GET",  
            url: "http://DESKTOP-SI86HH8:8280/inventariojeans/rest/services/busquedas/nombre=" + nombre + "/direccion=" + direccion,
            dataType: "json",  
            success: function(data)
                    {
                        var tPartidas = document.getElementById("tPartidas");            
                        var sizeClientes = Object.keys(data.clientes).length;
                        var j=0;
                    
                        //PARTIDAS
                            for (i=0; i<sizeClientes; i++)
                            {
                                var row = tPartidas.insertRow(i);
                                var x = row.insertCell(0);
                                x.innerHTML = data.clientes[i].id_cliente;
                                x.className = "id"; 

                                var x = row.insertCell(1);
                                x.innerHTML = data.clientes[i].nombre;
                                x.className = "nombre"; 

                                var x = row.insertCell(2);
                                x.innerHTML = data.clientes[i].direccion;
                                x.className = "direccion"; 

                                var x = row.insertCell(3);
                                x.innerHTML = data.clientes[i].colonia;
                                x.className = "colonia";

                                var x = row.insertCell(3);
                                x.innerHTML = data.clientes[i].telefono;
                                x.className = "colonia";

                                var x = row.insertCell(3);
                                x.innerHTML = data.clientes[i].lugar;
                                x.className = "colonia";

                                var x = row.insertCell(3);
                                x.innerHTML = data.clientes[i].id_ruta;
                                x.className = "id";

                                //j=j+1;
                                //total = total + Number(accounting.unformat(data.ventas_detalle[i].importe));
                            }

                    },
                    error: function(e)
                    {  
                        alert('Error al recuperar resultados: ' + e);   
                    } 
                });
    }

    function getClientesAND(nombre, direccion)
    {
        

        //alert("Nombre: " + nombre + " Direccion: " + direccion);

        $.ajax(
        {
            type: "GET",  
            url: "http://DESKTOP-SI86HH8:8280/inventariojeans/rest/services/busquedasAND/nombre=" + nombre + "/direccion=" + direccion,
            dataType: "json",  
            success: function(data)
                    {
                        var tPartidas = document.getElementById("tPartidas");            
                        var sizeClientes = Object.keys(data.clientes).length;
                        var j=0;
                    
                        //PARTIDAS
                            for (i=0; i<sizeClientes; i++)
                            {
                                var row = tPartidas.insertRow(i);
                                var x = row.insertCell(0);
                                x.innerHTML = data.clientes[i].id_cliente;
                                x.className = "id"; 

                                var x = row.insertCell(1);
                                x.innerHTML = data.clientes[i].nombre;
                                x.className = "nombre"; 

                                var x = row.insertCell(2);
                                x.innerHTML = data.clientes[i].direccion;
                                x.className = "direccion"; 

                                var x = row.insertCell(3);
                                x.innerHTML = data.clientes[i].colonia;
                                x.className = "colonia";

                                var x = row.insertCell(3);
                                x.innerHTML = data.clientes[i].telefono;
                                x.className = "colonia";

                                var x = row.insertCell(3);
                                x.innerHTML = data.clientes[i].lugar;
                                x.className = "colonia";

                                var x = row.insertCell(3);
                                x.innerHTML = data.clientes[i].id_ruta;
                                x.className = "id";

                                //j=j+1;
                                //total = total + Number(accounting.unformat(data.ventas_detalle[i].importe));
                            }

                    },
                    error: function(e)
                    {  
                        alert('Error al recuperar resultados: ' + e);   
                    } 
                });
    }
</script>

</head>
<body>
<!--header-->
<header>
   <div class="container">
        <div class="container">
        <div class="row">
            <article class="col-lg-12 col-md-12 col-sm-12">
                <h1 class="navbar-brand navbar-brand_"><a href="index.jsp">Inventario de Alexis</a></h1>
                <div class="menuBox clearfix">
                    <nav class="navbar navbar-default navbar-static-top my_navbar clearfix" role="navigation">
                        <ul class="nav sf-menu clearfix">
                            <li class="active"><a href="index.jsp">Inicio</a></li>
                            <li class="sub-menu"><a href="#">Clientes<span></span></a>
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
                            <li class="sub-menu"><a href="#">Reportes<span></span></a>
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
                    <h3></h3>
                    <dl>
						<dt></dt>
                    	<dd></dd>
                    	<dd></dd>
                   		<dd><a href="#"></a></dd>
                         
                    </dl>                   
                    
                </article>
                <article class="col-lg-8 col-md-8 col-sm-8 contactBox2">
                    <h3>Busquedas</h3>
                  
                    <form id="nuevo-cliente" action="saveCliente.jsp">
                       
                    	<input name="txtNombre" id="txtNombre" class="nombre" type="text" placeholder="Nombre:" required/><br/>
                    	 <p></p>
                    	 <input name="txtDireccion" id="txtDireccion" class="nombre" type="text" placeholder="Direccion:" required/>
                    	 <p></p>
                         <!--
                    	 <input name="txtColonia" id="txtColonia" class="colonia" type="text" placeholder="Colonia:" required/>
                        -->
                    	
                        
                        
                    </form>

                   <div class="btns">
                            <p></p>
                            <a href="#" data-type="submit" class="btn-default btn1" onclick="fnBuscar()">Buscar</a>
                            <p></p>
                        </div> 
 <p></p>

                         <p></p>

<table id="tPartidas">
                        </table>
                   


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
