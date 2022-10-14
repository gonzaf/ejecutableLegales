<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="pr.aspx.vb" Inherits="Dynamic_Data.pr" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

    <title>SL</title>


    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>


<script language="javascript">
    var NEW_LOC = '<%=newLoc%>';


    function redireccionar() {
        setTimeout("location.href=NEW_LOC", 3000);
    }
    function imrimeyredi() {
        window.print();
        redireccionar();
        //document.location=NEW_LOC;
    }
    // La redirección ocurre incluso cuando la página no se ha imprimido
    // si quieres hacer la redirección sólo si la página se ha imprimido
    // inserta la siguiente frase arriba 

</script>


<body onload="imrimeyredi()" class="imprimir">






    <table width="600" align="center">
        <tr>
            <td width="464">
                <img src="imagenes/logo.jpg" width="279" height="74" /></td>
            <td width="124">
                <p class="cuerpob" style="text-align: right"><%=fecha%></p>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" align="center">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <p class="titulo">Orden de Trabajo Nº: <%=idOrden%> - Coche nro.  <%=idCoche%></p>
                <p class="titulo">Usuario Emision: <%=usuarioEmision%></p>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">&nbsp;</td>
        </tr>
    </table>

    <table width="600" align="center" cellspacing="0" cellpadding="3">
        <tbody>

            <!--//titulo -->

            <tr>

                <td height="20" colspan="2" align="right" class="bordetituloi">
                    <p align="left" class="cuerpo">Fecha:&nbsp;<%=fecha%></p>
                </td>
                <td width="160" height="20" align="right" class="bordefull">
                    <p align="center" class="cuerpo">Hora: <%=hora%></p>
                </td>
                <td width="116" class="bordefull">
                    <p align="left" class="cuerpo">
                    </p>
                </td>
                <td width="181" class="bordefull">
                    <p align="center" class="cuerpo">Mecanico: <%=mecanico%></p>
                </td>
            </tr>
            <tr>
                <td align="right" class="bordefull" colspan="3" height="20">
                    <p align="left" class="cuerpo">
                        <%--                       Encargado:&nbsp;      <%='$encargado%>--%>
                    </p>
                </td>

                <td colspan="2" class="bordefull" height="20">
                    <p align="left" class="cuerpo">
                        Mecanico: <%=mecanico%>
                    </p>
                </td>
            </tr>
            <tr>
                <td align="left" class="bordefull" colspan="3" height="20">
                    <p class="cuerpo">
                        Prioridad:
                        <%=prioridad%>
                    </p>
                </td>
                <td colspan="2" class="bordefull" height="20">
                    <p align="left" class="cuerpo">
                        <%--  Informante:
      <%=$mant->getinformante();%>--%>
                    </p>
                </td>
            </tr>

            <tr>
                <td align="left" class="bordefull" colspan="3" height="20">
                    <p class="cuerpo">
                        <%-- Usuario:
       <%=getUsuarioIntranetDeOrden($mant->getidOrden())%>--%>
                    </p>
                </td>
                <td colspan="2" class="bordefull" height="20">
                    <p align="left" class="cuerpo">
                    </p>
                </td>
            </tr>

            <tr>
                <td align="right" class="bordefull" colspan="3" height="20">
                    <p class="cuerpo" align="left">Fecha Cierre:<%--<%=$mant->getfechaCierre()%>--%></p>
                </td>
                <td colspan="2" class="bordefull" height="20">
                    <p class="cuerpo">
                        Hora Cierre: 
     <%-- <%=tfxvMantHoraOrdenService : getById($idOrden)->gethoracierre()%>--%>
                    </p>
                </td>
            </tr>
            <tr>
                <td align="right" class="bordefull" width="116" height="20">
                    <p class="cuerpo">&nbsp;</p>
                </td>
                <td colspan="4" class="bordefull" height="60"><span class="cuerpo">

                    <!--//en la caja de texto (CODIGO) se inputara... -->
                    <%-- <p class="cuerpo"><%=$mant->getObservaciones()%> </p>--%>
                </span></td>
            </tr>
            <tr>
                <td colspan="2" height="5">
                    <spacer height="1"
                        width="1" type="block">
                </td>
            </tr>











            <tr align="center">
                <td height="89" colspan="8">


                    <asp:Repeater ID="Repeater1" runat="server">
                        <HeaderTemplate>
                            <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                <tr>
                                    <td align="middle" class="bordefull" height="23">
                                        <p align="center" class="chico">Tarea</p>
                                    </td>
                                    <td width="122" align="middle" class="bordefull">
                                        <p align="center" class="chico">Detalle</p>
                                    </td>
                                    <td width="122" height="23" align="middle" class="bordefull">
                                        <p align="center" class="chico">Fecha de entrega</p>
                                    </td>
                                    <td width="102" height="23" align="middle" class="bordefull">
                                        <p align="center" class="chico">Hora de entrega</p>
                                    </td>
                                    <td width="102" height="23" align="middle" class="bordefull">
                                        <p align="center" class="chico">Legajo</p>
                                    </td>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>

                            <tr>


                                <td align="center" width="122" class="bordefull">
                                    <p class="cuerpo"><%# Eval("mTareas.descripcion") %></p>
                                </td>
                                <td align="center" width="122" class="bordefull">
                                    <p class="cuerpo"><%# Eval("obs") %></p>
                                </td>
                                <td align="center" width="102" class="bordefull">
                                    <p class="cuerpo"></p>
                                </td>
                                <td align="center" width="102" class="bordefull">
                                    <p class="cuerpo"><%# Eval("idOrigen") %></p>
                                </td>
                                <td align="center" width="102" class="bordefull">
                                    <p class="cuerpo"><%# Eval("idOrigen") %></p>
                                </td>
                            </tr>


                        </ItemTemplate>

                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>


                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <table width="100%">

                        <tr>
                            <td align="left" class="bordefull" width="50%">
                                <p class="cuerpo">Mecanico&nbsp;</p>
                            </td>
                            <td colspan="4" class="bordefull">
                                <p class="cuerpo">Usuario&nbsp;</p>
                            </td>
                </td>
            </tr>
            <tr>
                <td align="left" class="bordefull" width="50%" height="20">
                    <p class="cuerpo">Firma&nbsp;</p>
                </td>
                <td colspan="4" class="bordefull" height="60">
                    <p class="cuerpo">Firma&nbsp;</p>
                </td>
                </TD>
            </tr>
            <tr>
                <td align="left" class="bordefull" width="116" height="20">
                    <p class="cuerpo">Aclaracion&nbsp;</p>
                </td>
                <td colspan="4" class="bordefull" height="60">
                    <p class="cuerpo">Aclaracion&nbsp;</p>
                </td>
            </tr>
    </table>






</body>

</html>
