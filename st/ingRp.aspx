<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/st/SiteST.master" CodeBehind="ingRp.aspx.vb" Inherits="Dynamic_Data.ingRp" %>

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


    <section id="content">
   <section class="main padder">
    <form id="form1" runat="server">
        <div class="row no-gutter">
            <div class="col-sm-12">

    <section class="panel">
        <header class="panel-heading">
            <span class="label pull-right" id="spanEstado" runat="server">
                <asp:Literal ID="litEstado" runat="server"></asp:Literal>
            </span>
            <h4>
                <asp:Literal ID="litTitulo" runat="server"></asp:Literal>
            </h4>
        </header>
        
        <section class="panel-body">
            
            <asp:Label ID="lError" runat="server" CssClass="text-danger"></asp:Label>

            <!-- FormView para la Cabecera -->
            <asp:FormView ID="fvCabecera" runat="server" 
                DataSourceID="dsCabecera" 
                DataKeyNames="idIngreso"
                DefaultMode="Edit"
                OnItemCommand="fvCabecera_ItemCommand"
                OnItemUpdated="fvCabecera_ItemUpdated"
                OnItemInserted="fvCabecera_ItemInserted"
                style="position: relative; z-index: 1;">
                
                <EditItemTemplate>
                    <asp:HiddenField ID="hfIdIngreso" runat="server" Value='<%# Eval("idIngreso") %>' />
                    
                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Fecha *</label>
                                <asp:TextBox ID="txtFecha" runat="server" 
                                    Text='<%# Bind("fecha", "{0:dd/MM/yyyy}") %>'
                                    CssClass="form-control input-sm datepicker"></asp:TextBox>
                            </div>
                        </div>
                        
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Tipo Comp *</label>
                                <asp:DropDownList ID="ddlTipoComprobante" runat="server" 
                                    SelectedValue='<%# Bind("codComprobante") %>'
                                    CssClass="form-control input-sm">
                                    <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                    <asp:ListItem Value="RCU">RCU</asp:ListItem>
                                    <asp:ListItem Value="RCT">RCT</asp:ListItem>
                                    <asp:ListItem Value="RCE">RCE</asp:ListItem>
                                    <asp:ListItem Value="RT">RT</asp:ListItem>
                                    <asp:ListItem Value="RT2">RT2</asp:ListItem>
                                    <asp:ListItem Value="RT3">RT3</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Nro Comp *</label>
                                <asp:TextBox ID="txtNroComprobante" runat="server" 
                                    Text='<%# Bind("nroComprobante") %>'
                                    CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                        </div>
                        
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Proveedor *</label>
                                <asp:DropDownList ID="ddlProveedor" runat="server" 
                                    DataSourceID="dsProveedores"
                                    DataTextField="Proveedor"
                                    DataValueField="idProveedor"
                                    SelectedValue='<%# Bind("codProveedor") %>'
                                    CssClass="form-control input-sm">
                                </asp:DropDownList>
                            </div>
                        </div>
                        
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Nro Remito</label>
                                <asp:TextBox ID="txtNroRemito" runat="server" 
                                    Text='<%# Bind("idRemito") %>'
                                    CssClass="form-control input-sm soloNumeros"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12" style="margin-top: 15px; position: relative; z-index: 10;">
                            <asp:Button ID="btnGuardar" runat="server" 
                                CommandName="Update" 
                                Text="Guardar" 
                                CssClass="btn btn-primary btn-sm" />
                            <asp:Button ID="btnCancelar" runat="server" 
                                CommandName="Cancelar" 
                                Text="Cancelar" 
                                CssClass="btn btn-default btn-sm"
                                CausesValidation="false" />
                        </div>
                    </div>
                </EditItemTemplate>

                <InsertItemTemplate>
                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Fecha *</label>
                                <asp:TextBox ID="txtFecha" runat="server" 
                                    Text='<%# Bind("fecha", "{0:dd/MM/yyyy}") %>'
                                    CssClass="form-control input-sm datepicker"></asp:TextBox>
                            </div>
                        </div>
                        
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Tipo Comp *</label>
                                <asp:DropDownList ID="ddlTipoComprobante" runat="server" 
                                    SelectedValue='<%# Bind("codComprobante") %>'
                                    CssClass="form-control input-sm">
                                    <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                    <asp:ListItem Value="RCU">RCU</asp:ListItem>
                                    <asp:ListItem Value="RCT">RCT</asp:ListItem>
                                    <asp:ListItem Value="RCE">RCE</asp:ListItem>
                                    <asp:ListItem Value="RT">RT</asp:ListItem>
                                    <asp:ListItem Value="RT2">RT2</asp:ListItem>
                                    <asp:ListItem Value="RT3">RT3</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Nro Comp *</label>
                                <asp:TextBox ID="txtNroComprobante" runat="server" 
                                    Text='<%# Bind("nroComprobante") %>'
                                    CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                        </div>
                        
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Proveedor *</label>
                                <asp:DropDownList ID="ddlProveedor" runat="server" 
                                    DataSourceID="dsProveedores"
                                    DataTextField="Proveedor"
                                    DataValueField="idProveedor"
                                    SelectedValue='<%# Bind("codProveedor") %>'
                                    CssClass="form-control input-sm">
                                </asp:DropDownList>
                            </div>
                        </div>
                        
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Nro Remito</label>
                                <asp:TextBox ID="txtNroRemito" runat="server" 
                                    Text='<%# Bind("idRemito") %>'
                                    CssClass="form-control input-sm soloNumeros"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12" style="margin-top: 15px; position: relative; z-index: 10;">
                            <asp:Button ID="btnInsertar" runat="server" 
                                CommandName="Insert" 
                                Text="Crear Ingreso" 
                                CssClass="btn btn-success btn-sm" />
                            <asp:Button ID="btnCancelar" runat="server" 
                                CommandName="Cancelar" 
                                Text="Cancelar" 
                                CssClass="btn btn-default btn-sm"
                                CausesValidation="false" />
                        </div>
                    </div>
                </InsertItemTemplate>

                <ItemTemplate>
                    <div class="row">
                        <div class="col-md-2">
                            <strong>Fecha:</strong> <%# Eval("fecha", "{0:dd/MM/yyyy}") %>
                        </div>
                        <div class="col-md-2">
                            <strong>Tipo:</strong> <%# Eval("codComprobante") %>
                        </div>
                        <div class="col-md-2">
                            <strong>Nro:</strong> <%# Eval("nroComprobante") %>
                        </div>
                        <div class="col-md-4">
                            <strong>Proveedor:</strong> <%# Eval("Proveedor") %>
                        </div>
                        <div class="col-md-2">
                            <strong>Remito:</strong> <%# Eval("idRemito") %>
                        </div>
                    </div>
                    <br />
                    <asp:Button ID="btnEditar" runat="server" 
                        CommandName="Edit" 
                        Text="Editar" 
                        CssClass="btn btn-info btn-sm" />
                </ItemTemplate>

            </asp:FormView>

            <hr />

            <!-- Panel de Detalle (solo visible después de guardar la cabecera) -->
            <asp:Panel ID="pnlDetalle" runat="server" Visible="false">
                
                <div class="row">
                    <div class="col-md-12">
                        <h5 class="pull-left">Detalle de Repuestos</h5>
                        <button type="button" class="btn btn-primary btn-sm pull-right" 
                            data-toggle="modal" data-target="#modalAgregarItem" style="margin-top: 15px;">
                            <i class="fa fa-plus"></i> Agregar Repuesto
                        </button>
                        <div class="clearfix"></div>
                    </div>
                </div>

                <br />

                <asp:GridView ID="gvDetalle" runat="server" 
                    DataSourceID="dsDetalleCompleto"
                    DataKeyNames="idDetalle"
                    CssClass="table table-striped table-bordered table-hover"
                    AutoGenerateColumns="false"
                    OnRowDataBound="gvDetalle_RowDataBound"
                    OnRowCommand="gvDetalle_RowCommand"
                    ShowFooter="true">
                    <Columns>
                        <asp:BoundField DataField="idCatalogo" HeaderText="Código" ItemStyle-Width="80px" />
                        <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
                        <asp:BoundField DataField="cant" HeaderText="Cant" ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Right" />
                        <asp:BoundField DataField="precio" HeaderText="Precio" DataFormatString="{0:N2}" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Right" />
                        <asp:BoundField DataField="deposito" HeaderText="Depósito" ItemStyle-Width="150px" />
                        <asp:TemplateField HeaderText="Subtotal" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <%# String.Format("{0:N2}", Convert.ToDecimal(Eval("cant")) * Convert.ToDecimal(Eval("precio"))) %>
                            </ItemTemplate>
                            <FooterTemplate>
                                <strong>TOTAL: $<asp:Literal ID="litTotal" runat="server"></asp:Literal></strong>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEditarItem" runat="server" 
                                    CommandName="EditarItem" 
                                    CommandArgument='<%# Eval("idDetalle") %>'
                                    CssClass="btn btn-info btn-xs">
                                    <i class="fa fa-edit"></i>
                                </asp:LinkButton>
                                <asp:LinkButton ID="btnEliminar" runat="server" 
                                    CommandName="Delete"
                                    CssClass="btn btn-danger btn-xs"
                                    OnClientClick="return confirm('¿Eliminar este repuesto?');">
                                    <i class="fa fa-trash"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="alert alert-warning">
                            <i class="fa fa-exclamation-triangle"></i> No hay repuestos agregados. Use el botón "Agregar Repuesto".
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>

                <div class="row">
                    <div class="col-md-12">
                        <hr />
                        <asp:Button ID="btnConfirmar" runat="server" 
                            Text="Confirmar Ingreso" 
                            CssClass="btn btn-success" 
                            OnClick="btnConfirmar_Click"
                            OnClientClick="return confirm('¿Confirmar este ingreso? Se generarán movimientos de stock y no podrá editarse.');" />
                        <asp:Button ID="btnVolver" runat="server" 
                            Text="Volver" 
                            CssClass="btn btn-default" 
                            OnClick="btnVolver_Click" />
                    </div>
                </div>

            </asp:Panel>

        </section>
    </section>

    <!-- Modal para agregar/editar repuesto -->
    <div class="modal fade" id="modalAgregarItem" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                    <h4 class="modal-title" id="modalTitulo">
                        <i class="fa fa-plus-circle"></i> <span id="spanTituloModal">Agregar Repuesto</span>
                    </h4>
                </div>
                <div class="modal-body">
                    <asp:HiddenField ID="hfIdDetalle" runat="server" Value="0" />
                    <asp:Label ID="lErrorDetalle" runat="server" CssClass="text-danger"></asp:Label>
                    
                    <div class="form-group">
                        <label>Repuesto *</label>
                        <input type="text" id="autoCompleteProductos" class="form-control input-sm" placeholder="Buscar repuesto..." />
                        <asp:HiddenField ID="hfIdRepuesto" runat="server" />
                        <asp:HiddenField ID="tbCodigo" runat="server" />
                        <asp:Label ID="lRepuestoSeleccionado" runat="server" CssClass="text-muted small"></asp:Label>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Cantidad *</label>
                                <asp:TextBox ID="txtCantidad" runat="server" CssClass="form-control input-sm soloNumeros" Text="1"></asp:TextBox>
                            </div>
                        </div>
                        
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Precio Unit. *</label>
                                <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control input-sm" Text="0"></asp:TextBox>
                            </div>
                        </div>
                        
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Subtotal</label>
                                <input type="text" id="txtSubtotal" class="form-control input-sm" readonly style="background-color: #f5f5f5;" />
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label>Depósito *</label>
                        <asp:DropDownList ID="ddlDeposito" runat="server" 
                            DataSourceID="dsDepositos"
                            DataTextField="Deposito"
                            DataValueField="idDeposito"
                            CssClass="form-control input-sm">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <asp:Button ID="btnGuardarItem" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="btnGuardarItem_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- DataSources -->
    <asp:LinqDataSource ID="dsCabecera" runat="server" 
        ContextTypeName="legLinq.LegalesDataContext"
        TableName="stIngresosCabecera"
        EnableUpdate="true"
        EnableInsert="true"
        Where="idIngreso == @idIngreso"
        OnInserting="dsCabecera_Inserting"
        OnUpdating="dsCabecera_Updating"
        OnInserted="dsCabecera_Inserted">
        <WhereParameters>
            <asp:QueryStringParameter Name="idIngreso" QueryStringField="id" Type="Int32" DefaultValue="0" />
        </WhereParameters>
    </asp:LinqDataSource>

    <asp:LinqDataSource ID="dsDetalleCompleto" runat="server" 
        ContextTypeName="legLinq.LegalesDataContext"
        EnableDelete="true"
        OnSelecting="dsDetalleCompleto_Selecting"
        OnDeleting="dsDetalleCompleto_Deleting"
        OnDeleted="dsDetalleCompleto_Deleted">
    </asp:LinqDataSource>

    <asp:LinqDataSource ID="dsProveedores" runat="server" 
        ContextTypeName="legLinq.LegalesDataContext"
        TableName="vStProveedor"
        OrderBy="Proveedor">
    </asp:LinqDataSource>

    <asp:LinqDataSource ID="dsDepositos" runat="server" 
        ContextTypeName="legLinq.LegalesDataContext"
        TableName="stDepositos"
        OrderBy="Deposito">
    </asp:LinqDataSource>

            </div>
        </div>
    </form>
