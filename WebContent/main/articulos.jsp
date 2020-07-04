<!DOCTYPE html>
<html lang="en">

<head>

<title>Articulos</title>
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

<style>

	 #inIDCliente {
        
        border-radius: 5px;
        margin: 5px;
        width: 90px;
        border: none;
        background: #ffffff;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 18px;
        color: #bab9b9;
        padding: 10px 14px 10px 14px;
        height: 39px;
       
    }

    #txtIDVenta {
        
        border-radius: 5px;
        margin: 5px;
        width: 90px;
        border: none;
        background: #ffffff;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 18px;
        color: #bab9b9;
        padding: 10px 14px 10px 14px;
        height: 39px;
       
    }

    #tRowsForm th, td 
    {
        color: white;
        font-size: 18px;
        
    }
	

    #tPartidas 
    {
        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
        border: none;
        border-collapse: separate;
        border-spacing: 10px 0.5rem;
    }

    #tPartidas .descripcion {
        
       	border-radius: 5px;
        outline: none;
        border: none;
        background: #ffffff;
        margin: 30px;
        width: 1000px;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 18px;
        color: #bab9b9;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
    
    }

   	#tPartidas .cantidad 
   	{   
       	border-radius: 5px;
        margin: 10px;
        width: 250px;
        outline: none;
        border: none;
        background: #ffffff;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 18px;
        color: #bab9b9;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
       
    }

    #tPartidas .precio
    {
    	border-radius: 5px;
        margin: 10px;
        width: 130px;
        outline: none;
        border: none;
        background: #ffffff;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 18px;
        color: #bab9b9;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
        text-align: right;
    }

    #tPartidas .importe
    {
    	border-radius: 5px;
        margin: 10px;
        width: 130px;
        outline: none;
        border: none;
        background: #ffffff;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 18px;
        color: #bab9b9;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
        text-align: right;
    }

    #tPartidas .idArt
    {
    	border-radius: 5px;
        margin: 10px;
        width: 10px;
        outline: none;
        border: none;
        background: #ffffff;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 18px;
        color: #bab9b9;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
        text-align: right;
    }

    #tMotor 
    {
        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
       
       	/*
       	border-collapse: separate;
        border-spacing: 5px 1rem;
        */
    }

    #tMotor .header
    {
        text-align: center;
        color: white;
        font-weight: bold;
        font-size: 18px;
    }

    #tMotor .myId {
        
        border-radius: 5px;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        float: left;
        margin: 5px;
        width: 90px;
        outline: none;
        border: none;
        background: #ffffff;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 18px;
        color: #bab9b9;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
    }

    #tMotor .cantidad {
        
        border-radius: 5px;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        float: right;
        text-align: right;
        margin: 5px;
        width: 105px;
        outline: none;
        border: none;
        background: #ffffff;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 18px;
        color: #bab9b9;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
    }

    #tMotor .sel {
        
        border-radius: 5px;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        float: left;
        margin: 5px;
        width: 330px;
        outline: none;
        border: none;
        background: #ffffff;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 18px;
        color: #bab9b9;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
    }

   	#tVendedor 
    {
        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
       	/*
       	border-collapse: separate;
        border-spacing: 5px 1rem;
        */
    }

    #tVendedor .header
    {
        text-align: center;
        color: white;
        font-weight: bold;
        font-size: 18px;
    }

    #tVendedor .sel {
        
        border-radius: 5px;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        float: left;
        margin: 10px;
        width: 350px;
        outline: none;
        border: none;
        background: #ffffff;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 18px;
        color: #bab9b9;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
    }

    #tTotal 
    {
        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
        border-collapse: separate;
        border-spacing: 10px;
    }

    #tTotal .descripcion {
        
       	border-radius: 5px;
        outline: none;
        border: none;
        background: none;
        
        width: 287px;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 14px;
        color: #bab9b9;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
    
    }

   	#tTotal .cantidad 
   	{   
       	border-radius: 5px;
        
        width: 130px;
        outline: none;
        border: none;
        background: none;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 14px;
        color: #bab9b9;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
       
    }

    #tTotal .precio
    {
    	border-radius: 5px;
        
        width: 105px;
        outline: none;
        border: none;
        background: black;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 14px;
        color: white;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
        text-align: center;
    }

    #tTotal .importe
    {
    	border-radius: 5px;
       
        width: 105px;
        outline: none;
        border: none;
        background: black;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 14px;
        color: white;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
        text-align: right;
    }
</style>

