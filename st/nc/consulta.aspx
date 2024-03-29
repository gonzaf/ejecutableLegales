﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/st/SiteST.master"
    EnableEventValidation="false" CodeBehind="consulta.aspx.vb" Inherits="Dynamic_Data.ConsultaNecesidadCompra" %>

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
                                    <div class="form-inline"><b>Consulta Necesidades de Compra</b></div>
                                </header>
                                <div class="panel-body" style="padding: 10px 30px 10px 30px">
                                    <div class="form-horizontal">

                                        <div class="form-group flex flex-align-bottom row">

                                            <div class="col margin-1-rem">
                                                <label class="col control-label">Fecha Desde</label>
                                                <div class="col">
                                                    <asp:TextBox ID="fecha_desde"
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
                                                    <asp:TextBox ID="fecha_hasta"
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
                                                <label class="col control-label">Artículo</label>
                                                <div class="col">
                                                    <asp:TextBox ID="articulo"
                                                        runat="server"
                                                        AutoCompleteType="Disabled"
                                                        ClientIDMode="Static"
                                                        data-next="ddmecanico"
                                                        CssClass="entTab form-control input-sm">
                                                    </asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group flex flex-align-bottom row">

                                            <div class="col margin-1-rem">
                                                <label class="col control-label">Tipo de Necesidad</label>
                                                <div class="col">
                                                    <asp:DropDownList ID="ddtiponecesidad" AppendDataBoundItems="true" runat="server" CssClass="form-control input-sm entTab" DataTextField="Tipo" DataValueField="id">
                                                        <asp:ListItem Text="Seleccionar..." Value="-2" Selected="True"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col margin-1-rem">
                                                <label class="col control-label">Depósito</label>
                                                <div class="col">
                                                    <asp:DropDownList ID="dddeposito" AppendDataBoundItems="true" runat="server" CssClass="form-control input-sm entTab" DataTextField="Deposito" DataValueField="idDeposito">
                                                        <asp:ListItem Text="Seleccionar..." Value="-2" Selected="True"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col margin-1-rem">
                                                <label class="col control-label">Nro. Necesidad</label>
                                                <div class="col">
                                                    <asp:TextBox ID="numeroNecesidad"
                                                        runat="server"
                                                        AutoCompleteType="Disabled"
                                                        ClientIDMode="Static"
                                                        data-next="ddmecanico"
                                                        CssClass="entTab form-control input-sm">
                                                    </asp:TextBox>
                                                </div>
                                            </div>

                                            <%--FIN NUEVOS FILTROS--%>


                                            <div class="col margin-1-rem">
                                                <asp:Button ID="btn_buscar"
                                                    runat="server"
                                                    ControlStyle-CssClass="btn btn-primary"
                                                    Style="color: #242424;"
                                                    Text="Buscar"
                                                    CommandName="buscar" />
                                            </div>

                                            <div class="col margin-1-rem">
                                                <asp:Button ID="btnExport"
                                                    runat="server"
                                                    ControlStyle-CssClass="btn btn-secondary"
                                                    Style="color: #242424;"
                                                    Text="Exportar XLS" />
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
                                <header class="panel-heading"><b>Necesidades de compra</b></header>


                                <asp:GridView ID="GridViewNecesidades" runat="server"
                                    ShowFooter="true" AutoGenerateColumns="False"
                                    DataKeyNames="id"
                                    CssClass="table table-striped m-b-none text-small"
                                    BorderStyle="None" GridLines="None"
                                    OnPreRender="GVPreRender">

                                    <Columns>

                                        <asp:BoundField DataField="nro"
                                            HeaderText="Número"
                                            SortExpression="nro"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>

                                        <asp:BoundField DataField="fecha" HeaderText="Fecha"
                                            SortExpression="fecha"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>

                                        <asp:BoundField DataField="Usuario"
                                            HeaderText="Usuario"
                                            SortExpression="Usuario"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>

                              <%--          <asp:BoundField DataField="observaciones"
                                            HeaderText="Observaciones"
                                            SortExpression="observaciones"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>--%>

                                        <asp:BoundField DataField="Deposito"
                                            HeaderText="Depósito"
                                            SortExpression="Deposito"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>

      <%--                                  <asp:BoundField DataField="confirmada"
                                            HeaderText="Confirmada"
                                            SortExpression="confirmada"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>--%>

                           <%--             <asp:TemplateField>
                                            <HeaderTemplate>Confirmada</HeaderTemplate>
                                            <ItemTemplate>
                                                <p><%# IIf(Eval("confirmada") = "True", "SI", "NO") %></p>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>


                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button ID="btn_detalle"
                                                    runat="server"
                                                    ControlStyle-CssClass="btn btn-primary btn-xs"
                                                    Style="color: #242424;"
                                                    Text="Detalle"
                                                    CommandName="detalle"
                                                    CommandArgument='<%# Eval("id") %>' />
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

                        </div>
                    </div>

                </div>


            </form>
        </section>
    </section>



    <div hidden>
             <asp:GridView ID="GridViewNecesidadesDetalle" runat="server"
                                    ShowFooter="true" AutoGenerateColumns="False"
                                    DataKeyNames="Orden"
                                    CssClass="table table-striped m-b-none text-small"
                                    BorderStyle="None" GridLines="None"
                                    OnPreRender="GVPreRender">

                                    <Columns>
                                        <asp:BoundField DataField="fecha" HeaderText="Fecha"
                                            SortExpression="fecha"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>

                                        <asp:BoundField DataField="fechaInicio" HeaderText="FechaInicio"
                                            SortExpression="fechaInicio"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>

                                        <asp:BoundField DataField="Orden"
                                            HeaderText="Orden"
                                            SortExpression="Orden"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>

                                        <asp:BoundField DataField="nroCoche"
                                            HeaderText="Interno"
                                            SortExpression="nroCoche"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>

                                        <asp:BoundField DataField="idLinea"
                                            HeaderText="Linea"
                                            SortExpression="idLinea"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>

                                        <asp:BoundField DataField="Apellido"
                                            HeaderText="Apellido Mecanico"
                                            SortExpression="Apellido"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>

                                        <asp:BoundField DataField="Descripcion" HeaderText="Tarea"
                                            SortExpression="Descripcion"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>

                                        <asp:BoundField DataField="observaciones" HeaderText="Detalle"
                                            SortExpression="observaciones"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>

                                        <asp:BoundField DataField="fechaFin" HeaderText="Fecha Fin"
                                            SortExpression="fechaFin"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>

                                        <asp:BoundField DataField="fechaCierre" HeaderText="Fecha Cierre"
                                            SortExpression="fechaCierre"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>

                                        <asp:BoundField DataField="resultado" HeaderText="Resultado"
                                            SortExpression="resultado"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>

                                        <asp:BoundField DataField="Origen" HeaderText="Origen"
                                            SortExpression="Origen"
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
