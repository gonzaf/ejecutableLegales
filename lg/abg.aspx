<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.master" CodeBehind="abg.aspx.vb" Inherits="Dynamic_Data.abg" %>

<%@ PreviousPageType VirtualPath="~/lg/eR.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <asp:DynamicDataManager ID="DynamicDataManager1" runat="server">
        <DataControls>
            <asp:DataControlReference ControlID="FormView1" />
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
                                        <span class="label bg-danger pull-right">Abogado</span>
                                        <div class="form-inline">
                                            Nuevo Abogado&nbsp;&nbsp; 
                                        </div>
                                    </header>
                                    <div class="panel-body">
                                        <div class="form-horizontal">
                                            <asp:FormView RenderOuterTable="False" DefaultMode="insert" ID="FormView1" runat="server" DataSourceID="LinqDataSource1" DataKeyNames="idAbogado">
                                                <EditItemTemplate>
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Nombre</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl7" runat="server" DataField="nombre" Mode="insert" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Apellido</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl2" runat="server" DataField="apellido" Mode="insert" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Telefono</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl3" runat="server" DataField="telefono" Mode="insert" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Dni</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="dni" Mode="insert" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Tel.Estudio</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl4" runat="server" DataField="TelefonoEstudio" Mode="insert" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Mail</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl5" runat="server" DataField="mail" Mode="insert" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Domicilio</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl6" runat="server" DataField="domicilio" Mode="insert" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>


                                                    <br />

                                                    <div class="form-group">
                                                        <div class="col-lg-7 col-lg-offset-3">
                                                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Guardar" CssClass="btn btn-primary btn-xs" />
                                                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" OnCommand="UpdateCancelButton_Command" CommandName="Cancel" Text="Cancelar" CssClass="btn btn-white btn-xs" />
                                                        </div>
                                                    </div>


                                                </EditItemTemplate>
                                            </asp:FormView>

                                            <asp:LinqDataSource ID="LinqDataSource1" EnableInsert="true" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="tAbogados">
                                            </asp:LinqDataSource>
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </section>
                    </div>

                    <div class="col-sm-12">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Detalle</span>
                                        Nota
                                    </header>
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Font-Bold="true" CssClass="DDValidator" Display="Dynamic" />
                                    <asp:CustomValidator ID="CustomValidator1" runat="server" Visible="false" ErrorMessage="CustomValidator" Display="Dynamic"> </asp:CustomValidator>

                                    <asp:GridView ID="GridView1" DataKeyNames="idAbogado" runat="server" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender" DataSourceID="dsAbogados">
                                        <Columns>

                                            <%-- <asp:TemplateField HeaderText="Abogado">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# String.Concat(Eval("nombre"), " ", Eval("apellido"))%>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle ></HeaderStyle>
                                            </asp:TemplateField>--%>
                                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="tTipoNovedad" />
                                            <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="tTipoNovedad" />
                                            <asp:BoundField DataField="telefono" HeaderText="Telefono" SortExpression="tTipoNovedad" />
                                            <asp:BoundField DataField="dni" HeaderText="DNI" SortExpression="Detalle" />
                                            <asp:BoundField DataField="telefonoEstudio" HeaderText="Tel.Estudio" SortExpression="Detalle" />
                                            <asp:BoundField DataField="mail" HeaderText="Mail" SortExpression="mail" />
                                            <asp:BoundField DataField="domicilio" HeaderText="Domicilio" SortExpression="domicilio" />


                                            <asp:CommandField />
                                            <asp:CommandField ShowEditButton="True" />


                                            <asp:CommandField  HeaderText="Eliminar" ShowDeleteButton="True" ShowHeader="True" />


                                        </Columns>
                                        <HeaderStyle CssClass="center th"></HeaderStyle>
                                        <RowStyle CssClass="td"></RowStyle>
                                    </asp:GridView>

                                    <asp:LinqDataSource ID="dsAbogados" EnableDelete="true" EnableUpdate="true" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="tAbogados">
                                    </asp:LinqDataSource>
                                </section>
                            </div>
                        </section>
                    </div>










                </div>
            </form>
        </section>
    </section>



</asp:Content>
