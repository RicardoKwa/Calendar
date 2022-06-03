<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Resources/Masters/SiteBase.Master" CodeBehind="ReservasCochesCalendarioSemanal.aspx.vb" Inherits="Becario.Presentation.Intranet.ReservasCochesCalendarioSemanal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Horario</title>
    <style type="text/css">
     
    #hidden,#clase1,#clase2{
        display:none;
    }

    .rellenado{
        min-width:5px;
        min-height:5px;
        background-color:greenyellow;
    }

     #wrapReservas{
         display:none;
         flex-flow : row wrap;
         justify-content :center;
         align-items:center;
         background-color :#F7F7F7;
         margin:20px 10px;
         border:1px solid black;
     }

 /*    #wrapReservas *{
         display:none;
     }*/

    .referencia {
            padding: 3px 1px 2px 1px;
            border-color: #a0a08f;
            border-radius: 4px;
            border: 1px solid #8fafe0;
            width:fit-content;
            background-color:#44b4c4;
            padding:3px;
            color:white;
            font-size: 11px;
            text-align: center;
            line-height: 13px;
            font-weight: bold;
        }



     #comboBox{
         background-color:#E6EDF5;
         /*border : 1px solid black;*/
         margin : 0px;
         height :100%;
         padding : 10px;
     }
/*
     #selectCar{
         background-color:#E6EDF5;
         border : 1px solid black;
         padding : 10px;
         max-height : 330px;

     }*/
       
        #calendarview {
  margin-bottom:40px;
  width:100%;
}

.calendargrego, .calendargrego th, .calendargrego td {
	border: 1px solid #D4E0EE;
	border-collapse: collapse;
	font-family: "Trebuchet MS", Arial, sans-serif;
	color: #555;
	text-align:right;
}

.calendargrego caption {
	font-size: 150%;
	font-weight: bold;
	margin: 5px;
}

.calendargrego td,.calendargrego th {
	padding: 4px;
}

.calendargrego thead th {
    font-size:12px;
	text-align: center;
	background: #E6EDF5;
	color: #4F76A3;
	/*font-size: 100% !important;*/
	height:18px;
    font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif !important;
}

.calendargrego tbody th {
	font-weight: bold;
}
.calendargrego tbody tr { background: #FCFDFE; }

.calendargrego tbody tr.odd { background: #F7F9FC; }

.calendargrego table a:link {
	color: #718ABE;
	text-decoration: none;
}

.calendargrego table a:visited {
	color: #718ABE;
	text-decoration: none;
}

.calendargrego table a:hover {
	color: #718ABE;
	text-decoration: underline !important;
}

.calendargrego tfoot th, tfoot td {
	font-size: 85%;
}

.calendargrego, #barcal{
	margin:0;
	padding:0;
	font-family:tahoma;
	font-size:8pt;
}

.calendargrego .disabled{
	color:#CCCCCC;
}

.calendargrego .headbox {
	background: #F7F9FC;
	width:100%;
	height:15px;
	display:block;
	vertical-align:top;
}
.calendargrego .bodybox{
	background-color:#fff;
	width:100%;
	text-align: left;
}

.bodybox * {
    margin-bottom:4px;
}
#barcal{
    /*color: #4F76A3;*/
    font-size:20px;
    /*font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;*/
	background-color:#E6EDF5;
	width:100%;
	padding-top: 5px;
	height:25px;
	text-align: center;
}

.nav-left,.nav-right {
	display: inline-block;
	height: 20px;
	width: 20px;
	background-repeat: no-repeat;
}
.nav-left{
	float: left;
	background-image: url('data:image/png;base64,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');
	
}
.nav-right {
	float: right;
	background-image: url('data:image/png;base64,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');
}


.res{
    cursor:pointer;
    color:#D85247 ;
    font-size:16px;
    font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
}

.res-cliente,.res-estado{
    font-size:14px;
    margin:2px 1px;
    color:#3D6BA5 ;
}

.bodybox p{
    color:#6DA0C3;
    font-size:14px;
    font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
}

.reservasDivs{
    min-height:50px;
    width :max-content;
    display:flex;
    flex-flow: row nowrap;
    justify-content:flex-start;
    align-items:center;
    border: 1px solid black;
    margin: 20px 10px;
    padding: 10px;
    font-size:18px;
    background-color: white;
}

#tituloCoche{
    font-size :22px;
    background-color:white;
    padding:10px;
    /*border: 1px solid black;*/
    border-radius: 2px;
}

