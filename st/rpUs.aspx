﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/st/SiteST.master" CodeBehind="rpUs.aspx.vb" Inherits="Dynamic_Data.rpUs" %>

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
                                            Repuestos Utilizados&nbsp;&nbsp; 
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
                                            <asp:GridView ID="gvPartes" runat="server" DataKeyNames="idOrden" AutoGenerateColumns="False" DataSourceID="dsPartes" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnSelectedIndexChanged="gvPartes_SelectedIndexChanged" OnPreRender="GVPreRender">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Nro.OE" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="hlMasInfoo" OnCommand="hlMasInfo_Command" CommandArgument='<%#Eval("idOrden") %>' runat="server"><%# Eval("idOrden") %></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                  
                                                    <asp:TemplateField HeaderText="Fec.Cierre" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Format(Eval("fechaCierre"), "dd/MM/yy")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="codRepuesto" HeaderText="Cod.Repuesto" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="idArticulo" HeaderText="# Art." ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="Desc_Repuesto" HeaderText="Repuesto" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="cant" HeaderText="Cant." ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="usuarioPanolrepuesto" HeaderText="U.Pañol" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="Linea">
                                                                                                            </asp:BoundField>
                                                    <asp:BoundField DataField="idCoche" HeaderText="Interno" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="Interno">
                                                        
                                                    </asp:BoundField>


                                                    <asp:BoundField DataField="idLegajo" HeaderText="Mecanico" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="100px" ReadOnly="True" SortExpression="Patente"></asp:BoundField>
                                                    <asp:BoundField DataField="Legajo" HeaderText="Legajo" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="Legajo">
                                                        
                                                    </asp:BoundField>
                                                    
                                                    
                                                   
                                                </Columns>
                                            </asp:GridView>

                                        </div>
                                        <asp:LinqDataSource ID="dsPartes" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="" TableName="vStRepuestosUtilizados" Where='(@okFecha == -1 or (fechaCierre >= @fechaDesde and fechaCierre <= @fechaHasta)) and idDeposito == @ddDepositos and (idCoche == @tbInterno or @tbInterno == -1) and  (codRepuesto == @tbRepuesto or @tbRepuesto == -1)'>
                                            <WhereParameters>
                                                <asp:Parameter DefaultValue="20-06-2016" Name="fechaDesde" Type="DateTime" />
                                                <asp:Parameter DefaultValue="20-06-2016" Name="fechaHasta" Type="DateTime" />
                                                <asp:Parameter DefaultValue="1" Name="okFecha" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddDepositos" DefaultValue="-1" Name="ddDepositos" Type="Int32" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="tbInterno" DefaultValue="-1" Name="tbInterno" Type="Int32" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="tbRepuesto" DefaultValue="-1" Name="tbRepuesto" Type="Int32" PropertyName="Text" />
                                            </WhereParameters>
                                        </asp:LinqDataSource> 
                                        <asp:QueryExtender TargetControlID="dsPartes" runat="server">
                                            <asp:SearchExpression ComparisonType="OrdinalIgnoreCase" DataFields="Desc_Repuesto" SearchType="Contains">
                                                <asp:ControlParameter ControlID="tbDescripcion" PropertyName="Text" Type="String" />
                                            </asp:SearchExpression>
                                          
                                        </asp:QueryExtender>
                                          
                                    </section>
                                    <%--</div>--%>
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
