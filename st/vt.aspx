<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/st/SiteST.master" CodeBehind="vt.aspx.vb" Inherits="Dynamic_Data.vt" %>

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
                                        <span class="label bg-danger pull-right">Orden de Entrega</span>
                                        <div class="form-inline">
                                            Orden de Entrega&nbsp;&nbsp; 
                                        </div>
                                    </header>
                                    <div class="panel-body" style="padding: 10px 30px 10px 30px">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <div class="col-sm-3">
                                                    <label for="empresa">Empresa</label><asp:TextBox ID="tbEmpresa" runat="server" CssClass="form-control input-sm" Enabled="false"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-3">
                                                    <label for="empresa">Nro.Or</label><asp:TextBox ID="tbIdOrden" runat="server" CssClass="form-control input-sm" Enabled="false"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-3">
                                                    <label for="empresa">Interno</label><asp:TextBox ID="tbInterno" runat="server" CssClass="form-control input-sm" Enabled="false"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-3">
                                                    <label for="empresa">Linea</label><asp:TextBox ID="tbLinea" runat="server" CssClass="form-control input-sm" Enabled="false"></asp:TextBox>
                                                </div>

                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-4">
                                                    <label for="fecha">Fecha OE</label>
                                                    <asp:TextBox ID="tbFecha" ClientIDMode="Static" runat="server" Enabled="false" CssClass="input-sm form-control" type="text"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-4">
                                                    <label for="fecha">Fecha cierre OE</label>
                                                    <asp:TextBox ID="tbFechaCierre" autocomplete="off" Enabled="false" ClientIDMode="Static" runat="server" CssClass="input-sm form-control datepicker" data-next="tbHoraCierre" type="text"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-4">
                                                    <label for="fecha">Hora cierre OE</label>
                                                    <asp:TextBox ID="tbHoraCierre" ClientIDMode="Static" Enabled="false" runat="server" CssClass="input-sm form-control" type="text"></asp:TextBox>
                                                </div>

                                            </div>

                                            <div class="form-group">
                                                <div class="col-sm-6">
                                                    <label for="ddDeposito">Deposito</label><asp:DropDownList ID="ddDeposito" CssClass="form-control input-sm entTab" data-next="ddMecanico" ClientIDMode="Static" runat="server" DataTextField="Deposito" DataValueField="idDeposito" AutoPostBack="false"></asp:DropDownList>
                                                </div>
                                                <div class="col-sm-6">
                                                    <label for="ddMecanico">Mecanico</label><asp:TextBox ID="tbMecanico" ClientIDMode="Static" Enabled="false" runat="server" CssClass="input-sm form-control" type="text"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-lg-12">
                                                    <asp:TextBox ID="observaciones" runat="server" class="form-control" placeholder="Detalle" Rows="4" TextMode="MultiLine"></asp:TextBox>

                                                    <%--<textarea id="notas"  class="form-control" data-trigger="keyup" data-rangelength="[20,200]"></textarea>--%>
                                                </div>
                                            </div>



                                            <div class="form-group">
                                                <div class="col-sm-2">
                                                    <label for="tbCodigo">Codigo</label>
                                                    <asp:TextBox ID="tbCodigo" ClientIDMode="Static" data-button="<%=b %>" runat="server" CssClass="form-control input-sm clickButton" Width="70px"></asp:TextBox>
                                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Font-Bold="true" CssClass="DDValidator" Display="Dynamic" />
                                                    <asp:CustomValidator ID="CustomValidator1" runat="server" Visible="false" ErrorMessage="CustomValidator" Display="Dynamic"> </asp:CustomValidator>
                                                </div>
                                                <div class="col-sm-10">
                                                    <label for="autoCompleteProductos">Buscar</label>
                                                    <asp:TextBox ID="autoCompleteProductos" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                                    <asp:Button ID="Button1" ClientIDMode="Static" runat="server" Style="display: none" Text="" Display="Dynamic" />
                                                </div>

                                            </div>

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


                                            <div class="form-group">
                                                <div class="col-sm-4">
                                                    <label for="descripcion">Pre.Ult.Compra</label>
                                                    <asp:TextBox ID="pUltCompra" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-4">
                                                    <label for="pLista">Cod.Proveedor</label>
                                                    <asp:TextBox ID="codProveedor" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="checkbox">
                                                        
                                                        <asp:CheckBox ID="cbCargaContinua" Checked="true" runat="server" Text="Carga Continua" />
                                                    </div>
                                                </div>
                                            </div>


                                            </div>


                                            <div class="form-group">
                                                <div class="col-sm-2">
                                                    <label for="cant">Cantidad</label>
                                                    <asp:TextBox ID="cant" runat="server" ClientIDMode="Static" data-next="ddUbicacion" CssClass="form-control input-sm clickButton entTab" Text="1"></asp:TextBox>
                                                </div>

                                                <div class="col-sm-6">
                                                    <label for="precio">Ubicacion</label>
                                                    <asp:DropDownList ID="ddUbicacion" CssClass="form-control input-sm entTab" data-next="partida" ClientIDMode="Static" runat="server" DataTextField="Ubicacion" DataValueField="idUbicacion" AutoPostBack="false"></asp:DropDownList>

                                                </div>
                                                <div class="col-sm-4">
                                                    <label for="detalle">Partida</label>
                                                    <asp:TextBox ID="partida" runat="server" ClientIDMode="Static" data-next="ubicacion" data-button="buttonPrecio" CssClass="form-control input-sm clickButton entTab" Text=""></asp:TextBox>
                                                    <asp:Button ID="buttonPrecio" OnClick="buttonPrecio_Click" ClientIDMode="Static" runat="server" Style="display: none" Text="" Display="Dynamic" />
                                                </div>


                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <div class="col-lg-12 ">
                                                <asp:Button ID="terminar" runat="server" Text="Cerrar Orden" OnClientClick="return finalizar();" Visible="false" CssClass="btn btn-primary btn-xs" />
                                                <asp:Button ID="guardar" runat="server" Text="Continuar luego" Width="120px" CssClass="btn btn-white btn-xs" />
                                                <asp:Button ID="eliminar" runat="server" Enabled="True" Text="Eliminar" Visible="false" OnClientClick="return eliminar();" CssClass="btn btn-white btn-xs" />
                                                <asp:Button ID="desvincular" runat="server" Enabled="true" Text="Desvincular" Visible="false" CssClass="btn btn-white btn-xs" />
                                                <asp:Button ID="reimprimir" runat="server" Enabled="true" Text="Reimprimir" Visible="false" CssClass="btn btn-white btn-xs" />
                                                <asp:Button ID="cancelar" runat="server" Enabled="true" Text="Cancelar" Visible="true" CssClass="btn btn-white btn-xs" />
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
                                        Repuestos Utilizados
                                    </header>
                                    <div>
                                        <asp:GridView ID="GridView1" runat="server" ShowFooter="true" AutoGenerateColumns="False" DataKeyNames="idDetalle" OnRowDeleting="GridView1_RowDeleting" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender">
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

                                                <asp:BoundField DataField="Ubicacion" HeaderText="Ubicacion" SortExpression="Ubicacion" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
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

                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Repuestos</span>
                                        Items Iniciados
                                    </header>
                                    <div>
                                        <asp:GridView ID="gvPartes" runat="server" DataKeyNames="id" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Fecha Inicio" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="120px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Format(Eval("fechaInicio"), "dd/MM/yy HH:mm")%>'></asp:Label>
                                                        <asp:HiddenField ID="hfId" ClientIDMode="Static" runat="server" Value='<%# Eval("id")%>' />
                                                        <asp:HiddenField ID="hfResultado" ClientIDMode="Static" runat="server" Value='<%# Eval("resultado")%>' />
                                                        <asp:HiddenField ID="hfOrigen" ClientIDMode="Static" runat="server" Value='<%# Eval("origen")%>' />
                                                        <%--  <asp:HiddenField ID="idEstado" ClientIDMode="Static" runat="server" Value='<%# Eval("idEstado")%>' />
                                                            <asp:HiddenField ID="idCubierta" ClientIDMode="Static" runat="server" Value='<%# Eval("idPartidaSacada")%>' />
                                                            <asp:HiddenField ID="nroOrden" ClientIDMode="Static" runat="server" Value='<%# Eval("nroOrden")%>' />--%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="mTareas.descripcion" HeaderText="Tarea" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                <%--<asp:BoundField DataField="deposito" HeaderText="Deposito" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="tipo" HeaderText="Cubierta" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="estado" HeaderText="Estado" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="nroPartida" HeaderText="Partida" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="Accion" HeaderText="Accion" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>--%>
                                                <%--<asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="cb" Text="Enviar" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>





                                                <asp:TemplateField HeaderText="Detalle" HeaderStyle-Width="300" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="detalle" runat="server" Enabled="false" Text='<%# Eval("obs")%>' CssClass="form-control input-sm entTab"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                            </Columns>
                                        </asp:GridView>



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
