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
<script type="text/javascript" src="js/abonos-autocomplete3.js"></script>
<!--
<script type="text/javascript" src="js/jquery.autocomplete.min.js"></script>
<script type="text/javascript" src="js/venta-autocomplete.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.3.js"></script>
-->
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

    #inAbono {
        
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
        width: 400px;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 18px;
        color: #bab9b9;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
    
    }

    #tPartidas .descripcion_black {
        
        border-radius: 5px;
        outline: none;
        border: none;
        background: 393838;
        margin: 30px;
        width: 400px;
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
        width: 80px;
        outline: none;
        border: none;
        background: #ffffff;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 18px;
        color: #bab9b9;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
        text-align: center;
    }

    #tPartidas .cantidad_black
    {   
        border-radius: 5px;
        margin: 10px;
        width: 80px;
        outline: none;
        border: none;
        background: 393838;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 18px;
        color: white;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
        text-align: center;
    }

    #tPartidas .importe
    {
    	border-radius: 5px;
        margin: 10px;
        width: 100px;
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

    #tPartidas .importe_black
    {
        border-radius: 5px;
        margin: 10px;
        width: 100px;
        outline: none;
        border: none;
        background: #686262;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 18px;
        color: white;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
        text-align: right;
    }

    #tAbonos_titulos 
    {
        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    }

    #tAbonos_titulos .header_fecha
    {
        text-align: center;
        color: white;
        font-weight: bold;
        font-size: 18px;
        width: 165px;
    }

    #tAbonos_titulos .header_cantidad
    {
        text-align: center;
        color: white;
        font-weight: bold;
        font-size: 18px;
        width: 120px;
    }

    #tAbonos_titulos .header_saldo
    {
        text-align: center;
        color: white;
        font-weight: bold;
        font-size: 18px;
        width: 100px;
    }

    #tAbonos_titulos .header_enganche
    {
        text-align: center;
        color: white;
        font-weight: bold;
        font-size: 18px;
        width: 50px;
    }
   
    #l1
    {
        text-align: center;
        color: white;
        font-size: 16px;
        width: 165px;
    }

    #l2
    {
        text-align: center;
        color: white;
        font-size: 16px;
        width: 165px;
    }

    #tAbonos
    {
        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
        border: none;
        border-collapse: separate;
        border-spacing: 10px 0.5rem;
    }

    #tAbonos .fecha {
        
        border-radius: 5px;
        outline: none;
        border: none;
        background: #ffffff;
        margin: 30px;
        width: 150px;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 18px;
        color: #bab9b9;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
    
    }

    #tAbonos .cantidad {
        
        border-radius: 5px;
        outline: none;
        border: none;
        background: #ffffff;
        margin: 30px;
        width: 100px;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 18px;
        color: #bab9b9;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
        text-align: right;
    
    }

    #tAbonos .saldo {
        
        border-radius: 5px;
        outline: none;
        border: none;
        background: #ffffff;
        margin: 30px;
        width: 100px;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 18px;
        color: #bab9b9;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
        text-align: right;
    
    }

     #tAbonos .enganche {
        
        border-radius: 5px;
        outline: none;
        border: none;
        background: #ffffff;
        margin: 30px;
        width: 70px;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 18px;
        color: #bab9b9;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
    
    }
    #tMotor 
    {
        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    }

    #tMotor .header_des
    {
        text-align: center;
        color: white;
        font-weight: bold;
        font-size: 18px;
        width: 410px;
    }

    #tMotor .header_can
    {
        text-align: center;
        color: white;
        font-weight: bold;
        font-size: 18px;
        width: 100px;
    }

    #tMotor .header_imp
    {
        text-align: center;
        color: white;
        font-weight: bold;
        font-size: 18px;
        width: 100px;
    }

    #tResumen
    {
        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
        border: none;
        border-collapse: separate;
        border-spacing: 10px 0.5rem;
    }

    #tResumen .titulo
    {   
        border-radius: 5px;
        margin: 10px;
        width: 80px;
        outline: none;
        border: none;
        background: black;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 18px;
        color: white;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
        text-align: center;
    }

    #tResumen .cantidad
    {   
        border-radius: 5px;
        margin: 10px;
        width: 120px;
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


    #tTarjetas 
    {
        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
        border: none;
        border-collapse: separate;
        border-spacing: 10px 0.5rem;
    }

    #tTarjetas .titulo {
        
        border-radius: 5px;
        outline: none;
        border: none;
        margin: 30px;
        width: 180px;
        font: 16px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 18px;
        color: #bab9b9;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
        text-align: left;
    
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
        color: #bab9b9;
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
        color: #bab9b9;
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
        color: #bab9b9;
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
        color: #bab9b9;
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
        color: #bab9b9;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
        text-align: left;
    
    }

	#tTarjetas .boton {
        
        border-radius: 5px;
        outline: none;
        border: none;
        margin: 30px;
        width: 250px;
        font: 18px 'Arial', "Helvetica Neue", Helvetica, sans-serif;
        line-height: 18px;
        color: #bab9b9;
        padding: 10px 14px 10px 14px;
        height: 39px;
        resize: none;
        text-align: left;
    
    }
