<%@ Page Title="" Language="vb" AutoEventWireup="false" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/st/SiteST.master" CodeBehind="cEnv.aspx.vb" Inherits="Dynamic_Data.cEnv" %>

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
                                        <span class="label bg-danger pull-right">Recepcion</span>
                                        <div class="form-inline">
                                            Consulta Reparaciones Repuestos&nbsp;&nbsp; <br /><br />
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



                                            <asp:TextBox ID="tbNroRemito" CssClass="form-control input-sm" Width="90" placeholder="# Remito" runat="server"></asp:TextBox>

                                            <asp:CheckBox ID="cbReclamos" AutoPostBack="true" runat="server" Checked="true" Text="Reclamos" />
                                            <asp:CheckBox ID="cbReparaciones" AutoPostBack="true" runat="server" Checked="true" Text="Reparaciones" />
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
                                            <asp:GridView ID="gvPartes" runat="server" DataKeyNames="id" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnSelectedIndexChanged="gvPartes_SelectedIndexChanged" OnPreRender="GVPreRender">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Fec.Envio" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Format(Eval("fechaEnvioProveedor"), "dd/MM/yy")%>'></asp:Label>
                                                            <asp:HiddenField ID="hfCant" ClientIDMode="Static" runat="server" Value='<%# Eval("cantEnviadaProveedor")%>' />
                                                            <asp:HiddenField ID="hfId" ClientIDMode="Static" runat="server" Value='<%# Eval("id")%>' />
                                                            <asp:HiddenField ID="hfIdConfirmacion" ClientIDMode="Static" runat="server" Value='<%# Eval("idConfirmacion")%>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="id" HeaderText="# Envio" HeaderStyle-CssClass="text-center"  HeaderStyle-Width="20px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="codRepuesto" HeaderText="Codigo Repuesto" HeaderStyle-CssClass="text-center"  HeaderStyle-Width="20px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="Desc_Repuesto" HeaderText="Repuesto" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="cantEnviadaProveedor" HeaderText="Cant Env" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="20px" HeaderStyle-CssClass="text-center" SortExpression="Linea"></asp:BoundField>
                                                      <asp:TemplateField HeaderText="Fec.Dev." ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label222" runat="server" Text='<%# Format(Eval("fechaDevolucion"), "dd/MM/yy")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:BoundField DataField="cantDesechada" HeaderStyle-Width="20px"  HeaderText="Des." HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="cantReingresada" HeaderStyle-Width="20px"  HeaderText="Reing." HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="idImpresion" HeaderStyle-Width="20px"  HeaderText="# Comp." HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>

                                                    <asp:BoundField DataField="obsRecepcion" HeaderStyle-Width="100px"  HeaderText="Detalle" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="nroComprobante" HeaderStyle-Width="20px"  HeaderText="Nro Factura" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="precio" HeaderStyle-Width="20px"  HeaderText="Precio" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>

                                                    
                                                     <asp:TemplateField HeaderText="Tipo" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelss2" runat="server" Text='<%#IIf(Eval("esReclamo"), "Reclamo", "Reparacion")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                  
                                                     <asp:TemplateField HeaderText="Reimpresion" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="HyperLink2" NavigateUrl='<%#String.Concat("/st/prEnvRep.aspx?id=", Eval("idImpresion"), "&back=Cs")%>' runat="server">R.Envio</asp:HyperLink>
                                                        </ItemTemplate>
                                                     </asp:TemplateField>

                                                      <asp:TemplateField HeaderText="Reimpresion" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="HyperLink1" NavigateUrl='<%#String.Concat("/st/prRec.aspx?id=", Eval("idRemitoRecepcion"), "&idRepRecibido=", Eval("idRepRecibido"), "&back=Cs")%>' runat="server">R.Recep.</asp:HyperLink>
                                                        </ItemTemplate>
                                                     </asp:TemplateField>



                                                </Columns>
                                            </asp:GridView>

                                        </div>

                                        <asp:LinqDataSource ID="LinqDataSource4" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="proveedor" TableName="vStProveedor">
                                        </asp:LinqDataSource>

                                        <%--<asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="" TableName="vStRepuestosEnviados" Where='(esReclamo == @cbReclamos or esReclamo != @cbReparaciones) and (idProveedor == @ddProveedor or @ddProveedor == -2) and (fechaDevolucion == null or not @cbSoloPendientes) and (@okFecha == -1 or (fechaEnvioProveedor >= @fechaDesde and fechaEnvioProveedor <= @fechaHasta)) and (@tbNroRemito == idImpresion or @tbNroRemito == -1)'>--%>
                                        <asp:LinqDataSource ID="dsPartes" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="" TableName="vStRepuestosEnviados" Where='( idDeposito == @ddDeposito or -2 == @ddDeposito)  and (esReclamo == @cbReclamos or esReclamo != @cbReparaciones) and (idProveedor == @ddProveedor or @ddProveedor == -2) and  (@tbNroRemito == idImpresion or @tbNroRemito == -1) and (      (fechaDevolucion == null and @ddEstado == 1 and (fechaEnvioProveedor >= @fechaDesde and fechaEnvioProveedor <= @fechaHasta ))    or   (fechaDevolucion != null and @ddEstado == 2 and (fechaDevolucion >= @fechaDesde and fechaDevolucion <= @fechaHasta ))     or    (@ddEstado == -2 and (fechaEnvioProveedor >= @fechaDesde and fechaEnvioProveedor <= @fechaHasta ))   )'>
                                            <WhereParameters>
                                                <asp:Parameter DefaultValue="20-06-2020" Name="fechaDesde" Type="DateTime" />
                                                <asp:Parameter DefaultValue="20-06-2016" Name="fechaHasta" Type="DateTime" />
                                                <asp:Parameter DefaultValue="1" Name="okFecha" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddProveedor" DefaultValue="-1" Name="ddProveedor" Type="Int32" PropertyName="SelectedValue" />
                                                <asp:ControlParameter ControlID="tbNroRemito" DefaultValue="-1" Name="tbNroRemito" Type="Int32" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="cbReclamos" DefaultValue="True" name="cbReclamos" Type="Boolean" PropertyName="Checked" />
                                                <asp:ControlParameter ControlID="cbReparaciones" DefaultValue="True" name="cbReparaciones" Type="Boolean" PropertyName="Checked" />
                                                <%--<asp:ControlParameter ControlID="cbSoloPendientes" DefaultValue="True" name="cbSoloPendientes" Type="Boolean" PropertyName="Checked" />--%>
                                                <asp:ControlParameter ControlID="ddEstado" DefaultValue="-2" Name="ddEstado" Type="Int32" PropertyName="SelectedValue" />
                                                <asp:ControlParameter ControlID="ddDeposito" DefaultValue="-2" Name="ddDeposito" Type="Int32" PropertyName="SelectedValue" />
                                            </WhereParameters>
                                        </asp:LinqDataSource>
                                    </section>
                                    <%--</div>--%>
                                    <div class="form-group text-center">
                                        <div class="col-lg-12">
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