</section>
    </section>

    <script type="text/javascript">
        $(document).ready(function () {

            // ============================================
            // EL AUTOCOMPLETE YA ESTÁ CONFIGURADO EN LA MASTERPAGE
            // Solo agregamos el evento para capturar la selección
            // ============================================

            // Capturar cuando se selecciona un repuesto
            $("#autoCompleteProductos").on("eac.select", function () {
                var codigo = $("#tbCodigo").val();
                var texto = $("#autoCompleteProductos").val();

                // Guardar en el HiddenField para el servidor
                $("#<%= hfIdRepuesto.ClientID %>").val(codigo);

                // Mostrar selección
                $("#<%= lRepuestoSeleccionado.ClientID %>").text("Seleccionado: " + texto);

                // Mover foco a cantidad
                $("#<%= txtCantidad.ClientID %>").focus().select();
            });

            // ============================================
            // CALCULAR SUBTOTAL AUTOMÁTICAMENTE
            // ============================================
            function calcularSubtotal() {
                var cantidad = parseFloat($("#<%= txtCantidad.ClientID %>").val()) || 0;
                var precio = parseFloat($("#<%= txtPrecio.ClientID %>").val()) || 0;
                var subtotal = cantidad * precio;
                $("#txtSubtotal").val(subtotal.toFixed(2));
            }

            $("#<%= txtCantidad.ClientID %>, <%= txtPrecio.ClientID %>").on("input change", function () {
                calcularSubtotal();
            });

            // ============================================
            // CONFIGURAR DATEPICKER
            // ============================================
            $('.datepicker').datepicker({
                format: 'dd/mm/yyyy',
                autoclose: true,
                todayHighlight: true,
                language: 'es'
            });

            // ============================================
            // LIMPIAR MODAL AL CERRAR
            // ============================================
            $('#modalAgregarItem').on('hidden.bs.modal', function () {
                // Resetear a modo "Agregar"
                $('#spanTituloModal').html('Agregar Repuesto');
                $('#<%= btnGuardarItem.ClientID %>').val('Agregar');

                // Limpiar campos
                $("#autoCompleteProductos").val('');
                $("#tbCodigo").val('');
                $("#<%= hfIdDetalle.ClientID %>").val('0');
                $("#<%= hfIdRepuesto.ClientID %>").val('');
                $("#<%= lRepuestoSeleccionado.ClientID %>").text('');
                $("#<%= txtCantidad.ClientID %>").val('1');
                $("#<%= txtPrecio.ClientID %>").val('0');
                $("#<%= ddlDeposito.ClientID %>").val('');
                $("#txtSubtotal").val('0.00');
                $("#<%= lErrorDetalle.ClientID %>").text('');
            });

            // ============================================
            // FOCUS AL ABRIR MODAL
            // ============================================
            $('#modalAgregarItem').on('shown.bs.modal', function () {
                $("#autoCompleteProductos").focus();
            });

            // ============================================
            // CERRAR MODAL DESPUÉS DE AGREGAR (si fue exitoso)
            // ============================================
    <% If ViewState("CerrarModal") IsNot Nothing AndAlso ViewState("CerrarModal") = True Then %>
            $('#modalAgregarItem').modal('hide');
        <% ViewState("CerrarModal") = Nothing %>
    <% End If %>

            // ============================================
            // FOCUS INICIAL (buscar el campo dentro del FormView)
            // ============================================
            $("input[id*='txtFecha']").first().focus();

        });
    </script>



</asp:Content>
