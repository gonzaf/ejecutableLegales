<%@ Page Title="" Language="vb" ValidateRequest="false" AutoEventWireup="false" MasterPageFile="~/Site.master" CodeBehind="iNv.aspx.vb" Inherits="Dynamic_Data.iNv" %>

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
                                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Font-Bold="true" CssClass="DDValidator" Display="Dynamic" />
                                            <asp:CustomValidator ID="CustomValidator1" runat="server" Visible="false" ErrorMessage="CustomValidator" Display="Dynamic"> </asp:CustomValidator>

                                            <asp:FormView RenderOuterTable="False" DefaultMode="Edit" ID="FormView1" runat="server" DataSourceID="LinqDataSource1" DataKeyNames="idNovedad">
                                                <EditItemTemplate>
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Siniestro</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="nroSiniestro" UIHint="TextDisable" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Reclamo</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl3" runat="server" DataField="tituloReclamo" UIHint="TextDisable" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Rubro</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl19" runat="server" DataField="rubro" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Etapa</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl2" runat="server" UIHint="foreignKeyReadOnly" DataField="tTipoNovedad" Mode="ReadOnly" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Fecha</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl7" runat="server" DataField="fecha" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group" id="dUsuario" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Usuario</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl5" runat="server" DataField="titulo" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group" id="dFecRes" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Fec.Res.</label>
                                                        <div class="col-sm-7">
                                                            <asp:TextBox ID="fechaRes" runat="server" ClientIDMode="Static" CssClass="input-sm form-control datepicker" Width="80px"></asp:TextBox>

                                                        </div>
                                                    </div>





                                                    <div class="form-group" id="dAbogadoEmpresa" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Abogado Empresa</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl10" runat="server" DataField="tAbogados" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group" id="dAbogadoDamnificado" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Abogado Damnificado</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl9" runat="server" DataField="tAbogados1" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group" id="dRequisitosMateriales" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Requisitos Materiales</label>

                                                        <div class="col-sm-7">
                                                            <table>
                                                                <% for Each a As String In docRequisitosMateriales  %>
                                                                <tr>
                                                                    <td><a href="<%= String.Concat("/docs/n-", eN.idNovedad, "-fuRequisitosMateriales-", a)%>" target="_blank"><%=a %></a></td>
                                                                </tr>
                                                                <% next %>
                                                            </table>
                                                            <asp:FileUpload ID="fuRequisitosMateriales" AllowMultiple="true" runat="server" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="dDocDemanda" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Demanda</label>
                                                        <div class="col-sm-7">
                                                            <table>
                                                                <% for Each a As String In docDemanda  %>
                                                                <tr>
                                                                    <td><a href="<%= String.Concat("/docs/n-", eN.idNovedad, "-fuDocDemanda-", a)%>" target="_blank"><%=a %></a></td>
                                                                </tr>
                                                                <% next %>
                                                            </table>
                                                            <asp:FileUpload ID="fuDocDemanda" AllowMultiple="true" runat="server" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="dMediador" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Mediador</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl12" runat="server" DataField="tMediador" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="dJuzgado" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Juzgado</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl4" runat="server" DataField="tJuzgado" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="dDocContestacionDemanda" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Contestacion Demanda</label>
                                                        <div class="col-sm-7">
                                                            <table>
                                                                <% for Each a As String In docContestacionDemanda  %>
                                                                <tr>
                                                                    <td><a href="<%= String.Concat("/docs/n-", eN.idNovedad, "-docContestacionDemanda-", a)%>" target="_blank"><%=a %></a></td>
                                                                </tr>
                                                                <% next %>
                                                            </table>
                                                            <asp:FileUpload ID="docContestacionDemanda" AllowMultiple="true" runat="server" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="dDocCartaReconsideracion" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Contestacion Demanda</label>
                                                        <div class="col-sm-7">
                                                            <table>
                                                                <% for Each a As String In docCartaReconsideracion  %>
                                                                <tr>
                                                                    <td><a href="<%= String.Concat("/docs/n-", eN.idNovedad, "-fuDocCartaReconsideracion-", a)%>" target="_blank"><%=a %></a></td>
                                                                </tr>
                                                                <% next %>
                                                            </table>
                                                            <asp:FileUpload ID="fuDocCartaReconsideracion" AllowMultiple="true" runat="server" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="dDocConvenio" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Convenio</label>
                                                        <div class="col-sm-7">
                                                            <table>
                                                                <% for Each a As String In docConvenio  %>
                                                                <tr>
                                                                    <td><a href="<%= String.Concat("/docs/n-", eN.idNovedad, "-fuDocConvenio-", a)%>" target="_blank"><%=a %></a></td>
                                                                </tr>
                                                                <% next %>
                                                            </table>
                                                            <asp:FileUpload ID="fuDocConvenio" runat="server" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="dDocSentencia" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Sentencia</label>
                                                        <div class="col-sm-7">
                                                            <table>
                                                                <% for Each a As String In docSentencia  %>
                                                                <tr>
                                                                    <td><a href="<%= String.Concat("/docs/n-", eN.idNovedad, "-fuDocSentencia-", a)%>" target="_blank"><%=a %></a></td>
                                                                </tr>
                                                                <% next %>
                                                            </table>
                                                            <asp:FileUpload ID="fuDocSentencia" AllowMultiple="true" runat="server" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="dDocLiquidacion" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Liquidación</label>
                                                        <div class="col-sm-7">
                                                            <table>
                                                                <% for Each a As String In docLiquidacion  %>
                                                                <tr>
                                                                    <td><a href="<%= String.Concat("/docs/n-", eN.idNovedad, "-fuDocLiquidacion-", a)%>" target="_blank"><%=a %></a></td>
                                                                </tr>
                                                                <% next %>
                                                            </table>
                                                            <asp:FileUpload ID="fuDocLiquidacion" runat="server" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="dDocApelacion" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Apelación</label>
                                                        <div class="col-sm-7">
                                                            <table>
                                                                <% for Each a As String In docApelacion  %>
                                                                <tr>
                                                                    <td><a href="<%= String.Concat("/docs/n-", eN.idNovedad, "-fuDocApelacion-", a)%>" target="_blank"><%=a %></a></td>
                                                                </tr>
                                                                <% next %>
                                                            </table>
                                                            <asp:FileUpload ID="fuDocApelacion" AllowMultiple="true" runat="server" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="dDocPresupuesto" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Prespuesto</label>
                                                        <div class="col-sm-7">
                                                            <table>
                                                                <% for Each a As String In docPresupuesto  %>
                                                                <tr>
                                                                    <td><a href="<%= String.Concat("/docs/n-", eN.idNovedad, "-fuDocPresupuesto-", a)%>" target="_blank"><%=a %></a></td>
                                                                </tr>
                                                                <% next %>
                                                            </table>
                                                            <asp:FileUpload ID="fuDocPresupuesto" runat="server" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="dDocCDEnviadas" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">CD Enviadas</label>
                                                        <div class="col-sm-7">
                                                            <table>
                                                                <% for Each a As String In docCDEnviadas  %>
                                                                <tr>
                                                                    <td><a href="<%= String.Concat("/docs/n-", eN.idNovedad, "-fuDocCDEnviadas-", a)%>" target="_blank"><%=a %></a></td>
                                                                </tr>
                                                                <% next %>
                                                            </table>
                                                            <asp:FileUpload ID="fuDocCDEnviadas" AllowMultiple="true" runat="server" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="dDocNotaRecepcion" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Nota Recepción</label>
                                                        <div class="col-sm-7">
                                                            <table>
                                                                <% for Each a As String In docNotaRecepcion  %>
                                                                <tr>
                                                                    <td><a href="<%= String.Concat("/docs/n-", eN.idNovedad, "-fuDocNotaRecepcion-", a)%>" target="_blank"><%=a %></a></td>
                                                                </tr>
                                                                <% next %>
                                                            </table>
                                                            <asp:FileUpload ID="fuDocNotaRecepcion" runat="server" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="dDocNotaRecepcionSeguro" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Nota Recepción Seguro</label>
                                                        <div class="col-sm-7">
                                                            <table>
                                                                <% for Each a As String In docNotaRecepcionSeguro  %>
                                                                <tr>
                                                                    <td><a href="<%= String.Concat("/docs/n-", eN.idNovedad, "-fuDocNotaRecepcionSeguro-", a)%>" target="_blank"><%=a %></a></td>
                                                                </tr>
                                                                <% next %>
                                                            </table>
                                                            <asp:FileUpload ID="fuDocNotaRecepcionSeguro" AllowMultiple="true" runat="server" />
                                                        </div>
                                                    </div>


                                                    <div class="form-group" id="dDocNotaReconsideracion" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Nota Reconsideración</label>
                                                        <div class="col-sm-7">
                                                            <table>
                                                                <% for Each a As String In docNotaReconsideracion  %>
                                                                <tr>
                                                                    <td><a href="<%= String.Concat("/docs/n-", eN.idNovedad, "-fuDocNotaReconsideracion-", a)%>" target="_blank"><%=a %></a></td>
                                                                </tr>
                                                                <% Next %>
                                                            </table>
                                                            <asp:FileUpload ID="fuDocNotaReconsideracion" AllowMultiple="true" runat="server" />
                                                        </div>
                                                    </div>



                                                    <div class="form-group" id="dImporteDesde" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Importe Desde</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl6" runat="server" DataField="importeDesde" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="dImporteHasta" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Importe Hasta</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl8" runat="server" DataField="importeHasta" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="dHonorarios" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Honorarios</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl18" runat="server" DataField="honorarios" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="dFormaDePago" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Forma de Pago</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl11" runat="server" DataField="tFormaDePago" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="dPlazo" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Plazo</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl13" runat="server" DataField="plazo" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="dImporteTotal" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Importe Total</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl14" runat="server" DataField="importeTotal" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group" id="dMontoReclamado" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Monto Reclamado</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl20" runat="server" DataField="montoReclamado" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group" id="dMontoEstimado" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Monto Estimado</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl21" runat="server" DataField="montoEstimado" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group" id="dMontoHonorariosAbogado" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Monto Hon.Abogado</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl22" runat="server" DataField="honAbogado" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                     <div class="form-group" id="dMOntoHonorariosMediador" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Monto Hon.Mediador</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl23" runat="server" DataField="honMediador" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group" id="dCamara" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Camara</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl15" runat="server" DataField="camara" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="dFormaCobro" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Forma De Cobro</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl16" runat="server" DataField="tFormaDeCobro" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="dMotivobaja" visible="false" runat="server">
                                                        <label class="col-sm-3 control-label">Motivo Baja</label>
                                                        <div class="col-sm-7">
                                                            <asp:DynamicControl ID="DynamicControl17" runat="server" DataField="tMotivobaja" Mode="Edit" ValidationGroup="Insert" />
                                                        </div>
                                                    </div>


                                                    <br />

                                                    <div class="form-group">
                                                        <div class="col-lg-7 col-lg-offset-3">
                                                            <asp:Button ID="UpdateButton" runat="server" OnClientClick="return finalizar(this.id);" CausesValidation="True" CommandName="Update" Text="Guardar" CssClass="btn btn-primary btn-xs" />
                                                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" OnCommand="UpdateCancelButton_Command" CommandName="Cancel" Text="Cancelar" CssClass="btn btn-white btn-xs" />
                                                            <asp:LinkButton ID="DeleteButton" ClientIDMode="Static" runat="server" CausesValidation="False" OnClientClick="javascript:document.getElementById('hfBorrar').value='true';" CommandName="Update" Text="Eliminar" CssClass="btn btn-white btn-xs" />
                                                        </div>
                                                    </div>


                                                </EditItemTemplate>
                                            </asp:FormView>

                                            <asp:HiddenField ID="hfBorrar" runat="server" Value="false" ClientIDMode="Static" />

                                            <asp:LinqDataSource ID="LinqDataSource1" EnableUpdate="true" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="rNovedades" Where="idNovedad == @idNovedad">
                                                <WhereParameters>
                                                    <asp:Parameter DefaultValue="-1" Name="idNovedad" Type="Int32" />
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
                                        <span class="label bg-danger pull-right">Detalle</span>
                                        Novedad
                                    </header>

                                    <div class="panel-body">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <div class="col-lg-12">
                                                    <asp:TextBox ID="detalle" runat="server" class="form-control" placeholder="Detalle" Rows="15" Visible="false" TextMode="MultiLine"></asp:TextBox>
                                                    <asp:TextBox ID="detallePago" runat="server" class="form-control" placeholder="Detalle Pago" Visible="false" Rows="15" TextMode="MultiLine"></asp:TextBox>
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

    <script>
        function finalizar(btnId) {

            var btn = document.getElementById(btnId);
            //alert(btn);
            btn.enabled = false;
            //return false;
            return true;
        }

    </script>

</asp:Content>
