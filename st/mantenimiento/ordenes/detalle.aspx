﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/st/SiteST.master"
    CodeBehind="detalle.aspx.vb" Inherits="Dynamic_Data.DetalleaOrdenes" %>

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
                                    <div class="form-inline"><b>Detalle Orden de Trabajo</b></div>
                                </header>
                                <div class="panel-body" style="padding: 10px 30px 10px 30px">
                                    <div class="form-horizontal">

                                        <div class="form-group flex flex-align-bottom">

                                            <div class="col">
                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Orden n°</label>
                                                    <asp:TextBox ID="Orden" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>

                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Coche</label>
                                                    <asp:TextBox ID="idCoche" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col">
                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Fecha Creación</label>
                                                    <asp:TextBox ID="fecha" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>

                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Fecha Cierre</label>
                                                    <asp:TextBox ID="fechaCierre" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col">
                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Línea</label>
                                                    <asp:TextBox ID="idLinea" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>

                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Mecanico</label>
                                                    <asp:TextBox ID="Apellido" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col">
                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Nro.PLanilla</label>
                                                    <asp:TextBox ID="tbNroPlanilla" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>
                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Prioridad</label>
                                                    <asp:TextBox ID="idPrioridad" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>

                                            </div>

                                            <div class="col">
                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Us.Genera</label>
                                                    <asp:TextBox ID="tbUsGenera" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>
                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Us.Cierre</label>
                                                    <asp:TextBox ID="tbUsCierre" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
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
                                <header class="panel-heading"><b>Tareas</b></header>
                                <div>
                                    <asp:GridView ID="GridViewTareas" runat="server"
                                        ShowFooter="true" AutoGenerateColumns="False"
                                        DataKeyNames="Orden"
                                        CssClass="table table-striped m-b-none text-small"
                                        BorderStyle="None" GridLines="None"
                                        OnPreRender="GVPreRender">

                                        <Columns>

                                            <asp:BoundField DataField="resultado"
                                                HeaderText="Resultado"
                                                SortExpression="resultado"
                                                HeaderStyle-CssClass="text-center"
                                                ItemStyle-HorizontalAlign="Center">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            </asp:BoundField>

                                            <asp:BoundField DataField="fechaInicio"
                                                HeaderText="Fecha Inicio"
                                                SortExpression="fechaInicio"
                                                HeaderStyle-CssClass="text-center"
                                                ItemStyle-HorizontalAlign="Center">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            </asp:BoundField>

                                            <asp:BoundField DataField="fechaFin"
                                                HeaderText="Fecha Fin"
                                                SortExpression="fechaFin"
                                                HeaderStyle-CssClass="text-center"
                                                ItemStyle-HorizontalAlign="Center">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            </asp:BoundField>


                                            <%--<asp:BoundField DataField="descripcion"
                                                HeaderText="Tarea"
                                                SortExpression="descripcion"
                                                HeaderStyle-CssClass="text-center"
                                                ItemStyle-HorizontalAlign="Center">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            </asp:BoundField>--%>


                                            <asp:TemplateField HeaderText="Tarea"
                                                ItemStyle-HorizontalAlign="Center"
                                                HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label222" runat="server"
                                                        Text='<%# String.Concat(Eval("descripcion"), " (", Eval("idTarea"), ")")%>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:BoundField DataField="Origen"
                                                HeaderText="Origen"
                                                SortExpression="Origen"
                                                HeaderStyle-CssClass="text-center"
                                                ItemStyle-HorizontalAlign="Center">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            </asp:BoundField>

                                            <asp:BoundField DataField="usuarioCreacion"
                                                HeaderText="Us.Inicia"
                                                SortExpression="Origen"
                                                HeaderStyle-CssClass="text-center"
                                                ItemStyle-HorizontalAlign="Center">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            </asp:BoundField>

                                            <asp:BoundField DataField="usuarioCierre"
                                                HeaderText="Us.Cierre"
                                                SortExpression="Origen"
                                                HeaderStyle-CssClass="text-center"
                                                ItemStyle-HorizontalAlign="Center">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            </asp:BoundField>

                                            <asp:BoundField DataField="observaciones"
                                                HeaderText="Detalle"
                                                SortExpression="observaciones"
                                                HeaderStyle-CssClass="text-center"
                                                ItemStyle-HorizontalAlign="Center">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            </asp:BoundField>

                                            <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <%--<asp:CheckBox runat="server" ID="guardar" Text="Generar" Visible='<%#IIf(Eval("origen") = "Revision", "false", "true")%>' />--%>
                                                    <asp:LinkButton ID="lbAnular" OnCommand="lbAnular_Command" CommandArgument='<%#String.Concat(Eval("orden"), "/", Eval("idTarea"), "/", Eval("idCoche")) %>' Visible='<%#IIf(False, "false", "true")%>' runat="server">Anular</asp:LinkButton>
                                                    <%--<asp:LinkButton ID="hlMasInfoo" OnCommand="hlMasInfo_Command" CommandArgument='<%#String.Concat(Eval("idTarea"), "/", Eval("idCabecera")) %>' Visible='<%#IIf(Eval("origen") = "Revision", "true", "false")%>' runat="server">Procesar</asp:LinkButton>--%>
                                                </ItemTemplate>
                                            </asp:TemplateField>



                                        </Columns>

                                        <RowStyle CssClass="td"></RowStyle>
                                    </asp:GridView>

                                </div>
                            </section>
                        </div>
                    </div>

                    <div class="flex flex-end">
                        <div>
                            <asp:Button ID="reimprimir" runat="server" Text="Reimprimir"
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
