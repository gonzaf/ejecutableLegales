<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/st/SiteST.master" CodeBehind="ingresosEdit.aspx.vb" Inherits="Dynamic_Data.ingresosEdit" %>

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
                                        <span class="label bg-danger pull-right">Nuevo</span>
                                        <div class="form-inline">
                                            Ingreso de Stock&nbsp;&nbsp; 
                                        </div>
                                    </header>


                                    <div id="ingresoEditor">
                                        <!-- TODO tu contenido -->


                                        <div class="panel-body ">

                                            <%-- <asp:UpdatePanel ID="upMain" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>--%>



                                            <asp:HiddenField ID="hfSoloLectura" runat="server" ClientIDMode="Static" Value="0" />

                                            <!-- Para el modal -->
                                            <asp:HiddenField ID="hfIdDetalle" runat="server" Value="0" />

                                            <!-- =========================
           CABECERA (FormView) - siempre Edit
           ========================= -->
                                            <asp:FormView ID="fvCab" runat="server"
                                                DataSourceID="ldsCab"
                                                DataKeyNames="IdIngreso"
                                                DefaultMode="Edit"
                                                OnItemUpdated="fvCab_ItemUpdated"
                                                RenderOuterTable="false">

                                                <EditItemTemplate>

                                                    <asp:Panel ID="pMsg" runat="server" Visible="false" CssClass="alert alert-danger"></asp:Panel>
                                                    <div class="container-fluid">
                                                        <div class="row">

                                                            <div class="col-md-2">
                                                                <label>Fecha</label>
                                                                <asp:TextBox ID="txtFecha" runat="server"
                                                                    CssClass="form-control input-sm"
                                                                    TextMode="Date"
                                                                    Text='<%# If(Eval("fecha") Is Nothing, "", CDate(Eval("fecha")).ToString("yyyy-MM-dd")) %>' />
                                                            </div>

                                                            <div class="col-md-2">
                                                                <label>Cod. Comprobante</label>
                                                                <asp:TextBox ID="txtCodComp" runat="server" CssClass="form-control input-sm"
                                                                    Text='<%# Bind("codComprobante") %>' />
                                                            </div>

                                                            <div class="col-md-2">
                                                                <label>Nro. Comprobante</label>
                                                                <asp:TextBox ID="txtNroComp" runat="server" CssClass="form-control input-sm"
                                                                    Text='<%# Bind("nroComprobante") %>' />
                                                            </div>

                                                            <div class="col-md-2">
                                                                <label>Id Remito</label>
                                                                <asp:TextBox ID="txtIdRemito" runat="server" CssClass="soloNumeros form-control input-sm"
                                                                    Text='<%# Bind("idRemito") %>' />
                                                            </div>


                                                            <div class="col-md-4">
                                                                <label>Proveedor</label>
                                                                <asp:DropDownList ID="ddlProveedor" runat="server" CssClass="form-control input-sm"
                                                                    DataSourceID="ldsProveedor"
                                                                    DataTextField="Proveedor"
                                                                    DataValueField="idProveedor"
                                                                    SelectedValue='<%# Bind("codProveedor") %>' />
                                                                <!-- si querés conservar el textbox visible, no hace falta; se setea por código -->
                                                            </div>
                                                        </div>

                                                        <div class="row" style="margin-top: 10px;">
                                                            <div class="col-md-12 text-center" style="margin-top: 18px;">
                                                                <!-- Botón estándar del FormView -->
                                                                <asp:LinkButton ID="btnUpdateCab" runat="server" CommandName="Update"
                                                                    CssClass="btn btn-success btn-xs" Text="Guardar" />

                                                                <asp:LinkButton ID="btnReabrir" runat="server"
                                                                    CssClass="btn btn-warning btn-xs soloLectura-siempreVisible"
                                                                    Text="Reabrir"
                                                                    OnClick="btnReabrir_Click"
                                                                    OnClientClick="return confirm('¿Reabrir este ingreso? Quedará en pendiente para editar.');" />

                                                                <asp:LinkButton ID="btnEliminarIngreso" runat="server"
                                                                    CssClass="btn btn-danger btn-xs"
                                                                    Text="Eliminar"
                                                                    OnClick="btnEliminarIngreso_Click"
                                                                    OnClientClick="return confirm('¿Eliminar el ingreso completo?');" />


                                                                <a class="btn btn-default btn-xs soloLectura-siempreVisible"
                                                                    href="cIngresos.aspx">Volver</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </EditItemTemplate>
                                            </asp:FormView>


                                            <br />

                                            <%-- </ContentTemplate>
                                            </asp:UpdatePanel>--%>






                                            <!-- =========================
       MODAL DETALLE (FormView) - SIEMPRE Edit
       ========================= -->

                                            <%-- <asp:UpdatePanel ID="upModal" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>--%>







                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <strong>Detalle</strong>

                                                    <asp:LinkButton ID="btnNuevoDet" runat="server"
                                                        CssClass="btn btn-primary btn-xs pull-right "
                                                        Text="Nuevo ítem"
                                                        OnClick="btnNuevoDet_Click" />
                                                    <div style="clear: both;"></div>
                                                </div>

                                                <div class="panel-body" style="padding: 0px">
                                                    <asp:GridView ID="gvDet" runat="server"
                                                        DataSourceID="ldsDet"
                                                        DataKeyNames="idDetalle"
                                                        AutoGenerateColumns="false"
                                                        OnRowCommand="gvDet_RowCommand"
                                                        OnRowDataBound="gvDet_RowDataBound"
                                                        CssClass="table table-striped m-b-none text-small"
                                                        BorderStyle="None"
                                                        GridLines="None">

                                                        <Columns>
                                                            <asp:BoundField DataField="idDetalle" HeaderText="ID" />
                                                            <asp:BoundField DataField="idCatalogo" HeaderText="Catálogo" />
                                                            <asp:BoundField DataField="DescRepuesto" HeaderText="Repuesto" />

                                                            <asp:BoundField DataField="cant" HeaderText="Cant" />
                                                            <asp:BoundField DataField="precio" HeaderText="Precio" DataFormatString="{0:N2}" />
                                                            <asp:BoundField DataField="DepositoIn" HeaderText="Depósito" />

                                                            <asp:TemplateField HeaderText="">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkEditDet" runat="server"
                                                                        CssClass="btn btn-default btn-xs soloLectura-siempreVisible"
                                                                        CommandName="EDITAR"
                                                                        CommandArgument='<%# Eval("IdDetalle") %>'
                                                                        Text="Editar" />

                                                                    <asp:LinkButton ID="lnkDelDet" runat="server"
                                                                        CssClass="btn btn-danger btn-xs"
                                                                        CommandName="BORRAR"
                                                                        CommandArgument='<%# Eval("IdDetalle") %>'
                                                                        Text="Borrar"
                                                                        OnClientClick="return confirm('¿Borrar este ítem?');" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>

                                                    </asp:GridView>
                                                </div>
                                            </div>









                                            <div id="modalDet" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">

                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h4 class="modal-title">Detalle</h4>
                                                        </div>

                                                        <div class="modal-body">

                                                            <asp:Button ID="btnBuscarCodRepuesto" runat="server" ClientIDMode="Static"
                                                                Style="display: none;"
                                                                UseSubmitBehavior="false"
                                                                CausesValidation="false"
                                                                OnClick="btnBuscarCodRepuesto_Click" />

                                                            <asp:FormView ID="fvDet" runat="server"
                                                                DataSourceID="ldsDetOne"
                                                                DataKeyNames="IdDetalle"
                                                                DefaultMode="Edit"
                                                                EnableViewState="true"
                                                                OnItemUpdated="fvDet_ItemUpdated">

                                                                <EditItemTemplate>

                                                                    <div class="row">
                                                                        <div class="col-md-2">
                                                                            <label>Cod.Repuesto</label>
                                                                            <asp:TextBox ID="tbCodigoDet"
                                                                                runat="server"
                                                                                ClientIDMode="Static"
                                                                                CssClass="form-control input-sm"
                                                                                Text='<%# Bind("idCatalogo") %>' />
                                                                        </div>
                                                                        <div class="col-md-10">
                                                                            <label>Repuesto</label>
                                                                            <asp:TextBox ID="txtRepuesto"
                                                                                runat="server"
                                                                                ClientIDMode="Static"
                                                                                CssClass="form-control input-sm acRepuesto"
                                                                                data-target="#tbCodigoDet"
                                                                                data-focus="#txtCant"
                                                                                Text='<%# Eval("DescRepuesto") %>' />
                                                                        </div>


                                                                    </div>

                                                                    <div class="row" style="margin-top: 10px;">
                                                                        <div class="col-md-2">
                                                                            <label>Cant</label>
                                                                            <asp:TextBox ID="txtCant" runat="server" ClientIDMode="Static" CssClass="form-control input-sm proximoFoco"
                                                                                Text='<%# Bind("cant") %>' />
                                                                        </div>

                                                                        <div class="col-md-3">
                                                                            <label>Precio</label>
                                                                            <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control input-sm"
                                                                                Text='<%# Bind("precio") %>' />
                                                                        </div>


                                                                        <div class="col-md-7">
                                                                            <label>Depósito In</label>
                                                                            <asp:DropDownList ID="ddlDepositoIn" runat="server"
                                                                                CssClass="form-control input-sm"
                                                                                DataSourceID="ldsDepositos"
                                                                                DataTextField="Deposito"
                                                                                DataValueField="IdDeposito"
                                                                                SelectedValue='<%# Bind("DepositoIn") %>'>
                                                                            </asp:DropDownList>
                                                                        </div>
                                                                    </div>

                                                                    <div class="text-right" style="margin-top: 15px;">
                                                                        <asp:LinkButton ID="btnUpdateDet" runat="server" CommandName="Update"
                                                                            CssClass="btn btn-success" Text="Guardar" />
                                                                        <button type="button" class="btn btn-default soloLectura-siempreVisible" data-dismiss="modal">Cancelar</button>
                                                                    </div>

                                                                </EditItemTemplate>

                                                            </asp:FormView>

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>

                                            <!-- =========================
       LINQ DATASOURCES
       ========================= -->

                                            <!-- Cabecera (Update + forzar confirmado en Updating) -->
                                            <asp:LinqDataSource ID="ldsCab" runat="server"
                                                ContextTypeName="SqlMetalModel.StockDataContext"
                                                TableName="stIngresosCabecera"
                                                EnableUpdate="true"
                                                EnableInsert="false"
                                                EnableDelete="false"
                                                Where="idIngreso == @idIngreso"
                                                OnUpdating="ldsCab_Updating">
                                                <WhereParameters>
                                                    <asp:QueryStringParameter Name="idIngreso" QueryStringField="idIngreso" Type="Int32" />
                                                </WhereParameters>
                                            </asp:LinqDataSource>

                                            <!-- Detalle list -->
                                            <asp:LinqDataSource ID="ldsDet" runat="server"
                                                ContextTypeName="SqlMetalModel.StockDataContext"
                                                TableName="stIngresosDetalle"
                                                EnableUpdate="false"
                                                EnableInsert="false"
                                                EnableDelete="false"
                                                Where="idIngreso == @idIngreso"
                                                OrderBy="idDetalle descending">
                                                <WhereParameters>
                                                    <asp:QueryStringParameter Name="idIngreso" QueryStringField="idIngreso" Type="Int32" />
                                                </WhereParameters>
                                            </asp:LinqDataSource>

                                            <!-- Detalle modal: solo Update (siempre Edit) -->
                                            <asp:LinqDataSource ID="ldsDetOne" runat="server"
                                                ContextTypeName="SqlMetalModel.StockDataContext"
                                                TableName="stIngresosDetalle"
                                                EnableUpdate="true"
                                                EnableInsert="false"
                                                EnableDelete="false"
                                                EnableViewState="true"
                                                Where="idDetalle == @idDetalle">
                                                <WhereParameters>
                                                    <asp:ControlParameter Name="idDetalle" ControlID="hfIdDetalle" PropertyName="Value" Type="Int32" />
                                                </WhereParameters>
                                            </asp:LinqDataSource>

                                            <!-- Catálogo -->
                                            <asp:LinqDataSource ID="ldsCatalogo" runat="server"
                                                ContextTypeName="SqlMetalModel.StockDataContext"
                                                TableName="zzzCatalogo"
                                                OrderBy="Articulo"
                                                Select="new (idCatalogo, (idCatalogo.ToString() + &quot; - &quot; + Articulo + &quot; - &quot; + Marca + &quot; &quot; + Modelo) as texto)" />

                                            <%--Proveedores--%>
                                            <asp:LinqDataSource ID="ldsProveedor" runat="server"
                                                ContextTypeName="SqlMetalModel.StockDataContext"
                                                TableName="vStProveedor"
                                                OrderBy="Proveedor" />

                                            <asp:LinqDataSource ID="ldsDepositos" runat="server"
                                                ContextTypeName="SqlMetalModel.StockDataContext"
                                                TableName="stDepositos"
                                                OrderBy="Deposito" />





                                            <script type="text/javascript">

                                                // focoTarget: selector opcional (ej "#txtCant")
                                                function abrirModalDet(focoTarget) {
                                                    $('#modalDet').modal('show');

                                                    setTimeout(function () {
                                                        if (focoTarget && $(focoTarget).length) {
                                                            $(focoTarget).focus().select();
                                                        } else {
                                                            $('#tbCodigoDet').focus().select();
                                                        }
                                                    }, 200);
                                                }

                                                function cerrarModalDet() { $('#modalDet').modal('hide'); }


                                                function initEnterCodigoRepuesto() {
                                                    if (!$("#tbCodigoDet").length) return;

                                                    // Evita duplicar handlers
                                                    $("#tbCodigoDet").off("keydown.enterCodRep").on("keydown.enterCodRep", function (e) {
                                                        if (e.key === "Enter" || e.keyCode === 13) {
                                                            e.preventDefault();
                                                            $("#btnBuscarCodRepuesto").click();
                                                            return false;
                                                        }
                                                    });
                                                }

                                                $(function () { initEnterCodigoRepuesto(); });



                                            </script>

                                            <%-- </ContentTemplate>
                                            </asp:UpdatePanel>--%>
                                        </div>




                                        <!-- TODO tu contenido -->
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
