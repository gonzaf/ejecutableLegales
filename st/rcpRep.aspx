<%@ Page Title="" Language="vb" AutoEventWireup="false" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/st/SiteST.master" CodeBehind="rcpRep.aspx.vb" Inherits="Dynamic_Data.rcpRep" %>

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
                                            Rec.Repuestos enviados&nbsp;&nbsp; <br /><br />
                                            <asp:TextBox ID="desdeFecha" runat="server" ClientIDMode="Static" CssClass="input-sm form-control datepicker" Width="80px"></asp:TextBox>
                                            <asp:Button ID="buttondesdeFecha" OnClick="buttonfecha_Click" display="dynamic" ClientIDMode="Static" runat="server" Text="Button" type="hidden" Style="display: none" />
                                            <asp:TextBox ID="hastaFecha" runat="server" ClientIDMode="Static" CssClass="input-sm form-control datepicker" Width="80px"></asp:TextBox>
                                            <asp:Button ID="buttonhastaFecha" OnClick="buttonfecha_Click" display="dynamic" ClientIDMode="Static" runat="server" Text="Button" type="hidden" Style="display: none" />
                                            &nbsp;&nbsp;
                                            <asp:CheckBox ID="cbMostrarTodo" AutoPostBack="true" OnCheckedChanged="cbMostrarTodo_CheckedChanged" runat="server" Checked="true" Text="Ver Todos los dias" />
                                            <asp:Label ID="Label2" runat="server" Text="Label">---</asp:Label>
                                            <asp:DropDownList ID="ddProveedor" DataSourceID="LinqDataSource4" OnSelectedIndexChanged="mostrarPartes" AppendDataBoundItems="true" DataTextField="proveedor" DataValueField="idProveedor" runat="server" AutoPostBack="true" CssClass="form-control col-6 input-sm entTab">
                                                 <asp:ListItem Text="Todos" Value="-2" Selected="True"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="proveedor" TableName="vStProveedor">
                                            </asp:LinqDataSource>



                                            <asp:TextBox ID="tbNroRemito" CssClass="form-control input-sm" Width="90" placeholder="# Remito" runat="server"></asp:TextBox>

                                            <asp:CheckBox ID="cbReclamos"  OnCheckedChanged="mostrarpartes" AutoPostBack="true" runat="server" Checked="true" Text="Reclamos" />
                                            <asp:CheckBox ID="cbReparaciones"  runat="server"  OnCheckedChanged="mostrarpartes" AutoPostBack="true" Checked="true" Text="Reparaciones" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:CheckBox ID="cbSoloPendientes" Visible="false" AutoPostBack="true"  runat="server" Checked="true" Text="Ver Solo Pendientes" />
                                            <asp:DropDownList ID="ddDeposito" CssClass="form-control input-sm entTab" AppendDataBoundItems="true"  OnSelectedIndexChanged="mostrarPartes" data-next="ddMecanico" ClientIDMode="Static" runat="server" DataTextField="Deposito" DataValueField="idDeposito" AutoPostBack="true">
                                                  <asp:ListItem Text="Todos" Value="-2" Selected="True"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </header>
                                    <section style="//height: 200px" class="panel-body scrollbar scroll-y m-b">
                                        <div class="panel">
                                            
                                            
                                            <asp:GridView ID="gvPartes" runat="server" DataKeyNames="id" AutoGenerateColumns="False"  CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnSelectedIndexChanged="gvPartes_SelectedIndexChanged" OnPreRender="GVPreRender">
                                                <%--<asp:GridView ID="GridView1" runat="server" DataKeyNames="id" AutoGenerateColumns="False" DataSourceID="dsPartes" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnSelectedIndexChanged="gvPartes_SelectedIndexChanged" OnPreRender="GVPreRender">--%>
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Fec.Envio" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Format(Eval("fechaEnvioProveedor"), "dd/MM/yy")%>'></asp:Label>
                                                            <asp:HiddenField ID="hfCant" ClientIDMode="Static" runat="server" Value='<%# Eval("cantEnviadaProveedor")%>' />
                                                            <asp:HiddenField ID="hfId" ClientIDMode="Static" runat="server" Value='<%# Eval("id")%>' />
                                                            <asp:HiddenField ID="hfIdConfirmacion" ClientIDMode="Static" runat="server" Value='<%# Eval("idConfirmacion")%>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="codRepuesto" HeaderText="Cod.Repuesto" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="Desc_Repuesto" HeaderText="Repuesto" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="cantEnviadaProveedor" HeaderText="Cant.Env." ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>

                                                    <asp:TemplateField HeaderText="Pendiente" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelss2" runat="server" Text='<%#Eval("cantEnviadaProveedor") - Eval("cantDesechada") - Eval("cantReingresada") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    
                                                     <asp:TemplateField HeaderText="Tipo" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Lab2" runat="server" Text='<%#IIf(Eval("esReclamo"), "Reclamo", "Reparacion")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Cant.a Desechar" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="cantDes" Width="10px" runat="server"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                          <asp:TemplateField HeaderText="Cant.a Reingresar" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="cantReing" Width="10px" runat="server"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Detalle" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="detalle" runat="server"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="# Factura" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="nroComp" Width="100px" runat="server"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="Precio" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="precio" Width="80px" runat="server"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                </Columns>
                                            </asp:GridView>

                                        </div>

                                        <asp:LinqDataSource ID="LinqDataSource4" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="proveedor" TableName="vStProveedor">
                                        </asp:LinqDataSource>

                                        <%--<asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="" TableName="vStRepuestosEnviados" Where='(esReclamo == @cbReclamos or esReclamo != @cbReparaciones) and (idProveedor == @ddProveedor or @ddProveedor == -2) and (fechaDevolucion == null or not @cbSoloPendientes) and (@okFecha == -1 or (fechaEnvioProveedor >= @fechaDesde and fechaEnvioProveedor <= @fechaHasta)) and (@tbNroRemito == idImpresion or @tbNroRemito == -1)'>--%>
                                        <%--<asp:LinqDataSource ID="dsPartes" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="" TableName="vStRepuestosEnviados" Where='( idDeposito == @ddDeposito or -2 == @ddDeposito) and ( @depositosPermitidos.Contains("" + idDeposito + "") ) and (esReclamo == @cbReclamos or esReclamo != @cbReparaciones) and (idProveedor == @ddProveedor or @ddProveedor == -2) and (fechaDevolucion == null or not @cbSoloPendientes) and (@tbNroRemito == idImpresion or @tbNroRemito == -1)'>
                                            <WhereParameters>
                                                <asp:Parameter DefaultValue="20-06-2016" Name="fechaDesde" Type="DateTime" />
                                                <asp:Parameter DefaultValue="20-06-2016" Name="fechaHasta" Type="DateTime" />
                                                <asp:Parameter DefaultValue="1" Name="okFecha" Type="Int32" />
                                                <asp:Parameter DefaultValue="1,2,3" Name="depositosPermitidos" Type="String" />
                                                <asp:ControlParameter ControlID="ddProveedor" DefaultValue="-1" Name="ddProveedor" Type="Int32" PropertyName="SelectedValue" />
                                                <asp:ControlParameter ControlID="tbNroRemito" DefaultValue="-1" Name="tbNroRemito" Type="Int32" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="cbReclamos" DefaultValue="True" name="cbReclamos" Type="Boolean" PropertyName="Checked" />
                                                <asp:ControlParameter ControlID="cbReparaciones" DefaultValue="True" name="cbReparaciones" Type="Boolean" PropertyName="Checked" />
                                                <asp:ControlParameter ControlID="cbSoloPendientes" DefaultValue="True" name="cbSoloPendientes" Type="Boolean" PropertyName="Checked" />
                                                <asp:ControlParameter ControlID="ddDeposito" DefaultValue="-2" Name="ddDeposito" Type="Int32" PropertyName="SelectedValue" />
                                            </WhereParameters>
                                        </asp:LinqDataSource>--%>
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
