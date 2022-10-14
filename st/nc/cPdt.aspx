<%@ Page Title="" Language="vb" AutoEventWireup="false" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/st/SiteST.master" CodeBehind="cPdt.aspx.vb" Inherits="Dynamic_Data.cPdt" %>

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
                                        <span class="label bg-danger pull-right">Repuestos</span>
                                        <div class="form-inline">
                                            Pendientes&nbsp;&nbsp; 
                                            <asp:TextBox Visible="false" ID="tbRepuesto" CssClass="form-control input-sm" Width="100" placeholder="# Articulo" runat="server"></asp:TextBox>
                                            <asp:TextBox Visible="false" ID="tbDescripcion" CssClass="form-control input-sm " Width="150" placeholder="Articulo" runat="server"></asp:TextBox>

                                            <%--                                            <asp:CheckBox ID="cbMostrarTodo" AutoPostBack="true" runat="server" Checked="true" Text="_Ver Todos los dias" />--%>
                                            <asp:Label ID="Label2" runat="server" Text="Label">---</asp:Label>
                                            <asp:DropDownList ID="ddDepositos" AppendDataBoundItems="true" runat="server" AutoPostBack="true" CssClass="form-control input-sm entTab" DataTextField="Deposito" DataValueField="idDeposito">
                                            </asp:DropDownList>
                                            <%--<asp:DropDownList ID="ddRubro" AppendDataBoundItems="true" DataSourceID="LinqDataSource1" DataTextField="rubro" DataValueField="idRubro" runat="server" AutoPostBack="true" CssClass="form-control col-6 input-sm entTab">
                                                <asp:ListItem Text="Todos los Rubros" Value="-2" Selected="True"></asp:ListItem>
                                            </asp:DropDownList>--%>
                                            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="rubro" TableName="vStRubrosN">
                                            </asp:LinqDataSource>

                                            <%--<asp:DropDownList ID="DropDownList1" AppendDataBoundItems="true" DataSourceID="LinqDataSource2" DataTextField="subrubro" DataValueField="idsubRubro" runat="server" AutoPostBack="true" CssClass="form-control col-6 input-sm entTab">
                                                <asp:ListItem Text="Todos los SubRubros" Value="-2" Selected="True"></asp:ListItem>
                                            </asp:DropDownList>--%>
                                            <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="subrubro" TableName="vStSubRubrosN">
                                            </asp:LinqDataSource>

                                        </div>
                                    </header>




                                    <%--<section style="//height: 200px" class="panel-body scrollbar scroll-y m-b">--%>








                                    <%--</section>--%>
                                    <%--</div>--%>
                                </section>



                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Pendientes</span>
                                        <div class="form-inline">
                                            Transferencias Enviadas
                                        </div>
                                    </header>

                                    <div class="panel">
                                        <asp:GridView ID="GridView2" runat="server" DataKeyNames="idArticulo" AutoGenerateColumns="False" DataSourceID="dsPartes" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Fecha" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Format(Eval("fecha"), "dd/MM/yy")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="idArticulo" HeaderText="Cod.Articulo" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Articulo" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label123" runat="server" Text='<%# Eval("articulo")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>



                                                <asp:TemplateField HeaderText="Deposito" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("depositoOut")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="usuario" HeaderText="Usuario" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                <asp:BoundField DataField="cantAenviar" HeaderText="Cant" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                <asp:BoundField DataField="puc" HeaderText="PUC" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                <asp:BoundField DataField="atraso" HeaderText="Atraso" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                <asp:BoundField DataField="idTransferencia" HeaderText="#Transf." HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>

                                                <%--  <asp:TemplateField HeaderText="Accion" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="ddAccion" runat="server" AutoPostBack="false" data-target='ddMotivo<%# Eval("idDetalle") %>' CssClass="form-control filterSelect input-sm entTab">
                                                                <asp:ListItem Text="Desechable" Value="1" Selected="True"></asp:ListItem>
                                                                <asp:ListItem Text="Enviar a Reparar" Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="Reclamo al Proveedor" Value="3"></asp:ListItem>
                                                                <asp:ListItem Text="Reingresa al Stock" Value="4"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                <%--  <asp:TemplateField HeaderText="Motivo" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="ddMotivo" DataSourceID="LinqDataSource4" DataTextField="motivo" DataValueField="idMotivo" runat="server" AutoPostBack="false" CssClass="form-control input-sm entTab">
                                                            </asp:DropDownList>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>

                                                <%--<asp:TemplateField HeaderText="Detalle" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="detalle" runat="server"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                            </Columns>
                                        </asp:GridView>
                                        <asp:LinqDataSource ID="dspartes" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="fecha" TableName="vStTransferenciasPendientes" Where='(@tbRepuesto == idArticulo or @tbRepuesto == -1) and @ddDepositos == idDepositoOut'>
                                            <%--<asp:LinqDataSource ID="LinqDataSource3" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="" TableName="vStNecesidadCompraCalculo" Where='cantPendiente > 0 and (@okFecha == -1 or (fechaCierre >= @fechaDesde and fechaCierre <= @fechaHasta)) and idDeposito == @ddDepositos  and (codRepuesto == @tbRepuesto or @tbRepuesto == -1) and ((@ddCaracteristica == -2 and (analizable == "Si" or reparable == "Si")) or (@ddCaracteristica == 1 and analizable == "Si") or (@ddCaracteristica == 2 and reparable == "Si"))'>--%>
                                            <WhereParameters>
                                                <asp:ControlParameter ControlID="ddDepositos" DefaultValue="-1" Name="ddDepositos" Type="Int32" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="tbRepuesto" DefaultValue="-1" Name="tbRepuesto" Type="Int32" PropertyName="Text" />
                                            </WhereParameters>
                                        </asp:LinqDataSource>
                                        <asp:QueryExtender TargetControlID="dsPartes" runat="server">
                                            <asp:SearchExpression ComparisonType="OrdinalIgnoreCase" DataFields="articulo" SearchType="Contains">
                                                <asp:ControlParameter ControlID="tbDescripcion" PropertyName="Text" Type="String" />
                                            </asp:SearchExpression>
                                        </asp:QueryExtender>


                                    </div>


                                </section>



                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Transferencias</span>
                                        <div class="form-inline">
                                            Transferencias A Recibir
                                        </div>
                                    </header>

                                    <div class="panel">
                                        <asp:GridView ID="GridView1" runat="server" DataKeyNames="idArticulo" AutoGenerateColumns="False" DataSourceID="LinqDataSource3" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Fecha" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label122" runat="server" Text='<%# Format(Eval("fecha"), "dd/MM/yy")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="idArticulo" HeaderText="Cod.Articulo" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Articulo" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("articulo")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>



                                                <asp:TemplateField HeaderText="Deposito" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("depositoOut")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="usuario" HeaderText="Usuario" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                <asp:BoundField DataField="cantAenviar" HeaderText="Cant" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                <asp:BoundField DataField="puc" HeaderText="PUC" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                <asp:BoundField DataField="atraso" HeaderText="Atraso" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                <asp:BoundField DataField="idTransferencia" HeaderText="#Transf." HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>

                                                <%--  <asp:TemplateField HeaderText="Accion" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="ddAccion" runat="server" AutoPostBack="false" data-target='ddMotivo<%# Eval("idDetalle") %>' CssClass="form-control filterSelect input-sm entTab">
                                                                <asp:ListItem Text="Desechable" Value="1" Selected="True"></asp:ListItem>
                                                                <asp:ListItem Text="Enviar a Reparar" Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="Reclamo al Proveedor" Value="3"></asp:ListItem>
                                                                <asp:ListItem Text="Reingresa al Stock" Value="4"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                <%--  <asp:TemplateField HeaderText="Motivo" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="ddMotivo" DataSourceID="LinqDataSource4" DataTextField="motivo" DataValueField="idMotivo" runat="server" AutoPostBack="false" CssClass="form-control input-sm entTab">
                                                            </asp:DropDownList>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>

                                                <%--<asp:TemplateField HeaderText="Detalle" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="detalle" runat="server"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                            </Columns>
                                        </asp:GridView>
                                        <asp:LinqDataSource ID="LinqDataSource3" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="fecha" TableName="vStTransferenciasPendientes" Where='(@tbRepuesto == idArticulo or @tbRepuesto == -1) and @ddDepositos == idDepositoIn'>
                                            <%--<asp:LinqDataSource ID="LinqDataSource3" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="" TableName="vStNecesidadCompraCalculo" Where='cantPendiente > 0 and (@okFecha == -1 or (fechaCierre >= @fechaDesde and fechaCierre <= @fechaHasta)) and idDeposito == @ddDepositos  and (codRepuesto == @tbRepuesto or @tbRepuesto == -1) and ((@ddCaracteristica == -2 and (analizable == "Si" or reparable == "Si")) or (@ddCaracteristica == 1 and analizable == "Si") or (@ddCaracteristica == 2 and reparable == "Si"))'>--%>
                                            <WhereParameters>
                                                <asp:ControlParameter ControlID="ddDepositos" DefaultValue="-1" Name="ddDepositos" Type="Int32" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="tbRepuesto" DefaultValue="-1" Name="tbRepuesto" Type="Int32" PropertyName="Text" />
                                            </WhereParameters>
                                        </asp:LinqDataSource>
                                        <asp:QueryExtender TargetControlID="LinqDataSource3" runat="server">
                                            <asp:SearchExpression ComparisonType="OrdinalIgnoreCase" DataFields="articulo" SearchType="Contains">
                                                <asp:ControlParameter ControlID="tbDescripcion" PropertyName="Text" Type="String" />
                                            </asp:SearchExpression>
                                        </asp:QueryExtender>


                                    </div>



                                </section>



                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Entregas</span>
                                        <div class="form-inline">
                                            Entregas Pendientes
                                        </div>
                                    </header>

                                    <div class="panel">
                                        <asp:GridView ID="GridView3" runat="server" DataKeyNames="idArticulo" AutoGenerateColumns="False" DataSourceID="LinqDataSource4" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Fecha" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label122" runat="server" Text='<%# Format(Eval("fecha"), "dd/MM/yy")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="idArticulo" HeaderText="Cod.Articulo" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Articulo" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("articulo")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>



                                                <asp:TemplateField HeaderText="Deposito" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("deposito")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="usuario" HeaderText="Usuario" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                <asp:BoundField DataField="cant" HeaderText="Cant" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                <asp:BoundField DataField="puc" HeaderText="PUC" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                <asp:BoundField DataField="atraso" HeaderText="Atraso" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                <asp:BoundField DataField="idDet" HeaderText="IdDet" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>


                                                <%--  <asp:TemplateField HeaderText="Accion" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="ddAccion" runat="server" AutoPostBack="false" data-target='ddMotivo<%# Eval("idDetalle") %>' CssClass="form-control filterSelect input-sm entTab">
                                                                <asp:ListItem Text="Desechable" Value="1" Selected="True"></asp:ListItem>
                                                                <asp:ListItem Text="Enviar a Reparar" Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="Reclamo al Proveedor" Value="3"></asp:ListItem>
                                                                <asp:ListItem Text="Reingresa al Stock" Value="4"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                <%--  <asp:TemplateField HeaderText="Motivo" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="ddMotivo" DataSourceID="LinqDataSource4" DataTextField="motivo" DataValueField="idMotivo" runat="server" AutoPostBack="false" CssClass="form-control input-sm entTab">
                                                            </asp:DropDownList>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>

                                                <%--<asp:TemplateField HeaderText="Detalle" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="detalle" runat="server"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                            </Columns>
                                        </asp:GridView>
                                        <asp:LinqDataSource ID="LinqDataSource4" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="fecha" TableName="vStEntregasPendientes" Where='(@tbRepuesto == idArticulo or @tbRepuesto == -1) and @ddDepositos == idDeposito'>
                                            <%--<asp:LinqDataSource ID="LinqDataSource3" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="" TableName="vStNecesidadCompraCalculo" Where='cantPendiente > 0 and (@okFecha == -1 or (fechaCierre >= @fechaDesde and fechaCierre <= @fechaHasta)) and idDeposito == @ddDepositos  and (codRepuesto == @tbRepuesto or @tbRepuesto == -1) and ((@ddCaracteristica == -2 and (analizable == "Si" or reparable == "Si")) or (@ddCaracteristica == 1 and analizable == "Si") or (@ddCaracteristica == 2 and reparable == "Si"))'>--%>
                                            <WhereParameters>
                                                <asp:ControlParameter ControlID="ddDepositos" DefaultValue="-1" Name="ddDepositos" Type="Int32" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="tbRepuesto" DefaultValue="-1" Name="tbRepuesto" Type="Int32" PropertyName="Text" />
                                            </WhereParameters>
                                        </asp:LinqDataSource>
                                        <asp:QueryExtender TargetControlID="LinqDataSource3" runat="server">
                                            <asp:SearchExpression ComparisonType="OrdinalIgnoreCase" DataFields="articulo" SearchType="Contains">
                                                <asp:ControlParameter ControlID="tbDescripcion" PropertyName="Text" Type="String" />
                                            </asp:SearchExpression>
                                        </asp:QueryExtender>


                                    </div>



                                </section>




                                
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Necesidad</span>
                                        <div class="form-inline">
                                            Necesidades de Compra Pendientes
                                        </div>
                                    </header>

                                    <div class="panel">
                                        <asp:GridView ID="GridView4" runat="server" DataKeyNames="idArticulo" AutoGenerateColumns="False" DataSourceID="LinqDataSource5" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Fecha" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label122" runat="server" Text='<%# Format(Eval("fecha"), "dd/MM/yy")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="idArticulo" HeaderText="Cod.Articulo" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Articulo" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("articulo")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>



                                                <asp:TemplateField HeaderText="Deposito" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("deposito")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="usuario" HeaderText="Usuario" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                <asp:BoundField DataField="cantidad" HeaderText="Cant" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                <asp:BoundField DataField="puc" HeaderText="PUC" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                <asp:BoundField DataField="atraso" HeaderText="Atraso" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                <asp:BoundField DataField="idDet" HeaderText="IdDet" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>

                                                <%--  <asp:TemplateField HeaderText="Accion" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="ddAccion" runat="server" AutoPostBack="false" data-target='ddMotivo<%# Eval("idDetalle") %>' CssClass="form-control filterSelect input-sm entTab">
                                                                <asp:ListItem Text="Desechable" Value="1" Selected="True"></asp:ListItem>
                                                                <asp:ListItem Text="Enviar a Reparar" Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="Reclamo al Proveedor" Value="3"></asp:ListItem>
                                                                <asp:ListItem Text="Reingresa al Stock" Value="4"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                <%--  <asp:TemplateField HeaderText="Motivo" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="ddMotivo" DataSourceID="LinqDataSource4" DataTextField="motivo" DataValueField="idMotivo" runat="server" AutoPostBack="false" CssClass="form-control input-sm entTab">
                                                            </asp:DropDownList>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>

                                                <%--<asp:TemplateField HeaderText="Detalle" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="detalle" runat="server"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                            </Columns>
                                        </asp:GridView>
                                        <asp:LinqDataSource ID="LinqDataSource5" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="fecha" TableName="vStNecesidadCompraPendientes" Where='(@tbRepuesto == idArticulo or @tbRepuesto == -1) and @ddDepositos == idDeposito'>
                                            <%--<asp:LinqDataSource ID="LinqDataSource3" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="" TableName="vStNecesidadCompraCalculo" Where='cantPendiente > 0 and (@okFecha == -1 or (fechaCierre >= @fechaDesde and fechaCierre <= @fechaHasta)) and idDeposito == @ddDepositos  and (codRepuesto == @tbRepuesto or @tbRepuesto == -1) and ((@ddCaracteristica == -2 and (analizable == "Si" or reparable == "Si")) or (@ddCaracteristica == 1 and analizable == "Si") or (@ddCaracteristica == 2 and reparable == "Si"))'>--%>
                                            <WhereParameters>
                                                <asp:ControlParameter ControlID="ddDepositos" DefaultValue="-1" Name="ddDepositos" Type="Int32" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="tbRepuesto" DefaultValue="-1" Name="tbRepuesto" Type="Int32" PropertyName="Text" />
                                            </WhereParameters>
                                        </asp:LinqDataSource>
                                        <asp:QueryExtender TargetControlID="LinqDataSource3" runat="server">
                                            <asp:SearchExpression ComparisonType="OrdinalIgnoreCase" DataFields="articulo" SearchType="Contains">
                                                <asp:ControlParameter ControlID="tbDescripcion" PropertyName="Text" Type="String" />
                                            </asp:SearchExpression>
                                        </asp:QueryExtender>


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
