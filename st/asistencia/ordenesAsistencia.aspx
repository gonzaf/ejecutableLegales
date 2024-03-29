﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/st/SiteST.master"
    EnableEventValidation="false" CodeBehind="ordenesAsistencia.aspx.vb" Inherits="Dynamic_Data.OrdenesAsistencia" %>

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

        .flex-column {
            flex-direction: column;
        }

        .flex-end {
            justify-content: end;
        }

        .flex-align-bottom {
            align-items: flex-end;
        }

        .flex-align-center {
            justify-content: center;
        }

        .flex-space-between {
            justify-content: space-between;
        }

        .flex-wrap {
            flex-wrap: wrap;
        }

        .margin-1-rem {
            margin: 1rem;
        }

        .hidden {
            display: none;
        }

        .green-badge {
            color: black;
            background-color: lightyellow;
            border-radius: 5px;
            padding: 0 5px 0 15px;
            font-weight: bold;
        }

        .red-badge {
            color: black;
            background-color: lightcoral;
            border-radius: 5px;
            padding: 0 5px 0 15px;
            font-weight: bold;
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
                                    <div class="flex flex-space-between">

                                        <div class="flex flex-align-bottom flex-wrap">

                                            <div class="col margin-1-rem">
                                                <label class="col control-label">Interno</label>
                                                <div class="col">
                                                    <asp:TextBox ID="interno"
                                                        runat="server"
                                                        AutoCompleteType="Disabled"
                                                        ClientIDMode="Static"
                                                        data-next="mecanico"
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

                                            <div class="col margin-1-rem">
                                                <asp:Button ID="btn_buscar"
                                                    runat="server"
                                                    ControlStyle-CssClass="btn btn-primary"
                                                    Style="color: #242424;"
                                                    Text="Buscar"
                                                    CommandName="buscar" />
                                            </div>

                                        </div>
                                        <div class="flex flex-column flex-align-center">
                                            <p class="green-badge">Ordenes Asistencia en Curso: <%= cantidadOrdenesAsistencia %></p>
                                            <p class="red-badge">Quedos Pendientes: <%= cantidadQuedosPendientes %></p>
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
                                            SortExpression="fecha"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>

                                        <asp:BoundField DataField="Id"
                                            HeaderText="Nro OA"
                                            SortExpression="Id"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>

                                        <asp:BoundField DataField="mTipoOrdenAsistencia.Codigo"
                                            HeaderText="Tipo"
                                            SortExpression="Tipo"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>

                                        <asp:BoundField DataField="Interno"
                                            HeaderText="Interno"
                                            SortExpression="Interno"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>


                                        <asp:BoundField DataField="tCabecera.Nombre"
                                            HeaderText="Cabecera"
                                            SortExpression="Cabecera"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>


                                        <asp:BoundField DataField="LegajoChofer" HeaderText="Chofer"
                                            SortExpression="fechaCierre"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>Nro. OR Asociada</HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Button ID="btn_or" runat="server" ControlStyle-CssClass="btn btn-xs"
                                                    Style="color: #242424;" Text='<%# Eval("IdOrdenReparacion") %>'
                                                    CommandName="ordenReparacion" CommandArgument='<%# Eval("IdOrdenReparacion") %>' Visible='<%# IIf(Eval("IdOrdenReparacion") = 0, False, True) %>'/>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                 <%--       <asp:BoundField DataField="mEstadoOrdenAsistencia.Codigo" HeaderText="Estado"
                                            SortExpression="Estado"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>--%>


                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button ID="btn_detalle"
                                                    runat="server"
                                                    ControlStyle-CssClass="btn btn-xs"
                                                    Style="color: #242424;"
                                                    Text="Editar"
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

                        </div>
                    </div>

                    <div class="row">
                        <div class="panel-body">
                            <section class="panel">
                                <header class="panel-heading"><b>Quedos Pendientes</b></header>


                                <asp:GridView ID="GridViewQuedos" runat="server"
                                    ShowFooter="true" AutoGenerateColumns="False"
                                    DataKeyNames="Id"
                                    CssClass="table table-striped m-b-none text-small"
                                    BorderStyle="None" GridLines="None"
                                    OnPreRender="GVPreRender">

                                    <Columns>
                                        <asp:BoundField DataField="FechaLlamada" HeaderText="Fecha"
                                            SortExpression="FechaLlamada"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>

                                        <asp:BoundField DataField="Motivo"
                                            HeaderText="Motivo"
                                            SortExpression="Motivo"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>


                                        <asp:BoundField DataField="Interno"
                                            HeaderText="Interno"
                                            SortExpression="Interno"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>


                                        <asp:BoundField DataField="LegajoChofer" HeaderText="Chofer"
                                            SortExpression="fechaCierre"
                                            HeaderStyle-CssClass="text-center"
                                            ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:BoundField>


                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button ID="btn_generar"
                                                    runat="server"
                                                    ControlStyle-CssClass="btn btn-xs btn-warning"
                                                    Style="color: #242424;"
                                                    Text="Generar OA"
                                                    CommandName="generaroa"
                                                    CommandArgument='<%# Eval("id") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>



                                    </Columns>

                                    <RowStyle CssClass="td"></RowStyle>
                                </asp:GridView>

                            </section>
                        </div>
                    </div>

                </div>


            </form>
        </section>
    </section>

    
    <div hidden>
             <asp:GridView ID="GridViewOrdenesDetalle" runat="server"
                                    ShowFooter="true" AutoGenerateColumns="False"
                                    DataKeyNames="Id"
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
