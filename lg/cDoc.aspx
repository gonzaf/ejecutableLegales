<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.master" CodeBehind="cDoc.aspx.vb" Inherits="Dynamic_Data.cDoc" %>

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
                                        <span class="label bg-danger pull-right">Requisito</span>
                                        <div class="form-inline">
                                            Carga de requisitos&nbsp;&nbsp; 
                                        </div>
                                    </header>
                                    <div class="panel-body">
                                        <div class="form-horizontal">







                                            <asp:FormView RenderOuterTable="False" DefaultMode="Edit" ID="FormView1" runat="server" DataSourceID="LinqDataSource1" DataKeyNames="idRequisito,idReclamo">

                                                <%-- <InsertItemTemplate>

                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Detalle</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DetalleDynamicControl" runat="server" DataField="Detalle" Mode="Insert" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>

                                                    <br />

                                                    <div class="form-group">
                                                        <div class="col-lg-7 col-lg-offset-3">
                                                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" ValidationGroup="Insert" CssClass="btn btn-primary btn-xs" />
                                                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" CssClass="btn btn-white btn-xs" />
                                                        </div>
                                                    </div>


                                                </InsertItemTemplate>--%>
                                                <EditItemTemplate>

                                                     <div class="form-group">
                                                        <label class="col-sm-3 control-label">Parte</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="idParte" UIHint="TextDisable" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                      <div class="form-group">
                                                        <label class="col-sm-3 control-label">Reclamo</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl3" runat="server" DataField="tituloReclamo" UIHint="TextDisable" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                     <div class="form-group">
                                                        <label class="col-sm-3 control-label">Requisito</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl2" runat="server" DataField="tRequisitos" UIHint="ForeignKeyReadOnly" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Detalle</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DetalleDynamicControl" runat="server" DataField="Detalle" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Documento Actual</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl4" runat="server" DataField="documento" UIHint="TextDisable" Mode="Readonly" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Nuevo Documento</label>
                                                        <div class="col-sm-7">
                                                            <asp:FileUpload ID="FileUpload1" runat="server" />

                                                        </div>
                                                    </div>

                                                    <br />

                                                    <div class="form-group">
                                                        <div class="col-lg-7 col-lg-offset-3">
                                                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" CssClass="btn btn-primary btn-xs" />
                                                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" OnCommand="UpdateCancelButton_Command" CommandName="Cancel" Text="Cancelar" CssClass="btn btn-white btn-xs" />
                                                        </div>
                                                    </div>


                                                </EditItemTemplate>
                                            </asp:FormView>

                                            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="rRequisitos" EnableInsert="True" EnableUpdate="True" Where="idReclamo == @idReclamo &amp;&amp; idRequisito == @idRequisito">
                                                <WhereParameters>
                                                    <asp:SessionParameter DefaultValue="11" Name="idReclamo" SessionField="idRecNDoc" Type="Int32" />
                                                    <asp:SessionParameter DefaultValue="22" Name="idRequisito" SessionField="idReqNDoc" Type="Int32" />
                                                </WhereParameters>
                                            </asp:LinqDataSource>




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
