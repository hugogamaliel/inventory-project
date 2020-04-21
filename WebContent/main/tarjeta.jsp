<!DOCTYPE html>
<html lang="en">

<head>
<title>Tarjetas</title>
<meta charset="utf-8">    
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="description" content="Your description">
<meta name="keywords" content="Your keywords">
<meta name="author" content="Your name">
<meta name = "format-detection" content = "telephone=no" />
<!--CSS-->
<link rel="stylesheet" href="css/bootstrap.css" >
<link rel="stylesheet" href="css/style.css">
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
<script type="text/javascript" src="js/tarjetas-autocomplete.js"></script>

<script src="/js/pdfobject.js"></script>

<style>

    #tRowsForm th, td 
    {
        color: white;
        font-size: 18px;
        
    }
	
    #tTarjetas 
    {
        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
        border: none;
        border-collapse: separate;
        border-spacing: 10px 0.5rem;
    }

    #tTarjetas .id_cliente {
        
       	border-radius: 5px;
        outline: none;
        border: none;
        background: #ffffff;
        margin: 30px;
        width: 180px;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 18px;
        color: black;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
        text-align: left;
    
    }

   	#tTarjetas .fecha {
        
        border-radius: 5px;
        outline: none;
        border: none;
        background: #ffffff;
        margin: 30px;
        width: 200px;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 18px;
        color: black;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
        text-align: center;
    
    }

    #tTarjetas .total
    {
    	border-radius: 5px;
        margin: 10px;
        width: 130px;
        outline: none;
        border: none;
        background: #ffffff;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 18px;
        color: black;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
        text-align: right;
    }

    #tTarjetas .id_venta {
        
        border-radius: 5px;
        outline: none;
        border: none;
        background: #ffffff;
        margin: 30px;
        width: 180px;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 18px;
        color: black;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
        text-align: left;
    }

    #tTarjetas .vendedor {
        
        border-radius: 5px;
        outline: none;
        border: none;
        background: #ffffff;
        margin: 30px;
        width: 250px;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 18px;
        color: black;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
        text-align: left;
    
    }

</style>

<script>

    window.onload = function() 
    {
        document.getElementById("autocomplete").focus();
    };
    
function verPDF(id_venta)
    {

        var parent = $('embed#pdf_file').parent();
       
        var newElement = "<embed src='http://localhost/tarjeta_" + id_venta +".pdf' id='pdf_file' type='application/pdf' height='570px' width='100%'>";

        $('embed#pdf_file').remove();
        parent.append(newElement);
        
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
                    <h2 id="txtLugar"></h2>
                          
                </article>
                <article class="col-lg-8 col-md-8 col-sm-8 contactBox2">
                    <h3>Tarjeta por cliente</h3>
                    
                    <div id="searchfield">
                        <form>
                            <input type="text" name="currency" class="biginput" id="autocomplete">
                        </form>
                    </div>      
                    
                    <table id="tTarjetas">
                    </table>              
					
					<p></p>
                   
                    <embed id="pdf_file" src="" type="application/pdf" height="600px" width="100%">

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
