<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="prTf.aspx.vb" Inherits="Dynamic_Data.prTf" %>

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
                <p class="cuerpo" style="text-align: right"><%=copia %></p>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" align="center">&nbsp;</td>
        </tr>
        <tr>

            <td colspan="2" align="left">

                <table border="0" width="100%">
                    <tr>
                        <td widht="40%">
                            <p class="titulo">Orden de Transferencia Nº: <%=idTransferencia %> </p>

                        </td>
                        <td widht="30%" align="right">
                            <p class="cuerpo">Desde: <%=idDepositoOut %> - <%=depositoOut %> </p>
                        </td>
                        <td widht="30%" align="right">
                            <p class="cuerpo">Hasta: <%=idDepositoIn %> - <%=depositoIn %> </p>
                        </td>

                    </tr>
    </table>



    </td>
        </tr>

    </table>

    <table width="600" align="center" cellspacing="0" cellpadding="3">
        <tbody>

            <!--//titulo -->

            <tr>
                <td height="20" colspan="2" align="right" class="bordetituloi">
                    <p align="left" class="cuerpo">Fecha: <%=fecha %></p>
                </td>
                <td width="160" height="20" align="right" class="bordefull">
                    <p align="center" class="cuerpo">Hora: <%=hora %></p>
                </td>
                <td width="116" class="bordefull">
                    <p align="left" class="cuerpo">OR:</p>
                </td>
                <td width="181" class="bordefull">
                    <p align="center" class="cuerpo">Usuario: <%=usuario %></p>
                </td>
            </tr>
            <tr>
                <td align="right" class="bordefull" colspan="3" height="20">
                    <p align="left" class="cuerpo">
                        Fecha Cierre:&nbsp; 
                    </p>
                </td>

                <td colspan="2" class="bordefull" height="20">
                    <p align="left" class="cuerpo">
                        Pañol:  - Mecanico:
                    </p>
                </td>
            </tr>

            <tr>
                <td align="right" class="bordefull" width="116" height="20">
                    <p class="cuerpo">Observaciones&nbsp;</p>
                </td>
                <td colspan="4" class="bordefull" height="60"><span class="cuerpo">

                    <!--//en la caja de texto (CODIGO) se inputara... -->
                    <p class="cuerpo"></p>
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
                                        <p align="center" class="chico">Codigo</p>
                                    </td>
                                    <td align="middle" class="bordefull">
                                        <p align="center" class="chico">Repuesto</p>
                                    </td>
                                    <td height="23" align="middle" class="bordefull">
                                        <p align="center" class="chico">Cant.</p>
                                    </td>
                                    <td height="23" align="middle" class="bordefull">
                                        <p align="center" class="chico">Partida</p>
                                    </td>

                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td align="center" width="40" class="bordefull">
                                    <p class="cuerpo">
                                        <asp:Label runat="server" ID="Label1" Text='<%# Eval("codRepuesto") %>' />
                                    </p>
                                </td>
                                <td align="center" width="*" class="bordefull">
                                    <p class="cuerpo">
                                        <asp:Label runat="server" ID="Label2" Text='<%# Eval("Desc_Repuesto") %>' />
                                    </p>
                                </td>
                                <td align="center" width="40" class="bordefull">
                                    <p class="cuerpo">
                                        <asp:Label runat="server" ID="Label3" Text='<%# Eval("cant") %>' />
                                    </p>
                                </td>
                                <td align="center" width="60" class="bordefull">
                                    <p class="cuerpo">
                                        <asp:Label runat="server" ID="Label5" Text='<%# Eval("nroPartida") %>' />
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
                    <table width="100%">

                        <tr>
                            <td align="left" class="bordefull" width="50%">
                                <p class="cuerpo">Emisor&nbsp;</p>
                            </td>
                            <td colspan="4" class="bordefull">
                                <p class="cuerpo">Transportista&nbsp;</p>
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
    <br />
    <table <%=Style %> width="100%">

        <tr>
            <td align="left" class="bordefull" width="50%">
                <p class="cuerpo">Receptor&nbsp;</p>
            </td>
            <td class="bordefull">
                <p class="cuerpo">&nbsp;</p>
            </td>
            </TD>
        </tr>
        <tr>
            <td align="left" class="bordefull" width="50%" height="20">
                <p class="cuerpo">Firma&nbsp;</p>
            </td>
            <td class="bordefull" height="60">
                <p class="cuerpo">Aclaracion&nbsp;</p>
            </td>
            </TD>
        </tr>
    </table>
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
