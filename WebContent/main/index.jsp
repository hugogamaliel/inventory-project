<!DOCTYPE html>
<html lang="en">

<head>
<title>Inventario de Alexis</title>
<meta charset="utf-8">    
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="description" content="Your description">
<meta name="keywords" content="Your keywords">
<meta name="author" content="Your name">
<meta name = "format-detection" content = "telephone=no" />
<!--CSS-->
<link rel="stylesheet" href="css/bootstrap.css" >
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/camera.css">
<!--JS-->
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/superfish.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.mobilemenu.js"></script>
<script src="js/jquery.ui.totop.js"></script>
<script src="js/jquery.equalheights.js"></script>
<script src="js/camera.js"></script>
<script src="js/jquery.mobile.customized.min.js"></script>
<script>
    $(document).ready(function(){
        jQuery('.camera_wrap').camera();
    });
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
<article class="slider">
    <div class="camera_wrap">
        <div data-src="img/picture1.jpg"><div class="camera-caption fadeIn"><p class="title1">Ventas</p><p class="description"></p><a href="#" class="btn-default btn1">Entrar</a></div></div>
        <div data-src="img/picture3.jpg"><div class="camera-caption fadeIn"><p class="title1">Clientes</p><p class="description"></p><a href="#" class="btn-default btn1">Entrar</a></div></div>
        <div data-src="img/picture1.jpg"><div class="camera-caption fadeIn"><p class="title1">Reportes</p><p class="description"></p><a href="#" class="btn-default btn1">Entrar</a></div></div>
    </div>
</article>
<div class="global">
    <div class="container">
        <div class="row">
            <div class="clearfix"></div>
                
                <article class="col-lg-4 col-md-12 col-sm-12 clientsBox">
                    <h2>Tareas rapidas</h2>
                    <ul class="list2">
                        <li>
                            <figure><img src="img/home_icon1.png" alt=""></figure>
                            <div class="extra-wrap">
                                <a href="#">Ventas</a>
                                <p class="description">Registrar nueva venta</p>
                                <p>Registrar nueva venta e imprimir tarjeta</p>
                            </div>
                        </li>
                        <li>
                            <figure><img src="img/home_icon1.png" alt=""></figure>
                            <div class="extra-wrap">
                                <a href="#">Clientes</a>
                                <p class="description">Registrar nuevo cliente</p>
                                <p>Dar de alta un nuevo cliente y registrar una venta rapidamente</p>
                            </div>
                        </li>
                        <li>
                            <figure><img src="img/home_icon1.png" alt=""></figure>
                            <div class="extra-wrap">
                                <a href="#">Reporte</a>
                                <p class="description">Imprimir reportes</p>
                                <p>Imprimir reportes</p>
                            </div>
                        </li>
                    </ul>
                </article>
        </div>
    </div>

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
