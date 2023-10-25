<%@ Page Title="" Language="vb" AutoEventWireup="false" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/st/SiteST.master" CodeBehind="st.aspx.vb" Inherits="Dynamic_Data.st" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <section id="content">
        <section class="main padder">
            <form id="form1" runat="server">
                <div class="row no-gutter">

                    <div class="col-sm-12">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Stock Actual</span>
                                        <div class="form-inline">
                                            Stock Actual
                                            <asp:HiddenField runat="server" ID="muestraModal" EnableViewState="true" Value="false" ClientIDMode="Static" />
                                            <asp:TextBox ID="tbCodigo" autocomplete="off" CssClass="form-control input-sm clickbutton" data-button="buttonBuscar" Width="70" placeholder="# Rep." runat="server"></asp:TextBox>
                                            <asp:TextBox ID="tbDescripcion" autocomplete="off" CssClass="form-control input-sm clickbutton" Width="100" data-button="buttonBuscar" placeholder="Desc.Repuesto" runat="server"></asp:TextBox>
                                            <asp:DropDownList ID="ddRubro" AppendDataBoundItems="true" runat="server" AutoPostBack="true" CssClass="form-control input-sm entTab" DataTextField="descRubro" DataValueField="codRubro">
                                                <asp:ListItem Text="Todos" Selected="True" Value="-1"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddDepositos" AppendDataBoundItems="true" runat="server" AutoPostBack="true" CssClass="form-control input-sm entTab" DataTextField="Deposito" DataValueField="idDeposito">
                                                <asp:ListItem Text="Todos" Value="-1"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:CheckBox runat="server" ID="cbAgrupar" Text="Agrupar Por Articulo" />

                                            <asp:Button ID="buttonBuscar" OnClick="buttonBuscar_Click" ClientIDMode="Static" runat="server" Text="Buscar" Display="Dynamic" />
                                        </div>
                                    </header>


                                    <section style="//height: 200px" class="panel-body scrollbar scroll-y m-b">
                                        <div class="panel">
                                            <span runat="server" id="mostrarError" visible="false" class="label bg-danger pull-right">No tiene permisos</span>

                                            <asp:GridView ID="gvStockTotal" runat="server" DataKeyNames="codRepuesto" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnSelectedIndexChanged="gvPartes_SelectedIndexChanged" OnPreRender="GVPreRender">
                                                <Columns>

                                                    <asp:TemplateField HeaderText="Repuesto" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Label ID="dfdfdf" runat="server" Text='<%# Eval("codRepuesto")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Descripcion" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" SortExpression="Desc_Repuesto">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label23231" runat="server" Text='<%# Eval("DescRepuesto")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="30px"></HeaderStyle>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="stock" HeaderStyle-Width="30px" HeaderText="Cant." ItemStyle-HorizontalAlign="center" HeaderStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="cod_rubro" />
                                                    <asp:BoundField DataField="descrubro" HeaderText="Rubro" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="desc_rubro" />
                                                    <asp:BoundField DataField="precioUltCompra" HeaderText="P.Ult.Compra" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="desc_rubro" />


                                                    <%--<asp:BoundField DataField="observaciones" HeaderText="Obs." ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="desc_subrubro"/>--%>
                                                </Columns>
                                            </asp:GridView>

                                            <asp:GridView ID="gvStockXdeposito" runat="server" DataKeyNames="codRepuesto" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnSelectedIndexChanged="gvPartes_SelectedIndexChanged" OnPreRender="GVPreRender">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Repuesto" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:HyperLink NavigateUrl='<%# String.Concat("/st/cMvs.aspx?rep=", Eval("codRepuesto"), "&dep=", Eval("idDeposito")) %>' ID="foto" runat="server"><%# Eval("codRepuesto")%></asp:HyperLink>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Descripcion" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" SortExpression="Desc_Repuesto">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label23231" runat="server" Text='<%# Eval("DescRepuesto")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="30px"></HeaderStyle>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="stock" HeaderStyle-Width="30px" HeaderText="Cant." ItemStyle-HorizontalAlign="center" HeaderStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="cod_rubro" />
                                                    <asp:BoundField DataField="descrubro" HeaderText="Rubro" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="desc_rubro" />
                                                    <asp:BoundField DataField="deposito" HeaderText="Deposito" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="desc_rubro" />
                                                    <asp:BoundField DataField="precioUltCompra" HeaderText="P.Ult.Compra" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="desc_rubro" />

                                                    <%-- <asp:TemplateField HeaderText="Foto" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:HyperLink NavigateUrl='<%# String.Concat("/docs/fotosRepuestos/", Eval("foto")) %>' Target="_blank" ID="foto" runat="server"><%# IIf(Eval("foto") <> "", "Ver Foto", "")%></asp:HyperLink>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>

                                                    <%--<asp:BoundField DataField="observaciones" HeaderText="Obs." ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="desc_subrubro"/>--%>
                                                </Columns>
                                            </asp:GridView>


                                            <asp:GridView ID="gvStockPorArticuloTotal" runat="server" DataKeyNames="idArticulo" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnSelectedIndexChanged="gvPartes_SelectedIndexChanged" OnPreRender="GVPreRender">
                                                <Columns>

                                                    <asp:TemplateField HeaderText="Articulo" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Label ID="dfdfdf" runat="server" Text='<%# Eval("idArticulo")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Descripcion" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" SortExpression="Desc_Repuesto">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label23231" runat="server" Text='<%# Eval("articulo")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="30px"></HeaderStyle>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="stock" HeaderStyle-Width="30px" HeaderText="Cant." ItemStyle-HorizontalAlign="center" HeaderStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="cod_rubro" />
                                                    <asp:BoundField DataField="descrubro" HeaderText="Rubro" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="desc_rubro" />
                                                    <asp:BoundField DataField="precioUltCompra" HeaderText="P.Ult.Compra" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="desc_rubro" />
                                                    <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lbIngresar" ToolTip="Ingresar" OnCommand="lbIngresar_Command" CommandArgument='<%# String.Concat(Eval("idArticulo"), "/", "", "/", "") %>' runat="server">Desagrupar</asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <%--<asp:BoundField DataField="observaciones" HeaderText="Obs." ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="desc_subrubro"/>--%>
                                                </Columns>
                                            </asp:GridView>

                                            <asp:GridView ID="gvStockPorArticuloPorDeposito" runat="server" DataKeyNames="idArticulo" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnSelectedIndexChanged="gvPartes_SelectedIndexChanged" OnPreRender="GVPreRender">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Articulo" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="foto" runat="server"><%# Eval("idArticulo")%></asp:HyperLink>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Descripcion" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" SortExpression="articulo">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label23231" runat="server" Text='<%# Eval("articulo")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="30px"></HeaderStyle>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="stock" HeaderStyle-Width="30px" HeaderText="Cant." ItemStyle-HorizontalAlign="center" HeaderStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="cod_rubro" />
                                                    <asp:BoundField DataField="descrubro" HeaderText="Rubro" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="desc_rubro" />
                                                    <asp:BoundField DataField="deposito" HeaderText="Deposito" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="desc_rubro" />
                                                    <asp:BoundField DataField="precioUltCompra" HeaderText="P.Ult.Compra" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="desc_rubro" />
                                                    <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lb2Ingresar" ToolTip="Ingresar" OnCommand="lbIngresar_Command" CommandArgument='<%# String.Concat(Eval("idArticulo"), "/", Eval("idDeposito")) %>' runat="server">Desagrupar</asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <%-- <asp:TemplateField HeaderText="Foto" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:HyperLink NavigateUrl='<%# String.Concat("/docs/fotosRepuestos/", Eval("foto")) %>' Target="_blank" ID="foto" runat="server"><%# IIf(Eval("foto") <> "", "Ver Foto", "")%></asp:HyperLink>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>

                                                    <%--<asp:BoundField DataField="observaciones" HeaderText="Obs." ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="desc_subrubro"/>--%>
                                                </Columns>
                                            </asp:GridView>



                                        </div>


                                    </section>
                                    <%--</div>--%>
                                </section>
                            </div>
                        </section>
                    </div>










                </div>



                <div class="modal fade" id="myModal" data-background="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">Agregar Tarea</h4>
                            </div>
                            <div class="modal-body">


                                <asp:GridView ID="gvDetalle" HeaderStyle-HorizontalAlign="Center" runat="server" DataKeyNames="idOrden" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender">
                                    <Columns>

                                        <asp:BoundField DataField="nroOrden" HeaderText="#Orden"></asp:BoundField>
                                        <asp:TemplateField HeaderText="Fecha" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Format(Eval("fecha"), "dd/MM/yy")%>'></asp:Label>
                                                <%-- <asp:HiddenField ID="hfCant" ClientIDMode="Static" runat="server" Value='<%# Eval("cant")%>' />
                                                            <asp:HiddenField ID="hfidDetalle" ClientIDMode="Static" runat="server" Value='<%# Eval("idMov")%>' />--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--#IIf(Eval("idAccion") = 6 And Eval("preventivo"), "Reajuste Preventivo", Eval("tarea"))--%>
                                        <asp:TemplateField HeaderText="Tarea" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="Label222" runat="server" Text='<%#IIf(Eval("idAccion") = 6 And Eval("preventivo"), IIf(Not Eval("observaciones") Is Nothing AndAlso Eval("observaciones").ToString.Contains("Alerta") = True, "Reajuste Un", "Reajuste Preventivo"), Eval("tarea")) %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="Interno" HeaderText="Interno"></asp:BoundField>


                                    </Columns>
                                </asp:GridView>



                            </div>
                            <div class="modal-footer">
                                <%--   <asp:Button ID="bCancelarAgregar"  CssClass="btn btn-default btn-xs" OnClientClick="verificar()" ClientIDMode="Static" runat="server" Text="Cancelar" Display="Dynamic" />
                                <asp:Button ID="bGuardarAgregar" CssClass="btn btn-primary btn-xs" ClientIDMode="Static" runat="server" Text="Guardar" Display="Dynamic" />--%>
                            </div>
                        </div>
                    </div>
                </div>






            </form>
        </section>
    </section>












    <script>

        if ($('#muestraModal').val() == 'true') {
            $('#myModal').modal('show');
        }


        $('#muestraModal').val('false');


        var objDiv = document.getElementById("divCaja");
        //objDiv.scrollTop = objDiv.scrollHeight;



        //  $("#fechaCaja").datepicker({ format: 'dd/mm/yy' })
        //  .on('changeDate', function (ev) {
        //      $(this).datepicker('hide');
        //      $("#buttonFechaCaja").click();
        //  });

        //  $("#fechaVentas").datepicker({ format: 'dd/mm/yy' })
        //.on('changeDate', function (ev) {
        //    $(this).datepicker('hide');
        //    $("#buttonFechaVentas").click();
        //});




    </script>
</asp:Content>
