<%@ Page Title="" Language="vb" AutoEventWireup="false" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/st/SiteST.master" CodeBehind="cEnvCub.aspx.vb" Inherits="Dynamic_Data.cEnvCub" %>

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
                                        <span class="label bg-danger pull-right">Envio y Recepcion</span>
                                        <div class="form-inline">
                                            Consulta de envio y recepcion&nbsp;&nbsp;
                                            <br />
                                            <br />
                                            <asp:TextBox ID="desdeFecha" runat="server" ClientIDMode="Static" CssClass="input-sm form-control datepicker" Width="80px"></asp:TextBox>
                                            <asp:Button ID="buttondesdeFecha" OnClick="buttonfecha_Click" display="dynamic" ClientIDMode="Static" runat="server" Text="Button" type="hidden" Style="display: none" />
                                            <asp:TextBox ID="hastaFecha" runat="server" ClientIDMode="Static" CssClass="input-sm form-control datepicker" Width="80px"></asp:TextBox>
                                            <asp:Button ID="buttonhastaFecha" OnClick="buttonfecha_Click" display="dynamic" ClientIDMode="Static" runat="server" Text="Button" type="hidden" Style="display: none" />
                                            &nbsp;&nbsp;

                                            <asp:DropDownList ID="ddDeposito" CssClass="form-control input-sm entTab" AppendDataBoundItems="true" data-next="ddMecanico" ClientIDMode="Static" runat="server" DataTextField="Deposito" DataValueField="idDeposito" AutoPostBack="true">
                                                  <asp:ListItem Text="Todos" Value="-2" Selected="True"></asp:ListItem>
                                            </asp:DropDownList>


                                            <%--<asp:CheckBox ID="cbMostrarTodo" AutoPostBack="true" OnCheckedChanged="cbMostrarTodo_CheckedChanged" runat="server" Checked="true" Text="Ver Todos los dias" />--%>
                                            
                                            <asp:Label ID="Label2" runat="server" Text="Label">---</asp:Label>
                                            <asp:DropDownList ID="ddProveedor" AppendDataBoundItems="true" DataSourceID="LinqDataSource4" DataTextField="proveedor" DataValueField="idProveedor" runat="server" AutoPostBack="true" CssClass="form-control col-6 input-sm entTab">
                                                 <asp:ListItem Text="Todos" Value="-2" Selected="True"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="proveedor" TableName="vStProveedor">
                                            </asp:LinqDataSource>



                                            <asp:TextBox ID="tbNroRemito" data-button="buttonhastaFecha" CssClass="form-control input-sm clickbutton" Width="90" placeholder="# Remito" runat="server"></asp:TextBox>

                                         
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            
                                            
                                            <%--<asp:CheckBox ID="cbSoloPendientes" Visible="true" AutoPostBack="true"  runat="server" Text="Ver Solo Pendientes" />--%>
                                            
                                            
                                             <asp:DropDownList ID="ddEstado" AppendDataBoundItems="true" runat="server" AutoPostBack="true" CssClass="form-control col-6 input-sm entTab">
                                                 <asp:ListItem Text="Ver Todos" Value="-2" Selected="True"></asp:ListItem>
                                                 <asp:ListItem Text="Pendientes" Value="1"></asp:ListItem>
                                                 <asp:ListItem Text="Finalizados" Value="2"></asp:ListItem>
                                             </asp:DropDownList>


                                        </div>
                                    </header>
                                    <section style="//height: 200px" class="panel-body scrollbar scroll-y m-b">
                                        <div class="panel">
                                            <asp:GridView ID="gvPartes" runat="server" DataKeyNames="id" AutoGenerateColumns="False" DataSourceID="dsPartes" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnSelectedIndexChanged="gvPartes_SelectedIndexChanged" OnPreRender="GVPreRender">
                                                <Columns>
                                                    <asp:BoundField DataField="idEnvio" HeaderText="# Envio" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="id"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="Fec.Envio" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Format(Eval("fechaEnvio"), "dd/MM/yy")%>'></asp:Label>
                                                            <asp:HiddenField ID="hfId" ClientIDMode="Static" runat="server" Value='<%# Eval("id")%>' />
                                                            <asp:HiddenField ID="hfIdCubierta" ClientIDMode="Static" runat="server" Value='<%# Eval("idCubierta")%>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="stPartidas.nroPartida" HeaderText="#Partida" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="stPartidas.stTiposCubiertas.completo" HeaderText="Cubierta" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="stTipoAccionRevision.Accion" HeaderText="Accion" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="stEstado.Estado" HeaderText="Estado Ant." ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="Fec.Rec." ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label212" runat="server" Text='<%# Format(Eval("fechaVuelta"), "dd/MM/yy")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="stEstado1.Estado" HeaderText="Estado Nuevo" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="eliminado" HeaderText="Eliminado" ItemStyle-ForeColor="Red" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                     <asp:BoundField DataField="obsVuelta" HeaderStyle-Width="100px"  HeaderText="Detalle" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="nroComprobante" HeaderStyle-Width="20px"  HeaderText="Nro Factura" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="precio" HeaderStyle-Width="20px"  HeaderText="Precio" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="stCambioCubiertas.stOrdenGomeriaDetalle.stOrdenGomeria.stDepositos.Deposito" HeaderStyle-Width="20px"  HeaderText="Precio" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>



                                                     <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="HyperLink2" NavigateUrl='<%#String.Concat("prEnv.aspx?id=", Eval("idEnvio"))%>' runat="server">Reimp.Envio</asp:HyperLink>
                                                        </ItemTemplate>
                                                     </asp:TemplateField>

                                                      <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="HyperLink1" NavigateUrl='<%#String.Concat("prRcp.aspx?id=", Eval("idRecepcion"))%>' runat="server">Reimp.Recep.</asp:HyperLink>
                                                        </ItemTemplate>
                                                     </asp:TemplateField>
                                                    
                                                    


                                                </Columns>
                                            </asp:GridView>
                                            <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="Estado" TableName="stEstado">
                                            </asp:LinqDataSource>
                                        </div>

                                        <asp:LinqDataSource ID="LinqDataSource4" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="proveedor" TableName="vStProveedor">
                                        </asp:LinqDataSource>

                                        <asp:LinqDataSource ID="ldsMotivos" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="stMotivosBaja">
                                        </asp:LinqDataSource>



                                        <asp:LinqDataSource ID="dsPartes" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="" TableName="stEnvioCubiertas" Where='((@ddEstado == -2) or (@ddEstado = 1 and fechaVuelta == null) or (@ddEstado = 2 and fechaVuelta != null)) and (idEnvio == @remito or @remito == -1) and (stCambioCubiertas.stOrdenGomeriaDetalle.stOrdenGomeria.stDepositos.idDeposito == @ddDeposito or @ddDeposito == -2) and (idProveedor == @ddProveedor or @ddProveedor == -2) and ((fechaEnvio >= @fechaDesde and fechaEnvio <= @fechaHasta))'>
                                            <WhereParameters>
                                                <asp:Parameter DefaultValue="20-06-2016" Name="fechaDesde" Type="DateTime" />
                                                <asp:Parameter DefaultValue="20-06-2016" Name="fechaHasta" Type="DateTime" />
                                                <asp:Parameter DefaultValue="-1" Name="remito" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddProveedor" DefaultValue="-1" Name="ddProveedor" Type="Int32" PropertyName="SelectedValue" />
                                                <asp:ControlParameter ControlID="ddDeposito" DefaultValue="-1" Name="ddDeposito" Type="Int32" PropertyName="SelectedValue" />
                                                <asp:ControlParameter ControlID="ddEstado" DefaultValue="-1" Name="ddEstado" Type="Int32" PropertyName="SelectedValue" />
                                            </WhereParameters>
                                        </asp:LinqDataSource>
                                    </section>
                                    <%--</div>--%>
                                    <div class="form-group text-center">
                                        <div class="col-lg-12">
                                            <%--<asp:Button ID="terminar" runat="server" Text="Guardar" OnClientClick="return finalizar();" Visible="true" CssClass="btn btn-primary btn-xs" />

                                            <asp:Button ID="cancelar" runat="server" Enabled="true" Text="Cancelar" Visible="true" CssClass="btn btn-white btn-xs" />--%>
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
