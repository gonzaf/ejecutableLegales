<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.master" CodeBehind="ePte.aspx.vb" Inherits="Dynamic_Data.ePte" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <asp:DynamicDataManager ID="DynamicDataManager1" runat="server">
        <DataControls>
            <asp:DataControlReference ControlID="FormView1" />
            <asp:DataControlReference ControlID="gvReclamosAbiertos" />
        </DataControls>
    </asp:DynamicDataManager>



    <section id="content">
        <section class="main padder">
            <form id="form1" runat="server">

                <input type="hidden" id="imprimir" name="imprimir" value="true" />
                <div class="row no-gutter">
                    <div class="col-sm-5">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Parte</span>
                                        <div id="tituloSiniestro" runat="server" class="form-inline">
                                            
                                        </div>
                                    </header>
                                    <div class="panel-body">
                                        <div class="form-horizontal">
                                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Font-Bold="true" CssClass="DDValidator" Display="Dynamic" />
                                            <asp:CustomValidator ID="CustomValidator1" runat="server" Visible="false" ErrorMessage="CustomValidator" Display="Dynamic"> </asp:CustomValidator>

                                            <asp:FormView RenderOuterTable="False" DefaultMode="Edit" ID="FormView1" runat="server" DataSourceID="dsFormView" DataKeyNames="idHeader">
                                                <EditItemTemplate>
                                                    <div class="form-group">

                                                        <div class="col-sm-1">
                                                            <label class="col-sm-2 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <label class="col-sm-2 control-label">Empresa</label>
                                                            <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="EmpresaAbreviada" UIHint="TextDisable" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <label class="col-sm-1 control-label">Linea</label>
                                                            <asp:DynamicControl ID="DynamicControl9" runat="server" DataField="linea" UIHint="TextDisable" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <label class="col-sm-1 control-label">Interno</label>
                                                            <asp:DynamicControl ID="DynamicControl10" runat="server" DataField="interno" UIHint="TextDisable" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <label class="control-label">Patente</label>
                                                            <asp:DynamicControl ID="DynamicControl11" runat="server" DataField="patente" UIHint="TextDisable" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>

                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-2 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <label class="col-sm-3 control-label">Fec.Siniestro</label>
                                                            <asp:DynamicControl ID="DynamicControl3" runat="server" DataField="fechaSiniestro" UIHint="TextDisable" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <label class="col-sm-3 control-label">Fec.Parte</label>
                                                            <asp:DynamicControl ID="DynamicControl7" runat="server" DataField="fechaParte" UIHint="TextDisable" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <label class="control-label">Culpabilidad</label>
                                                            <asp:DynamicControl ID="DynamicControl2" runat="server" DataField="tCulpabilidad" UIHint="TextDisable" Mode="Readonly" ValidationGroup="Insert" />
                                                        </div>

                                                    </div>



                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-1 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <label class="control-label">Legajo</label>
                                                            <asp:DynamicControl ID="DynamicControl8" runat="server" DataField="legajo" UIHint="TextDisable" Mode="Readonly" ValidationGroup="Insert" />
                                                        </div>
                                                        <div class="col-sm-5">
                                                            <label class="control-label">Apellido</label>
                                                            <asp:DynamicControl ID="DynamicControl6" runat="server" DataField="apellido" UIHint="TextDisable" Mode="Readonly" ValidationGroup="Insert" />
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <label class="control-label">Puede Circular</label>
                                                            <asp:DynamicControl ID="DynamicControl4" runat="server" DataField="puedeCircular" UIHint="TextDisable" Mode="Readonly" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-3 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-10">
                                                            <label class="col-sm-4 control-label">Daños Vehiculos</label>
                                                            <asp:DynamicControl ID="DynamicControl13" UIHint="TextDisable" runat="server" DataField="daniosVehiculo" Mode="readonly" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-3 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-10">
                                                            <label class="col-sm-2 control-label">Declaración</label>
                                                            <asp:DynamicControl ID="DynamicControl5" UIHint="TextMultiLine" runat="server" DataField="declaracion" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class="col-sm-3 control-label"></label>
                                                        </div>
                                                        <div class="col-sm-10">
                                                            <label class="col-sm-6 control-label">Declaración Administrativa</label>
                                                            <asp:DynamicControl ID="DynamicControl12" UIHint="TextMultiLine" Mode="ReadOnly" runat="server" DataField="declaracionAdministrativa" ValidationGroup="Insert" />
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


                                                </EditItemTemplate>
                                            </asp:FormView>

                                            <asp:LinqDataSource ID="dsFormView" EnableUpdate="true" runat="server" ContextTypeName="legLinq.LegalesDataContext" TableName="pHeader" Where="idHeader == @idHeader">
                                                <WhereParameters>
                                                    <asp:Parameter DefaultValue="-1" Name="idHeader" Type="Int32" />
                                                </WhereParameters>
                                            </asp:LinqDataSource>
                                        </div>
                                    </div>
                                </section>
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Documentos</span>
                                        Informes y Notas
                                    </header>

                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" DataKeyNames="idNota" OnPreRender="GVPreRender" DataSourceID="dsNotas">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Fecha" HeaderStyle-Width="30px">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1234234" runat="server" Text='<%# Format(Eval("fecha"), "dd/MM/yy")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Nota" HeaderStyle-Width="100px">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="verNota" OnCommand="verNota_Command1" CommandArgument='<%# Eval("idNota")%>' runat="server"><%# Eval("nota")%></asp:LinkButton>
                                                    <%--<asp:LinkButton ID="verNota" OnCommand="verNota_Command" CommandArgument='<%# Eval("idNota")%>' runat="server"><%# Eval("nota")%></asp:LinkButton>--%>
                                                    <%--<asp:HyperLink ID="verNota" NavigateUrl='<%# Eval("idReclamo", "/lg/er.aspx?id={0}") %>' runat="server"><%# Eval("idReclamo") %></asp:HyperLink>--%>
                                                    <%--<asp:Button runat="server" ID="verNota" OnClick="verNota_Click" Text="Ver Nota" />--%>
                                                </ItemTemplate>
                                                <HeaderStyle Width="100px"></HeaderStyle>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="tUsuario.usuario" HeaderText="Usuario" SortExpression="usuario" />

                                            <asp:TemplateField HeaderText="Documentos" HeaderStyle-Width="30px">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label19" runat="server" Text='<%# Eval("cantDocs")%>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="30px"></HeaderStyle>
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle CssClass="center th"></HeaderStyle>
                                        <RowStyle CssClass="td"></RowStyle>
                                    </asp:GridView>

                                    <asp:LinqDataSource ID="dsNotas" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="pNotas" Where="idParte == @idParte and tipoNota >= 1 and tipoNota <=4 and (idUsuarioBaja == null)">
                                        <WhereParameters>
                                            <asp:SessionParameter DefaultValue="1" Name="idParte" SessionField="ePteIdHeader" Type="Int32" />
                                        </WhereParameters>
                                    </asp:LinqDataSource>




                                </section>
                                <div class="form-group">
                                    <div class="col-lg-12 text-center">
                                        <asp:LinkButton ID="ingresarNota" OnCommand="ingresarNota_Command" CssClass="btn btn-primary btn-xs" runat="server">Ingresar Nota</asp:LinkButton>
                                    </div>
                                </div>
                                <br />
                                 <br />
                                 <div class="form-group">
                                    <div class="col-lg-12 text-center">
                                        <asp:LinkButton  ID="LinkButton2" Visible="false" OnCommand="LinkButton2_Command" CssClass="btn btn-primary btn-xs" runat="server">Ver Todas las Fotos</asp:LinkButton>
                                        <asp:HyperLink Visible="false" ID="HyperLink1"  NavigateUrl='<%# String.Format("/lg/vPhs.aspx?id={0}", 1) %>'  runat="server">Ver Todas las Fotos</asp:HyperLink>
                                        <a href="/lg/vPhs.aspx?id=<%=idHeader %>" target="vP" class="btn btn-primary btn-xs" >Ver Todas las fotos</a>
                                    </div>
                                </div>





                            </div>
                        </section>
                    </div>



                    <div class="col-sm-7">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">
                                            <asp:Label ID="lParte2" runat="server" Text=""></asp:Label></span>
                                        <div class="form-inline">
                                            Damnificados&nbsp;&nbsp; 
                                            <%--<input id="autoCompleteProductos" /></div>--%>
                                        </div>
                                    </header>

                                    <asp:GridView ID="gvDamnificados" runat="server" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender" DataSourceID="dsDamnificados">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Damnificados" HeaderStyle-Width="200px">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="verDamnificado" OnCommand="verDamnificado_Command" CommandArgument='<%# String.Concat(Eval("tipo"), "-", Eval("idRegistro"), "-", Eval("idHeader"))%>' runat="server"><%# Eval("Damnificado") %></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Lesionado" HeaderStyle-Width="200px">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# Eval("idReclamo", "/lg/er.aspx?id={0}") %>' runat="server"><%#If(Eval("idReclamo") > 0, "Ver Reclamo", "")%></asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>


                                        </Columns>
                                        <HeaderStyle CssClass="center th"></HeaderStyle>

                                        <RowStyle CssClass="td"></RowStyle>
                                    </asp:GridView>
                                    <asp:LinqDataSource ID="dsDamnificados" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="vDamnificados" Where="idHeader == @idHeader">
                                        <WhereParameters>
                                            <asp:SessionParameter DefaultValue="-1" Name="idHeader" SessionField="ePteIdHeader" Type="Int32" />
                                        </WhereParameters>
                                    </asp:LinqDataSource>
                                    <br />

                                </section>
                                <div class="form-group">
                                    <div class="col-lg-12 text-center">
                                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="/lg/nvr.aspx" CssClass="btn btn-primary btn-xs" Text="Inicio de Gestión" />
                                        <asp:LinkButton ID="LinkButton1" OnCommand="ingresarNotaPreliminar_Command" CssClass="btn btn-primary btn-xs" runat="server">Nota Preliminar</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>





                    <div class="col-sm-7">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">
                                            <asp:Label ID="lNParte" runat="server" Text=""></asp:Label></span>
                                        <div class="form-inline">
                                            Reclamos abiertos &nbsp;&nbsp; 
                                            <%--</div>--%>
                                        </div>
                                    </header>


                                    <asp:GridView ID="gvReclamosAbiertos" runat="server" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender" DataKeyNames="idReclamo" DataSourceID="dsReclamos">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Fecha" HeaderStyle-Width="30px">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label12435435" runat="server" Text='<%# Format(Eval("fecha"), "dd/MM/yy")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

