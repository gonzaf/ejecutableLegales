<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.master" CodeBehind="vDmf.aspx.vb" Inherits="Dynamic_Data.vDmf" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <%--<asp:DynamicDataManager ID="DynamicDataManager1" runat="server">
        <DataControls>
            <asp:DataControlReference ControlID="FormView1" />

        </DataControls>
    </asp:DynamicDataManager>--%>



    <section id="content">
        <section class="main padder">
            <form id="form1" runat="server">

                <input type="hidden" id="imprimir" name="imprimir" value="true" />

                <asp:FormView Visible="false" RenderOuterTable="False" DefaultMode="Edit" ID="formViewLesionado" runat="server" DataSourceID="dsFormViewLesionado" DataKeyNames="idHeader">
                    <EditItemTemplate>

                        <div class="row no-gutter">
                            <div class="col-sm-7">
                                <section class="panel">
                                    <div class="panel-body">
                                        <section class="panel">
                                            <header class="panel-heading">
                                                <span class="label bg-danger pull-right">Lesionado</span>
                                                <div class="form-inline">
                                                    Datos del Lesionado&nbsp;&nbsp; 
                                                </div>
                                            </header>
                                            <div class="panel-body">
                                                <div class="form-horizontal">
                                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Font-Bold="true" CssClass="DDValidator" Display="Dynamic" />
                                                    <asp:CustomValidator ID="CustomValidator1" runat="server" Visible="false" ErrorMessage="CustomValidator" Display="Dynamic"> </asp:CustomValidator>

                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-2 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <label class="col-sm-2 control-label">Parte</label>
                                                            <asp:DynamicControl ID="DynamicControl2" runat="server" DataField="idHeader" UIHint="TextDisable" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <label class="col-sm-1 control-label">Apellido</label>
                                                            <asp:DynamicControl ID="DynamicControl3" runat="server" DataField="apellidoLesionado" UIHint="TextDisable" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <label class="col-sm-1 control-label">Nombre</label>
                                                            <asp:DynamicControl ID="DynamicControl4" runat="server" DataField="nombreLesionado" UIHint="TextDisable" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-2 control-label"></label>
                                                        </div>


                                                        <div class="col-sm-2">
                                                            <label class="control-label"></label>
                                                            <asp:LinkButton ID="LinkButton1" OnCommand="hlMasInfo_Command" CommandArgument='<%# Eval("idHeader") %>' runat="server" CssClass="btn btn-primary btn-xs">Ver Parte</asp:LinkButton>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-2 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <label class="col-sm-2 control-label">Documento</label>
                                                            <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="documento" UIHint="TextDisable" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <label class="col-sm-1 control-label">Responsabilidad</label>
                                                            <asp:TextBox ID="TextBox12" runat="server" class="form-control" disabled="disabled" Text='<%# Eval("tResponsabilidad.responsabilidad") %>'></asp:TextBox>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <label class="control-label">Gravedad</label>
                                                            <asp:TextBox ID="detalle" runat="server" class="form-control" disabled="disabled" Text='<%# Eval("tNivelGravedad.NivelDeGravedad") %>'></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-2 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <label class="col-sm-1 control-label">Telefono</label>
                                                            <asp:DynamicControl ID="DynamicControl7" runat="server" DataField="telefono" UIHint="TextDisable" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <label class="control-label">Direccion</label>
                                                            <asp:TextBox ID="TextBox9" runat="server" class="form-control" disabled="disabled" Text='<%# Eval("domicilio") %>'></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-2 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <label class="control-label">Tipo Lesion</label>
                                                            <asp:TextBox ID="TextBox11" runat="server" class="form-control" disabled="disabled" Text='<%# Eval("tLesionTipo.TipoDeLesion") %>'></asp:TextBox>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <label class="control-label">Detalle Lesion</label>
                                                            <asp:TextBox ID="TextBox10" runat="server" class="form-control" disabled="disabled" Text='<%# Eval("detalleLesion") %>'></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-1 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <label class="control-label">Transportado</label>
                                                            <asp:DynamicControl ID="DynamicControl5" runat="server" DataField="transportado" Mode="Readonly" ValidationGroup="Insert" />
                                                        </div>
                                                        <div class="col-sm-5">
                                                            <label class="control-label">Muerto</label>
                                                            <asp:DynamicControl ID="DynamicControl6" runat="server" DataField="muerto" Mode="Readonly" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>


                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-2 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <label class="control-label">Internado</label>
                                                            <asp:TextBox ID="TextBox4" runat="server" class="form-control" disabled="disabled" Text='<%# Eval("tInternado.Internado") %>'></asp:TextBox>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <label class="control-label">Domicilio Internación</label>
                                                            <asp:TextBox ID="TextBox13" runat="server" class="form-control" disabled="disabled" Text='<%# Eval("tInternado.domicilio") %>'></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-2 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <label class="col-sm-3 control-label">Fec.Siniestro</label>
                                                            <asp:TextBox ID="TextBox1" runat="server" class="form-control" disabled="disabled" Text='<%# Format(Eval("pHeader.fechaSiniestro"), "dd/MM/yy") %>'></asp:TextBox>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <label class="col-sm-3 control-label">Fec.Parte</label>
                                                            <asp:TextBox ID="TextBox2" runat="server" class="form-control" disabled="disabled" Text='<%# Format(Eval("pHeader.fechaParte"), "dd/MM/yy") %>'></asp:TextBox>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <label class="control-label">Culpabilidad</label>
                                                            <asp:TextBox ID="TextBox3" runat="server" class="form-control" disabled="disabled" Text='<%# Eval("pHeader.tCulpabilidad") %>'></asp:TextBox>
                                                        </div>

                                                    </div>






                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-3 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-10">
                                                            <label class="col-sm-2 control-label">Declaración</label>
                                                            <asp:TextBox ID="TextBox7" runat="server" class="form-control" disabled="disabled" TextMode="MultiLine" Rows="10" Text='<%# Eval("pHeader.declaracion") %>'></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-3 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-10">
                                                            <label class="col-sm-6 control-label">Declaracion Administrativa</label>
                                                            <asp:TextBox ID="TextBox8" runat="server" class="form-control" disabled="disabled" TextMode="MultiLine" Rows="10" Text='<%# Eval("pHeader.declaracionAdministrativa") %>'></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <br />

                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-3 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-10 text-center">
                                                            <%--<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" CssClass="btn btn-primary btn-xs" />--%>
                                                            <%--                                                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" OnCommand="UpdateCancelButton_Command" CommandName="Cancel" Text="Volver" CssClass="btn btn-white btn-xs" />--%>
                                                            <asp:HyperLink ID="HyperLink3" NavigateUrl='<%# Eval("idHeader", "/default.aspx") %>' runat="server" CssClass="btn btn-white btn-xs">Volver</asp:HyperLink>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </section>


                                    </div>
                                </section>
                            </div>
                    </EditItemTemplate>
                </asp:FormView>

                <asp:LinqDataSource ID="dsFormViewLesionado" EnableUpdate="true" runat="server" ContextTypeName="legLinq.LegalesDataContext" TableName="pLesionados" Where="idRegistro == @idRegistro">
                    <WhereParameters>
                        <asp:Parameter DefaultValue="-1" Name="idRegistro" Type="Int32" />
                    </WhereParameters>
                </asp:LinqDataSource>




                <asp:FormView Visible="false" RenderOuterTable="False" DefaultMode="Edit" ID="FormViewVehiculo" runat="server" DataSourceID="dsFormViewVehiculo" DataKeyNames="idHeader">
                    <EditItemTemplate>

                        <div class="row no-gutter">
                            <div class="col-sm-7">
                                <section class="panel">
                                    <div class="panel-body">
                                        <section class="panel">
                                            <header class="panel-heading">
                                                <span class="label bg-danger pull-right">Vehiculo</span>
                                                <div class="form-inline">
                                                    Datos del Vehiculo&nbsp;&nbsp; 
                                                </div>
                                            </header>
                                            <div class="panel-body">
                                                <div class="form-horizontal">
                                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Font-Bold="true" CssClass="DDValidator" Display="Dynamic" />
                                                    <asp:CustomValidator ID="CustomValidator1" runat="server" Visible="false" ErrorMessage="CustomValidator" Display="Dynamic"> </asp:CustomValidator>

                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-2 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-2 control-label">Parte</label>
                                                            <asp:DynamicControl ID="DynamicControl2" runat="server" DataField="idHeader" UIHint="TextDisable" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>
                                                        <div class="col-sm-5">
                                                            <label class="col-sm-1 control-label">Conductor</label>
                                                            <asp:DynamicControl ID="DynamicControl3" runat="server" DataField="nombreConductor" UIHint="TextDisable" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <label class="col-sm-1 control-label">Edad</label>
                                                            <asp:DynamicControl ID="DynamicControl4" runat="server" DataField="edadConductor" UIHint="TextDisable" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <label class="col-sm-1 control-label">Registro</label>
                                                            <asp:DynamicControl ID="DynamicControl8" runat="server" DataField="registroConductor" UIHint="TextDisable" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-2 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <label class="control-label"></label>
                                                            <asp:LinkButton ID="LinkButton1" OnCommand="hlMasInfo_Command" CommandArgument='<%# Eval("idHeader") %>' runat="server" CssClass="btn btn-primary btn-xs">Ver Parte</asp:LinkButton>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-2 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <label class="col-sm-2 control-label">Documento</label>
                                                            <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="documento" UIHint="TextDisable" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <label class="col-sm-1 control-label">Responsabilidad</label>
                                                            <asp:TextBox ID="TextBox12" runat="server" class="form-control" disabled="disabled" Text='<%# Eval("tResponsabilidad.responsabilidad") %>'></asp:TextBox>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <label class="control-label">Gravedad</label>
                                                            <asp:TextBox ID="detalle" runat="server" class="form-control" disabled="disabled" Text='<%# Eval("tNivelGravedad.NivelDeGravedad") %>'></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-2 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <label class="col-sm-1 control-label">Telefono</label>
                                                            <asp:DynamicControl ID="DynamicControl7" runat="server" DataField="telefono" UIHint="TextDisable" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <label class="control-label">Direccion</label>
                                                            <asp:TextBox ID="TextBox9" runat="server" class="form-control" disabled="disabled" Text='<%# Eval("domicilioConductor") %>'></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-2 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <label class="col-sm-1 control-label">Titular</label>
                                                            <asp:DynamicControl ID="DynamicControl9" runat="server" DataField="nombreTitular" UIHint="TextDisable" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <label class="control-label">Direccion Titular</label>
                                                            <asp:TextBox ID="TextBox6" runat="server" class="form-control" disabled="disabled" Text='<%# Eval("domicilioTitular") %>'></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-2 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <label class="control-label">Telefono Titular</label>
                                                            <asp:DynamicControl ID="DynamicControl10" runat="server" DataField="telefonoTitular" UIHint="TextDisable" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <label class="control-label">Tipo Vehiculo</label>
                                                            <asp:TextBox ID="TextBox14" runat="server" class="form-control" disabled="disabled" Text='<%# Eval("tVehiculoTipo.TipoDeVehiculo") %>'></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-2 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <label class="control-label">Compañia de Seguro</label>
                                                            <asp:TextBox ID="TextBox16" runat="server" class="form-control" disabled="disabled" Text='<%# Eval("tCiaDeSeguro.CiaDeSeguro") %>'></asp:TextBox>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <label class="control-label">Poliza</label>
                                                            <asp:TextBox ID="TextBox15" runat="server" class="form-control" disabled="disabled" Text='<%# Eval("Poliza") %>'></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-2 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <label class="control-label">Vehiculo</label>
                                                            <asp:TextBox ID="TextBox11" runat="server" class="form-control" disabled="disabled" Text='<%# Eval("vehiculoMarca") %>'></asp:TextBox>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <label class="control-label">Año</label>
                                                            <asp:TextBox ID="TextBox10" runat="server" class="form-control" disabled="disabled" Text='<%# Eval("vehiculoAnio") %>'></asp:TextBox>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <label class="control-label">Patente</label>
                                                            <asp:TextBox ID="TextBox5" runat="server" class="form-control" disabled="disabled" Text='<%# Eval("patente") %>'></asp:TextBox>
                                                        </div>
                                                    </div>


                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-3 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-10">
                                                            <label class="control-label">Daños</label>
                                                            <asp:TextBox ID="TextBox17" runat="server" class="form-control" disabled="disabled" TextMode="MultiLine" Rows="3" Text='<%# Eval("detalleDanios") %>'></asp:TextBox>
                                                        </div>
                                                    </div>


                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-3 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-10">
                                                            <label class="control-label">Otros Detalles</label>
                                                            <asp:TextBox ID="TextBox18" runat="server" class="form-control" disabled="disabled" TextMode="MultiLine" Rows="3" Text='<%# Eval("otroDetalle") %>'></asp:TextBox>
                                                        </div>
                                                    </div>



                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-2 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <label class="col-sm-3 control-label">Fec.Siniestro</label>
                                                            <asp:TextBox ID="TextBox1" runat="server" class="form-control" disabled="disabled" Text='<%# Format(Eval("pHeader.fechaSiniestro"), "dd/MM/yy") %>'></asp:TextBox>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <label class="col-sm-3 control-label">Fec.Parte</label>
                                                            <asp:TextBox ID="TextBox2" runat="server" class="form-control" disabled="disabled" Text='<%# Format(Eval("pHeader.fechaParte"), "dd/MM/yy") %>'></asp:TextBox>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <label class="control-label">Culpabilidad</label>
                                                            <asp:TextBox ID="TextBox3" runat="server" class="form-control" disabled="disabled" Text='<%# Eval("pHeader.tCulpabilidad") %>'></asp:TextBox>
                                                        </div>

                                                    </div>


                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-3 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-10">
                                                            <label class="col-sm-2 control-label">Declaración</label>
                                                            <asp:TextBox ID="TextBox7" runat="server" class="form-control" disabled="disabled" TextMode="MultiLine" Rows="10" Text='<%# Eval("pHeader.declaracion") %>'></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-3 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-10">
                                                            <label class="col-sm-6 control-label">Declaracion Administrativa</label>
                                                            <asp:TextBox ID="TextBox8" runat="server" class="form-control" disabled="disabled" TextMode="MultiLine" Rows="10" Text='<%# Eval("pHeader.declaracionAdministrativa") %>'></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <br />

                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-3 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-10 text-center">
                                                            <%--<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" CssClass="btn btn-primary btn-xs" />--%>
                                                            <%--                                                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" OnCommand="UpdateCancelButton_Command" CommandName="Cancel" Text="Volver" CssClass="btn btn-white btn-xs" />--%>
                                                            <asp:HyperLink ID="HyperLink3" NavigateUrl='<%# Eval("idHeader", "/default.aspx") %>' runat="server" CssClass="btn btn-white btn-xs">Volver</asp:HyperLink>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </section>


                                    </div>
                                </section>
                            </div>
                    </EditItemTemplate>
                </asp:FormView>

                <asp:LinqDataSource ID="dsFormViewVehiculo" EnableUpdate="true" runat="server" ContextTypeName="legLinq.LegalesDataContext" TableName="pVehiculo" Where="idRegistro == @idRegistro">
                    <WhereParameters>
                        <asp:Parameter DefaultValue="-1" Name="idRegistro" Type="Int32" />
                    </WhereParameters>
                </asp:LinqDataSource>






                <asp:FormView Visible="false" RenderOuterTable="False" DefaultMode="Edit" ID="formViewPropiedad" runat="server" DataSourceID="dsPropiedad" DataKeyNames="idHeader">
                    <EditItemTemplate>

                        <div class="row no-gutter">
                            <div class="col-sm-7">
                                <section class="panel">
                                    <div class="panel-body">
                                        <section class="panel">
                                            <header class="panel-heading">
                                                <span class="label bg-danger pull-right">Propiedad</span>
                                                <div class="form-inline">
                                                    Datos de la propiedad&nbsp;&nbsp; 
                                                </div>
                                            </header>
                                            <div class="panel-body">
                                                <div class="form-horizontal">
                                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Font-Bold="true" CssClass="DDValidator" Display="Dynamic" />
                                                    <asp:CustomValidator ID="CustomValidator1" runat="server" Visible="false" ErrorMessage="CustomValidator" Display="Dynamic"> </asp:CustomValidator>

                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-2 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-2 control-label">Parte</label>
                                                            <asp:DynamicControl ID="DynamicControl2" runat="server" DataField="idHeader" UIHint="TextDisable" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <label class="control-label">Nombre Propietario</label>
                                                            <asp:DynamicControl ID="DynamicControl3" runat="server" DataField="nombrePropietario" UIHint="TextDisable" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>

                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-2 control-label"></label>
                                                        </div>


                                                        <div class="col-sm-2">
                                                            <label class="control-label"></label>
                                                            <asp:LinkButton ID="LinkButton1" OnCommand="hlMasInfo_Command" CommandArgument='<%# Eval("idHeader") %>' runat="server" CssClass="btn btn-primary btn-xs">Ver Parte</asp:LinkButton>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-2 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-7">
                                                            <label class="col-sm-1 control-label">Domicilio</label>
                                                            <asp:DynamicControl ID="DynamicControl4" runat="server" DataField="domicilionPropietario" UIHint="TextDisable" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <label class="col-sm-2 control-label">Telefono</label>
                                                            <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="telefono" UIHint="TextDisable" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>


                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-2 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-10">
                                                            <label class="control-label">Daños</label>
                                                            <asp:TextBox ID="TextBox17" runat="server" class="form-control" disabled="disabled" TextMode="MultiLine" Rows="3" Text='<%# Eval("detalleDanios") %>'></asp:TextBox>
                                                        </div>
                                                    </div>


                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-2 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <label class="col-sm-1 control-label">Responsabilidad</label>
                                                            <asp:TextBox ID="TextBox20" runat="server" class="form-control" disabled="disabled" Text='<%# Eval("tResponsabilidad.responsabilidad") %>'></asp:TextBox>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <label class="control-label">Gravedad</label>
                                                            <asp:TextBox ID="TextBox21" runat="server" class="form-control" disabled="disabled" Text='<%# Eval("tNivelGravedad.NivelDeGravedad") %>'></asp:TextBox>
                                                        </div>
                                                    </div>



                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-2 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <label class="col-sm-3 control-label">Fec.Siniestro</label>
                                                            <asp:TextBox ID="TextBox1" runat="server" class="form-control" disabled="disabled" Text='<%# Format(Eval("pHeader.fechaSiniestro"), "dd/MM/yy") %>'></asp:TextBox>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <label class="col-sm-3 control-label">Fec.Parte</label>
                                                            <asp:TextBox ID="TextBox2" runat="server" class="form-control" disabled="disabled" Text='<%# Format(Eval("pHeader.fechaParte"), "dd/MM/yy") %>'></asp:TextBox>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <label class="control-label">Culpabilidad</label>
                                                            <asp:TextBox ID="TextBox3" runat="server" class="form-control" disabled="disabled" Text='<%# Eval("pHeader.tCulpabilidad") %>'></asp:TextBox>
                                                        </div>

                                                    </div>


                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-3 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-10">
                                                            <label class="col-sm-2 control-label">Declaración</label>
                                                            <asp:TextBox ID="TextBox7" runat="server" class="form-control" disabled="disabled" TextMode="MultiLine" Rows="10" Text='<%# Eval("pHeader.declaracion") %>'></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-3 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-10">
                                                            <label class="col-sm-6 control-label">Declaracion Administrativa</label>
                                                            <asp:TextBox ID="TextBox8" runat="server" class="form-control" disabled="disabled" TextMode="MultiLine" Rows="10" Text='<%# Eval("pHeader.declaracionAdministrativa") %>'></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <br />

                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-3 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-10 text-center">
                                                            <%--<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" CssClass="btn btn-primary btn-xs" />--%>
                                                            <%--                                                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" OnCommand="UpdateCancelButton_Command" CommandName="Cancel" Text="Volver" CssClass="btn btn-white btn-xs" />--%>
                                                            <asp:HyperLink ID="HyperLink3" NavigateUrl='<%# Eval("idHeader", "/default.aspx") %>' runat="server" CssClass="btn btn-white btn-xs">Volver</asp:HyperLink>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </section>


                                    </div>
                                </section>
                            </div>
                    </EditItemTemplate>
                </asp:FormView>

                <asp:LinqDataSource ID="dsPropiedad" EnableUpdate="true" runat="server" ContextTypeName="legLinq.LegalesDataContext" TableName="pPropiedad" Where="idRegistro == @idRegistro">
                    <WhereParameters>
                        <asp:Parameter DefaultValue="-1" Name="idRegistro" Type="Int32" />
                    </WhereParameters>
                </asp:LinqDataSource>










                <div class="col-sm-5">
                    <section class="panel">
                        <div class="panel-body">
                            <section class="panel">
                                <header class="panel-heading">
                                    <span class="label bg-danger pull-right">Documentos</span>
                                    Notas Preliminares
                                </header>

                                <asp:GridView ID="gvNotasPreliminares" runat="server" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Fecha" HeaderStyle-Width="30px">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text=''></asp:Label>
                                                <asp:LinkButton ID="verNotaPreliminar" OnCommand="verNotaPreliminar_Command" CommandArgument='<%# Eval("np.idNotaPreliminar")%>' runat="server"><%# Format(Eval("np.fecha"), "dd/MM/yy")%></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Width="30px"></HeaderStyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Damnificado" HeaderStyle-Width="30px">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="verNovedad" OnCommand="verNotaPreliminar_Command" CommandArgument='<%# Eval("np.idNotaPreliminar")%>' runat="server"><%# Eval("damnificado")%></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Width="30px"></HeaderStyle>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle CssClass="center th"></HeaderStyle>
                                    <RowStyle CssClass="td"></RowStyle>
                                </asp:GridView>
                            </section>
                            <section class="panel">
                                <header class="panel-heading">
                                    <span class="label bg-danger pull-right">Documentos</span>
                                    Nueva Nota Preliminar
                                </header>
                                <div class="panel-body">
                                    <div class="form-horizontal">


                                        <asp:FormView RenderOuterTable="False" DefaultMode="Insert" ID="FormView2" runat="server" DataSourceID="LinqDataSource1" DataKeyNames="idNota">
                                            <EditItemTemplate>
                                                <div class="form-group">

                                                    <div class="col-sm-12">
                                                        <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="detalle" Mode="Insert" UIHint="TextMultiline" ValidationGroup="Insert" />
                                                    </div>
                                                </div>

                                                <div class="form-group">

                                                    <div class="col-sm-10">
                                                        <label class="control-label">Fecha</label>
                                                        <asp:DynamicControl ID="DynamicControl7" runat="server" DataField="fecha" Mode="Insert" ValidationGroup="Insert" />
                                                    </div>
                                                </div>



                                                <br />

                                                <div class="form-group">
                                                    <div class="col-lg-7 col-lg-offset-3">
                                                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Guardar" CssClass="btn btn-primary btn-xs" />
                                                    </div>
                                                </div>


                                            </EditItemTemplate>
                                        </asp:FormView>

                                        <asp:LinqDataSource ID="LinqDataSource1" EnableInsert="True" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="pNotasPreliminares">
                                        </asp:LinqDataSource>
                                    </div>
                                </div>

                            </section>
                    </section>
                </div>





























                </div>


             

            </form>
        </section>
    </section>

    <script>
        <%
        If lanzarmodal <> "" Then
            Response.Write("$('#modal').modal()")
        End If
        %>
    </script>

</asp:Content>
