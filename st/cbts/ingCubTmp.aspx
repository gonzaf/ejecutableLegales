<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/st/SiteST.master" CodeBehind="ingCubTmp.aspx.vb" Inherits="Dynamic_Data.ingCubTmp" %>

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
                                        <span class="label bg-danger pull-right">Cubiertas</span>
                                        <div class="form-inline">
                                            Ingreso de cubiertas en Stock&nbsp;&nbsp; 
                                        </div>
                                    </header>
                                    <div class="panel-body" style="padding: 10px 30px 10px 30px">


                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-6">
                                                    <label for="ddDeposito">Deposito Origen</label><asp:DropDownList ID="ddDeposito" CssClass="form-control input-sm entTab" data-next="ddMecanico" ClientIDMode="Static" runat="server" DataTextField="Deposito" DataValueField="idDeposito" AutoPostBack="true"></asp:DropDownList>
                                                </div>
                                            </div>

                                        </div>

                                        <%--  <div class="form-group">
                                              <div class="col-lg-12">
                                                    <asp:TextBox ID="observaciones" runat="server" class="form-control" placeholder="Detalle" Rows="4" TextMode="MultiLine"></asp:TextBox>
                                                    
                                                   
                                                </div>
                                            </div>--%>


                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-2">
                                                    <label for="tbCodigo">Codigo</label>
                                                    <asp:TextBox ID="tbCodigo" ClientIDMode="Static" data-button="Button1" runat="server" CssClass="form-control input-sm clickButton" Width="70px"></asp:TextBox>
                                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Font-Bold="true" CssClass="DDValidator" Display="Dynamic" />
                                                    <asp:CustomValidator ID="CustomValidator1" runat="server" Visible="false" ErrorMessage="CustomValidator" Display="Dynamic"> </asp:CustomValidator>
                                                </div>
                                                <div class="col-sm-10">
                                                    <label for="autoCompleteProductos">Buscar</label>
                                                    <asp:TextBox ID="autoCompleteProductos" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                                    <asp:Button ID="Button1" ClientIDMode="Static" runat="server" Style="display: none" Text="" Display="Dynamic" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-10">
                                                    <label for="descripcion">Descripcion</label>
                                                    <asp:TextBox ID="descripcion" ClientIDMode="Static" runat="server" CssClass="form-control input-sm" Enabled="false"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="form-group ">
                                                <div class="col-sm-2">
                                                    <label for="cant">Cantidad</label>
                                                    <asp:TextBox ID="cant" runat="server" ClientIDMode="Static" data-next="partida" CssClass="form-control input-sm clickButton entTab" Text="1"></asp:TextBox>
                                                </div>


                                                <div class="col-sm-6">
                                                    <label for="detalle">Fecha</label>
                                                    <asp:TextBox ID="fecha" runat="server" ClientIDMode="Static" data-next="ubicacion" autocomplete="off" data-button="buttonPrecio" CssClass="form-control input-sm clickButton datepicker entTab" Text=""></asp:TextBox>

                                                </div>
                                                <div class="col-sm-4">
                                                    <label for="buttonPrecio">-</label>
                                                    <asp:Button ID="buttonPrecio" OnClick="buttonPrecio_Click" ClientIDMode="Static" CssClass=" btn form-control btn-primary btn-xs" runat="server" Text="Agregar" />
                                                </div>

                                            </div>
                                        </div>

                                        <div class="row">
                                        </div>
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-12 text-right m-t-large">
                                                    <%--<asp:Button ID="terminar" runat="server" Text="Cerrar Orden" OnClientClick="return finalizar();" Visible="false" CssClass="btn btn-primary btn-xs" />
                                                    <asp:Button ID="guardar" runat="server" Text="Continuar luego" Width="120px" CssClass="btn btn-white btn-xs" />
                                                    <asp:Button ID="eliminar" runat="server" Enabled="True" Text="Eliminar" Visible="false" OnClientClick="return eliminar();" CssClass="btn btn-white btn-xs" />
                                                    <asp:Button ID="desvincular" runat="server" Enabled="true" Text="Desvincular" Visible="false" CssClass="btn btn-white btn-xs" />
                                                    <asp:Button ID="reimprimir" runat="server" Enabled="true" Text="Reimprimir" Visible="false" CssClass="btn btn-white btn-xs" />--%>
                                                  
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
