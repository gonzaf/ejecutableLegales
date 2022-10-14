<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="print.aspx.vb" Inherits="Dynamic_Data.print" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>SL</title>


<link href="styles.css" rel="stylesheet" type="text/css" />
</head>

    
<script language="javascript">
    var NEW_LOC = "/st/dfst.aspx";


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


<body onLoad="imrimeyredi()" class="imprimir" >
<table width="600" align="center">
  <tr>
  <td width="464"><img src="imagenes/logo.jpg" width="279" height="74" /></td>
  <td width="124"><p class="cuerpob" style="text-align: right"></p>&nbsp;</td>
</tr>
  <tr>
    <td colspan="2" align="center">&nbsp;</td>
  </tr>
  <tr><td colspan="2" align="center"><p class="titulo">Orden de Entrega Nº: <%=idOrdenEntrega %> - Deposito: <%= deposito %> - Coche: <%=idCoche %> </p>

</td></tr>
  <tr>
    <td colspan="2" align="center">&nbsp;</td>
  </tr>
</table>

<table width="600" align="center" cellspacing="0" cellpadding="3">
    <TBODY>

<!--//titulo -->

  <TR>
     <TD  height=20 colspan="2" align="right" class="bordetituloi">
      <P align="left" class=cuerpo>Fecha: <%=fecha %></P>      </TD><TD width="160"  height=20 align=right class="bordefull">
      <P align="center" class=cuerpo>Hora: <%=hora %></P>
      </TD>
    <TD width=116 class="bordefull"><p align="left" class="cuerpo">OR: <%=nroOrden %></p></TD>
    <TD width=181 class="bordefull"><P align="center" class=cuerpo>Usuario: <%=usuario %></P></TD>
  </TR>
  <TR>
    <TD align="right"  class="bordefull" colspan="3" height=20><p align="left" class="cuerpo">Fecha Cierre:&nbsp; <%=fechaCierre %> - <%=horaCierre %>
    </p></TD>
   
    <TD colspan="2"  class="bordefull" height=20><p align="left" class="cuerpo">
    Pañol: <%=panol %> - Mecanico: <%=mecanico %>
    </p></TD>
  </TR>

    <TR>
    <TD align=right   class="bordefull" width=116  height=20>
      <P class=cuerpo>Observaciones&nbsp;</P></TD>
    <TD colspan="4" class="bordefull"  height=60><span class="cuerpo">

<!--//en la caja de texto (CODIGO) se inputara... -->
    <P class=cuerpo><%=observaciones %> </P>   
    </span></TD>
    </TR>
  <TR>
    <TD  colSpan=2 height=5><SPACER height="1" 
      width="1" type="block"></TD></TR>
  
  <TR align="center">
    <TD height="89" colSpan=8>
	





        <asp:Repeater ID="Repeater1" runat="server">
        <HeaderTemplate>
         <table width="100%" border="0" cellspacing="0" cellpadding="3">
              <tr>
	             <td align="middle" class="bordefull" height="23"><p align="center" class="chico">Codigo</p></td>     
                 <td align="middle" class="bordefull"><p align="center" class="chico">Repuesto</p></td>
                 <td height="23" align="middle" class="bordefull"><p align="center" class="chico">Cant.</p></td>
                 <td height="23" align="middle" class="bordefull"><p align="center" class="chico">Partida</p></td>
                 <td height="23" align="middle" class="bordefull"><p align="center" class="chico">Ubicacion</p></td>
              </tr>
        </HeaderTemplate>
        <ItemTemplate>
         <TR>
	        <TD align=center width=40  class="bordefull" >
                <P class=cuerpo><asp:Label runat="server" ID="Label1" Text='<%# Eval("codRepuesto") %>' /></P>
	        </TD>
            <td align="center" width="*" class="bordefull" >
                <p class="cuerpo"><asp:Label runat="server" ID="Label2" Text='<%# Eval("Desc_Repuesto") %>' /></p>
            </td>  
            <td align="center" width="40" class="bordefull" >
                <P class="cuerpo"><asp:Label runat="server" ID="Label3" Text='<%# Eval("cant") %>' /></P>
            </td>
            <td align="center" width="60" class="bordefull">
                <p class="cuerpo"><asp:Label runat="server" ID="Label5" Text='<%# Eval("nroPartida") %>' /></p>
            </td>
            <td align="center" width="102" class="bordefull">
                <p class="cuerpo"><asp:Label runat="server" ID="Label6" Text='<%# Eval("ubicacion") %>' /></p>
            </td>
        </TR>
        </ItemTemplate>
       
        <FooterTemplate>
          </table>
        </FooterTemplate>
      </asp:Repeater>

</TD>
  </TR>
  <tr>
  <td colspan="6">
  <table width="100%">
    
    <TR>
    <TD align=left   class="bordefull" width="50%">
      <P class=cuerpo>Mecánico&nbsp;</P></TD>
    <TD colspan="4" class="bordefull">
        <P class=cuerpo>Pañol&nbsp;</P></TD>
    </TD>
    </TR>
    <TR>
    <TD align=left   class="bordefull" width="50%"  height=20>
      <P class=cuerpo>Firma&nbsp;</P></TD>
    <TD colspan="4" class="bordefull"  height=60>
        <P class=cuerpo>Firma&nbsp;</P></TD>
    </TD>
    </TR>
    <TR>
    <TD align=left   class="bordefull" width=116  height=20>
      <P class=cuerpo>Aclaracion&nbsp;</P>
    </TD>
    <TD colspan="4" class="bordefull"  height=60>
        <P class=cuerpo>Aclaracion&nbsp;</P>
    </TD>
    </TR>
  </table>
  </td>
  </tr>
  
</table>


</TD>
<TD width="10">&nbsp;</TD>
  </TR>
  </TBODY>

</TABLE>

</body>

</html>
