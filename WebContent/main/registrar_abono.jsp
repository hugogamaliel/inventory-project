<!DOCTYPE html>
<html lang="en">

<head>
<title>Registrar abono</title>
<meta charset="utf-8">    
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="description" content="Your description">
<meta name="keywords" content="Your keywords">
<meta name="author" content="Your name">
<meta name = "format-detection" content = "telephone=no" />
<!--CSS-->
<link rel="stylesheet" href="css/bootstrap.css" >
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/registrar-abono.css">
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

<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/jquery.autocomplete.min.js"></script>

<script>

    window.onload = function() 
    {
        document.getElementById("inIDTarjeta").focus();
        //alert("Hello");
    } 

    //function abonarCuenta
    function abonarCuenta(event)
    {
        var x = event.keyCode;
        if (x == 13) 
        {
            var id_venta;
            id_venta = document.getElementById("inIDTarjeta").value;
            var saldo = 0;
            var valido = 0;

            document.getElementById("tPartidas").innerHTML = "";
            document.getElementById("tAbonos").innerHTML = "";

            //Ocultar controles
            document.getElementById("tAbonos_titulos").hidden=true;
            document.getElementById("hAbonos").hidden=true;
            document.getElementById("tAbonos").hidden=true;
            document.getElementById("inAbono").hidden=true;
            document.getElementById("rdEnganche").hidden=true;
            document.getElementById("l1").hidden=true;
            document.getElementById("l2").hidden=true;
            //document.getElementById("l3").hidden=true;
            document.getElementById("tResumen").hidden=true; 


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
                        x.innerHTML = data.ventas_detalle[i].importe;
                        x.className = "importe";

                        j=j+1;
                        total = total + Number(accounting.unformat(data.ventas_detalle[i].importe));
                    }

                    var row = tPartidas.insertRow(j);
                    var x = row.insertCell(0);
                    x.innerHTML = "";
                    x.className = "descripcion_black"; 

                    //row = tPartidas.insertRow(j);
                    x = row.insertCell(1);
                    x.innerHTML = "TOTAL";
                    x.className = "cantidad_black"; 

                    x = row.insertCell(2);
                    x.innerHTML = accounting.formatMoney(total);
                    x.className = "importe_black"; 

                    document.getElementById("txtTotal").value = total
                    document.getElementById("txtIDVenta").value = data.ventas_detalle[0].id_venta;
                    
                },
                error: function(e)
                {  
                    alert('Error al recuperar articulos: ' + e);   
                } 
            });

            //Obtener datos del cliente
            $.ajax(
            {
                type: "GET",  
                url: "http://localhost:8080/inventariojeans/rest/services/datos_cliente_by_id/id_cuenta=" + id_venta,
                dataType: "json",  
                success: function(data)
                {
                    document.getElementById("txtId").innerHTML = data.cliente.id_cliente;
                    document.getElementById("txtNombre").innerHTML = data.cliente.nombre;
                    document.getElementById("txtDireccion").innerHTML = data.cliente.direccion;
                    document.getElementById("txtColonia").innerHTML = data.cliente.colonia;
                    document.getElementById("txtTelefono").innerHTML = data.cliente.telefono;
                    document.getElementById("txtLugar").innerHTML = data.cliente.lugar;
                    document.getElementById("txtSaldo").innerHTML = "Saldo: " + data.cliente.saldo;
                    document.getElementById("tSaldo").value = data.cliente.saldo;
                    saldo = Number(data.cliente.saldo);
                    
                    if(saldo==0)//Validar si la cuenta ya fue liquidada 29-05-19
                    {
                        alert("Cuenta liquidada");
                        document.getElementById("inIDTarjeta").focus();
                    }
                    else
                    {   
                        document.getElementById("inAbono").hidden=false;
                        document.getElementById("rdEnganche").hidden=false;
                        document.getElementById("l1").hidden=false;
                        document.getElementById("l2").hidden=false;
                        document.getElementById("tResumen").hidden=false;
                        document.getElementById("inAbono").focus();
                    }
                    
                },
                error: function(e)
                {  
                    alert('Error al recuperar abonos: ' + e);   
                } 
            });
        }
    }
    
    //function getAbonos
    function getAbonos()
    {
        var valido = 1;

        if (document.getElementById("inIDTarjeta").validity.valueMissing) 
        {valido=0;}

        if (valido==1)
        {
            document.getElementById("tAbonos").hidden=false;
            document.getElementById("hAbonos").hidden=false;
            document.getElementById("tAbonos_titulos").hidden=false;
            document.getElementById("tAbonos").innerHTML = "";

            var id_venta;
            id_venta = document.getElementById("inIDTarjeta").value;

            //Obtener abonos
            $.ajax(
            {
                type: "GET",  
                url: "http://localhost:8080/inventariojeans/rest/services/abonos/id_venta=" + id_venta,
                dataType: "json",  
                success: function(data)
                {
                    var tAbonos = document.getElementById("tAbonos");            
                    var sizeAbonos = Object.keys(data.abonos).length;
                    var totalPagado = 0;

                    for (i=0; i<sizeAbonos; i++)
                    {
                        var row = tAbonos.insertRow(i);
                        var x = row.insertCell(0);
                        x.innerHTML = data.abonos[i].fecha;
                        x.className = "fecha";

                        x = row.insertCell(1);
                        x.innerHTML = data.abonos[i].cantidad;
                        x.className = "cantidad";

                        x = row.insertCell(2);
                        x.innerHTML = data.abonos[i].saldo;
                        x.className = "saldo";

                        x = row.insertCell(3);
                        x.innerHTML = data.abonos[i].enganche;
                        x.className = "enganche";
                    }        
                         
                },
                error: function(e)
                {  
                    alert('Error al recuperar abonos: ' + e);   
                } 
            });

        }
        else
        {
            alert("ID de Tarjeta es requerido");
            document.getElementById("inIDTarjeta").focus();
        }
    }
    
    //function calcularResumen
    function calcular_resumen(event)
    {
        var x = event.keyCode;
        if (x == 13) 
        {
            var valido = 1;

            if (document.getElementById("inAbono").validity.valueMissing) 
            {valido=0;}

            if (valido==1)
            {
                var abono = document.getElementById("inAbono").value;
                //alert("abono: " + abono);
                //Validar que sea numero
                if (isNaN(abono)) //Is not number
                {
                    alert("El valor debe ser numero");
                    document.getElementById("inAbono").focus;
                }
                else
                {
                    //Validar que sea mayor que 0.00
                    if (abono>0)
                    {
                        document.getElementById("tResumen").innerHTML = "";
                        var id_venta = document.getElementById("inIDTarjeta").value;
                        
                        var saldo = 0;

                        saldo = Number(document.getElementById("tSaldo").value);
                        var nvoSaldo = Number(saldo) - Number(abono); 
                    
                        if (nvoSaldo<0)
                        {
                            alert("Valor incorrecto");
                            document.getElementById("inAbono").focus();
                        }
                        else
                        {
                            var row = tResumen.insertRow(0);
                            var x = row.insertCell(0);
                            x.innerHTML = "Total";
                            x.className = "titulo";
                            
                            x = row.insertCell(1);
                            x.innerHTML = accounting.formatMoney(saldo);
                            x.className = "cantidad";

                            row = tResumen.insertRow(1);
                            var x = row.insertCell(0);
                            x.innerHTML = "Pagado";
                            x.className = "titulo";

                            x = row.insertCell(1);
                            x.innerHTML = accounting.formatMoney(abono);
                            x.className = "cantidad";

                            row = tResumen.insertRow(2);
                            var x = row.insertCell(0);
                            x.innerHTML = "Saldo";
                            x.className = "titulo";
                            
                            x = row.insertCell(1);
                            x.innerHTML = accounting.formatMoney(nvoSaldo);
                            x.className = "cantidad";

                            document.getElementById("txtAbono").value = Number(abono);
                            document.getElementById("txtNvoSaldo").value = Number(nvoSaldo);

                            //Validar si radio Button encganche es click
                            if(document.getElementById("rdEnganche").checked==true)
                            {
                                document.getElementById("txtIsEnganche").value = 1;
                            }
                            else
                            {
                                document.getElementById("txtIsEnganche").value = 0;
                            }

                            document.getElementById("inGuardar").hidden=false;
                            document.getElementById("inGuardar").focus();
                        }
                    }
                    else
                    {
                        alert("El valor debe ser mayor a 0.00");
                        document.getElementById("inAbono").focus;
                    }
                }
            }
            else
            {
                alert("Valor para ABONO es requerido");
                document.getElementById("inAbono").focus();
            }
        }
        
    }

    function guardarAbono(event)
    {
        var x = event.keyCode;
        if (x == 13) 
        {
            var txtAbono = document.getElementById("txtAbono").value;
            var txtNvoSaldo = document.getElementById("txtNvoSaldo").value;
            var txtIDVenta = document.getElementById("txtIDVenta").value;
            var txtIsEnganche = document.getElementById("txtIsEnganche").value;

            var itemAbono = {};
            itemAbono.abono = txtAbono;
            itemAbono.nuevoSaldo = txtNvoSaldo;
            itemAbono.idVenta = txtIDVenta;
            itemAbono.isEnganche = txtIsEnganche;

            var abonoJSON = JSON.stringify(itemAbono);
            //alert(abonoJSON);
            //POST JSON
        }
    }

    /*
    function saveAbono()
    {
        var txtAbono = document.getElementById("txtAbono");
        var txtNvoSaldo = document.getElementById("txtNvoSaldo");
        var txtIDVenta = document.getElementById("txtIDVenta");
        var txtIsEnganche = document.getElementById("txtIsEnganche");

        var miformulario = document.getElementById("inv_form");
            
        miformulario.submit();
    }
    */

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
                                    <li><a href="#">Nuevo</a></li>
                                    <li><a href="#">Modificar</a></li>
                                    <li><a href="#">Buscar</a></li>
                                    <li class="tr1"></li>
                                </ul>
                            </li>
                            <li class="sub-menu"><a href="#">Ventas<span></span></a>
                                <ul class="submenu">
                                    <li><a href="#">Ventas</a></li>
                                    <li><a href="#">Abonos</a></li>
                                    <li class="tr1"></li>
                                </ul>
                            </li>
                            <li class="sub-menu"><a href="#">Reportes<span></span></a>
                                <ul class="submenu">
                                    <li><a href="#">Rutas</a></li>
                                    <li><a href="#">Saldos menores</a></li>
                                    <li class="tr1"></li>
                                </ul>
                            </li>
                            <li class="sub-menu"><a href="#">Notificaciones<span></span></a>
                                <ul class="submenu">
                                    <li><a href="notificacion_sms.jsp">Mensaje SMS</a></li>
                                    <li><a href="notificacion.jsp">Correo electronico</a></li>
                                    <li class="tr1"></li>
                                </ul>
                            </li>
                            <li><a href="#">Salir</a></li>
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
                    <h2 id="txtSaldo"></h2>

                    <input name="inGuardar" id="inGuardar" type="text" onkeypress="guardarAbono(event)" hidden/>
                          
                </article>
                <article class="col-lg-8 col-md-8 col-sm-8 contactBox2">

                    <p></p>
                    <p></p>
                    <h2>ID Venta/Tarjeta</h2>
                    <input type="text" name="inIDTarjeta" id="inIDTarjeta" onkeypress="abonarCuenta(event)" required/>ID:

                    <table id="tTarjetas">
                    </table>              
                    
                    <p></p>

                     <table id="tMotor" hidden>

                        <tr>
                            <th class="header_des">Descripcion</th>
                            <th class="header_can">Cantidad</th>
                            <th class="header_imp">Importe</th>
                        </tr>
                         
                    </table>

                    <table id="tPartidas">
                    </table>

                    <p></p>
                    <p></p>

                    
                    
                    <p></p>
                    <!-- <h3>Registrar abono</h3> -->
                    <p></p>
                    
                    <input name="inAbono" id="inAbono" type="text" onkeypress="calcular_resumen(event)" required hidden/><a id="l1" hidden>Registrar abono</a><br/>
                    <input name="rdEnganche" id="rdEnganche" type="radio" value="male" hidden> <a id="l2" hidden>Enganche </a><br>

                    
                    <a id="l1" hidden>Registrar abono</a><br/>

                    <p></p>
                    <p></p>
                    <p></p>
                    <!-- <a class="btn-default btn6" onclick="calc_resumen()">Abonar</a> -->
                    <a class="btn-default btn6" onclick="getAbonos()">Ver abonos</a>

                    <table id="tResumen" hidden>
                    </table>
                    <p></p>
                    <h3 id="hAbonos" hidden>Abonos</h3>
                    <p></p>

                    <table id="tAbonos_titulos" hidden>
                         <tr>
                            <th class="header_fecha">Fecha</th>
                            <th class="header_cantidad">Cantidad</th>
                            <th class="header_saldo">Saldo</th>
                            <th class="header_enganche">Enganche</th>
                        </tr>
                    </table>

                    <table id="tAbonos" hidden>
                    </table>

                    <form id="inv_form" action="saveAbono.jsp">
    
                        <input name="txtTotal" id="txtTotal" hidden/>
                        
                        <input name="tSaldo" id="tSaldo"hidden/>
                        <input name="txtAbono" id="txtAbono"/>
                        <input name="txtNvoPagado" id="txtNvoPagado" hidden/>
                        <input name="txtNvoSaldo" id="txtNvoSaldo"/>
                        <input name="txtIDVenta" id="txtIDVenta"/>
                        <input name="txtIsEnganche" id="txtIsEnganche"/>

                        <div class="btns">
                             <a data-type="submit" class="btn-default btn5" href="index.jsp">Regresar</a>
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
