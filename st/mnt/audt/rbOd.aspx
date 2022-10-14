<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/st/SiteST.master" CodeBehind="rbOd.aspx.vb" Inherits="Dynamic_Data.rbOd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
        }

        .auto-style2 {
            text-align: center;
        }

        .auto-style3 {
            width: 76%;
        }

        .auto-style4 {
            width: 78px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="gLinq.StockDataContext" EntityTypeName="" OrderBy="Nombre" TableName="Personas">
    </asp:LinqDataSource>



    <section id="content">
        <section class="main padder">
            <form id="form2" runat="server">
                <input type="hidden" id="imprimir" name="imprimir" value="true" />
                <div class="row no-gutter">
                    <div class="col-sm-5">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Auditoria</span>
                                        <div class="form-inline">
                                            Raebrir Orden de Mantenimiento&nbsp;&nbsp; 
                                        </div>
                                    </header>
                                    <div class="panel-body" style="padding: 10px 30px 10px 30px">



                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-4">
                                                   <label for="detalle">Nro.Orden</label>
                                                    <asp:TextBox ID="tbCoche" runat="server" ClientIDMode="Static" data-next="ubicacion" data-button="buttonCoche" CssClass="form-control input-sm " Text=""></asp:TextBox>
                                                    
                                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Green" Font-Bold="true" CssClass="DDValidator" Display="Dynamic" />
                                                    <asp:CustomValidator ID="CustomValidator1" runat="server" Visible="false" ErrorMessage="CustomValidator" Display="Dynamic"> </asp:CustomValidator><br />
                                                    <asp:Button ID="buttonPrecio" OnClick="buttonPrecio_Click" ClientIDMode="Static" CssClass=" btn form-control btn-primary btn-xs" runat="server" Text="Reabrir" />
                                                </div>
                                                <div class="col-sm-4">
                                                  
                                                </div>
                                                <div class="col-sm-4">
                                                  
                                                    
                                                    <%--<label for="ddDepositoDestino">Ubicacion 2</label><asp:DropDownList ID="ddUbicacion2" CssClass="form-control input-sm entTab" data-next="ddMecanico" ClientIDMode="Static" runat="server" DataTextField="Deposito" DataValueField="idDeposito" OnSelectedIndexChanged="ddDeposito_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>--%>
                                                </div>
                                            </div>
                                        </div>



                                     
                                    </div>

                                </section>
                            </div>
                        </section>


                    </div>


                </div>


            </form>
        </section>
    </section>



    <script>

        <%If mostrarDialogo Then%>
        $('#myModal').modal('show');
        <%End If%>
        

         <%If controlFocus <> "" Then%>
        setearFoco('<%=controlFocus%>')
         <%End If%>

        function finalizar() {
            var confirma = confirm('Desea cerrar la orden?');
            var imprime = confirm('Queres imprimir?');
            $("#imprimir").val(false);
            if (imprime) $("#imprimir").val(true);
            //alert(imprime);
            //alert($("#imprime").val());
            return confirma;
            //return false;
        }

        function eliminar() {
            var confirma = confirm('Queres eliminar la factura?');
            return confirma;
        }





    </script>

</asp:Content>
