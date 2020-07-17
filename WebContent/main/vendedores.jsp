<!DOCTYPE html>
<html lang="en">

<head>
<title>Vendedores</title>
<meta charset="utf-8">    
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="description" content="Your description">
<meta name="keywords" content="Your keywords">
<meta name="author" content="Your name">
<meta name = "format-detection" content = "telephone=no" />
<!--CSS-->
<link rel="stylesheet" href="css/bootstrap.css" >
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/vendedores.css">
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

    window.onload = function() 
    {
        //Obtener vendedores
       
        /*
         $.ajax(
        {
            type: "GET",  
            url: "http://localhost:8080/inventariojeans/rest/services/vendedores",
            dataType: "json",  
            success: function(data)
            {
                var tVendedores = document.getElementById("tVendedores");
                var sizeVendedores = Object.keys(data.vendedores).length;

                for (i=0; i<sizeVendedores; i++)
                {
                    var row = tVendedores.insertRow(i);
                    var x = row.insertCell(0);
                    x.innerHTML = data.vendedores[i].nombre;
                    x.className = "nombre";

                    //Insertar Checkbox
                    var x = row.insertCell(1);
                        
                    var y = document.createElement("input");
                    y.type = "checkbox";
                    y.name="chkbox[]";
                    x.appendChild(y);
                }
            },
            error: function(e)
            {  
                alert('Error al recuperar vendedores: ' + e);   
            } 
        });

        document.getElementById("txtNombre").focus();
        */

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

    function selChangeVendedores()
    {
        var posc = $("#selVendedores")[0].selectedIndex;
            
        document.getElementById("selIDVendedor").selectedIndex = posc;

        var x = document.getElementById("selIDVendedor").selectedIndex;
        var y = document.getElementById("selIDVendedor").options;

        document.getElementById("txtIDVendedor").value = (y[x].text);

    }

    function getTarjetas()
    {
        var id_vendedor = document.getElementById("txtIDVendedor").value;

        //Limpiar tabla tTarjetas
        document.getElementById("tTarjetas").innerHTML = "";

        //Llenar tabla de tarjetas por vendedor - Obtener las tarjetas - tTarjetas
        $.ajax(
        {
            type: "GET",  
            url: "http://localhost:8080/inventariojeans/rest/services/tarjetas_by_vendedor/id_vendedor=" + id_vendedor,
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
                        x.innerHTML = data.tarjetas[i].id_venta;
                        x.className = "id_venta";  

                        var x = row.insertCell(1);
                        x.innerHTML = data.tarjetas[i].nombre;
                        x.className = "nombre";

                        var x = row.insertCell(2);
                        x.innerHTML = data.tarjetas[i].id_cliente;
                        x.className = "id_venta";

                        var x = row.insertCell(3);
                        x.innerHTML = data.tarjetas[i].fecha;
                        x.className = "fecha";

                        var x = row.insertCell(4);
                        x.innerHTML = data.tarjetas[i].total;
                        x.className = "total";

                        var x = row.insertCell(5);
                        x.innerHTML = data.tarjetas[i].saldo;
                        x.className = "total";

                        var x = row.insertCell(6);
                        x.innerHTML = data.tarjetas[i].estado;
                        x.className = "estado";

                        j=j+1;
                                
                }
                    
            //Titulos
            var row = tTarjetas.insertRow(0);
                    
            },
            error: function(e)
            {  
                alert('Error al recuperar tarjetas: ' + e);   
            } 
        });          
    }
    
    function pressNom(event)
    {
        var x = event.keyCode;
        if (x == 13) 
        {
            //Validar cajas de texto
            saveVendedor();
        }
    }

    function saveVendedor()
    {
        var valido = 1;

        if (document.getElementById("txtNombre").validity.valueMissing) 
        {valido=0;}

        var txtNombre = document.getElementById("txtNombre").value;

        if (valido==1)
        {
            document.getElementById("txtAction").value = 1;
            var miformulario = document.getElementById("nuevo-vendedor");
            miformulario.submit();
        }
        else
        {
            alert("Nombre es requerido");
        }

    }

    function deleteVendedor()
    {

        //Validar que no haya tarjetas Pendientes
        document.getElementById("txtAction").value = 2;
        var miformulario = document.getElementById("nuevo-vendedor");
        miformulario.submit();
        
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
                <article>
                    <h3>Vendedor
                    <p></p>

                    <table id="tVendedores">
                        </table>
                    <p></p>

                    <table id="tVendedor">

                        <tr class="header">
                            <th>Vendedores</th>
                            
                        </tr>
                        <tr>
                            <th><select id="selVendedores" class="sel" onclick="" onchange="selChangeVendedores()" placeholder="Descripcion"></select></th>
                            <th><select id="selIDVendedor" hidden></select></th>
                           
                        </tr>
                    </table>
                    <table id="tTarjetas">
                    </table>
                    <a data-type="submit" class="btn-default btn6" onclick="getTarjetas()">Ver Tarjetas</a>
                    <a data-type="submit" class="btn-default btn6" onclick="deleteVendedor()">Eliminar</a>
                    <h2>Nuevo vendedor</h3>
                    <form id="nuevo-vendedor" action="saveVendedor.jsp">
                    	<p></p>
                        <input name="txtNombre" id="txtNombre" type="text" placeholder="Nombre:" onkeypress="pressNom(event)" required/>
                         <input name="txtIDVendedor" id="txtIDVendedor" hidden/>
                         <input name="txtAction" id="txtAction" hidden/>
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