#tituloCoche > *{
    margin-left:5px;
}

    .activo {
      cursor:pointer;
      background: #F1F1F1  !important;
      border-radius:5px;
    }

    
    .activoReservar {
      cursor:pointer;
      background: #CFEDE3  !important;
      border-radius:5px;
    }

    .seleccion{
        color:black;
        font-size:1.3em;
        /*background-color: #CFEDE3;*/
    }

    .mantenimiento{
        color : black;
        background-color:#E7E7E7;
    }
    
    .chek{
        width:5px;
        height:5px;
    }

    </style>

    <link rel="stylesheet" href="css/Horarios.css?v=1" />
    <script src="js/Horarios.js?v=1" type="text/javascript"></script>

     <script type="text/javascript">
         //Referencia 
         var divReferencia = '<div class="clasificacionDivExterior" style="background-color: {1}; "><div class="clasificacionDivInterior">{0}</div></div>';
         var renderReferencia = function (value, metadata, record, rowIndex) {

             return String.format(divReferencia, record.data.Ref, '#44b4c4');

         };

         var prepareToolbarReserva = function (grid, toolbar, rowIndex, record) {

             if (record.get("VisibleEditar") == false) {
                 toolbar.items.items[1].hide();//Edit   Hide
                 toolbar.items.items[2].hide();//Delete Hide
             }
         };

         var renderTitulo = function (value, metadata, record, rowIndex, colIndex, store, view) {
            /* $('#hidden').text() = value*/
             return "<div id='tituloCoche'><i class='fa fa-calendar-day'></i>" + value + "</div>";
         };

         var renderIdCoche = function (value, metadata, record, rowIndex, colIndex, store, view) {
             /* $('#hidden').text() = value*/
             return "</i><div id='IdCoche'>" + value + "</div>";
         };

         var renderNumero = function (value, metadata, record, rowIndex, colIndex, store, view) {
             /* $('#hidden').text() = value*/
             return "</i><div id='numRes'>" + value + "</div>";
         };

         var renderReservaFecha = function (value, metadata, record, rowIndex, colIndex, store, view) {
             /* $('#hidden').text() = value*/
             return "<div class='badgeEstado relleno azul fechaIn'><i class='fa fa-calendar'></i> " + value + "</div>";
         };

         //var renderReservaFecha = function (value, metadata, record, rowIndex, colIndex, store, view) {
         //    /* $('#hidden').text() = value*/
         //    return "<div class='badgeEstado relleno azul fechaIn'><i class='fa fa-calendar'></i> " + value + "</div>";
         //};

         var columnUsuario = function (value, metadata, record, rowIndex, colIndex, store, view) {
             return "<a href=\"mailto:" + value + "\" target='_blank'>" + value + "</a>";
         }

         function DoPostBack() {
             __doPostBack('btnNew', 'MyArgument');
         }

     </script>

