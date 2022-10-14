<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.master" CodeBehind="iDec.aspx.vb" Inherits="Dynamic_Data.iDec" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




    <section id="content">
        <section class="main padder">
            <form id="form1" runat="server">

                <input type="hidden" id="imprimir" name="imprimir" value="true" />
                <div class="row no-gutter">
                    <div class="col-sm-12">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Declaración</span>
                                        <div class="form-inline">
                                            Declaración&nbsp;&nbsp; 
                                        </div>
                                    </header>
                                    <div class="panel-body">
                                        <div class="form-horizontal">

                                            <asp:FormView RenderOuterTable="False" ID="FormView1" DefaultMode="edit" runat="server" DataSourceID="dsDeclaracion" DataKeyNames="idTestigo">
                                                <EditItemTemplate>
                                                    <div class="form-group">
                                                        <label class="col-sm-1 control-label">Testigo</label>
                                                        <div class="col-sm-3">
                                                            <asp:DynamicControl ID="DynamicControl3" UIHint="TextDisable" runat="server" DataField="pTestigos" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-1 control-label">Parte</label>
                                                        <div class="col-sm-2">
                                                            <asp:DynamicControl ID="DynamicControl2" UIHint="TextDisable" runat="server" DataField="idHeader" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>


                                                    <div class="form-group">
                                                        <label class="col-sm-1 control-label">Fecha</label>
                                                        <div class="col-sm-2">
                                                            <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="fecha" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>

                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-1 control-label">Declaracion</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl4" UIHint="TextMultiLine" runat="server" DataField="declaracion" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group" id="dDocNotaRecepcionSeguro" visible="true" runat="server">
                                                        <label class="col-sm-1 control-label">Nota</label>
                                                        <div class="col-sm-7">
                                                            <table>
                                                                <% for Each a As String In docs  %>
                                                                <tr>
                                                                    <td><a href="<%= String.Concat("/docs/dec-", eD.idTestigo, "-FileUpload1-", a)%>" target="_blank"><%=a %></a></td>
                                                                </tr>
                                                                <% next %>
                                                            </table>
                                                            <asp:FileUpload ID="FileUpload1" AllowMultiple="true" runat="server" />
                                                        </div>
                                                    </div>
                                                    <br />
                                                    <div class="form-group">
                                                        <div class="col-lg-7 col-lg-offset-3">
                                                            <asp:LinkButton ID="volver" runat="server" CommandName="Update" CausesValidation="True" Text="Guardar" ValidationGroup="Insert" CssClass="btn btn-primary btn-xs" />
                                                            <asp:LinkButton ID="LinkButton1" runat="server" OnCommand="volver_Command" CommandName="Cancel" CausesValidation="True" Text="Cancelar" ValidationGroup="Insert" CssClass="btn btn-white btn-xs" />
                                                        </div>
                                                    </div>


                                                </EditItemTemplate>


                                            </asp:FormView>

                                            <asp:LinqDataSource ID="dsDeclaracion" EnableUpdate="true" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="rDeclaracion" Where="idTestigo == @idTestigo">
                                                <WhereParameters>
                                                    <asp:SessionParameter DefaultValue="-1" Name="idTestigo" SessionField="idTestigo" Type="Int32" />
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