</style>


<script>

    

    //function cargarAbonos(event)

    function abonarCuenta(id_venta)
    {
       
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
            url: "http://54.144.154.41:8180/inventariojeans/rest/services/ventas_detalle_actual/id_venta=" + id_venta,
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


                
                document.getElementById("tAbonos").hidden=false;
                document.getElementById("hAbonos").hidden=false;
                document.getElementById("inAbono").hidden=false;
                document.getElementById("rdEnganche").hidden=false;
                document.getElementById("l1").hidden=false;
                document.getElementById("l2").hidden=false;
                document.getElementById("tResumen").hidden=false;
                       
            },
            error: function(e)
            {  
                alert('Error al recuperar articulos: ' + e);   
            } 
        });


        //Obtener abonos
        $.ajax(
                {
                    type: "GET",  
                    url: "http://54.144.154.41:8180/inventariojeans/rest/services/abonos/id_venta=" + id_venta,
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

                            //var row = tAbonos.insertRow(i);
                            x = row.insertCell(1);
                            x.innerHTML = data.abonos[i].cantidad;
                            x.className = "cantidad";

                            //var row = tAbonos.insertRow(i);
                            x = row.insertCell(2);
                            x.innerHTML = data.abonos[i].saldo;
                            x.className = "saldo";

                            //row = tAbonos.insertRow(i);
                            x = row.insertCell(3);
                            x.innerHTML = data.abonos[i].enganche;
                            x.className = "enganche";

                            totalPagado = totalPagado + Number(data.abonos[i].cantidad);
                            document.getElementById("txtPagado").value = totalPagado;
                        }

                        
                    },
                    error: function(e)
                    {  
                        alert('Error al recuperar abonos: ' + e);   
                    } 
                });

        

    }


    function calcular_resumen()
    {
        var valido = 1;

        if (document.getElementById("inAbono").validity.valueMissing) 
        {valido=0;}

        if (valido==1)
        {
            var abono = document.getElementById("inAbono").value;
            var nvoPagado = Number(abono) + Number(document.getElementById("txtPagado").value);
            var total = document.getElementById("txtTotal").value

            var nvoSaldo = Number(total) - Number(nvoPagado); 

            var row = tResumen.insertRow(0);
            var x = row.insertCell(0);
            x.innerHTML = "Total";
            x.className = "titulo";
            
            x = row.insertCell(1);
            x.innerHTML = accounting.formatMoney(total);
            x.className = "cantidad";

            row = tResumen.insertRow(1);
            var x = row.insertCell(0);
            x.innerHTML = "Pagado";
            x.className = "titulo";

            x = row.insertCell(1);
            x.innerHTML = accounting.formatMoney(nvoPagado);
            x.className = "cantidad";

            row = tResumen.insertRow(2);
            var x = row.insertCell(0);
            x.innerHTML = "Saldo";
            x.className = "titulo";
            
            x = row.insertCell(1);
            x.innerHTML = accounting.formatMoney(nvoSaldo);
            x.className = "cantidad";

            document.getElementById("txtNvoPagado").value = nvoPagado;
            document.getElementById("txtNvoSaldo").value = nvoSaldo;
            document.getElementById("txtAbono").value = abono;    
            
            //Validar si radio Button encganche es click
            if(document.getElementById("rdEnganche").checked==true)
            {
                document.getElementById("txtIsEnganche").value = 1;
            }
            else
            {
                document.getElementById("txtIsEnganche").value = 0;
            }

        }
        else
        {
            alert("Valor para ABONO es requerido");
            document.getElementById("inAbono").focus();
        }

        
    }

    function guardarAbono()
    {

        var txtAbono = document.getElementById("txtAbono");
        var txtNvoSaldo = document.getElementById("txtNvoSaldo");
        var txtIDVenta = document.getElementById("txtIDVenta");
        var txtIsEnganche = document.getElementById("txtIsEnganche");

        var miformulario = document.getElementById("inv_form");
        
        miformulario.submit();

    }

     function doit_onkeypress(event)
    {

        if (event.keyCode == 13 || event.which == 13)
        {
            var id_cliente = document.getElementById("inIDCliente").value;
            
            document.getElementById("inIDCliente").disabled = true;

            $.ajax(
                {
                    type: "GET",  
                    url: "http://54.144.154.41:8180/inventariojeans/rest/services/ventas_detalle/id_cliente=" + id_cliente,
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

             //Obtener abonos
            $.ajax(
                {
                    type: "GET",  
                    url: "http://54.144.154.41:8180/inventariojeans/rest/services/abonos/id_cliente=" + id_cliente,
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

                            //var row = tAbonos.insertRow(i);
                            x = row.insertCell(1);
                            x.innerHTML = data.abonos[i].cantidad;
                            x.className = "cantidad";

                            //var row = tAbonos.insertRow(i);
                            x = row.insertCell(2);
                            x.innerHTML = data.abonos[i].saldo;
                            x.className = "saldo";

                            //row = tAbonos.insertRow(i);
                            x = row.insertCell(3);
                            x.innerHTML = data.abonos[i].enganche;
                            x.className = "enganche";

                            totalPagado = totalPagado + Number(data.abonos[i].cantidad);
                            document.getElementById("txtPagado").value = totalPagado;
                        } 
                    },
                    error: function(e)
                    {  
                        alert('Error al recuperar abonos: ' + e);   
                    } 
                });

            //Obtener datos del cliente

            $.ajax(
                {
                    type: "GET",  
                    url: "http://54.144.154.41:8180/inventariojeans/rest/services/datos_cliente/id_cliente=" + id_cliente,
                    dataType: "json",  
                    success: function(data)
                    {
                        //alert(data.cliente.id_cliente);

                        document.getElementById("txtId").innerHTML = "ID: " + data.cliente.id_cliente;
                        document.getElementById("txtNombre").innerHTML = "Nombre: " + data.cliente.nombre;
                        document.getElementById("txtDireccion").innerHTML = "Direccion: " + data.cliente.direccion;
                        document.getElementById("txtColonia").innerHTML = "Colonia: " + data.cliente.colonia;
                        document.getElementById("txtTelefono").innerHTML = "Telefono: " + data.cliente.telefono;
                        document.getElementById("txtLugar").innerHTML = "Lugar: " + data.cliente.lugar; 
                        document.getElementById("txtSaldo").innerHTML = "Saldo: " + data.cliente.saldo; 

                    },
                    error: function(e)
                    {  
                        alert('Error al recuperar datos del cliente: ' + e);   
                    } 
                });
        }
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
                          
                </article>
                <article class="col-lg-8 col-md-8 col-sm-8 contactBox2">

                    <!--
                    <input name="inIDCliente" id="inIDCliente" class="myId" type="text" placeholder="ID:" onchange="" onkeypress="javascript:doit_onkeypress(event);" required/><br/>
                    -->

                    <p></p>
                    <p></p>

                     <div id="searchfield">
                        <form>
                            <input type="text" name="currency" class="biginput" id="autocomplete">
                        </form>
                    </div>   

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
                    
                    <p></p>
                    <!-- <h3>Registrar abono</h3> -->
                    <p></p>
                    
                    <input name="inAbono" id="inAbono" type="text" required hidden/><a id="l1" hidden>Registrar abono</a><br/>
                    <input name="rdEnganche" id="rdEnganche" type="radio" value="male" hidden> <a id="l2" hidden>Enganche </a><br>


                    <p></p>
                    <p></p>
                    <p></p>
                    <a class="btn-default btn6" onclick="calcular_resumen()">Abonar</a>

                    <table id="tResumen" hidden>
                    </table>

                    <form id="inv_form" action="saveAbono.jsp">
    
                        <input name="txtTotal" id="txtTotal" hidden/>
                        <input name="txtPagado" id="txtPagado" hidden/>
                        <input name="txtAbono" id="txtAbono" hidden/>
                        <input name="txtNvoPagado" id="txtNvoPagado" hidden/>
                        <input name="txtNvoSaldo" id="txtNvoSaldo" hidden/>
                        <input name="txtIDVenta" id="txtIDVenta" hidden/>
                        <input name="txtIsEnganche" id="txtIsEnganche" hidden/>

                        <div class="btns">
                            <a data-type="submit" class="btn-default btn5" onclick="guardarAbono()">Guardar</a>
                           
                            <p></p>
                        </div>

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
