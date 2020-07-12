<!DOCTYPE html>
<html lang="en">

<head>
<title>Reporte de ruta</title>
<meta charset="utf-8">    
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="description" content="Your description">
<meta name="keywords" content="Your keywords">
<meta name="author" content="Your name">
<meta name = "format-detection" content = "telephone=no" />
<!--CSS-->
<link rel="stylesheet" href="css/bootstrap.css" >
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/reporte-ruta.css">
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

<script src="/js/pdfobject.js"></script>

<script>

    window.onload = function() 
    {
        //Cargar rutas
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
                    el.className = "rutaDesc";
                    //x.className = "descripcion";
                            
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

        //document.getElementById("txtNombre").focus();
    }

    function selChangeRuta()
    {
        
        var posc = $("#selRutas")[0].selectedIndex;
            
        document.getElementById("selIdRuta").selectedIndex = posc;

        var id_ruta = document.getElementById("selIdRuta").value;
    }

    //2020-07-11
    function verTarjeta()
    {   
        var id_ruta = document.getElementById("selIdRuta").value;

        var parent = $('embed#pdf_file').parent();
       
        var newElement = "<embed src='http://localhost/pdf/reporte_ruta_" + id_ruta +".pdf' id='pdf_file' type='application/pdf' height='570px' width='100%'>";

        $('embed#pdf_file').remove();
        parent.append(newElement);

    }

    function generateReporte()
    {
        var id_ruta = document.getElementById("selIdRuta").value;
        alert("Generando reporte de ruta " + id_ruta);

        $.ajax(
        {
            type: "GET",  
            url: "http://localhost:8080/inventariojeans/rest/services/reporte_ruta/id_ruta=" + id_ruta,
            dataType: "json",  
            success: function(data)
            {
                var response = data.reporte_ruta;

                if(reponse=="1")
                {
                    alert()
                }
                else
                {

                }
                alert("response: " + response);
            },
            error: function(e)
            {  
                alert('Error generado reporte: ' + e);   
            } 
        });

        //Do events 5 segundos

        //Mostrar el reporte
        
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
                                    <li><a href="reporte_ruta.jsp">Rutas</a></li>
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
                    <h3></h3>
                    
                    <h2 id="txtId"></h2>
                    <h2 id="txtNombre"></h2>
                    <h2 id="txtDireccion"></h2>
                    <h2 id="txtColonia"></h2>
                    <h2 id="txtTelefono"></h2>
                    <h2 id="txtLugar"></h2>
                    <h2 id="txtSaldo"></h2> 
                    <!--
                    <input name="inGuardar" id="inGuardar" type="text" onkeypress="guardarAbono(event)" hidden/>
                    -->

                </article>
                <article class="col-lg-8 col-md-8 col-sm-8 contactBox2">

                    <p></p>
                    <p></p>
                    <h2>Ruta</h2>
                    <select id="selRutas" onclick="" onchange="selChangeRuta()" placeholder="Ruta" onkeypress=""></select>
                    <select id="selIdRuta" hidden></select>
                    <p></p>
                    <!--
                    <div class="btns">
                             <a class="btn-default btn5">Generar reporte</a>
                        </div>
                    
                    -->
                    <a class="btn-default btn6" onclick="verTarjeta()">Abrir</a>
                    <a class="btn-default btn6" onclick="generateReporte()">Actualizar</a>
                    <p></p>
                    <!--
                    <embed id="pdf_file" src="" type="application/pdf" height="600px" width="100%">
                    -->
                    <embed id="pdf_file" src="" type="application/pdf" height="800px" width="1000px">

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
