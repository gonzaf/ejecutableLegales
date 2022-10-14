<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.master" CodeBehind="noiNv.aspx.vb" Inherits="Dynamic_Data.noiNv" %>

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
                                        <span class="label bg-danger pull-right">Novedades</span>
                                        <div class="form-inline">
                                            Carga de Novedades&nbsp;&nbsp; 
                                        </div>
                                    </header>
                                    <div class="panel-body">
                                        <div class="form-horizontal">

                                         

                                            <asp:FormView RenderOuterTable="False" ID="FormView1" DefaultMode="edit" runat="server" DataSourceID="LinqDataSource1" DataKeyNames="idNovedad">

                                                <InsertItemTemplate>
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Titulo</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl3" runat="server" DataField="titulo" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Fecha</label>
                                                        <div class="col-sm-2">
                                                            <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="fecha" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                          <label class="col-sm-3 control-label">Monto</label>
                                                        <div class="col-sm-2">
                                                            <asp:DynamicControl ID="DynamicControl4" runat="server" DataField="monto" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Tipo</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl2" runat="server" DataField="ttiponovedad" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <br />
                                                    <div class="form-group">
                                                        <div class="col-lg-7 col-lg-offset-3">
                                                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" ValidationGroup="Insert" CssClass="btn btn-primary btn-xs" />
                                                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" CssClass="btn btn-white btn-xs" />
                                                        </div>
                                                    </div>


                                                </InsertItemTemplate>

                                                <ItemTemplate>
                                                     <div class="form-group">
                                                        <label class="col-sm-3 control-label">Titulo</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl3" UIHint="TextDisable" runat="server" DataField="titulo" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>
                                                       
                                                    </div>
                                                                                                       
                                                   
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Fecha</label>
                                                        <div class="col-sm-2">
                                                            <asp:DynamicControl ID="DynamicControl1" UIHint="TextDisable" runat="server" DataField="fecha" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>
                                                          <label class="col-sm-3 control-label">Monto</label>
                                                        <div class="col-sm-2">
                                                            <asp:DynamicControl ID="DynamicControl4" UIHint="TextDisable"  runat="server" DataField="monto" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Tipo</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl2" UIHint="ForeignKeyReadOnly"  runat="server" DataField="ttiponovedad" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <br />
                                                    <div class="form-group">
                                                        <div class="col-lg-7 col-lg-offset-3">
                                                            <asp:LinkButton ID="volver" runat="server" OnCommand="volver_Command" CausesValidation="True" Text="Volver" ValidationGroup="Insert" CssClass="btn btn-info btn-xs" />
                                                        </div>
                                                    </div>
                                                </ItemTemplate>


                                            </asp:FormView>

                                            <asp:LinqDataSource ID="LinqDataSource1" OnInserting="LinqDataSource1_Inserting" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="rNovedades" EnableInsert="True" EnableUpdate="True" Where="idNovedad == @idNovedad">
                                                <WhereParameters>
                                                    <asp:Parameter DefaultValue="11" Name="idNovedad" Type="Int32" />
                                                </WhereParameters>
                                            </asp:LinqDataSource>


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
                                        <span class="label bg-danger pull-right">Nota</span>
                                        <div class="form-inline">
                                            Nota&nbsp;&nbsp; 
                                        </div>
                                    </header>
                                    <div class="panel-body">
                                        <div class="form-horizontal">

                                            <div class="form-group">
                                                <div class="col-sm-12">
                                                    <asp:TextBox CssClass="form-control" ID="tbNota" Rows="10" TextMode="MultiLine" runat="server"></asp:TextBox>
                                                </div>
                                            </div>

                                        </div>
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
