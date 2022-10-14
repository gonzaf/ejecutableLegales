<%@ Page Title="" Language="vb" AutoEventWireup="false" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/st/SiteST.master" CodeBehind="bjas.aspx.vb" Inherits="Dynamic_Data.bjas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <section id="content">
        <section class="main padder">
            <form id="form1" runat="server">
                <div class="row no-gutter">

                    <div class="col-sm-12">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Bajas</span>
                                        <div class="form-inline">
                                            Cubiertas a dar de Baja&nbsp;&nbsp;
                                        </div>

                                        <div class="form-inline" style="visibility: hidden">
                                            Envio a Reparar&nbsp;&nbsp; 
                                            <asp:TextBox ID="desdeFecha" runat="server" ClientIDMode="Static" CssClass="input-sm form-control datepicker" Width="80px"></asp:TextBox>
                                            <asp:Button ID="buttondesdeFecha" OnClick="buttonfecha_Click" display="dynamic" ClientIDMode="Static" runat="server" Text="Button" type="hidden" Style="display: none" />
                                            <asp:TextBox ID="hastaFecha" runat="server" ClientIDMode="Static" CssClass="input-sm form-control datepicker" Width="80px"></asp:TextBox>
                                            <asp:Button ID="buttonhastaFecha" OnClick="buttonfecha_Click" display="dynamic" ClientIDMode="Static" runat="server" Text="Button" type="hidden" Style="display: none" />
                                            &nbsp;&nbsp;
                                            <asp:CheckBox ID="cbMostrarTodo" AutoPostBack="true" OnCheckedChanged="cbMostrarTodo_CheckedChanged" runat="server" Checked="true" Text="Ver Todos los dias" />
                                            <asp:Label ID="Label2" runat="server" Text="Label">---</asp:Label>
                                            <asp:DropDownList ID="ddDepositos" AppendDataBoundItems="true" runat="server" AutoPostBack="true" CssClass="form-control input-sm entTab" DataTextField="Deposito" DataValueField="idDeposito">
                                            </asp:DropDownList>


                                            <asp:TextBox ID="tbInterno" CssClass="form-control input-sm" Width="50" placeholder="# Int." runat="server"></asp:TextBox>
                                            <asp:TextBox ID="tbRepuesto" CssClass="form-control input-sm" Width="100" placeholder="# Repuesto" runat="server"></asp:TextBox>
                                            <asp:TextBox ID="tbDescripcion" CssClass="form-control input-sm " Width="100" placeholder="Desc.Repuesto" runat="server"></asp:TextBox>
                                        </div>
                                    </header>
                                    <section style="//height: 200px" class="panel-body scrollbar scroll-y m-b">
                                        <div class="panel">


                                            <asp:Label ID="lError" Visible="false" ForeColor="Red" runat="server" Text="Se produjeron errores en las Profundidades ingresadas"></asp:Label>

                                            <asp:GridView ID="gvPartes" runat="server" DataKeyNames="id" OnRowDataBound="gvPartes_RowDataBound" AutoGenerateColumns="False" DataSourceID="dsPartes" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnSelectedIndexChanged="gvPartes_SelectedIndexChanged" OnPreRender="GVPreRender">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <%--<asp:Label ID="Label2" runat="server" Text='<%# Format(Eval("stOrdenGomeriaDetalle.stOrdenGomeria.fecha"), "dd/MM/yy")%>'></asp:Label>--%>
                                                            <asp:HiddenField ID="hfId" ClientIDMode="Static" runat="server" Value='<%# Eval("id")%>' />
                                                            <asp:HiddenField ID="idEstado" ClientIDMode="Static" runat="server" Value='<%# Eval("stPartidas.idEstado")%>' />
                                                            <asp:HiddenField ID="idCubierta" ClientIDMode="Static" runat="server" Value='<%# Eval("idCubierta")%>' />
                                                            <asp:HiddenField ID="hfOrigen" ClientIDMode="Static" runat="server" Value='<%#IIf(Eval("idEnvioCubiertas") > 0, "Proveedor", IIf(Eval("idCambioCubiertas") > 0, "O.Gomeria", "1"))%>' />
                                                            
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Origen" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelss2" runat="server" Text='<%#IIf(Eval("idEnvioCubiertas") > 0, "Proveedor", IIf(Eval("idCambioCubiertas") > 0, "O.Gomeria", "Baja x Venta"))%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="stPartidas.stTiposCubiertas.completo" HeaderText="Cubierta" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="stPartidas.nroPartida" HeaderText="Partida" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="Deposito" HeaderText="Deposito" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    

                                                    <%--<asp:BoundField DataField="stMotivosBaja.Motivo" HeaderText="Motivo" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>--%>
                                                    <%--<asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="cb" Text="Enviar" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>

                                                    <asp:TemplateField HeaderText="Accion" HeaderStyle-Width="180px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="ddAccion" OnDataBound="ddAccion_DataBound" AppendDataBoundItems="false" CssClass="form-control input-sm entTab" data-next="ddMecanico" ClientIDMode="Static" runat="server" DataTextField="Accion" DataValueField="id" DataSourceID="LinqDataSource2">
                                                                <asp:ListItem Text="Sin Accion" Value="-1" Selected="True"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Motivo"  ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="ddMOtivo" CssClass="form-control input-sm entTab" data-next="ddMecanico" ClientIDMode="Static" runat="server" DataTextField="MOtivo" DataValueField="id" DataSourceID="ldsMotivos">
                                                                
                                                            </asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <%--<asp:TemplateField HeaderText="Motivo" HeaderStyle-Width="300px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="ddMotivo" AppendDataBoundItems="false" CssClass="form-control input-sm entTab" data-next="ddMecanico" ClientIDMode="Static" runat="server" DataTextField="Motivo" DataValueField="id" DataSourceID="ldsMotivos">
                                                            </asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>

                                                  <%--  <asp:TemplateField HeaderText="Detalle" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="detalle" runat="server"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>


                                                </Columns>
                                            </asp:GridView>

                                        </div>


                                        <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="stTipoAccionRevision" Where="cubiertas == true and (id == 8 or id == 10) ">
                                        </asp:LinqDataSource>


                                        <asp:LinqDataSource ID="ldsMotivos" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="stMotivosBaja">
                                        </asp:LinqDataSource>


                                        <asp:LinqDataSource ID="LinqDataSource4" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="proveedor" TableName="vStProveedor">
                                        </asp:LinqDataSource>

                                        <asp:LinqDataSource ID="dsPartes" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="" TableName="stBajas" Where='confirmada == false'>
                                           <%-- <WhereParameters>
                                                <asp:Parameter DefaultValue="20-06-2016" Name="fechaDesde" Type="DateTime" />
                                                <asp:Parameter DefaultValue="20-06-2016" Name="fechaHasta" Type="DateTime" />
                                                <asp:Parameter DefaultValue="1" Name="okFecha" Type="Int32" />
                                                <asp:Parameter DefaultValue="1" Name="okFecha" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddDepositos" DefaultValue="-1" Name="ddDepositos" Type="Int32" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="tbInterno" DefaultValue="-1" Name="tbInterno" Type="Int32" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="tbRepuesto" DefaultValue="-1" Name="tbRepuesto" Type="Int32" PropertyName="Text" />
                                            </WhereParameters>--%>
                                        </asp:LinqDataSource>
                                       <%-- <asp:QueryExtender TargetControlID="dsPartes" runat="server">
                                            <asp:SearchExpression ComparisonType="OrdinalIgnoreCase" DataFields="Desc_Repuesto" SearchType="Contains">
                                                <asp:ControlParameter ControlID="tbDescripcion" PropertyName="Text" Type="String" />
                                            </asp:SearchExpression>

                                        </asp:QueryExtender>--%>
                                    </section>
                                    <%--</div>--%>
                                    <div class="form-group text-center">
                                        <div class="col-lg-12">
                                            <asp:Button ID="terminar" runat="server" Text="Guardar" OnClientClick="return finalizar();" Visible="true" CssClass="btn btn-primary btn-xs" />

                                            <asp:Button ID="cancelar" runat="server" Enabled="true" Text="Cancelar" Visible="true" CssClass="btn btn-white btn-xs" />
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

        var objDiv = document.getElementById("divCaja");
        //objDiv.scrollTop = objDiv.scrollHeight;



        //  $("#fechaCaja").datepicker({ format: 'dd/mm/yy' })
        //  .on('changeDate', function (ev) {
        //      $(this).datepicker('hide');
        //      $("#buttonFechaCaja").click();
        //  });

        //  $("#fechaVentas").datepicker({ format: 'dd/mm/yy' })
        //.on('changeDate', function (ev) {
        //    $(this).datepicker('hide');
        //    $("#buttonFechaVentas").click();
        //});




    </script>
</asp:Content>
