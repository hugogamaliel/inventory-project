<!DOCTYPE html>
<html lang="en">

<head>
<title>Nuevo cliente</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="description" content="Your description">
<meta name="keywords" content="Your keywords">
<meta name="author" content="Your name">
<meta name = "format-detection" content = "telephone=no" />
<!--CSS-->
<link rel="stylesheet" href="css/bootstrap.css" >
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/nuevo-cliente.css">
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
        $.ajax(
        {
            type: "GET",  
            url: "http://localhost:8080/inventariojeans/rest/services/max_cliente",
            dataType: "json",  
            success: function(data)
            {     
                var max_cliente = data.max_cliente;
                document.getElementById("myId").value = max_cliente;
            },  
            error: function(e)
            {  
                alert('Error Pedidos: ' + e);
            }  
        });

        //Llenar rutas 
        $.ajax(
        {
            type: "GET",  
            url: "http://localhost:8080/inventariojeans/rest/services/rutas",
            dataType: "json",  
            success: function(data)
            {
                var sizeRutas = Object.keys(data.rutas).length;
                var el = document.getElementById('selRutas'); //Get the select element
                var selId = document.getElementById('selIdRuta'); //Get the select element
                            
                //insertar una categoria antes que las de la BD
                var opt = document.createElement('option'); //Create option element
                opt.innerHTML = " "; //Add a value to the option    
                el.appendChild(opt); //Add the option to the select element
                        
                var opt1 = document.createElement('option');
                opt1.innerHTML = "0"; 
                selId.appendChild(opt1);
                        
                for (i=0; i<sizeRutas; i++)
                {
                    var opt = document.createElement('option'); //Create option element
                    opt.innerHTML = data.rutas[i].descripcion; //Add a value to the option 
                    el.appendChild(opt); //Add the option to the select element        
                            
                    var opt1 = document.createElement('option');
                    opt1.innerHTML = data.rutas[i].id_ruta; 
                    selId.appendChild(opt1);           
                }
                        
            },
            error: function(e)
            {  
                alert('Error al recuperar rutas: ' + e);   
            } 
        });

        document.getElementById("txtNombre").focus();
    }

    function saveCliente()
    {
        var valido = 1;

        if (document.getElementById("txtNombre").validity.valueMissing) 
        {valido=0;}
        
        if (document.getElementById("txtDireccion").validity.valueMissing) 
        {valido=0;}

        if (document.getElementById("txtColonia").validity.valueMissing) 
        {valido=0;}

        if (document.getElementById("txtCelular").validity.valueMissing) 
        {valido=0;}

        if (document.getElementById("txtLugar").validity.valueMissing) 
        {valido=0;}

        if (document.getElementById("txtIdRuta").validity.valueMissing) 
        {valido=0;}

        
        if (valido==1)
        {

            //alert(JSON.stringify({"id": $('#myId').val(), "nombre": $('#txtNombre').val(), "direccion": $('#txtDireccion').val(), "colonia": $('#txtColonia').val(), "celular": $('#txtCelular').val(), "lugar": $('#txtLugar').val(), "ruta": $('#txtIdRuta').val(), "referencias": $('#txtReferencias').val()}));
            
            //POST
            $.ajax(
            {
                type: "POST",
                url: "http://localhost:8080/inventariojeans/rest/postservices/post-cliente",
                data: JSON.stringify({"id": $('#myId').val(), "nombre": $('#txtNombre').val(), "direccion": $('#txtDireccion').val(), "colonia": $('#txtColonia').val(), "celular": $('#txtCelular').val(), "lugar": $('#txtLugar').val(), "ruta": $('#txtIdRuta').val(), "referencias": $('#txtReferencias').val()}),
                headers: 
                {
                    "Content-Type": "application/json"
                },
                success: function(data) 
                {//alert("Ok!");
                    window.location.replace("nuevoClienteJSON.jsp");
                },
                error : function(e)
                {
                    alert("Error");
                }
            });   
        }
        else
        {
            alert("Faltan valores requeridos");
        }
    }

    function selChangeRutas()
    {
        //Determinar cuál ruta se eligió
        //Posicionar el idRuta
        var posc = $("#selRutas")[0].selectedIndex;
            
        document.getElementById("selIdRuta").selectedIndex = posc;
        document.getElementById("txtIdRuta").value = document.getElementById("selIdRuta").selectedIndex;
            
        var x = document.getElementById("selIdCat").selectedIndex;
        var y = document.getElementById("selIdCat").options;
    }

    function pressNom(event)
    {
        var x = event.keyCode;
        if (x == 13) 
        {
            document.getElementById("txtDireccion").focus();
        }
    }

    function pressDir(event)
    {
        var x = event.keyCode;
        if (x == 13) 
        {
            document.getElementById("txtColonia").focus();
        }
    }

    function pressCol(event)
    {
        var x = event.keyCode;
        if (x == 13) 
        {
            document.getElementById("txtCelular").focus();
        }
    }

    function pressCel(event)
    {
        var x = event.keyCode;
        if (x == 13) 
        {
            document.getElementById("txtLugar").focus();
        }
    }

    function pressLug(event)
    {
        var x = event.keyCode;
        if (x == 13) 
        {
            document.getElementById("selRutas").focus();
        }
    }


    function pressRut(event)
    {
        var x = event.keyCode;
        if (x == 13) 
        {
            document.getElementById("txtReferencias").focus();
        }
    }

    function pressRef(event)
    {
        var x = event.keyCode;
        if (x == 13) 
        {
            saveCliente();
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
                                    <li><a href="modificar_ventaJSON.jsp">Ventas</a></li>
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
                    <h3>Nuevo cliente</h3>
                  
                    <form id="nuevo-cliente" action="saveCliente.jsp">
                        
                        <input name="myId" id="myId" type="text" disabled/><br/>
                        <p></p>
                    	<input name="txtNombre" id="txtNombre" type="text" placeholder="Nombre:" onkeypress="pressNom(event)" required/><br/>
                    	<p></p>
                    	<input name="txtDireccion" id="txtDireccion" type="text" placeholder="Direccion:" onkeypress="pressDir(event)" required/>
                    	<p></p>
                    	<input name="txtColonia" id="txtColonia" type="text" placeholder="Colonia:" onkeypress="pressCol(event)" required/><br/>
                    	 <p></p>
                    	 <input name="txtCelular" id="txtCelular" type="text" placeholder="Celular:" onkeypress="pressCel(event)" required/>
                    	 <p></p>
                    	 <input name="txtLugar" id="txtLugar" type="text" placeholder="Lugar:" onkeypress="pressLug(event)" required/>
                    	 <p></p>
                         <select id="selRutas" onchange="selChangeRutas()" onkeypress="pressRut(event)"></select>
                         <select id="selIdRuta" nombre="selIdRuta" onclick="" onchange="" hidden></select>
                         <p></p>
                         <input name="txtIdRuta" id="txtIdRuta" type="text" placeholder="txtIdRuta" required hidden/>
                         <p></p>
                         <input name="txtReferencias" id="txtReferencias" type="text" placeholder="Referencias" onkeypress="pressRef(event)" required/>
                         <p></p>
                        <!--
                        <div class="btns">
                            <p></p>
                            <a href="#" data-type="submit" class="btn-default btn1" onclick="saveCliente()">Guardar</a>
                            <p></p>
                        </div> 
                        -->
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
