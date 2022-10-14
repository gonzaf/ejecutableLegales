<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="rsm.aspx.vb" Inherits="Dynamic_Data.rsm" %>

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
    <table width="650" align="center">
        <tr>
            <td width="464" style="width: 0">
                <img src="imagenes/logo.jpg" width="279" height="74" /></td>
            <td width="464" style="width: 232px" colspan="2">
                <p class="titulo">
                    Resumen Diario: <%=gomero %>
                </p>
                <p class="cuerpo">
                    Fecha: <%=fecha %> -- <%=deposito %>
                </p>
            </td>
            <td width="124" class="cuerpo">
              <%--  <p class="cuerpo" style="text-align: right"><%=copia %></p>
                <p class="cuerpo" style="text-align: right">Nro: <%=1 %></p>
                <p class="cuerpo" style="text-align: right">CUIT: <%=" 30-54624298-2"  %></p>
                <p class="cuerpo" style="text-align: right">IIBB: <%=" 30-54624298-2"  %></p>--%>


            </td>

        </tr>
       <%-- <tr>
            <td colspan="2" align="center">
                <p class="cuerpo" style="width: 335px; height: 7px;">
                    
                </p>
            </td>
            <td colspan="2" align="center">&nbsp;</td>
        </tr>--%>
        

    </table>

    <table width="650" align="center" cellspacing="0" cellpadding="3">
        <tbody>

            <!--//titulo -->
            
            <tr align="center">
                <td height="89" colspan="8">






                    <asp:Repeater ID="Repeater1" runat="server">
                        <HeaderTemplate>
                            <table width="100%" border="1" cellspacing="0" cellpadding="3">
                                <tr>
                                    <td align="middle" class="bordefull" height="23">
                                        <p align="center" class="chico">Interno</p>
                                    </td>
                                    <td align="middle" class="bordefull">
                                        <p align="center" class="chico">Orden</p>
                                    </td>
                                    <td height="23" align="middle" class="bordefull">
                                        <p align="center" class="chico">Detalle</p>
                                    </td>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td align="center" width="40" class="bordefull">
                                    <p class="cuerpo">
                                        <asp:Label runat="server" ID="Label1" Text='<%# Eval("interno") %>' />
                                    </p>
                                </td>
                                <td align="center" width="40" class="bordefull">
                                    <p class="cuerpo">
                                        <asp:Label runat="server" ID="Label2" Text='<%# Eval("nroOrden") %>' />
                                    </p>
                                </td>
                                <td align="center" width="*" class="bordefull">
                                    <p class="cuerpo">
                                        <asp:Label runat="server" ID="Label3" Text='<%# Eval("detalle") %>' />
                                    </p>
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
                    <table border="1" cellspacing="0" cellpadding="3" width="100%">

                        <tr>
                            <td align="center" class="bordefull" width="33%">
                                <p class="cuerpo">Firma&nbsp;</p>
                            </td>
                            <td colspan="4" align="center" class="bordefull" width="33%">
                                <p class="cuerpo">Aclaracion&nbsp;</p>
                            </td>
                            <td colspan="4" align="center" class="bordefull" width="33%">
                                <p class="cuerpo">Fecha y Hora&nbsp;</p>
                            </td>
                        </tr>
            <tr>
                <td align="left" class="bordefull" width="33%" height="20">
                    <p class="cuerpo">&nbsp;</p>
                </td>
                <td colspan="4" class="bordefull" height="33%">
                    <p class="cuerpo">&nbsp;</p>
                </td>
                <td colspan="4" class="bordefull" height="33%">
                    <p class="cuerpo">&nbsp;</p>
                </td>

            </tr>
    </table>
    <br />
    </td>
  </tr>
  
</table>


</TD>
    <td width="10">&nbsp;</td>
    </TR>
  </TBODY>

</TABLE>

</body>

</html>