<%--    <script type="text/javascript">

        // fix scroll con tooltips.
        var timeoutquicktipdisable = null;
        $(document).bind('mousewheel', function (e) {
            ext.getcmp('ext-quicktips-tip').hide()
            ext.quicktips.disable();
            if (timeoutquicktipdisable != null) {
                cleartimeout(timeoutquicktipdisable);
            }
            timeoutquicktipdisable = settimeout(function () {
                ext.quicktips.enable();
            }, 500);
        });

        /*ext.tip.quicktipmanager.init(true, { trackmouse: true });*/

    </script>

    <!-- <ext:xscript runat="server">
        <script type="text/javascript">
            function esadmin() {
                return #{hdnesadmin}.getvalue();
            }

        </script>
    </ext:xscript>--%> -->

    <script type="text/javascript">
        /*//import $ from "https://cdn.skypack.dev/jquery@3.6.0";*/
        /**
         * Calendario simple
         */

       

        function calendarioGrego(id) {
            
            // Arreglo con los días de la semana

            this.arrDiasSemana = ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'];
            this.primerDiaSemana = 1; // Lunes
            this.arrMesesAnio = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
            this.idhtml = id;
            this.periodoActual = { 'dia': 0, 'mes': 0, 'anio': 0 };


            // Acciones cuando arranca la nueva instancia del calendario
            this.init = function () {
                var ext = this;
                $(document).ready(function () {
                    $(window).resize(function () { ext.resizeme() });
                    $(window).load(function () {ext.resizeme()});
                   /* $(window).load(miCalendario.insertData(2022, 5, 25));*/
                });
                return this;
            }


            // Implementa el menu superior
            this.menuSuperior = function () {
                var html = '<div id="barcal"><a class="nav-left" href="#"></a>' + this.arrMesesAnio[this.periodoActual.mes] + ' - ' + this.periodoActual.anio + '<a class="nav-right" href="#"></a></div>';
                return html;
            }


            // Genera el HTMl de la cabecera
            this.generaCabecera = function () {
                var x = 0, html = '', n = this.primerDiaSemana;
                for (x in this.arrDiasSemana) {
                    html += '<th>' + this.arrDiasSemana[n++] + '</th>';
                    if (n >= this.arrDiasSemana.length) {
                        n = 0;
                    }
                }
                return '<thead><tr>' + html + '</tr></thead>';
            }


            // general el contendido del calendario
            this.contenido = function () {

                var html = '', n = 1, someDay = new Date(), inicial = 1, flagDespliegaLineaCajas = true;

                // Setea el primer día a evaluar
                someDay.setFullYear(this.periodoActual.anio, this.periodoActual.mes, n);

                // Calcula los días previos al comienzo del mes
                if ((someDay.getDay() + this.primerDiaSemana) > 0) {

                    var preRango = (someDay.getDay() >= this.primerDiaSemana) ? someDay.getDay() -
                        this.primerDiaSemana : this.arrDiasSemana.length -
                        this.primerDiaSemana + someDay.getDay();

                    n = (preRango * -1) + 1;
                    inicial = n;
                };

                while (n <= 1 || this.periodoActual.mes == someDay.getMonth() ||
                    (n > 1 && this.periodoActual.mes != someDay.getMonth() && someDay.getDay() != this.primerDiaSemana)) {

                    someDay.setFullYear(this.periodoActual.anio, this.periodoActual.mes, n++);

                    // Si el calendario se extiede mas de lo que corresponde, corta la ejecución
                    console.log(someDay.getDay());
                    if (n > 3 && (this.periodoActual.mes < someDay.getMonth() || this.periodoActual.anio < someDay.getFullYear()) && someDay.getDay() == this.primerDiaSemana) {
                        break;
                    }

                    // pertenece el día al mes consultado
                    var habilitado = this.periodoActual.mes == someDay.getMonth();
                    // Flag en el caso
                    flagDespliegaLineaCajas = (this.periodoActual.mes < someDay.getMonth() && someDay.getDay() == 0 && someDay.getDate() == 1) ? false : true;


                    if (flagDespliegaLineaCajas) {
                        if (someDay.getDay() == this.primerDiaSemana && (inicial + 1) != n) {
                            html += '</tr><tr>';
                        }
                        html += this.celdaHtml(someDay.getDate(), someDay.getMonth(), habilitado, someDay.getFullYear());  'Modificar para que no se borre los valores'
                    }
                }
                return '<tbody><tr>' + html + '</tr></tbody>';
            }


            // dibuja la celda del calendario
            this.celdaHtml = function (numero, mes, activo, anio) {  //cssHoy no me interesa
                var fechaActual = new Date();
                var cssHoy = (activo && numero == fechaActual.getDate() && mes == fechaActual.getMonth() && anio == fechaActual.getFullYear()) ? 'cssHoy' : '';
                var flagActivo = (activo) ? '' : ' class="disabled" ';
                return '<td data="' + anio + '-' + mes + '-' + numero + '" ' + flagActivo + '><div class="headbox ' + cssHoy + '">' + numero +
                    '</div><div class="bodybox ' + anio + '/' + mes + '/' + numero + '" id="cell_' + anio + '_' + mes + '_' + numero + '"><p><i class="fas fa-garage-car"></i> LIBRE</p><div class="res"></div><div class="res-ref"></div><div class="res-cliente"></div><div class="res-estado"></div></div></td>';
            }

            // Recalcula el tamaño en relacion con el contenedor
            this.resizeme = function () {
                var wscr = $('#' + this.idhtml).width();
                var hscr = $('#' + this.idhtml).height() - 1 - $('#barcal').height();
                var counttr = $("#minical tr").length - 1; //numero de filas menos cabecera
                var counttd = $("#minical th").length; //numero de filas menos cabecera

                $('#minical').css("width", wscr);
                $('#minical').css("height", hscr);
                //alto de cada bodybox menos alto de headbox
                $('.bodybox').css("height", (hscr / counttr) - ($('.headbody').height() + $('#barcal').height()))
                //ancho de cada columna (ancho pantalla/numero columnas)
                $('#minical th').css("width", (wscr / counttd));
            }

            // Inserta informacion en la celda especificada
            this.insertData = function (anio, mes, dia, array) {
                /*mes--;*/
                /*$(". 20").append("RESERVADO");*/
                $('.bodybox').each(function () {
                    
                    var Ref = array[5];
                    var Id = array[6];
                    // check class
                    if ($(this).hasClass(anio + "/" + mes + "/" + dia)) {
                        $(this).find('p').empty();
                        $(this).find('.res').append("<i class='fa fa-car'></i>  RESERVADO");
                        $(this).find('.res-cliente').append("<i class='fa fa-user'></i> " + array[3]);
                        $(this).find('.res-estado').append("<i class='fa fa-info'></i> " + array[4]);
                        $(this).find('.res-ref').append("<div class='referencia'>" + Ref + "</div>");
                        $(this).addClass('check'); //Se puede quitar
                        /*$(this).append("<div class='rellenado'></div>").css("background-color", color);*/
                        /*<div class='badgeEstado relleno azul fechaIn'><i class='fa fa-calendar'></i> " + value + "</div>"*/
                        

                        /*.find('check').css('background-color', randomColor);*/
                        

                        $(this).hover(function () {
                            $(this).addClass('activo');
                        }, function () {
                            $(this).removeClass('activo');
                        }
                        )

                        $(this).click(function () {
                            top.addTab('Reserva - ' + Ref, 'Reserva - ' + Ref, '/Private/Intranet/Reservas/ReservasCoches/ReservasView.aspx?Id=' + Id);
                        });


                        //$('#buttons1 button:nth-child(n+5):nth-child(-n+8)')
                        //    .on('mouseover', function () {

                        //    })
                        //    .on('mouseout', function () {
                        //        $(this).stop(true).animate({
                        //            borderWidth: '0px',
                        //            color: '#ebc000'
                        //        }, duration, 'easeOutSine');
                        //    });

                    }

                    //if ($(this).hasClass("libre")){

                    //    $(this).hover(function () {
                    //        $(this).addClass('activo');
                    //    }, function () {
                    //        $(this).removeClass('activo');
                    //    }
                    //    )

                       
                    //};
                
                })

            }

            this.updateCells = function () {
         
                $('.bodybox').each(function () {
                    if ($.trim($(this).find('p').html()) !== '') {
                        
                        $(this).hover(function () {
                            $(this).addClass('activoReservar');
                        }, function () {
                            $(this).removeClass('activoReservar');
                        })
                        $(this).click(function () {
                            var clases = $(this).attr("class").split(' ');
                            var fechaArray = clases[1].split('/');
                            fechaArray[1] = Number(fechaArray[1]) + 1; //Sumamos 1 a cada mes, para que funciene tod correcto en el servidor

                            if (Number(fechaArray[1]) > 0) {
                                var fecha = fechaArray.join('/')
                            }

                            if ($("#hidden").html() == '') {

                                $("#clase1").append(clases[1]);
                                $("#hidden").html("<i class='fa fa-check'></i><div class='seleccion'>" + fecha + "</div>");
                                $(this).append("<div class='seleccion inicio'> <i class='fa fa-check'></i> Fecha Inicio </div>");
                                $(this).css("background-color", "#A1D8C6");

                            } else {
                                if ($("#clase2").html() == '') {
                                    var id = $("#IdCoche").text()
                                    console.log(id)
                                    $("#clase2").append(clases[1]);
                                    var fechaini = $("#hidden").find('.seleccion').text()
                                    $(this).append("<div class='seleccion fin'> <i class='fa fa-check'></i> Fecha Fin </div>");
                                    $(this).css("background-color", "#A1D8C6");
                                    const promise1 = new Promise((resolve, reject) => {

                                        if (checkMayor($("#clase1").text(), clases[1])) {
                                            if (check($("#clase1").text(), clases[1])) {
                                                pintar($("#clase1").text(), clases[1]);
                                                setTimeout(resolve, 1200)
                                            }
                                            else {
                                                limpiar($("#clase1").text(), $("#clase2").text());
                                                reject("error");
                                            }
                                        } else {
                                            limpiarIncorrecto($("#clase1").text(), $("#clase2").text());
                                            reject("Fecha Fin inferior a Inicio");
                                        }

                                        
                                        //const promise2 = new Promise((resolve, reject) => {
                                             
                                        //     resolve()
                                        //});
                                        //promise2.then(() => cleanHiddenData());
                                        ///*limpiar($("#clase1").text(), clases[1]);*/
                                        //reject('Promise is rejected');
                                        //}

                                        //if (pintar($("#clase1").text(), clases[1])) {
                                        //    setTimeout(resolve, 1200)
                                        //} else {
                                        //    limpiar($("#clase1").text(), clases[1]);
                                        //    reject('Promise is rejected');
                                        //}
                                    });
                                    
                                    promise1.then(
                                        () => top.addTab('Nueva Reserva', 'Nueva Reserva', '/Private/Intranet/Reservas/ReservasCoches/ReservasForm.aspx?Id=0&Fecha1=' + fechaini + "&Fecha2=" + fecha + "&IdCar=" + id),
                                        error => cleanHiddenData(error));
                                        

                                } else {
                                    const promise2 = new Promise((resolve, reject) => {
                                        limpiar($("#clase1").text(), $("#clase2").text());
                                        setTimeout(resolve, 500)
                                    });
                                    promise2.then(() => cleanHiddenData());

                                }
                               
                            }
                                                                                       
                        });

                    }

                })

            }

            //function getId() {
            //    $("#reservasDivs")
            //}
            
            // Limpia todos los elementos del calendario
            this.clearData = function () {
                $('.bodybox').html("");
            }

            // Imprime el contenido en el cuerpo del calendario
            this.imprime = function () {
                var fechaActual = new Date();
                var numeroDia = fechaActual.getDate();
                var numeroMes = fechaActual.getMonth();
                var numeroAnio = fechaActual.getFullYear();

                if (arguments[0] != undefined) // argumento como día actual
                    numeroDia = parseInt(arguments[0], 10);
                if (arguments[1] != undefined) // argumeto como mes actual
                    numeroMes = parseInt(arguments[1], 10);
                if (arguments[2] != undefined) // argumeto como año actual
                    numeroAnio = parseInt(arguments[2], 10);

                this.periodoActual.dia = numeroDia;
                this.periodoActual.mes = numeroMes;
                this.periodoActual.anio = numeroAnio;


                // Contenido que se insertara finalmente en el DOM
                var contenidoHtml = '';
                contenidoHtml += this.menuSuperior();
                contenidoHtml += '<table class="calendargrego" id="minical" cellpadding="0" cellspacing="0">';
                contenidoHtml += this.generaCabecera();
                contenidoHtml += this.contenido(numeroMes, numeroAnio);
                contenidoHtml += '</table>';
                $('#' + this.idhtml).html(contenidoHtml);
                this.resizeme();

                // Acciones adicionales
                var objeto = this;
                $('.nav-left').click(function () { // resta un mes al calendario
                    objeto.periodoActual.mes--;
                    if ((objeto.periodoActual.mes) < 0) {
                        objeto.periodoActual.mes = 11;
                        objeto.periodoActual.anio--;
                    }
                    objeto.imprime(objeto.dia, objeto.periodoActual.mes, objeto.periodoActual.anio);

                    //let anno = 2022;
                    //let mes = 5;
                    //let dia = 29;

                    const promise = new Promise((resolve, reject) => {

                        var cont = 0;
                        $('.reservasDivs').each(function () {
                            /*  console.log($(this).text())*/
                            var elements = $(this).text().split(' ');

                            printReserva(elements);
                            cont++;
                        })
                        pintarStorage();
                        resolve(true);
                    });

                    promise.then(() => miCalendario.updateCells());
                   
                });
                $('.nav-right').click(function () { // resta un mes al calendario
                    objeto.periodoActual.mes++;
                    if ((objeto.periodoActual.mes) > 11) {
                        objeto.periodoActual.mes = 0;
                        objeto.periodoActual.anio++;
                    }
                    objeto.imprime(objeto.dia, objeto.periodoActual.mes, objeto.periodoActual.anio);

                    const promise = new Promise((resolve, reject) => {


                        $('.reservasDivs').each(function () {
                            /*  console.log($(this).text())*/
                            var elements = $(this).text().split(' ');

                            printReserva(elements);

                        })
                        pintarStorage();
                        resolve(true);
                    });

                    promise
                        .then(() => miCalendario.updateCells());
                        /*.then(() => pintarStorage());*/

                });
            }
        }

        function pintarStorage() {

            if ($("#clase1").html() != '') {

                var fecha1 = $("#clase1").text().split("/")
                var anio = Number(fecha1[0])
                var mes = Number(fecha1[1])
                var dia = Number(fecha1[2])

                $("#cell_" + anio + '_' + mes + '_' + dia).append("<div class='seleccion inicio'> <i class='fa fa-check'></i> Fecha Inicio </div>");
                $("#cell_" + anio + '_' + mes + '_' + dia).css("background-color", "#A1D8C6");

                if ($("#clase2").html() != '') {

                    var fecha2 = $("#clase2").text().split("/")
                    var aniofinal = Number(fecha2[0])
                    var mesfinal = Number(fecha2[1])
                    var diafinal = Number(fecha2[2])

                    pintar($("#clase1").text(), $("#clase2").text());

                    $("#cell_" + aniofinal + '_' + mesfinal + '_' + diafinal).append("<div class='seleccion fin'> <i class='fa fa-check'></i> Fecha Fin</div>");
                    /*$("#cell_" + aniofinal + '_' + mesfinal + '_' + diafinal).css("background-color", "#A1D8C6");*/

                }                                    
            }                 
        }

        function checkMayor(fecha1, fecha2) {

            var fecha1Array = fecha1.split('/');
            fecha1Array[1] = Number(fecha1Array[1]) + 1; //Sumamos 1 a cada mes, para que funciene tod correcto en el servidor

            
            var date1 = new Date(fecha1Array.join('/'));
            

            var fecha2Array = fecha2.split('/');
            fecha2Array[1] = Number(fecha2Array[1]) + 1; //Sumamos 1 a cada mes, para que funciene tod correcto en el servidor

            
            var date2 = new Date(fecha2Array.join('/'));


            if (date1 < date2) {
                return true;
            } else {
                return false;
            }

        }


        function check(fecha1, fecha2) {

            var fecha1Array = fecha1.split('/');
            fecha1Array[1] = Number(fecha1Array[1]) + 1; //Sumamos 1 a cada mes, para que funciene tod correcto en el servidor

            if (Number(fecha1Array[1]) > 0) {
                var date1 = new Date(fecha1Array.join('/'));
            }

            var fecha2Array = fecha2.split('/');
            fecha2Array[1] = Number(fecha2Array[1]) + 1; //Sumamos 1 a cada mes, para que funciene tod correcto en el servidor

            if (Number(fecha2Array[1]) > 0) {
                var date2 = new Date(fecha2Array.join('/'));
            }

            
            //var date1 = new Date(fecha1);
            //var date2 = new Date(fecha2);
            //console.log(date1)
            //console.log(date2)

            let flag = true;

            $('.reservasDivs').each(function () {
                /*  console.log($(this).text())*/
                var elements = $(this).text().split(' ');
                var reorder = elements[1].split('/'); // reordenar la fecha de 03/05/2022 a 05/03/2022 , porque falla el new Date(), ya que crea (mes/dia/año)
                var save = reorder[0];
                reorder[0] = reorder[1];
                reorder[1] = save;

                reorder.join('/');

                var fecha = new Date(reorder);
                console.log(fecha)
                if (date1 < fecha && date2 > fecha) {
                    flag = false;
                    /*break;*/
                } 

            })

            return flag;

        }

        function checkReservado(fecha1, fecha2) {               //QUITAR
             
            var fecha = fecha1.split("/")
            var anio = Number(fecha[0])
            var mes = Number(fecha[1])
            var dia = Number(fecha[2])
            var correcto = true

            //if ($.trim($("#cell_" + anio + '_' + mes + '_' + dia).find('p').html()) == '') {
            //    correcto = false;
            //    return correcto;
            //}
            //else {

                let i = calcularDias(fecha1, fecha2) + 1
                while (i >= 0) {

                    if (dia == (diaFinalMes(mes) - 1)) {
                        if ($("#cell_" + anio + '_' + mes + '_' + dia).hasClass("check")) {
                            correcto = false;
                            break;
                        } else {
                            mes++;
                            dia = 1;
                            if (mes == 11) {
                                anio++;
                                mes = 0;
                            }
                        }
                        
                    } else {
                        if ($("#cell_" + anio + '_' + mes + '_' + dia).hasClass("check")) {
                            correcto = false;
                            break;
                        }
                        dia++;
                    }

                    //if ($.trim($("#cell_" + anio + '_' + mes + '_' + dia).find('p').html()) == '') {
                    //    correcto = false;
                    //    break;
                    //}

                    i--;

            /*}*/

           

            };

            return correcto;

        };

        function pintar(clase1, clase2) {
            var fecha1 = clase1.split("/")
            var anio = Number(fecha1[0]) 
            var mes = Number(fecha1[1]) 
            var dia = Number(fecha1[2]) + 1

            var fecha2 = clase2.split("/")
            var aniofinal = Number(fecha2[0])
            var mesfinal = Number(fecha2[1])
            var diafinal = Number(fecha2[2])
            console.log(dia)
            let mesCount = 0;
            let i = calcularDias(clase1, clase2) - 1;
            let correcto = true;



            //if (mesfinal == mes && aniofinal == anio) {
            //    i = calcularDias(clase1, clase2) - 2 //Ajuste , para que se pinte el dia final de color más oscuro
            //}
            //else {
            //    i = calcularDias(clase1, clase2) - 1 //Se calcula los dias que hay entre las fechas y se resta 1, para quitar el dia fin
            //}
            
            while (i > 0) {

                /*if ($.trim($("#cell_" + anio + '_' + mes + '_' + (dia - 1)).find('p').html()) !== '') {*/

                    $("#cell_" + anio + '_' + mes + '_' + dia).append("<div class='seleccion'></i></div>");
                    $("#cell_" + anio + '_' + mes + '_' + dia).css("background-color", "#CFEDE3");

                    if (dia == (diaFinalMes(mes))) {
                        //if ((diaFinalMes(mes)) == 32) {
                        //    i++;
                        //}
                        mes++;
                        mesCount++;
                        dia = 1;
                        if (mes == 12) {
                            anio++;
                            mes = 0;
                        }
                    } else {
                        dia++;
                    }

                    if (mesCount % 2 == 0 && dia == 1) {  //Ajuste
                        i++;
                    } else {
                        i--;
                    }

                
                //else {
                //    correcto = false;
                //    break;
                //}

               
                //if (i == 0) {
                //    /*$("#cell_" + aniofinal + '_' + mesfinal + '_' + diafinal).append("<div class='seleccion fin'> <i class='fa fa-check'></i> Fecha Fin</div>");*/
                //    $("#cell_" + aniofinal + '_' + mesfinal + '_' + diafinal).css("background-color", "#A1D8C6");
                //}
            };

            /*$("#cell_" + aniofinal + '_' + mesfinal + '_' + diafinal).append("<div class='seleccion fin'> <i class='fa fa-check'></i> Fecha Fin</div>");*/
            $("#cell_" + aniofinal + '_' + mesfinal + '_' + diafinal).css("background-color", "#A1D8C6");

            return correcto;

        }

        function limpiarIncorrecto(clase1, clase2) {


            var fecha1 = clase1.split("/")
            var anio = Number(fecha1[0])
            var mes = Number(fecha1[1])
            var dia = Number(fecha1[2])

            var fecha2 = clase2.split("/")
            var aniofinal = Number(fecha2[0])
            var mesfinal = Number(fecha2[1])
            var diafinal = Number(fecha2[2])

            $("#cell_" + anio + '_' + mes + '_' + dia).find('.seleccion').remove();
            $("#cell_" + anio + '_' + mes + '_' + dia).css("background-color", "white")

            $("#cell_" + aniofinal + '_' + mesfinal + '_' + diafinal).find('.seleccion').remove();
            $("#cell_" + aniofinal + '_' + mesfinal + '_' + diafinal).css("background-color", "white")

        }

        function limpiar(clase1, clase2) {
            var fecha1 = clase1.split("/")
            var anio = Number(fecha1[0])
            var mes = Number(fecha1[1])
            var dia = Number(fecha1[2])

            var fecha2 = clase2.split("/")
            var aniofinal = Number(fecha2[0])
            var mesfinal = Number(fecha2[1])
            var diafinal = Number(fecha2[2])

            //$("#cell_" + anio + '_' + mes + '_' + dia).css("background-color", "white")
            //$('.inicio').remove();
            let mesCount = 0;
            let i = calcularDias(clase1, clase2)   //ANTES ESTABA A + 1 , PERO ME BORRA LA CELDA DE MANTENIMIENTO 
            while (i >= 0) {
                /*if (!$("#cell_" + anio + '_' + mes + '_' + dia).hasClass("mantenimiento")){*/    //PARA QUE NO ME BORRE EL DIA DE MANT, COMPRUEBO QUE NO TENGA LA CLASE
                    $("#cell_" + anio + '_' + mes + '_' + dia).find('.seleccion').remove();
                    $("#cell_" + anio + '_' + mes + '_' + dia).css("background-color", "white")

                    if (dia == diaFinalMes(mes)) {
                        mes++;
                        mesCount++;
                        dia = 1;
                        if (mes == 12) {
                            anio++;
                            mes = 0;
                        }
                    } else {
                        dia++;
                    }

                    if (mesCount % 2 == 0 && dia == 1) {  //Ajuste
                        i++;
                    } else {
                        i--;
                    }
                /*}*/
            };

        }

        function cleanHiddenData(error) {
            if (error) {
                alert(error);
            }
            $("#hidden").empty()
            $("#clase1").empty()
            $("#clase2").empty()
        }


        // Inicia el calendario y el boton asignar mensajes
        var miCalendario = new calendarioGrego('calendarview').init();
        $(document).ready(function () {

            //var colores = arrayColores();
            //console.log(colores)
            miCalendario.imprime();
            const promise = new Promise((resolve, reject) => {

                var cont = 0;
                $('.reservasDivs').each(function () {
                    /*  console.log($(this).text())*/
                    var elements = $(this).text().split(' ');

                    printReserva(elements);
                    cont++;
                })
                resolve(true);
            });

            promise
                .then(() => miCalendario.updateCells());

        });

        function randomColor() {
            var randomColor = '#' + ('000000' + Math.floor(Math.random() * 16777215).toString(16)).slice(-6);
            return randomColor;
        }

        function arrayColores() {

            /*var numres = $("#numRes").innerHtml();*/
            /*console.log(numres);*/
            var colores = new Array();

            for (let j = 0; j < 20; j++) {

                colores.push(randomColor());
            }

            return colores;
        }
 

        function printReserva(array) {

            var elementosFecha1 = array[1].split('/');
            var dia = parseInt(elementosFecha1[0]);
            var mes = parseInt(elementosFecha1[1]) - 1;
            var anio = parseInt(elementosFecha1[2]);

            var elementosFecha2 = array[2].split('/');
            var diafinal = parseInt(elementosFecha2[0]);
            var mesfinal = parseInt(elementosFecha2[1]) - 1;
            var aniofinal = parseInt(elementosFecha2[2]);
            
            var anterior = diaAnterior(dia, mes, anio);
            var posterior = diaPosterior(diafinal, mesfinal, aniofinal);

            var diaAnt = anterior.split('/')[0]
            var mesAnt = anterior.split('/')[1]
            var anioAnt = anterior.split('/')[2]

            var diaPost = posterior.split('/')[0]
            var mesPost = posterior.split('/')[1]
            var anioPost = posterior.split('/')[2]

            $("#cell_" + anioPost + '_' + mesPost + '_' + diaPost).find('p').empty();
            $("#cell_" + anioPost + '_' + mesPost + '_' + diaPost).find('.res').append("<div class='mantenimiento'><i class='fa fa-wrench'></i>  Mantenimiento POST</div>");
            $("#cell_" + anioPost + '_' + mesPost + '_' + diaPost).addClass('mantenimiento');

            $("#cell_" + anioAnt + '_' + mesAnt + '_' + diaAnt).find('p').empty();
            //$("#cell_" + anioAnt + '_' + mesAnt + '_' + diaAnt).find('.res').empty();
            $("#cell_" + anioAnt + '_' + mesAnt + '_' + diaAnt).find('.res').append("<div class='mantenimiento'><i class='fa fa-wrench'></i>  Mantenimiento PRE</div>");
            $("#cell_" + anioAnt + '_' + mesAnt + '_' + diaAnt).addClass('mantenimiento');

            //$("#cell_" + anioAnt + '_' + mesAnt + '_' + diaAnt).css("background-color", "#E7E7E7")
            //$("#cell_" + anioPost + '_' + mesPost + '_' + diaPost).css("background-color", "#E7E7E7")

           /* var dias = array[2];*/
            let mesCount = 0;
            dias = calcularDias2(array[1], array[2])

            while (dias > 0) {

                /*if ($.trim($("#cell_" + anio + '_' + mes + '_' + (dia - 1)).find('p').html()) !== '') {*/

                miCalendario.insertData(anio, mes, dia, array);
                /*$("#cell_" + anio + '_' + mes + '_' + dia).css("background-color", "#CFEDE3");*/

                if (dia == (diaFinalMes(mes))) {
                    //if ((diaFinalMes(mes)) == 32) {
                    //    i++;
                    //}
                    mes++;
                    mesCount++;
                    dia = 1;
                    if (mes == 12) {
                        anio++;
                        mes = 0;
                    }
                } else {
                    dia++;
                }

                if (mesCount > 0  && dia == 1) {  //Ajuste
                    dias++;
                } 
                dias--;
                


                //else {
                //    correcto = false;
                //    break;
                //}


                //if (i == 0) {
                //    /*$("#cell_" + aniofinal + '_' + mesfinal + '_' + diafinal).append("<div class='seleccion fin'> <i class='fa fa-check'></i> Fecha Fin</div>");*/
                //    $("#cell_" + aniofinal + '_' + mesfinal + '_' + diafinal).css("background-color", "#A1D8C6");
                //}
            };


            //for (let j = 0; j < dias; j++) {

            //    //if (dia == 31) {
            //    //    miCalendario.insertData(anno, mes, dia, array);
            //    //}

            //        if (dia == (diaFinalMes(mes))) {
            //            dia = 1;
            //            mes++;
            //            if (mes == 12) {
            //                anno++;
            //                mes = 0;
            //                console.log(anno + mes)
            //            } 
            //            //else {
            //            //    mes++;
            //            //}
            //        }
            //        miCalendario.insertData(anno, mes, dia ,array);
            //        dia++;
            //}
            /*miCalendario.updateCells();*/
        }

        function diaAnterior(dia,mes,anio) {
            var anterior;


            if (dia == 1) {
                if (mes == 0) {
                    anio--;
                    mes = 11;
                } else {
                    mes--;
                }
                anterior = diaFinalMes(mes) - 1;
            } else {
                anterior = dia - 1;
            }

            return anterior + "/" + mes + "/" + anio;
        }

        function diaPosterior(diafinal, mesfinal, aniofinal) {
            var posterior;

            if (diafinal == (diaFinalMes(mesfinal) - 1) ) {
                if (mesfinal == 11) {
                    aniofinal++;
                    mesfinal = 0;
                } else {
                    mesfinal++;
                }
                posterior = 1;
            } else {
                posterior = diafinal + 1;
            }

            return posterior + "/" + mesfinal + "/" + aniofinal;
        }

        function diaFinalMes(mes) {
            let fin

            if (mes == 0 || mes == 2 || mes == 4 || mes == 6 || mes == 7 || mes == 9 || mes == 11) {
                fin = 32
            }
            else if (mes == 1) {
                fin = 29
            }
            else {
                fin = 31
            }

            return fin
        }

        //function diaFinalMes2(mes) {
        //    let fin

        //    if (mes == 1 || mes == 3 || mes == 5 || mes == 7 || mes == 8 || mes == 10 || mes == 12) {
        //        fin = 32
        //    }
        //    else if (mes == 2) {
        //        fin = 29
        //    }
        //    else {
        //        fin = 31
        //    }

        //    return fin
        //}

        function reorderDate(fechaIn) {

            var reorder = fechaIn.split('/'); // reordenar la fecha de 03/05/2022 a 05/03/2022 , porque falla el new Date(), ya que crea (mes/dia/año)
            var save = reorder[0];
            reorder[0] = reorder[1];
            reorder[1] = save;

            reorder.join('/');

            var fechaOut = new Date(reorder);

            return fechaOut;
        }


        function calcularDias2(fecha1, fecha2) {                //Probar a cambiar por total dias en el servidor
            //let date = new Date().toDateString();
            /* console.log(date);*/

            var fechaini = reorderDate(fecha1);
            var fechafin = reorderDate(fecha2);

            //var fechaini = new Date(fecha1);
            //var fechafin = new Date(fecha2);
            //fechafin.setMonth(fechaini.getMonth() + 4)

            var diasdif = fechafin.getTime() - fechaini.getTime();
            var contdias = Math.round(diasdif / (1000 * 60 * 60 * 24) + 1);
            console.log(fechaini.toDateString())
            console.log(fechafin.toDateString())
            console.log(contdias)
            return contdias;
        }


       

        function calcularDias(fecha1,fecha2) {
            //let date = new Date().toDateString();
            /* console.log(date);*/

            var arrayfecha1 = fecha1.split('/');
            arrayfecha1[1] = Number(arrayfecha1[1]) + 1;
            fecha1 = arrayfecha1.join('/');


            var arrayfecha2 = fecha2.split('/');
            arrayfecha2[1] = Number(arrayfecha2[1]) + 1;
            fecha2 = arrayfecha2.join('/');


            var fechaini = new Date(fecha1);
            var fechafin = new Date(fecha2);
            //fechafin.setMonth(fechaini.getMonth() + 4)
            
            var diasdif = fechafin.getTime() - fechaini.getTime();
            var contdias = Math.round(diasdif / (1000 * 60 * 60 * 24) + 1);
            console.log(fechaini.toDateString())
            console.log(fechafin.toDateString())
            //console.log(contdias)
            return contdias;
        }


    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

                                       
    <div id="comboBox">
        <ext:Hidden ID="Objeto_Id" runat="server" />
        <ext:DisplayField ID="disCoche" runat="server" LabelWidth="90" Cls="blue-text" MarginSpec="0 30 0 0" ReadOnly="true">
         <Renderer Fn="renderTitulo" />
         </ext:DisplayField>

        <%--<ext:DisplayField ID="disNumeroRes" runat="server" LabelWidth="90" MarginSpec="0 30 0 0" ReadOnly="true">
         <Renderer Fn="" /> 
         </ext:DisplayField>--%>

         <ext:DisplayField ID="disIdCoche" runat="server" LabelWidth="90"  Cls="blue-text" MarginSpec="0 30 0 0" ReadOnly="true" Hidden="true">
            <Renderer Fn="renderIdCoche" />
         </ext:DisplayField>
        
        <div id="calendarview" style="width:auto;height:700px" ;></div>
        <div id="hidden"></div>
        <div id="clase1"></div>
        <div id="clase2"></div>
         <ext:Panel runat="server" ID="Panel1" Cls="Panel1" Hidden="true">

    </ext:Panel>

        <ext:StatusBar ID="StatusBarCliente" runat="server" DefaultText="Pulsa el botón para actualizar">
                                         <Items>
                                             <ext:Button Text="Update" runat="server" ID="btUpdate" Icon="Calendar" OnClientClick="DoPostBack();" >
                                                 <%--<DirectEvents>
                                                     <Click OnEvent="cargarCliente" IsUpload="true">
                                                         <EventMask MinDelay="100" Target="CustomTarget" />
                                                     </Click>
                                                 </DirectEvents>--%>
                                             </ext:Button>
                                         </Items>
        </ext:StatusBar>

    </div>

</asp:Content>

