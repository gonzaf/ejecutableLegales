<%@ Page Title="" Language="vb" AutoEventWireup="false" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/Site.master" CodeBehind="eR.aspx.vb" Inherits="Dynamic_Data.eR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



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
                                        <span class="label bg-danger pull-right">Nuevo <%=reclamoOrecupero%></span>
                                        <div class="form-inline">
                                            <asp:Label ID="titulo" runat="server" Text="Reclamo"></asp:Label>&nbsp;&nbsp; 
                                        </div>
                                    </header>
                                    <div class="panel-body">
                                        <div class="form-horizontal">

                                            <div class="form-group">
                                                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="None"> </asp:CustomValidator>
                                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="DDValidator" ForeColor="Red" />

                                                <%--<label id="labelReclamo" runat="server" class="col-sm-3 control-label">Nro.Reclamo</label>
                                                <div class="col-sm-2">
                                                    <asp:TextBox ID="tbIdReclamo" Enabled="false" ClientIDMode="Static" data-button="bNroReclamo" runat="server" CssClass="form-control input-sm clickButton"></asp:TextBox>
                                                </div>--%>
                                                <div class="col-sm-7">
                                                    <label class="col-sm-5 control-label">Empresa</label>
                                                    <div class="col-sm-7">
                                                        <asp:TextBox ID="tbParte" Enabled="false" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Siniestro</label>
                                                <div class="col-sm-7">
                                                    <asp:TextBox ID="tbSiniestro" Enabled="false" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Titulo</label>
                                                <div class="col-sm-7">
                                                    <asp:TextBox ID="tbTitulo" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                                </div>
                                            </div>




                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Rubro</label>
                                                <div class="col-sm-5">
                                                    <asp:DropDownList ID="ddRubro" CssClass="form-control input-sm entTab" data-next="efectivo" ClientIDMode="Static" runat="server" DataTextField="Idheader" DataValueField="Idheader">
                                                        <asp:ListItem Selected="True">--</asp:ListItem>

                                                    </asp:DropDownList>
                                                </div>
                                                <div class="col-sm-2">
                                                    <asp:Button ID="bIniciar" OnClick="bIniciar_Click" runat="server" ToolTip="Quitar Damnificado" Text="Iniciar" OnClientClick="return confirm('Desea iniciar?');" CssClass="btn btn-primary btn-xs" />
                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Etapa</label>
                                                <div class="col-sm-7">
                                                    <asp:TextBox ID="tbEstado" ClientIDMode="Static" Enabled="false" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Nueva Etapa</label>
                                                <div class="col-sm-5">
                                                    <asp:DropDownList ID="nuevaEtapa" CssClass="form-control input-sm entTab" data-next="efectivo" ClientIDMode="Static" runat="server" DataTextField="novedad" DataValueField="idTipoNovedad">
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="col-sm-2">
                                                    <asp:Button ID="cambiarEtapa" OnClick="cambiarEtapa_Click" runat="server" ToolTip="Cambiar Etapa" Text="Cambiar" OnClientClick="return confirm('Desea cambiar de etapa?');" CssClass="btn btn-primary btn-xs" />
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Nivel Gravedad</label>
                                                <div class="col-sm-7">

                                                    <asp:DropDownList ID="ddNIvelGravedad" CssClass="form-control input-sm entTab" data-next="efectivo" ClientIDMode="Static" runat="server" AutoPostBack="True">
                                                        <asp:ListItem Value="1" Selected="True">Leve</asp:ListItem>
                                                        <asp:ListItem Value="2">Grave</asp:ListItem>
                                                    </asp:DropDownList>

                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">Fecha</label>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="fecha" runat="server" ClientIDMode="Static" data-next="ddMoneda" CssClass="entTab form-control input-sm datepicker" onfocus="this.select()" onblur="convert_date(this)"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:DropDownList ID="ddTipoReclamo" OnSelectedIndexChanged="ddTipoReclamo_SelectedIndexChanged" CssClass="entTab form-control input-sm" ClientIDMode="Static" runat="server" data-next="rbEfectivo" AutoPostBack="true">
                                                        <asp:ListItem Value="1" Selected="True">Material</asp:ListItem>
                                                        <asp:ListItem Value="2">Lesiones Transportados</asp:ListItem>
                                                        <asp:ListItem Value="3">Lesiones no transportados</asp:ListItem>
                                                        <asp:ListItem Value="4">Materiales y no transportados</asp:ListItem>
                                                    </asp:DropDownList>

                                                </div>
                                            </div>




                                            <div id="damnificados" runat="server">
                                                <div class="form-group">
                                                    <label id="t" runat="server" class="col-sm-3 control-label">Damnificados</label>
                                                    <div class="col-sm-5">
                                                        <asp:ListBox ID="lbDamnificados" runat="server" CssClass="form-control entTab" DataSourceID="dsDamnificados2" DataTextField="nombre" DataValueField="id"></asp:ListBox>
                                                        <asp:LinqDataSource ID="dsDamnificados2" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="rDamnificados" Where="idReclamo == @idReclamo" Select="new (idDamnificado, idReclamo, tipoDamnificado, nombre,tipoDamnificado & '-' & idDamnificado as id)">
                                                            <WhereParameters>
                                                                <asp:QueryStringParameter Name="idReclamo" QueryStringField="id" Type="Int32" />
                                                            </WhereParameters>
                                                        </asp:LinqDataSource>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <asp:Button ID="quitar" OnClick="quitar_Click" runat="server" ToolTip="Quitar Damnificado" Text="Quitar" OnClientClick="return confirm('Desea quitar el Damnificado?');" CssClass="btn btn-primary btn-xs" />
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label"></label>
                                                    <div class="col-sm-7">
                                                        <label id="tt" runat="server" class="control-label">Agregar Damnificado</label>
                                                    </div>

                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label"></label>
                                                    <div class="col-sm-5">

                                                        <asp:DropDownList ID="ddDamnificados" CssClass="form-control input-sm entTab" data-next="efectivo" ClientIDMode="Static" runat="server" DataSourceID="dsNuevosDamnificados" DataTextField="g2" DataValueField="g">
                                                        </asp:DropDownList>
                                                        <asp:LinqDataSource ID="dsNuevosDamnificados" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="vDamnificadosSinReclamos" OrderBy="Damnificado" Where="idHeader == @idHeader" Select='new (idRegistro, Tipo, idHeader, Damnificado,tipo & "-" & idRegistro as g,damnificado & " (" & tipo & ")" as g2  )'>
                                                            <WhereParameters>
                                                                <asp:Parameter Name="idHeader" Type="Int32" />
                                                            </WhereParameters>
                                                        </asp:LinqDataSource>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <asp:Button ID="agregar" runat="server" OnClick="agregar_Click" ToolTip="Agregar Damnificado" Text="Agregar" OnClientClick="return confirm('Desea agregar el Damnificado?');" CssClass="btn btn-primary btn-xs" />
                                                    </div>
                                                </div>
                                            </div>





                                            <div id="demandados" runat="server">
                                                <div class="form-group">
                                                    <label id="Label2" runat="server" class="col-sm-3 control-label">Demandados</label>
                                                    <div class="col-sm-5">
                                                        <asp:ListBox ID="lbDemandados" runat="server" CssClass="form-control entTab" DataSourceID="ldsDemandados" DataTextField="nombre" DataValueField="id"></asp:ListBox>
                                                        <asp:LinqDataSource ID="ldsDemandados" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="rCiaDeSeguro" Where="idRecupero == @idRecupero" Select="new (idCiaDeSeguro as id,tCiaDeSeguro.CiaDeSeguro as nombre)">
                                                            <WhereParameters>
                                                                <asp:QueryStringParameter Name="idRecupero" QueryStringField="id" Type="Int32" />
                                                            </WhereParameters>
                                                        </asp:LinqDataSource>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <asp:Button ID="bQuitarDemandado" OnClick="bQuitarDemandado_Click" runat="server" ToolTip="Quitar Demandado" Text="Quitar" OnClientClick="return confirm('Desea quitar el Demandado?');" CssClass="btn btn-primary btn-xs" />
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label"></label>
                                                    <div class="col-sm-7">
                                                        <label id="Label3" runat="server" class="control-label">Agregar Demandado</label>
                                                    </div>

                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label"></label>
                                                    <div class="col-sm-5">

                                                        <asp:DropDownList ID="ddDemandados" CssClass="form-control input-sm entTab" data-next="efectivo" ClientIDMode="Static" runat="server" DataSourceID="ldsNuevosDemandados" DataTextField="CiaDeSeguro" DataValueField="idCiaDeSeguro">
                                                        </asp:DropDownList>
                                                        <asp:LinqDataSource ID="ldsNuevosDemandados" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="tCiaDeSeguro" OrderBy="CiaDeSeguro">
                                                        </asp:LinqDataSource>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" ToolTip="Agregar Demandado" Text="Agregar" OnClientClick="return confirm('Desea agregar el Demandados?');" CssClass="btn btn-primary btn-xs" />
                                                    </div>
                                                </div>
                                            </div>





                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Abogado</label>
                                                <div class="col-sm-7">

                                                    <asp:DropDownList ID="ddAbogado" CssClass="form-control input-sm entTab" data-next="efectivo" ClientIDMode="Static" runat="server" DataSourceID="dsAbogados" DataTextField="nombre" DataValueField="idAbogado" AutoPostBack="True" OnDataBound="ddAbogado_DataBound">
                                                    </asp:DropDownList>
                                                    <asp:LinqDataSource ID="dsAbogados" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" Select="new (idAbogado, Apellido &amp; ' ' &amp; Nombre   as nombre)" TableName="tAbogados" OrderBy="Apellido">
                                                    </asp:LinqDataSource>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">Notas</label>
                                                <div class="col-lg-7">
                                                    <asp:TextBox ID="notas" runat="server" class="form-control" placeholder="Notas del abogado de la empresa" Rows="4" TextMode="MultiLine"></asp:TextBox>
                                                    <%--<textarea id="notas"  class="form-control" data-trigger="keyup" data-rangelength="[20,200]"></textarea>--%>
                                                </div>
                                            </div>


                                            <br />
                                            <br />
                                            <br />



                                            <div id="alertas" runat="server">

                                                <div class="form-group">
                                                    <label class="col-lg-3 control-label">Alertas</label>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="dFecha" runat="server" ClientIDMode="Static" data-next="ddMoneda" CssClass="entTab form-control input-sm datepicker" onfocus="this.select()" onblur="convert_date(this)"></asp:TextBox>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="hFecha" runat="server" ClientIDMode="Static" data-next="ddMoneda" CssClass="entTab form-control input-sm datepicker" onfocus="this.select()" onblur="convert_date(this)"></asp:TextBox>
                                                    </div>
                                                </div>

                                                

                                                <div class="form-group">
                                                    <label id="Label5" runat="server" class="col-sm-3 control-label">Usuarios</label>
                                                    <div class="col-sm-5">
                                                        <asp:ListBox ID="lbUsuarios" runat="server" CssClass="form-control entTab" DataSourceID="ldsUsuarios" DataTextField="detalle" DataValueField="idUsuario"></asp:ListBox>
                                                        <asp:LinqDataSource ID="ldsUsuarios" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="rAlertasUsuarios" Select="new (tUsuario.detalle as detalle,idUsuario as idUsuario)"  Where="rAlertas.idReclamo == @idReclamo">
                                                            <WhereParameters>
                                                                <asp:QueryStringParameter Name="idReclamo" QueryStringField="id" Type="Int32" />
                                                            </WhereParameters>
                                                        </asp:LinqDataSource>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <asp:Button ID="bQuitarUsuario" OnClick="bQuitarUsuario_Click" runat="server" ToolTip="Quitar Damnificado" Text="Quitar" OnClientClick="return confirm('Desea quitar el usuario?');" CssClass="btn btn-primary btn-xs" />
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label"></label>
                                                    <div class="col-sm-7">
                                                        <label id="Label6" runat="server" class="control-label">Agregar Usuario</label>
                                                    </div>

                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label"></label>
                                                    <div class="col-sm-5">

                                                        <asp:DropDownList ID="ddUsuarios" CssClass="form-control input-sm entTab" data-next="efectivo" ClientIDMode="Static" runat="server" DataSourceID="ldsUsus" DataTextField="detalle" DataValueField="idUser">
                                                        </asp:DropDownList>
                                                        <asp:LinqDataSource ID="ldsUsus" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="tUsuario" Where="solapa10 == 0" OrderBy="detalle">

                                                        </asp:LinqDataSource>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <asp:Button ID="bAgregarUsuario" runat="server" OnClick="bAgregarUsuario_Click" ToolTip="Agregar" Text="Agregar" OnClientClick="return confirm('Desea agregar el usuario?');" CssClass="btn btn-primary btn-xs" />
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                <label class="col-lg-3 control-label">Notas</label>
                                                <div class="col-lg-7">
                                                    <asp:TextBox ID="tbNotasAlerta" runat="server" class="form-control" placeholder="Notas Alerta" Rows="4" TextMode="MultiLine"></asp:TextBox>
                                                    <%--<textarea id="notas"  class="form-control" data-trigger="keyup" data-rangelength="[20,200]"></textarea>--%>
                                                </div>
                                            </div>


                                            </div>




                                            <br />
                                            <br />
                                            <br />







                                            <div class="form-group">
                                                <div class="col-lg-7 col-lg-offset-3">
                                                    <asp:Button ID="guardar" runat="server" Text="Guardar" OnClientClick="return finalizar();" CssClass="btn btn-primary btn-xs" />
                                                    <asp:Button ID="cancelar" runat="server" Enabled="true" Text="Cancelar" OnClientClick="return cancelar();" CssClass="btn btn-white btn-xs" />
                                                    <asp:Button ID="eliminar" runat="server" Enabled="true" Text="Eliminar" Visible="false" OnClientClick="return eliminar();" CssClass="btn btn-white btn-xs" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </section>
                            </div>
                        </section>
                    </div>




                    <div class="col-sm-7">
                        <section class="panel">
                            <div class="panel-body">

                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Documentos</span>
                                        Requisitos
                                    </header>

                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" DataKeyNames="idNota" OnPreRender="GVPreRender" DataSourceID="dsNotas">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Fecha" HeaderStyle-Width="30px">
                                                <ItemTemplate>

                                                    <asp:LinkButton ID="verNota2" OnCommand="verNota_Command1" CommandArgument='<%# Eval("idNota")%>' runat="server"><%# Format(Eval("fecha"), "dd/MM/yy")%></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Nota">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="verNota" OnCommand="verNota_Command1" CommandArgument='<%# Eval("idNota")%>' runat="server"><%# Eval("nota")%></asp:LinkButton>
                                                    <%--<asp:LinkButton ID="verNota" OnCommand="verNota_Command" CommandArgument='<%# Eval("idNota")%>' runat="server"><%# Eval("nota")%></asp:LinkButton>--%>
                                                    <%--<asp:HyperLink ID="verNota" NavigateUrl='<%# Eval("idReclamo", "/lg/er.aspx?id={0}") %>' runat="server"><%# Eval("idReclamo") %></asp:HyperLink>--%>
                                                    <%--<asp:Button runat="server" ID="verNota" OnClick="verNota_Click" Text="Ver Nota" />--%>
                                                </ItemTemplate>
                                                <HeaderStyle></HeaderStyle>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="requisito" HeaderText="Tipo" SortExpression="usuario" />

                                            <asp:TemplateField HeaderText="Documentos" HeaderStyle-Width="30px">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label199" runat="server" Text='<%# Eval("cantDocs")%>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="30px"></HeaderStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Usuario" HeaderStyle-Width="30px">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label19" runat="server" Text='<%# Eval("usuarioAlta")%>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="30px"></HeaderStyle>
                                            </asp:TemplateField>


                                        </Columns>
                                        <HeaderStyle CssClass="center th"></HeaderStyle>
                                        <RowStyle CssClass="td"></RowStyle>
                                    </asp:GridView>

                                    <asp:LinqDataSource ID="dsNotas" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="vRequisitos" Where="usuario == @idReclamo and (idUsuarioBaja == null)">
                                        <WhereParameters>
                                            <asp:QueryStringParameter Name="idReclamo" QueryStringField="id" Type="String" />
                                        </WhereParameters>
                                    </asp:LinqDataSource>



                                </section>
                                <div class="form-group">
                                    <div class="col-lg-12 text-center">
                                        <asp:LinkButton ID="ingresarNota" OnCommand="ingresarNota_Command" CssClass="btn btn-primary btn-xs" runat="server">Ingresar Requisito</asp:LinkButton>
                                    </div>
                                </div>

                            </div>
                        </section>
                    </div>






                    <div class="col-sm-7">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel" id="panelRequisitosViejos" runat="server" visible="false">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Documentos</span>
                                        Requisitos
                                    </header>
                                    <asp:GridView ID="gvRequisitos" runat="server" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender" ShowFooter="True">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Requisito" HeaderStyle-Width="40px">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Requisito")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Detalle" HeaderStyle-Width="40px">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label111" runat="server" Text='<%# Eval("tr.detalle")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Documento" HeaderStyle-Width="40px">
                                                <ItemTemplate>
                                                    <asp:HyperLink runat="server" Target="_blank" NavigateUrl='<%# String.Concat("/docs/", Eval("tr.idReclamo"), "-", Eval("idRequisito"), "-", Eval("tr.documento"))%>'><%# Eval("tr.documento") %></asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Acciones" HeaderStyle-Width="40px">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="HyperLink1" OnCommand="HyperLink1_Command" CommandArgument='<%# Eval("idRequisito") %>' runat="server">Cargar Documento</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                        <HeaderStyle CssClass="center th"></HeaderStyle>

                                        <RowStyle CssClass="td"></RowStyle>
                                    </asp:GridView>




                                </section>










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

                                    <%--<asp:LinqDataSource ID="ldsNotasPreliminares" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="pNotasPreliminares" Where="idParte == @idParte">
                                        <WhereParameters>
                                            <asp:SessionParameter DefaultValue="1" Name="idheader" SessionField="ePteIdHeader" Type="Int32" />
                                        </WhereParameters>
                                    </asp:LinqDataSource>--%>
                                </section>
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Documentos</span>
                                        Novedades y Etapas
                                    </header>

                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender" DataSourceID="dsNovedades">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Fecha" HeaderStyle-Width="50px">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label" runat="server" Text=''></asp:Label>
                                                    <asp:LinkButton ID="verNovedad1" OnCommand="verNovedad_Command" CommandArgument='<%# Eval("idNovedad")%>' runat="server"><%# Format(Eval("fecha"), "dd/MM/yy")%></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Etapa" HeaderStyle-Width="50px">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text=''></asp:Label>
                                                    <asp:LinkButton ID="verNovedad2" OnCommand="verNovedad_Command" CommandArgument='<%# Eval("idNovedad")%>' runat="server"><%# Eval("tTipoNovedad.Novedad")%></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>



                                            <asp:BoundField DataField="tTipoNovedad.Rubro" HeaderText="" HeaderStyle-Width="60" SortExpression="tTipoNovedad" />

                                            <asp:TemplateField HeaderText="Gestion" HeaderStyle-Width="90px">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label881" runat="server" Text=''><%#If(Eval("importeDesde") > 0 Or Eval("importeHasta") > 0, String.Concat(FormatNumber(Eval("importeDesde"), 0), " A ", FormatNumber(Eval("importeHasta"), 0)), If(Eval("importeTotal") > 0, FormatNumber(Eval("importeTotal"), 0), ""))%></asp:Label>
                                                    <asp:Label ID="Label4" runat="server" Text=''><%#If(Eval("tTipoNovedad.Novedad") = "Novedades", If(Not Eval("detalle") Is Nothing, Eval("detalle").Split(vbCrLf)(0), Eval("detalle")), "")%></asp:Label>
                                                </ItemTemplate>

                                            </asp:TemplateField>

                                            <asp:BoundField DataField="tUsuario.usuario" HeaderText="Usuario" HeaderStyle-Width="80" SortExpression="tTipoNovedad" />



                                            <%--<asp:BoundField DataField="monto" HeaderText="" SortExpression="Detalle" />--%>
                                        </Columns>
                                        <HeaderStyle CssClass="center th"></HeaderStyle>
                                        <RowStyle CssClass="td"></RowStyle>
                                    </asp:GridView>

                                    <asp:LinqDataSource ID="dsNovedades" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="rNovedades" Where="idReclamo == @idReclamo and idUsuarioBaja == null and guardadaOK == true">
                                        <WhereParameters>
                                            <asp:QueryStringParameter DefaultValue="-1" Name="idReclamo" QueryStringField="id" Type="Int32" />
                                        </WhereParameters>
                                    </asp:LinqDataSource>



                                </section>
                                <div class="form-group">
                                    <div class="col-lg-12 text-center">
                                        <asp:LinkButton ID="hl" OnCommand="ingresarNovedad" CssClass="btn btn-primary btn-xs" runat="server">Ingresar Novedad</asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                        </section>
                    </div>





                </div>
            </form>
        </section>
    </section>


    <script>
         
         <%If controlFocus <> "" Then%>
        setearFoco('<%=controlFocus%>')
         <%End If%>

        var bPreguntar = true;

        function finalizar() {
            var confirma = confirm('Desea guardar el <%=reclamoOrecupero%>?');
            //var imprime = confirm('Queres imprimir?');
            //if (imprime) $("#imprime").val = true;
            if (confirma) { bPreguntar = false }
            return confirma;
        }

        function cancelar() {
            bPreguntar = false;
        }

        function eliminar() {
            var confirma = confirm('Desea eliminar el <%=reclamoOrecupero%>?');
            //var imprime = confirm('Queres imprimir?');
            //if (imprime) $("#imprime").val = true;
            if (confirma) { bPreguntar = false }
            return confirma;
        }




        //window.onbeforeunload = preguntarAntesDeSalir;

        function preguntarAntesDeSalir() {
            if (bPreguntar) {
                alert("Debe guardar o cancelar");
                return true;

            }

        }


    </script>






</asp:Content>
