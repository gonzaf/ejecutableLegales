<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/st/SiteST.master"
    EnableEventValidation="false" CodeBehind="ordenesAsistenciaCerrada.aspx.vb" Inherits="Dynamic_Data.OrdenesAsistenciaCerrada" %>

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

        .hidden {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="content">
        <section class="main padder">
            <form id="form1" runat="server">
                <input type="hidden" id="imprimir" name="imprimir" value="true" />
                <div class="row no-gutter">

                    <div class="row">
                        <div class="panel-body">

                            <section class="panel">
                                <header class="panel-heading">
                                    <div class="form-inline"><b>Filtrar</b></div>
                                </header>
                                <div class="panel-body" style="padding: 10px 30px 10px 30px">
                                    <div class="form-horizontal">

                                        <div class="form-group flex flex-align-bottom row">

                                            <div class="col margin-1-rem">
                                                <label class="col control-label">Interno</label>
                                                <div class="col">
                                                    <asp:TextBox ID="interno"
                                                        runat="server"
                                                        AutoCompleteType="Disabled"
                                                        ClientIDMode="Static"
                                                        data-next="ddCabeceras"
                                                        CssClass="entTab form-control input-sm">
                                                    </asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col margin-1-rem">
                                                <label class="col control-label">Cabecera</label>
                                                <div class="col">
                                                    <asp:DropDownList ID="ddCabeceras" AppendDataBoundItems="true" runat="server" CssClass="form-control input-sm entTab" DataTextField="Nombre" DataValueField="idCabecera">
                                                        <asp:ListItem Text="Sin filtro" Value="-2" Selected="True"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>

                                            <div class="col margin-1-rem">
                                                <label class="col control-label">Empresa</label>
                                                <div class="col">
                                                    <asp:DropDownList ID="ddEmpresa" AppendDataBoundItems="true" runat="server" CssClass="form-control input-sm entTab" DataTextField="NombreAbreviado" DataValueField="idEmpresa">
                                                        <asp:ListItem Text="Sin filtro" Value="-2" Selected="True"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>

                                            <div class="col margin-1-rem">
                                                <label class="col control-label">Tipo</label>
                                                <div class="col">
                                                    <asp:DropDownList ID="ddTipo" AppendDataBoundItems="true" runat="server" CssClass="form-control input-sm entTab" DataTextField="Label" DataValueField="id">
                                                        <asp:ListItem Text="Sin filtro" Value="-2" Selected="True"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>

                                            <div class="col margin-1-rem">
                                                <label class="col control-label">Chofer</label>
                                                <div class="col">
                                                    <asp:DropDownList ID="ddChofer" AppendDataBoundItems="true" runat="server" CssClass="form-control input-sm entTab" DataTextField="Label" DataValueField="id">
                                                        <asp:ListItem Text="Sin filtro" Value="-2" Selected="True"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>

                                            <div class="col margin-1-rem">
                                                <label class="col control-label">Pérdida Kms</label>
                                                <div class="col">
                                                    <asp:DropDownList ID="ddSiPierdeKms" AppendDataBoundItems="true" runat="server" CssClass="form-control input-sm entTab" DataTextField="Label" DataValueField="id">
                                                        <asp:ListItem Text="Sin filtro" Value="-2" Selected="True"></asp:ListItem>
                                                        <asp:ListItem Text="Con Pérdida" Value="1" Selected="False"></asp:ListItem>
                                                        <asp:ListItem Text="Sin Pérdida" Value="0" Selected="False"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="form-group flex flex-align-bottom row">
                                            <div class="col margin-1-rem">
                                                <label class="col control-label">Fecha Desde</label>
                                                <div class="col">
                                                    <asp:TextBox ID="fechaDesde"
                                                        runat="server"
                                                        AutoComplete="off"
                                                        onkeypress="return false"
                                                        ClientIDMode="Static"
                                                        data-next="fecha_hasta"
                                                        CssClass="entTab form-control datepicker"
                                                        onfocus="this.select()"
                                                        onblur="convert_date(this)">
                                                    </asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col margin-1-rem">
                                                <label class="col control-label">Fecha Hasta</label>
                                                <div class="col">
                                                    <asp:TextBox ID="fechaHasta"
                                                        runat="server"
                                                        AutoComplete="off"
                                                        onkeypress="return false"
                                                        ClientIDMode="Static"
                                                        data-next="coche"
                                                        CssClass="entTab form-control datepicker"
                                                        onfocus="this.select()"
                                                        onblur="convert_date(this)">
                                                    </asp:TextBox>
                                                </div>
                                            </div>


                                            <div class="col margin-1-rem">
                                                <label class="col control-label">Sistema</label>
                                                <div class="col">
                                                    <asp:DropDownList ID="ddSistema" AppendDataBoundItems="true" runat="server" CssClass="form-control input-sm entTab" DataTextField="Descripcion" DataValueField="Id" AutoPostBack="true">
                                                        <asp:ListItem Text="Seleccione Sistema" Value="-2" Selected="True"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col margin-1-rem">
                                                <label class="col control-label">Subsistema</label>
                                                <div class="col">
                                                    <asp:DropDownList ID="ddSubsistema" AppendDataBoundItems="true" runat="server" CssClass="form-control input-sm entTab" DataTextField="Descripcion" DataValueField="Id" AutoPostBack="true">
                                                        <asp:ListItem Text="Seleccione Subsistema" Value="-2" Selected="True"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col margin-1-rem">
                                                <label class="col control-label">Componente</label>
                                                <div class="col">
                                                    <asp:DropDownList ID="ddComponente" AppendDataBoundItems="true" runat="server" CssClass="form-control input-sm entTab" DataTextField="Descripcion" DataValueField="Id" AutoPostBack="true">
                                                        <asp:ListItem Text="Seleccione Componente" Value="-2" Selected="True"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>


                                            <div class="col margin-1-rem">
                                                <asp:Button ID="btn_buscar"
                                                    runat="server"
                                                    ControlStyle-CssClass="btn btn-primary"
                                                    Style="color: #242424;"
                                                    Text="Buscar"
                                                    CommandName="buscar" />
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
                                <header class="panel-heading"><b>Ordenes de Asistencia</b></header>


                                <asp:GridView ID="GridViewOrdenes" runat="server"
                                    ShowFooter="true" AutoGenerateColumns="False"
                                    DataKeyNames="Id"
                                    CssClass="table table-striped m-b-none text-small"
                                    BorderStyle="None" GridLines="None"
                                    OnPreRender="GVPreRender">

                                    <Columns>
                                        <asp:BoundField DataField="fecha" HeaderText="Fecha"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>

                                        <asp:BoundField DataField="Interno"
                                            HeaderText="Interno"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>

                                        <asp:BoundField DataField="Linea"
                                            HeaderText="Línea"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>Chofer</HeaderTemplate>
                                            <ItemTemplate>
                                                <p><%# Eval("LegajoChofer") %> - <%# Eval("ApellidoChofer") %></p>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                       <%-- <asp:BoundField DataField="ApellidoChofer" HeaderText="Chofer"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>--%>

                                        <asp:BoundField DataField="Sistema" HeaderText="Sistema"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>

                                        <asp:BoundField DataField="Subsistema" HeaderText="Subsistema"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>

                                        <asp:BoundField DataField="Componente" HeaderText="Componente"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>

                                        <asp:BoundField DataField="Interno" HeaderText="Interno"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>

                                        <asp:BoundField DataField="NombreCabecera" HeaderText="Cabecera"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>Remolque</HeaderTemplate>
                                            <ItemTemplate>
                                                <p><%# IIf(Eval("Remolque") = 0, "NO", "SI") %></p>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>Pérdida kms</HeaderTemplate>
                                            <ItemTemplate>
                                                <p><%# IIf(Eval("PerdidaKilometros") = 0, "NO", "SI") %></p>
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                        <asp:TemplateField>
                                            <HeaderTemplate>Nro. OR Asociada</HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Button ID="btn_or" runat="server" ControlStyle-CssClass="btn btn-xs"
                                                    Style="color: #242424;" Text='<%# Eval("IdOrdenReparacion") %>'
                                                    CommandName="ordenReparacion" CommandArgument='<%# Eval("IdOrdenReparacion") %>' Visible='<%# IIf(Eval("IdOrdenReparacion") = 0, False, True) %>'/>
                                            </ItemTemplate>
                                        </asp:TemplateField>



                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button ID="btn_detalle"
                                                    Visible='<%# IIf(siTienePermisoParaCorregir Is Nothing, False, True) %>'
                                                    runat="server"
                                                    ControlStyle-CssClass="btn btn-xs"
                                                    Style="color: white; background-color: red;"
                                                    Text="Corregir"
                                                    CommandName="detalle"
                                                    CommandArgument='<%# Eval("Id") %>' />

                                                <asp:Button ID="btn_imprimir"
                                                    runat="server"
                                                    ControlStyle-CssClass="btn btn-xs btn-warning"
                                                    Style="color: #242424;"
                                                    Text="Imprimir"
                                                    CommandName="imprimir"
                                                    CommandArgument='<%# Eval("Id") %>' />

                                            </ItemTemplate>
                                        </asp:TemplateField>



                                    </Columns>

                                    <RowStyle CssClass="td"></RowStyle>
                                </asp:GridView>

                            </section>
                        </div>
                    </div>


                    <div class="flex flex-end">
                        <div>

                            <asp:Button ID="volver" runat="server" Text="Volver"
                                CssClass="btn btn-primary"
                                Style="color: #242424; cursor: pointer;" />  
                            <asp:Button ID="btnExport" runat="server" Text="Exportar"
                                CssClass="btn btn-secondary"
                                Style="color: #242424; cursor: pointer;" />

                        </div>
                    </div>

                </div>


            </form>
        </section>
    </section>
    <div style="display: none">
        <asp:GridView ID="GridToBePrinted" runat="server"
            ShowFooter="true"
            AutoGenerateColumns="False"
            DataKeyNames="Id"
            CssClass="table table-striped m-b-none text-small"
            OnPreRender="GVPreRender">

            <Columns>
                <asp:BoundField DataField="fecha" HeaderText="Fecha"
                    HeaderStyle-CssClass="text-center"
                    ItemStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </asp:BoundField>

                <asp:BoundField DataField="Interno"
                    HeaderText="Interno"
                    HeaderStyle-CssClass="text-center"
                    ItemStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </asp:BoundField>

                <asp:BoundField DataField="Linea"
                    HeaderText="Línea"
                    HeaderStyle-CssClass="text-center"
                    ItemStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </asp:BoundField>


                <asp:BoundField DataField="ApellidoChofer" HeaderText="Chofer"
                    HeaderStyle-CssClass="text-center"
                    ItemStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </asp:BoundField>

                <asp:BoundField DataField="Sistema" HeaderText="Sistema"
                    HeaderStyle-CssClass="text-center"
                    ItemStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </asp:BoundField>

                <asp:BoundField DataField="Subsistema" HeaderText="Subsistema"
                    HeaderStyle-CssClass="text-center"
                    ItemStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </asp:BoundField>

                <asp:BoundField DataField="Componente" HeaderText="Componente"
                    HeaderStyle-CssClass="text-center"
                    ItemStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </asp:BoundField>

                <asp:BoundField DataField="Interno" HeaderText="Interno"
                    HeaderStyle-CssClass="text-center"
                    ItemStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </asp:BoundField>

                <asp:BoundField DataField="NombreCabecera" HeaderText="Cabecera"
                    HeaderStyle-CssClass="text-center"
                    ItemStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </asp:BoundField>

                <asp:TemplateField>
                    <HeaderTemplate>Remolque</HeaderTemplate>
                    <ItemTemplate>
                        <p><%# IIf(Eval("Remolque") = 0, "NO", "SI") %></p>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <HeaderTemplate>Perdida kms</HeaderTemplate>
                    <ItemTemplate>
                        <p><%# IIf(Eval("PerdidaKilometros") = 0, "NO", "SI") %></p>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="IdOrdenReparacion" HeaderText="Nro. OR Asociada"
                    HeaderStyle-CssClass="text-center"
                    ItemStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </asp:BoundField>

                <asp:BoundField DataField="Causa" HeaderText="Causa"
                    HeaderStyle-CssClass="text-center"
                    ItemStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </asp:BoundField>

                <asp:BoundField DataField="OtroMotivo" HeaderText="Otro Motivo"
                    HeaderStyle-CssClass="text-center"
                    ItemStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </asp:BoundField>

                <asp:BoundField DataField="Taller" HeaderText="Taller"
                    HeaderStyle-CssClass="text-center"
                    ItemStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </asp:BoundField>

                <asp:BoundField DataField="Recomendacion" HeaderText="Recomendacion"
                    HeaderStyle-CssClass="text-center"
                    ItemStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </asp:BoundField>
            </Columns>
            <RowStyle CssClass="td"></RowStyle>
        </asp:GridView>
    </div>


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
