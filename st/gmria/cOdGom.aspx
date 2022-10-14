<%@ Page Title="" Language="vb" AutoEventWireup="false" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/st/SiteST.master" CodeBehind="cOdGom.aspx.vb" Inherits="Dynamic_Data.cOdGom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <section id="content">
        <section class="main padder">
            <form id="form1" runat="server">
                <div class="row no-gutter">

                    <div id="panel1" runat="server" class="col-sm-12">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Ordenes</span>
                                        <div class="form-inline">
                                            Ordenes de Gomeria&nbsp;&nbsp;
                                            <br />
                                            <br />
                                            <asp:TextBox ID="desdeFecha" runat="server" ClientIDMode="Static" CssClass="input-sm form-control datepicker" Width="80px"></asp:TextBox>
                                            <asp:Button ID="buttondesdeFecha" OnClick="buttonfecha_Click" display="dynamic" ClientIDMode="Static" runat="server" Text="Button" type="hidden" Style="display: none" />
                                            <asp:TextBox ID="hastaFecha" runat="server" ClientIDMode="Static" CssClass="input-sm form-control datepicker" Width="80px"></asp:TextBox>
                                            <asp:Button ID="buttonhastaFecha" OnClick="buttonfecha_Click" display="dynamic" ClientIDMode="Static" runat="server" Text="Button" type="hidden" Style="display: none" />
                                            &nbsp;&nbsp;
                                            <%--<asp:CheckBox ID="cbMostrarTodo" AutoPostBack="true" OnCheckedChanged="cbMostrarTodo_CheckedChanged" runat="server" Checked="true" Text="Ver Todos los dias" />--%>
                                            <asp:Label ID="Label2" runat="server" Text="Label">---</asp:Label>
                                            <asp:DropDownList ID="ddProveedor" AppendDataBoundItems="true" DataSourceID="LinqDataSource4" DataTextField="detalle" DataValueField="idUser" runat="server" AutoPostBack="true" CssClass="form-control col-6 input-sm entTab">
                                                <asp:ListItem Text="Todos los Gomeros" Value="-2" Selected="True"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddDepositos" AppendDataBoundItems="true" DataTextField="Deposito" DataValueField="idDeposito" runat="server" AutoPostBack="true" CssClass="form-control col-6 input-sm entTab">
                                                <asp:ListItem Text="Todos los Depositos" Value="-2" Selected="True"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:TextBox ID="tbNroCoche" autocomplete="off" CssClass="form-control input-sm clickbutton" data-button="buttonBuscar" Width="70" placeholder="# Coche" runat="server"></asp:TextBox>
                                            <asp:Button ID="buttonBuscar" OnClick="buttonBuscar_Click" ClientIDMode="Static" runat="server" Style="display: none" Text="" Display="Dynamic" />


                                            <asp:CheckBox ID="cbReclamos" AutoPostBack="true" runat="server" Checked="true" Text="Pendientes" />
                                            <asp:CheckBox ID="cbReparaciones" AutoPostBack="true" runat="server" Checked="true" Text="Cerradas" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </div>
                                    </header>
                                    <section style="//height: 200px" class="panel-body scrollbar scroll-y m-b">
                                        <div class="panel">
                                            <asp:GridView ID="gvPartes" runat="server" DataKeyNames="idOrden" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnSelectedIndexChanged="gvPartes_SelectedIndexChanged" OnPreRender="GVPreRender">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Fec" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Format(Eval("fecha"), "dd/MM/yy")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="nroOrden" HeaderText="# Orden" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="interno" HeaderText="Interno" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="deposito" HeaderText="Deposito" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>

                                                    <asp:TemplateField HeaderText="Tarea" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lbIngresar" ToolTip="Ver Orden" OnCommand="lbIngresar_Command" CommandArgument='<%#String.Concat(Eval("idOrden"), "/", Eval("idAccion")) %>' runat="server"><%#IIf(Eval("idAccion") = 6 And Eval("preventivo"), IIf(Not Eval("observaciones") Is Nothing AndAlso Eval("observaciones").ToString.Contains("Alerta") = True, "Reajuste Un", "Reajuste Preventivo"), Eval("tarea")) %></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:BoundField DataField="gomero" HeaderText="Gomero" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>


                                                    <asp:TemplateField HeaderText="Estado" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelss2" runat="server" Text='<%#IIf(Eval("cerrada"), "Cerrada", "Pendiente")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>




                                                </Columns>
                                            </asp:GridView>

                                        </div>

                                        <asp:LinqDataSource ID="LinqDataSource4" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="detalle" TableName="tUsuario">
                                        </asp:LinqDataSource>


                                        <asp:LinqDataSource ID="dsPartes" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="" TableName="vStOrdenesGomeriaConsulta" Where='(cerrada == @cerradas or cerrada != @pendientes) and (idUser == @ddProveedor or @ddProveedor == -2) and (@okFecha == -1 or (fecha >= @fechaDesde and fecha <= @fechaHasta))'>
                                            <WhereParameters>
                                                <asp:Parameter DefaultValue="20-06-2016" Name="fechaDesde" Type="DateTime" />
                                                <asp:Parameter DefaultValue="20-06-2016" Name="fechaHasta" Type="DateTime" />
                                                <asp:Parameter DefaultValue="1" Name="okFecha" Type="Int32" />
                                                <asp:Parameter DefaultValue=",1,2,3," Name="depositosPermitidos" Type="String" />
                                                <asp:ControlParameter ControlID="ddProveedor" DefaultValue="-1" Name="ddProveedor" Type="Int32" PropertyName="SelectedValue" />
                                                <asp:ControlParameter ControlID="cbReclamos" DefaultValue="True" Name="pendientes" Type="Boolean" PropertyName="Checked" />
                                                <asp:ControlParameter ControlID="cbReparaciones" DefaultValue="true" Name="cerradas" Type="Boolean" PropertyName="Checked" />
                                            </WhereParameters>
                                        </asp:LinqDataSource>
                                    </section>
                                    <%--</div>--%>
                                    <div class="form-group text-center">
                                        <div class="col-lg-12">
                                            <asp:Button ID="cancelar" runat="server" Enabled="true" Text="Cancelar" Visible="false" CssClass="btn btn-white btn-xs" />
                                        </div>
                                    </div>

                                </section>
                            </div>
                        </section>
                    </div>








                    <div runat="server" id="panel2" visible="false" class="col-sm-12">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Cambio de cubiertas</span>
                                    </header>
                                    <section style="//height: 200px">
                                        <div class="panel-body" style="padding: 10px 30px 10px 30px">

                                            <asp:GridView ID="GridView1" runat="server" ShowFooter="true" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="gridDataSource" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender">
                                                <Columns>
                                                    <asp:BoundField DataField="stOrdenGomeriaDetalle.stUbicaciones.Ubicacion" HeaderText="Ubicacion" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="Nro.Partida Sacada" HeaderStyle-Width="100px" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-left">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Eval("stPartidas1.nroPartida")%>'></asp:Label>
                                                        </ItemTemplate>

                                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="stTipoAccionRevision.Accion" HeaderText="Destino" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="Partida Sacada" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                                        <FooterTemplate>
                                                            <%--<asp:Label ID="Label1" runat="server" Text="Total"></asp:Label>--%>
                                                        </FooterTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Eval("stPartidas1.completo")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Nro.Partida Colocada" HeaderStyle-Width="100px" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-left">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Eval("stPartidas.nroPartida")%>'></asp:Label>
                                                        </ItemTemplate>

                                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Partida Colocada" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                                        <FooterTemplate>
                                                            <%--<asp:Label ID="Label1" runat="server" Text="Total"></asp:Label>--%>
                                                        </FooterTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Eval("stPartidas.completo")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>





                                                </Columns>

                                                <RowStyle CssClass="td"></RowStyle>
                                            </asp:GridView>


                                            <div class="form-group text-center">
                                                <div class="col-lg-12">
                                                    <asp:Button ID="Button1" OnClick="Button1_Click" runat="server" Enabled="true" Text="Volver" Visible="true" CssClass="btn btn-white btn-xs" />
                                                </div>
                                            </div>

                                            <asp:LinqDataSource ID="gridDataSource" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="stCambioCubiertas" Where="stOrdenGomeriaDetalle.idOrden == @idOrden">
                                                <WhereParameters>
                                                    <asp:Parameter DefaultValue="-1" Name="idOrden" Type="Int32" />
                                                </WhereParameters>

                                            </asp:LinqDataSource>

                                        </div>
                                    </section>
                                </section>
                            </div>
                        </section>
                    </div>











                    <div runat="server" id="panel3" visible="false" class="col-sm-12">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Medicion de Profundidad</span>
                                    </header>
                                    <section style="//height: 200px">
                                        <div class="panel-body" style="padding: 10px 30px 10px 30px">

                                            <asp:GridView ID="GridView2" runat="server" ShowFooter="true" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="gridDataSource2" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender">
                                                <Columns>
                                                    <asp:BoundField DataField="stOrdenGomeriaDetalle.stUbicaciones.Ubicacion" HeaderText="Ubicacion" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="Nro.Partida" HeaderStyle-Width="100px" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-left">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Eval("stPartidas.nroPartida")%>'></asp:Label>
                                                        </ItemTemplate>

                                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                                        <FooterTemplate>
                                                            <%--<asp:Label ID="Label1" runat="server" Text="Total"></asp:Label>--%>
                                                        </FooterTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Eval("stPartidas.completo")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Profundidad" HeaderStyle-Width="100px" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-left">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Eval("medicion")%>'></asp:Label>
                                                        </ItemTemplate>

                                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Kms" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                                        <FooterTemplate>
                                                            <%--<asp:Label ID="Label1" runat="server" Text="Total"></asp:Label>--%>
                                                        </FooterTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Eval("kms")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>





                                                </Columns>

                                                <RowStyle CssClass="td"></RowStyle>
                                            </asp:GridView>


                                            <div class="form-group text-center">
                                                <div class="col-lg-12">
                                                    <asp:Button ID="Button2" OnClick="Button1_Click" runat="server" Enabled="true" Text="Volver" Visible="true" CssClass="btn btn-white btn-xs" />
                                                </div>
                                            </div>

                                            <asp:LinqDataSource ID="gridDataSource2" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="stMedicionProfundidad" Where="stOrdenGomeriaDetalle.idOrden == @idOrden">
                                                <WhereParameters>
                                                    <asp:Parameter DefaultValue="-1" Name="idOrden" Type="Int32" />
                                                </WhereParameters>

                                            </asp:LinqDataSource>

                                        </div>
                                    </section>
                                </section>
                            </div>
                        </section>
                    </div>





















                    <div runat="server" id="panel4" visible="false" class="col-sm-12">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Calibracion</span>
                                    </header>
                                    <section style="//height: 200px">
                                        <div class="panel-body" style="padding: 10px 30px 10px 30px">

                                            <asp:GridView ID="gvCalibracion" runat="server" ShowFooter="true" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="ldsCalibracion" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender">
                                                <Columns>
                                                    <asp:BoundField DataField="stOrdenGomeriaDetalle.stUbicaciones.Ubicacion" HeaderText="Ubicacion" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="Nro.Partida" HeaderStyle-Width="100px" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-left">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Eval("stPartidas.nroPartida")%>'></asp:Label>
                                                        </ItemTemplate>

                                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                                        <FooterTemplate>
                                                            <%--<asp:Label ID="Label1" runat="server" Text="Total"></asp:Label>--%>
                                                        </FooterTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Eval("stPartidas.completo")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Presion" HeaderStyle-Width="100px" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-left">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Eval("presion")%>'></asp:Label>
                                                        </ItemTemplate>

                                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Kms" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                                        <FooterTemplate>
                                                            <%--<asp:Label ID="Label1" runat="server" Text="Total"></asp:Label>--%>
                                                        </FooterTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Eval("kms")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>





                                                </Columns>

                                                <RowStyle CssClass="td"></RowStyle>
                                            </asp:GridView>


                                            <div class="form-group text-center">
                                                <div class="col-lg-12">
                                                    <asp:Button ID="Button3" OnClick="Button1_Click" runat="server" Enabled="true" Text="Volver" Visible="true" CssClass="btn btn-white btn-xs" />
                                                </div>
                                            </div>

                                            <asp:LinqDataSource ID="ldsCalibracion" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="stCalibracion" Where="stOrdenGomeriaDetalle.idOrden == @idOrden">
                                                <WhereParameters>
                                                    <asp:Parameter DefaultValue="-1" Name="idOrden" Type="Int32" />
                                                </WhereParameters>

                                            </asp:LinqDataSource>

                                        </div>
                                    </section>
                                </section>
                            </div>
                        </section>
                    </div>









                    <div runat="server" id="panel5" visible="false" class="col-sm-12">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Reajuste</span>
                                    </header>
                                    <section style="//height: 200px">
                                        <div class="panel-body" style="padding: 10px 30px 10px 30px">


                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-lg-12">
                                                        <label for="ddDepositoDestino">Observaciones</label><asp:TextBox ID="tbObs" Enabled="false" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>


                                                    </div>
                                                    <div class="col-lg-0"></div>
                                                </div>
                                            </div>

                                            <div class="form-group text-center">
                                                <div class="col-lg-12">
                                                    <asp:Button ID="Button4" OnClick="Button1_Click" runat="server" Enabled="true" Text="Volver" Visible="true" CssClass="btn btn-white btn-xs" />
                                                </div>
                                            </div>

                                            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="stCalibracion" Where="stOrdenGomeriaDetalle.idOrden == @idOrden">
                                                <WhereParameters>
                                                    <asp:Parameter DefaultValue="-1" Name="idOrden" Type="Int32" />
                                                </WhereParameters>

                                            </asp:LinqDataSource>

                                        </div>
                                    </section>
                                </section>
                            </div>
                        </section>
                    </div>






                      <div runat="server" id="panel6" visible="false" class="col-sm-12">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Reajuste</span>
                                    </header>
                                    <section style="//height: 200px">
                                        <div class="panel-body" style="padding: 10px 30px 10px 30px">


                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-lg-12">
                                                        <label for="ddDepositoDestino">Observaciones</label><asp:TextBox ID="tbObsRep" Enabled="false" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-0"></div>
                                                </div>
                                            </div>

                                                                                        <div class="row">
                                                <div class="form-group">
                                                    <div class="col-lg-12">
                                                        <label for="ddDepositoDestino">Observaciones Reparacion</label><asp:TextBox ID="tbObsRep2" Enabled="false" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-0"></div>
                                                </div>
                                            </div>
                                            <br />
                                            <div class="form-group text-center">
                                                <div class="col-lg-12">
                                                    <asp:Button ID="Button5" OnClick="Button1_Click" runat="server" Enabled="true" Text="Volver" Visible="true" CssClass="btn btn-white btn-xs" />
                                                </div>
                                            </div>

                                            <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="stCalibracion" Where="stOrdenGomeriaDetalle.idOrden == @idOrden">
                                                <WhereParameters>
                                                    <asp:Parameter DefaultValue="-1" Name="idOrden" Type="Int32" />
                                                </WhereParameters>

                                            </asp:LinqDataSource>

                                        </div>
                                    </section>
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