<script>

    function selChangeArticulos()
    {
        var action = document.getElementById("txtAction"). value;

        var posc = $("#selArticulos")[0].selectedIndex;
            
        document.getElementById("selArticulos").selectedIndex = posc;
        document.getElementById("selPrecios").selectedIndex = posc;
        document.getElementById("selIDArticulo").selectedIndex = posc;
            
        var x = document.getElementById("selPrecios").selectedIndex;
        var y = document.getElementById("selPrecios").options;

        x = document.getElementById("selIDArticulo").selectedIndex;
        y = document.getElementById("selIDArticulo").options;
        
        document.getElementById("inPrecio").value = accounting.formatMoney(document.getElementById("selPrecios").value);

        document.getElementById("txtIDArticulo").value = (y[x].text);
        //alert(action);
        if (action==2)
        { 
            document.getElementById("inDescripcion").hidden = false;
            document.getElementById("inPrecio").hidden = false;

            document.getElementById("inDescripcion").focus();

            document.getElementById("inDescripcion").value = document.getElementById("selArticulos").value;            
        }

        if (action==3)
        {
            document.getElementById("btnGuardar").hidden = false;
        }

    }
    
    function guardarArticulos()
    {
        var txtAction = document.getElementById("txtAction").value;
        var miformulario = document.getElementById("form_articulos");

        if (txtAction==1 || txtAction==2)
        {
           var valido = 1;

            if (document.getElementById("inPrecio").validity.valueMissing) 
            {valido=0;}

            var txtDescripcion = document.getElementById("txtDescripcion").value;
            var txtPrecio = document.getElementById("txtPrecio").value;
            var txtIDArticulo = document.getElementById("txtIDArticulo").value;
            
            var precio = document.getElementById("inPrecio").value;
           
            if (valido==1)
            {
                if (isNaN(precio)) //Is not a number
                {
                    alert("El valor debe ser numero");
                    document.getElementById("inPrecio").focus;
                }
                else
                {
                    if (precio>0)
                    {miformulario.submit();}
                    else
                    {
                        alert("El valor debe ser mayor a 0.00");
                        document.getElementById("inPrecio").focus;
                    }
                }
            }
            else
            {
                alert("El valor para Precio es requerido");
                document.getElementById("inPrecio").focus;
            } 
        }

        if (txtAction==3)
        {
            var txtDescripcion = document.getElementById("txtDescripcion").value;
            var txtPrecio = document.getElementById("txtPrecio").value;
            var txtIDArticulo = document.getElementById("txtIDArticulo").value;

            miformulario.submit();
        }

    }

    function addArticulo()
    {
        document.getElementById("txtAction").value = 1; 

        document.getElementById("selArticulos").hidden = true;

        document.getElementById("inDescripcion").hidden = false;
        document.getElementById("inPrecio").hidden = false;

        document.getElementById("inDescripcion").value = "";
        document.getElementById("inPrecio").value = "";

        document.getElementById("inDescripcion").focus();
        
    }

    function modArticulo()
    {
        document.getElementById("txtAction").value = 2;
        getArticulos();
    }

    function delArticulo()
    {
        document.getElementById("txtAction").value = 3;

        document.getElementById("inDescripcion").hidden = true;
        document.getElementById("inPrecio").hidden = true;

        getArticulos();   
    }

    function getArticulos()
    {
        //Llener sel de descripciones de articulos
        document.getElementById("selArticulos").hidden = false;
        
        $.ajax(
        {
            type: "GET",  
            url: "http://54.144.154.41:8180/inventariojeans/rest/services/articulos",
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
                    
                document.getElementById("tMotor").hidden=false;
                document.getElementById("selArticulos").disabled=false;
                document.getElementById("selArticulos").focus();

            },
            error: function(e)
            {  
                alert('Error al recuperar articulos: ' + e);   
            } 

        });
    }

    function pressDesc(event)
    {
        var x = event.keyCode;
        if(x == 13)
        {
            var valido = 1;

            if (document.getElementById("inDescripcion").validity.valueMissing) 
            {valido=0;}

            if (valido==1)
            {document.getElementById("inPrecio").focus();}
            else
            {
                alert("El valor para Descripcion es requerido");
                document.getElementById("inDescripcion").focus;
            }
        }
    }

    function pressPre(event)
    {
        var x = event.keyCode;
        if(x == 13)
        {
            document.getElementById("txtDescripcion").value = document.getElementById("inDescripcion").value;
            document.getElementById("txtPrecio").value = accounting.unformat(document.getElementById("inPrecio").value);

            guardarArticulos();
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
                          
                </article>
                <article class="col-lg-8 col-md-8 col-sm-8 contactBox2">
                    <h3>Articulos</h3>

                    <a data-type="submit" class="btn-default btn6" onclick="addArticulo()">Nuevo</a> <a> &nbsp</a>
                    <a data-type="submit" class="btn-default btn6" onclick="modArticulo()">Modificar</a> <a> &nbsp</a>
                    <a data-type="submit" class="btn-default btn6" onclick="delArticulo()">Eliminar</a>

                    <p></p>

                    <table id="tMotor">

                        <tr>
                            <th><select id="selArticulos" class="sel" onclick="" onchange="selChangeArticulos()" placeholder="Descripcion" onkeypress="pressArt(event)" hidden></select></th>
                        </tr>
                        <tr>
                            <th><input name="inDescripcion" id="inDescripcion" class="sel" type="text" placeholder="Descripcion" onkeypress="pressDesc(event)" hidden required/></th>
                            <th><input name="inPrecio" id="inPrecio" class="cantidad" type="text" placeholder="0.00" onkeypress="pressPre(event)" hidden required/></th>
                        </tr>
                    </table>
                    
                    <select id="selPrecios" class="sel" onclick="" onchange="" placeholder="" hidden></select>
                    <select id="selIDArticulo" class="sel" onclick="" onchange="" placeholder="" hidden></select>

                    <form id="form_articulos" action="saveArticulos.jsp">

                        <input name="txtDescripcion" id="txtDescripcion" hidden/>
                        <input name="txtPrecio" id="txtPrecio" hidden/>
                        <input name="txtAction" id="txtAction" hidden/>
                        <input name="txtIDArticulo" id="txtIDArticulo" hidden/>
                        
                        <div id="btnGuardar" class="btns" hidden>
                            <a data-type="submit" class="btn-default btn5" onclick="guardarArticulos()">Guardar</a>
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
