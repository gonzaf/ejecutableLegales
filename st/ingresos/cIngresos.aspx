<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/st/SiteST.master" CodeBehind="cIngresos.aspx.vb" Inherits="Dynamic_Data.cIngresos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">





    <section id="content">
        <section class="main padder">
            <form id="form2" runat="server">
                <div class="row no-gutter">
                    <div class="col-sm-12 g">
                        <section class="panel">
                            <div class="panel-body g">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Consulta</span>
                                        <div class="form-inline">
                                            Ingreso de Repuestos&nbsp;&nbsp; 
                                        </div>
                                    </header>
                                    <div class="panel-body g">

                                        <asp:UpdatePanel ID="upPanelIngresos" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>

                                                <div class="container-fluid">
                                                    <asp:Panel ID="pMsg" runat="server" Visible="false" CssClass="alert alert-danger"></asp:Panel>


                                                    <!-- FILTROS -->
                                                    <div class="row" style="margin-bottom: 10px;">
                                                        <div class="col-md-2">
                                                            <label>Desde</label>
                                                            <asp:TextBox ID="txtDesde" runat="server" CssClass="form-control input-sm" TextMode="Date" />
                                                        </div>

                                                        <div class="col-md-2">
                                                            <label>Hasta</label>
                                                            <asp:TextBox ID="txtHasta" runat="server" CssClass="form-control input-sm" TextMode="Date" />
                                                        </div>

                                                        <div class="col-md-1">
                                                            <label># Compro.</label>
                                                            <asp:TextBox ID="txtNroComprobante" runat="server" CssClass="form-control input-sm" />
                                                        </div>

                                                        <div class="col-md-2" style="margin-top: 24px;">
                                                            <asp:LinkButton ID="btnFiltrar" runat="server" CssClass="btn btn-default btn-sm" Text="Filtrar"
                                                                OnClick="btnFiltrar_Click" />
                                                            <asp:LinkButton ID="btnLimpiar" runat="server" CssClass="btn btn-default btn-sm" Text="Limpiar"
                                                                OnClick="btnLimpiar_Click" />
                                                        </div>
                                                        <div class="col-md-5 text-right" style="margin-top: 24px;">
                                                            <asp:LinkButton ID="btnNuevo" runat="server" CssClass="btn btn-default btn-sm" Text="Nuevo"
                                                                OnClick="btnNuevo_Click" />
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <strong>Listado</strong>


                                                        <div style="clear: both;"></div>
                                                    </div>

                                                    <div class="panel-body" style="padding: 0px">

                                                        <asp:GridView ID="gvIngresos" runat="server"
                                                            CssClass="table table-striped m-b-none text-small"
                                                            AutoGenerateColumns="false"
                                                            AllowPaging="true"
                                                            AllowCustomPaging="true"
                                                            BorderStyle="None"
                                                            GridLines="None"
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
                                                    </div>
                                                </div>
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





</asp:Content>