<%--                                            <asp:TemplateField HeaderText="#Reclamo" HeaderStyle-Width="40px">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# Eval("idReclamo", "/lg/er.aspx?id={0}") %>' runat="server"><%# Eval("idReclamo") %></asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="Reclamo" HeaderStyle-Width="200px">
                                                <ItemTemplate>
                                                    <%--<asp:Label ID="Label16" runat="server" Text='<%# Eval("titulo")  %>'></asp:Label>--%>
                                                    <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# Eval("idReclamo", "/lg/er.aspx?id={0}") %>' runat="server"><%# Eval("titulo") %></asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            
                                              <asp:TemplateField HeaderText="Rubro" HeaderStyle-Width="250px">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label13" runat="server" Text='<%# Eval("tTipoNOvedad.Rubro")  %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Estado" HeaderStyle-Width="250px">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label14" runat="server" Text='<%# Eval("tTipoNOvedad.Novedad")  %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                          


                                            
                                        </Columns>
                                        <HeaderStyle CssClass="center th"></HeaderStyle>

                                        <RowStyle CssClass="td"></RowStyle>

                                    </asp:GridView>

                                    <asp:LinqDataSource ID="dsReclamos" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" Select="new (idReclamo, Fecha, tAbogados, tTipoReclamo, idParte, titulo, tTipoNovedad,tTipoNovedad.rubro)" TableName="rReclamos" Where="idParte == @idParte and idUsuarioBaja = null and (esRecupero = false or esRecupero = null)">
                                        <WhereParameters>
                                            <asp:SessionParameter DefaultValue="1" Name="idParte" SessionField="ePteIdHeader" Type="Int32" />
                                        </WhereParameters>
                                    </asp:LinqDataSource>
                                </section>
                            </div>
                        </section>
                    </div>



                    <div class="col-sm-7">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">
                                            <asp:Label ID="Label2" runat="server" Text=""></asp:Label></span>
                                        <div class="form-inline">
                                            Recuperos Iniciados &nbsp;&nbsp; 
                                            <%--</div>--%>
                                        </div>
                                    </header>


                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender" DataKeyNames="idReclamo" DataSourceID="LinqDataSource1">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Fecha" HeaderStyle-Width="30px">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label111" runat="server" Text='<%# Format(Eval("fecha"), "dd/MM/yy")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="#Recupero" HeaderStyle-Width="40px">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# Eval("idReclamo", "/lg/er.aspx?id={0}") %>' runat="server"><%# Eval("idReclamo") %></asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Rubro" HeaderStyle-Width="250px">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label11223" runat="server" Text='<%# Eval("tTipoNOvedad.Rubro")  %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Estado" HeaderStyle-Width="250px">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label112123" runat="server" Text='<%# Eval("tTipoNOvedad.Novedad")  %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>


                                            <asp:TemplateField HeaderText="Recupero" HeaderStyle-Width="200px">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label123423" runat="server" Text='<%# Eval("titulo")  %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle CssClass="center th"></HeaderStyle>

                                        <RowStyle CssClass="td"></RowStyle>

                                    </asp:GridView>

                                    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" Select="new (idReclamo, Fecha, tAbogados, tTipoReclamo, idParte, titulo, tTipoNovedad)" TableName="rReclamos" Where="idParte == @idParte and esRecupero = true and idUsuarioBaja = null ">
                                        <WhereParameters>
                                            <asp:SessionParameter DefaultValue="1" Name="idParte" SessionField="ePteIdHeader" Type="Int32" />
                                        </WhereParameters>
                                    </asp:LinqDataSource>
                                </section>
                            </div>
                        </section>
                    </div>


                    <div class="col-sm-7">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">
                                            <asp:Label ID="lParte3" runat="server" Text=""></asp:Label></span>
                                        <div class="form-inline">
                                            Testigos del Parte &nbsp;&nbsp; 
                                            <%# Eval("idReclamo") %>
                                        </div>
                                    </header>
                                    <asp:GridView ID="gvTestigos" ShowHeader="False" runat="server" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender" DataSourceID="dsTestigos">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Testigo" HeaderStyle-Width="200px">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label123432" runat="server" Text='<%#String.Concat(Eval("ApellidoTestigo"), " ", Eval("NombreTestigo"))  %>'></asp:Label>
                                                </ItemTemplate>

                                                <HeaderStyle Width="200px"></HeaderStyle>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Testigo" HeaderStyle-Width="200px">
                                                <ItemTemplate>
                                                    <%--<asp:LinkButton ID="HyperLink1" OnCommand="HyperLink1_Command" CommandArgument='<%# Eval("idregistro") %>' runat="server"><%#IIf(Eval("tieneDeclaracion"), "Ver Declaracion", "Cargar Declaracíon") %></asp:LinkButton>--%>
                                                    <asp:HyperLink ID="HyperLink3" NavigateUrl='<%# Eval("idregistro", "/lg/iDec.aspx?id={0}") %>' runat="server"><%#IIf(Eval("tieneDeclaracion"), "Ver Declaracion", "Cargar Declaracíon") %></asp:HyperLink>
                                                </ItemTemplate>
                                                <HeaderStyle Width="200px"></HeaderStyle>
                                            </asp:TemplateField>

                                        </Columns>
                                        <HeaderStyle CssClass="center th"></HeaderStyle>
                                        <RowStyle CssClass="td"></RowStyle>
                                    </asp:GridView>
                                    <asp:LinqDataSource ID="dsTestigos" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" Select="new (idregistro, NombreTestigo, ApellidoTestigo, rDeclaracion, tieneDeclaracion)" TableName="pTestigos" Where="idheader == @idheader">
                                        <WhereParameters>
                                            <asp:SessionParameter DefaultValue="1" Name="idheader" SessionField="ePteIdHeader" Type="Int32" />
                                        </WhereParameters>
                                    </asp:LinqDataSource>
                                    <br />
                                </section>

                            </div>
                        </section>
                    </div>

                    <div class="col-sm-7" id="divNotas" runat="server">
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
                                                    <asp:Label ID="Label1fsdfsdf" runat="server" Text=''></asp:Label>
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

                                    <%--<asp:LinqDataSource ID="ldsNotasPreliminares" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="pNotasPreliminares" Where="idParte == @idParte">
                                        <WhereParameters>
                                            <asp:SessionParameter DefaultValue="1" Name="idheader" SessionField="ePteIdHeader" Type="Int32" />
                                        </WhereParameters>
                                    </asp:LinqDataSource>--%>
                                </section>
                                <div class="form-group">
                                    <div class="col-lg-12 text-center">
                                        <asp:LinkButton ID="ingresarNotaPreliminar" OnCommand="ingresarNotaPreliminar_Command" CssClass="btn btn-primary btn-xs" runat="server">Nota Preliminar</asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                        </section>
                    </div>

















                    <!-- .modal -->
                    <div id="modal" class="modal fade">
                        <%--<form class="m-b-none">--%>
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times"></i></button>
                                    <h4 class="modal-title" id="myModalLabel">Nueva Nota</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="panel-body">
                                        <div class="form-horizontal">
                                            <asp:FormView ID="fvNota" RenderOuterTable="False" DefaultMode="Edit" runat="server" DataSourceID="ldsNotas" DataKeyNames="idNota">
                                                <EditItemTemplate>

                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Fecha</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl14" runat="server" DataField="fecha" Mode="Insert" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Nota</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl15" runat="server" DataField="nota" Mode="Insert" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Detalle</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DetalleDynamicControl" runat="server" DataField="Detalle" Mode="Insert" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Usuario</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl16" runat="server" DataField="usuario" Mode="Insert" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Documento</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl17" runat="server" DataField="documento" Mode="Insert" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>

                                                    <br />

                                                    <div class="form-group">
                                                        <div class="col-lg-7 col-lg-offset-3">
                                                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" ValidationGroup="Insert" CssClass="btn btn-primary btn-xs" />
                                                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" data-dismiss="modal" CommandName="Cancel" Text="Cancelar" CssClass="btn btn-white btn-xs" />
                                                        </div>
                                                    </div>
                                                </EditItemTemplate>
                                            </asp:FormView>
                                            <asp:LinqDataSource ID="ldsNotas" OnUpdating="LinqDataSource2_Updating" runat="server" ContextTypeName="legLinq.LegalesDataContext" TableName="pNotas" EnableInsert="True" EnableUpdate="True" EntityTypeName="" Where="idNota == @idNota">
                                                <WhereParameters>
                                                    <asp:Parameter DefaultValue="-1" Name="idNota" Type="Int32" />
                                                </WhereParameters>
                                            </asp:LinqDataSource>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-xs btn-default" data-dismiss="modal">Cancelar</button>
                                    <button type="button" class="btn btn-xs btn-primary" data-loading-text="Publishing...">Guardar</button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <%--</form>--%>
                    </div>
                    <!-- / .modal -->














                </div>
            </form>
        </section>
    </section>

    <script>
        <%
        If lanzarModal <> "" Then
            Response.Write("$('#modal').modal()")
        End If
        %>
    </script>

</asp:Content>
