<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/st/SiteST.master"
    CodeBehind="detalle.aspx.vb" Inherits="Dynamic_Data.DetalleNecesidadCompra" %>

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

        .flex {
            display: flex;
        }

        .flex-end {
            justify-content: end;
        }

        .flex-align-bottom {
            align-items: flex-end;
        }

        .margin-1-rem {
            margin: 1rem;
        }

        .flex-column {
            flex-direction: column;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="gLinq.StockDataContext"
        EntityTypeName="" OrderBy="Nombre" TableName="Personas">
    </asp:LinqDataSource>



    <section id="content">
        <section class="main padder">
            <form id="form2" runat="server">
                <input type="hidden" id="imprimir" name="imprimir" value="true" />
                <div class="row no-gutter">

                    <div class="row">
                        <div class="panel-body">
                            <section class="panel">
                                <header class="panel-heading">
                                    <div class="form-inline"><b>Detalle Necesidad de Compra</b></div>
                                </header>
                                <div class="panel-body" style="padding: 10px 30px 10px 30px">
                                    <div class="form-horizontal">

                                        <div class="form-group flex flex-column">

                                            <div class="flex">
                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Necesidad Número°</label>
                                                    <asp:TextBox ID="numero" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>

                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Fecha</label>
                                                    <asp:TextBox ID="fecha" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>
                                  
                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Depósito</label>
                                                    <asp:TextBox ID="deposito" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>

                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Usuario</label>
                                                    <asp:TextBox ID="usuario" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>
                                            </div>

                                            <div>
                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Observaciones</label>
                                                    <asp:TextBox ID="observaciones" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control" Rows="5" TextMode="MultiLine">
                                                    </asp:TextBox>
                                                </div>
                                            </div>


                                        </div>


                                    </div>
                                </div>

                            </section>
                        </div>
                    </div>

                              <div class="row">
                                          <div class="panel-body">
                                                <section class="panel">
                                                      <header class="panel-heading"><b>Artículos</b></header>
                                                      <div>
                                                            <asp:GridView ID="GridViewArticulos" runat="server"
                                                                  ShowFooter="true" AutoGenerateColumns="False"
                                                                  DataKeyNames="idNecesidad"
                                                                  CssClass="table table-striped m-b-none text-small"
                                                                  BorderStyle="None" GridLines="None"
                                                                  OnPreRender="GVPreRender">

                                                                  <Columns>

                                                                        <asp:BoundField DataField="id"
                                                                              HeaderText="IdDetalle"
                                                                              SortExpression="id"
                                                                              HeaderStyle-CssClass="text-center"
                                                                              ItemStyle-HorizontalAlign="Center">
                                                                              <HeaderStyle HorizontalAlign="Center">
                                                                              </HeaderStyle>
                                                                        </asp:BoundField>

                                                                        <asp:BoundField DataField="idArticulo"
                                                                              HeaderText="Código de Artículo"
                                                                              SortExpression="idArticulo"
                                                                              HeaderStyle-CssClass="text-center"
                                                                              ItemStyle-HorizontalAlign="Center">
                                                                              <HeaderStyle HorizontalAlign="Center">
                                                                              </HeaderStyle>
                                                                        </asp:BoundField>

                                                                        <asp:BoundField DataField="Articulo"
                                                                              HeaderText="Artículo"
                                                                              SortExpression="Articulo"
                                                                              HeaderStyle-CssClass="text-center"
                                                                              ItemStyle-HorizontalAlign="Center">
                                                                              <HeaderStyle HorizontalAlign="Center">
                                                                              </HeaderStyle>
                                                                        </asp:BoundField>


                                                                        <asp:BoundField DataField="cantidad"
                                                                              HeaderText="Cantidad"
                                                                              SortExpression="cantidad"
                                                                              HeaderStyle-CssClass="text-center"
                                                                              ItemStyle-HorizontalAlign="Center">
                                                                              <HeaderStyle HorizontalAlign="Center">
                                                                              </HeaderStyle>
                                                                        </asp:BoundField>


                                                                        <asp:BoundField DataField="TipoDetalle"
                                                                              HeaderText="Tipo"
                                                                              SortExpression="TipoDetalle"
                                                                              HeaderStyle-CssClass="text-center"
                                                                              ItemStyle-HorizontalAlign="Center">
                                                                              <HeaderStyle HorizontalAlign="Center">
                                                                              </HeaderStyle>
                                                                        </asp:BoundField>


                                                                  </Columns>

                                                                  <RowStyle CssClass="td"></RowStyle>
                                                            </asp:GridView>

                                                      </div>
                                                </section>
                                          </div>
                                    </div>

                    <div class="flex flex-end">
                        <div>

                            <asp:Button ID="bReimrimir" runat="server" Text="Reimprimir"
                                CssClass="btn btn-primary"
                                Style="color: #242424; cursor: pointer;" />


                            <asp:Button ID="volver" runat="server" Text="Volver"
                                CssClass="btn btn-primary"
                                Style="color: #242424; cursor: pointer;" />

                             
                        </div>
                    </div>
                </div>


            </form>
        </section>
    </section>



    <script>


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
