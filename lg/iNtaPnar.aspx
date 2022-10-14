<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.master" CodeBehind="iNtaPnar.aspx.vb" Inherits="Dynamic_Data.iNtaPnar" %>

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
                                            Carga de Notas Preliminares&nbsp;&nbsp; 
                                        </div>
                                    </header>
                                    <div class="panel-body">
                                        <div class="form-horizontal">
                                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Font-Bold="true" CssClass="DDValidator" Display="Dynamic" />
                                            <asp:CustomValidator ID="CustomValidator1" runat="server" Visible="false" ErrorMessage="CustomValidator" Display="Dynamic"> </asp:CustomValidator>

                                            <asp:FormView RenderOuterTable="False" DefaultMode="Edit" ID="FormView1" runat="server" DataSourceID="LinqDataSource1" DataKeyNames="idNota">
                                                <EditItemTemplate>
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Parte</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="idParte" UIHint="TextDisable" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Damnificado</label>
                                                        <div class="col-sm-7">
                                                            <asp:DropDownList ID="ddLesionados" CssClass="form-control input-sm entTab" data-next="efectivo" ClientIDMode="Static" runat="server" DataSourceID="dsNuevosDamnificados" DataTextField="g2" DataValueField="g">
                                                            </asp:DropDownList>
                                                            <asp:LinqDataSource ID="dsNuevosDamnificados" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="vDamnificados" OrderBy="Damnificado" Where="idHeader == @idParte" Select='new (idRegistro, idHeader, damnificado,tipo & "-" & idRegistro as g,damnificado  as g2  )'>
                                                                <WhereParameters>
                                                                    <asp:ControlParameter ControlID="idParte" DefaultValue="-1" Name="idParte" PropertyName="Value" Type="Int32" />
                                                                </WhereParameters>
                                                            </asp:LinqDataSource>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Fecha</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl7" runat="server" DataField="fecha" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>




                                                    <br />

                                                    <div class="form-group">
                                                        <div class="col-lg-7 col-lg-offset-3">
                                                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" CssClass="btn btn-primary btn-xs" />
                                                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" OnCommand="UpdateCancelButton_Command" CommandName="Cancel" Text="Cancelar" CssClass="btn btn-white btn-xs" />
                                                            <asp:LinkButton ID="DeleteButton" ClientIDMode="Static" runat="server" CausesValidation="False" OnClientClick="javascript:document.getElementById('hfBorrar').value='true';" CommandName="Update" Text="Eliminar" CssClass="btn btn-white btn-xs" />
                                                        </div>
                                                    </div>


                                                </EditItemTemplate>
                                            </asp:FormView>

                                            <asp:HiddenField ID="hfBorrar" runat="server" Value="false" ClientIDMode="Static" />

                                            <asp:LinqDataSource ID="LinqDataSource1" EnableUpdate="True" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="pNotasPreliminares" Where="idNotaPreliminar == @idNota">
                                                <WhereParameters>
                                                    <asp:Parameter DefaultValue="-1" Name="idNota" Type="Int32" />
                                                </WhereParameters>
                                            </asp:LinqDataSource>
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </section>
                    </div>


                    <asp:HiddenField ID="idParte" runat="server" />

                    <div class="col-sm-7">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Detalle</span>
                                        Nota
                                    </header>

                                    <div class="panel-body">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <div class="col-lg-12">
                                                    <asp:TextBox ID="detalle" runat="server" class="form-control" placeholder="Detalle" Rows="15" TextMode="MultiLine"></asp:TextBox>
                                                    <%--<textarea id="notas"  class="form-control" data-trigger="keyup" data-rangelength="[20,200]"></textarea>--%>
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
