<%@ Page Title="" Language="vb" AutoEventWireup="false" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/st/SiteST.master" CodeBehind="cIngRp.aspx.vb" Inherits="Dynamic_Data.cIngRp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <section id="content">
        <section class="main padder">
            <form id="form1" runat="server" onsubmit="ShowLoading()">
                <div class="row no-gutter">

                    <div class="col-sm-12 g">
                        <section class="panel">
                            <div class="panel-body g">
                                <section class="panel">


                                    <header class="panel-heading">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <h4 style="margin: 0;">Ingresos</h4>
                                                <small class="text-muted">Finalizados (todos) + Pendientes (míos)</small>
                                            </div>
                                            <div class="col-md-4 text-right">
                                                <a class="btn btn-primary" href="stIngresoEdit.aspx">Nuevo ingreso</a>
                                            </div>
                                        </div>
                                    </header>

                                    <div class="panel-body">

                                        <asp:UpdatePanel ID="upPanelIngresos" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>

                                                <asp:Panel ID="pMsg" runat="server" Visible="false" CssClass="alert alert-danger"></asp:Panel>

                                                <!-- FILTROS -->
                                                <div class="row" style="margin-bottom: 10px;">
                                                    <div class="col-md-2">
                                                        <label>Desde</label>
                                                        <asp:TextBox ID="txtDesde" runat="server" CssClass="form-control" TextMode="Date" />
                                                    </div>

                                                    <div class="col-md-2">
                                                        <label>Hasta</label>
                                                        <asp:TextBox ID="txtHasta" runat="server" CssClass="form-control" TextMode="Date" />
                                                    </div>

                                                    <div class="col-md-3">
                                                        <label>Código repuesto (idCatalogo)</label>
                                                        <asp:TextBox ID="txtIdCatalogo" runat="server" CssClass="form-control" />
                                                    </div>

                                                    <div class="col-md-5 text-right" style="margin-top: 24px;">
                                                        <asp:LinkButton ID="btnFiltrar" runat="server" CssClass="btn btn-default" Text="Filtrar"
                                                            OnClick="btnFiltrar_Click" />
                                                        <asp:LinkButton ID="btnLimpiar" runat="server" CssClass="btn btn-default" Text="Limpiar"
                                                            OnClick="btnLimpiar_Click" />
                                                    </div>
                                                </div>

                                                <!-- GRID -->
                                                <asp:GridView ID="gvIngresos" runat="server"
                                                    CssClass="table table-striped table-condensed"
                                                    AutoGenerateColumns="false"
                                                    AllowPaging="true"
                                                    AllowCustomPaging="true"
                                                    PageSize="25"
                                                    DataKeyNames="idIngreso"
                                                    OnPageIndexChanging="gvIngresos_PageIndexChanging"
                                                    OnRowCommand="gvIngresos_RowCommand">

                                                    <Columns>
                                                        <asp:BoundField DataField="idIngreso" HeaderText="ID" />

                                                        <asp:BoundField DataField="fecha" HeaderText="Fecha" DataFormatString="{0:yyyy-MM-dd}" />

                                                        <asp:BoundField DataField="Proveedor" HeaderText="Proveedor" />

                                                        <asp:BoundField DataField="Comprobante" HeaderText="Comprobante" />

                                                        <asp:BoundField DataField="Estado" HeaderText="Estado" />

                                                        <asp:TemplateField HeaderText="">
                                                            <ItemTemplate>
                                                                <asp:LinkButton runat="server"
                                                                    CssClass="btn btn-default btn-xs"
                                                                    CommandName="EDITAR"
                                                                    CommandArgument='<%# Eval("idIngreso") %>'
                                                                    Text="Abrir" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>

                                                    <PagerSettings Mode="NumericFirstLast" FirstPageText="«" LastPageText="»" />
                                                    <PagerStyle CssClass="text-center" />

                                                </asp:GridView>

                                            </ContentTemplate>
                                        </asp:UpdatePanel>

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

        var objDiv = document.getElementById("divCaja");
        //objDiv.scrollTop = objDiv.scrollHeight;

        function set(textbox, cant, cb) {
            if (document.getElementById(cb).checked) {
                document.getElementById(textbox).value = cant;
            } else {
                document.getElementById(textbox).value = '';
            }

        }


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
