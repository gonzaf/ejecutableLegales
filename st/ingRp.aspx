<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/st/SiteST.master" CodeBehind="ingRp.aspx.vb" Inherits="Dynamic_Data.ingRp" %>

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
                                        <span class="label bg-danger pull-right">Transferencia</span>
                                        <div class="form-inline">
                                            Transferencia a Deposito Satelite&nbsp;&nbsp; 
                                        </div>
                                    </header>
                                    <div class="panel-body" style="padding: 10px 30px 10px 30px">


                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-6">
                                                    <label for="ddDeposito">Deposito Origen</label><asp:DropDownList ID="ddDeposito" CssClass="form-control input-sm entTab" data-next="ddMecanico" ClientIDMode="Static" runat="server" DataTextField="Deposito" DataValueField="idDeposito" OnSelectedIndexChanged="ddDeposito_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                </div>
                                                <div class="col-sm-6">
                                                    <label for="ddDepositoDestino">Deposito Destino</label><asp:DropDownList ID="ddDepositoDestino" CssClass="form-control input-sm entTab" data-next="ddMecanico" ClientIDMode="Static" runat="server" DataTextField="Deposito" DataValueField="idDeposito" OnSelectedIndexChanged="ddDeposito_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
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
                                                  
                                                </div>
                                                <div class="col-sm-10">
                                                    <label for="autoCompleteProductos">Buscar</label>
                                                    <asp:TextBox ID="autoCompleteProductos" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                                    <asp:Button ID="Button1" ClientIDMode="Static" runat="server" Style="display: none" Text="" Display="Dynamic" />
                                                      <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Font-Bold="true" CssClass="DDValidator" Display="Dynamic" />
                                                    <asp:CustomValidator ID="CustomValidator1" runat="server" Visible="false" ErrorMessage="CustomValidator" Display="Dynamic"> </asp:CustomValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-10">
                                                    <label for="descripcion">Descripcion</label>
                                                    <asp:TextBox ID="descripcion" ClientIDMode="Static" runat="server" CssClass="form-control input-sm" Enabled="false"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-2">
                                                    <label for="stock">Stock</label>
                                                    <asp:TextBox ID="stock" runat="server" Enabled="false" CssClass="form-control input-sm"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-6">
                                                    <label for="descripcion">Pre.Ult.Compra</label>
                                                    <asp:TextBox ID="pUltCompra" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-6">
                                                    <label for="pLista">Cod.Proveedor</label>
                                                    <asp:TextBox ID="codProveedor" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
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
                                                    <label for="detalle">Partida</label>
                                                    <asp:TextBox ID="partida" runat="server" ClientIDMode="Static" data-next="ubicacion" data-button="buttonPrecio" CssClass="form-control input-sm clickButton entTab" Text=""></asp:TextBox>

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
                                                    <asp:Button ID="cancelar" runat="server" Enabled="true" Text="Volver" Visible="true" CssClass="btn btn-white btn-xs" />
                                                    <asp:Button ID="Enviar" runat="server" Enabled="true" Text="Enviar" Visible="true" CssClass="btn btn-primary btn-xs" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </section>
                            </div>
                        </section>


                    </div>

                    <div class="col-sm-7">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Repuestos</span>
                                        Repuestos A Transferir
                                    </header>
                                    <div>
                                        <asp:GridView ID="GridView1" runat="server" ShowFooter="true" AutoGenerateColumns="False" DataKeyNames="idMov" OnRowDeleting="GridView1_RowDeleting" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender">
                                            <Columns>
                                                <asp:BoundField DataField="codRepuesto" HeaderText="Codigo" SortExpression="codRepuesto" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                </asp:BoundField>

                                                <asp:BoundField DataField="Desc_Repuesto" HeaderText="Repuesto" SortExpression="Desc_Repuesto" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                </asp:BoundField>

                                                <asp:BoundField DataField="nroPartida" HeaderText="#Partida" SortExpression="nroPartida" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                </asp:BoundField>

                                                <asp:BoundField DataField="cant" HeaderText="Cant." SortExpression="cant" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                </asp:BoundField>

                                               
                                                <asp:CommandField ShowDeleteButton="True" DeleteText="Borrar" ItemStyle-HorizontalAlign="Center" />

                                            </Columns>

                                            <RowStyle CssClass="td"></RowStyle>
                                        </asp:GridView>


                                        <%-- <asp:LinqDataSource ID="gridDataSource" runat="server" ContextTypeName="gLinq.StockDataContext" EntityTypeName="" TableName="DetalleFactura" EnableDelete="True" EnableUpdate="True" Where="idFactura == @idFactura">
                                            <WhereParameters>
                                                <asp:Parameter DefaultValue="1" Name="idFactura" Type="Int32" />
                                            </WhereParameters>

                                        </asp:LinqDataSource>--%>



                                        <%--<input id="basics" />--%>
                                        <%-- <div id="the-basics">
                                            <input class="typeahead" type="text" placeholder="States of USA">
                                        </div>--%>
                                        <%-- <select class="js-data-example-ajax">
                                            <option value="3620194" selected="selected">select2/select2</option>
                                        </select>--%>
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
