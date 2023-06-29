<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="impresionOrdenAsistencia.aspx.vb" Inherits="Dynamic_Data.ImpresionOrdenAsistencia" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

    <title>OA</title>


    <link href="styles.css" rel="stylesheet" type="text/css" />
    <style>
        .flexible-around {
            display: flex;
            justify-content: space-around;
        }

        .flexible-between {
            display: flex;
            justify-content: space-between;
        }

        .flex-center {
            display: flex;
            justify-content: center;
        }

        .flex-center-wrap {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }

        .flex-column-bottom {
            display: flex;
            flex-direction: column;
            align-items: flex-end
        }

        .hidden {
            display: none;
        }

        .bold {
            font-weight: bold;
        }
    </style>
</head>


<script language="javascript">
    
    var NEW_LOC;

    function redireccionar() {
        setTimeout("location.href=NEW_LOC", 3000);
    }
    function imrimeyredi() {
        window.print();
        redireccionar()
    }

    function doThings() {
        NEW_LOC = '<%= IIf(abiertaOCerrada = "abiertas", "/st/asistencia/ordenesAsistencia.aspx", "/st/asistencia/ordenesAsistenciaCerrada.aspx") %>';
        setTimeout(imrimeyredi(), 1000)
    }
</script>


<body onload="doThings()" class="imprimir">
    <div class="flexible-around">
        <div>
            <img src="imagenes/logo.jpg" width="279" height="74" />
        </div>
        <div>Fecha:  <%=fecha %> Hora:  <%=hora %></div>
    </div>

    <hr />
    <div class="flex-center">
        <div>
            <h3>Orden de Asistencia Nº: <%= idOrdenAistencia %> </h3>
        </div>
    </div>

    <br />

    <div class="flexible-around">
        <div>
            <p class="cuerpo">Chofer: <%= nombreChofer %> - <%= legajoChofer %></p>
        </div>
        <div>
            <p class="cuerpo">Pérdida Kms: <%= perdidaKms %></p>
        </div>
    </div>

    <div class="flexible-around">
        <div>
            <p class="cuerpo">Auxilio Tipo: <%= tipoOrden %></p>
        </div>
        <div>
            <p class="cuerpo">Nro. Coche:  <%= interno %></p>
        </div>
    </div>

    <div class="flexible-around">
        <div>
            <p class="cuerpo">Orden Reparación: <%= idOrdenReparacion %></p>
        </div>
        <div>
            <p class="cuerpo">Observaciones: <%=observaciones %></p>
        </div>
    </div>

    <div class="flexible-around">
        <div>
            <p class="cuerpo">Teléfono Chofer: <%= telefono %></p>
        </div>
        <div>
            <p class="cuerpo">Auxiliador:  <%= auxiliador %></p>
        </div>
    </div>


    <div class="flexible-around">
        <div>
            <p class="cuerpo">Otro Motivo: <%= otroMotivo %></p>
        </div>
        <div>
            <p class="cuerpo">Causa:  <%= causa %></p>
        </div>
    </div>
    <div class="flexible-around">
        <div>
            <p class="cuerpo">Recomendación:  <%= recomendacion %></p>
        </div>
        <div>
            <p class="cuerpo">Remolcado:  <%= remolque %></p>
        </div>
    </div>

    <div class="flexible-around">
        <div>
            <p class="cuerpo">Taller Externo: <%= taller %></p>
        </div>
        <div>
            <p class="cuerpo">Sistema:  <%= sistema %></p>
        </div>
    </div>
    <div class="flexible-around">
        <div>
            <p class="cuerpo">Subsistema:  <%= subsistema %></p>
        </div>
        <div>
            <p class="cuerpo">Componente:  <%= componente %></p>
        </div>
    </div>
        

    <hr class="<%= IIf(idOrdenReparacion = 0, "hidden", "") %>" />
    <div class="flexible-around <%= IIf(idOrdenReparacion = 0, "hidden", "") %>">
        <div>
            <p class="cuerpo bold">Orden de reparación asociada: <%=idOrdenReparacion %></p>
        </div>
    </div>    
    <div class="flexible-around <%= IIf(idOrdenReparacion = 0, "hidden", "") %>">
        <div>
            <p class="cuerpo">Mecánico asignado: <%=datosMecanico %></p>
        </div>
    </div>

   



    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <hr />
    <div class="flexible-around">
        <div class="flex-column-bottom">
            <div>
                <p class="cuerpo">Firma&nbsp;</p>
            </div>
            <div>
                <p class="cuerpo">Aclaracion&nbsp;</p>
            </div>
        </div>
        <div class="flex-column-bottom">
            <div>
                <p class="cuerpo">Firma&nbsp;</p>
            </div>
            <div>
                <p class="cuerpo">Aclaracion&nbsp;</p>
            </div>
        </div>
    </div>

</body>

</html>
