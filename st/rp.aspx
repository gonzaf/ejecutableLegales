<%@ Page Title="" Language="vb" AutoEventWireup="false" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/st/SiteST.master" CodeBehind="rp.aspx.vb" Inherits="Dynamic_Data.rp" %>

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
                                        <span class="label bg-danger pull-right">Consulta de Repuestos</span>
                                        <div class="form-inline">
                                            Consulta de Repuestos
                                            <asp:TextBox ID="tbCodigo" CssClass="form-control input-sm clickbutton" data-button="buttonBuscar" Width="70" placeholder="# Rep." runat="server"></asp:TextBox>
                                            <asp:TextBox ID="tbDescripcion" CssClass="form-control input-sm clickbutton" Width="100" data-button="buttonBuscar" placeholder="Desc.Repuesto" runat="server"></asp:TextBox>
                                            <asp:Button ID="buttonBuscar" OnClick="buttonBuscar_Click" ClientIDMode="Static" runat="server" Style="display: none" Text="" Display="Dynamic" />
                                        </div>
                                    </header>


                                    <section style="//height: 200px" class="panel-body scrollbar scroll-y m-b">
                                        <div class="panel">
                                            <asp:GridView ID="gvPartes" runat="server" DataKeyNames="cod_repuesto" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnSelectedIndexChanged="gvPartes_SelectedIndexChanged" OnPreRender="GVPreRender">
                                                <Columns>
                                                    <asp:BoundField DataField="cod_repuesto" HeaderText="Codigo" HeaderStyle-HorizontalAlign="Center"  HeaderStyle-Width="30px" ReadOnly="True" SortExpression="cod_repuesto" />
                                                    <asp:TemplateField HeaderText="Descripcion" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" SortExpression="Desc_Repuesto">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label23231" runat="server" Text='<%# Eval("Desc_Repuesto")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="30px"></HeaderStyle>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="cod_rubro" HeaderStyle-Width="30px" HeaderText="Codigo" ItemStyle-HorizontalAlign="center" HeaderStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="cod_rubro" />
                                                    <asp:BoundField DataField="desc_rubro" HeaderText="Rubro" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="desc_rubro"/>
                                                    <asp:BoundField DataField="cod_subrubro" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="center" HeaderText="Codigo" HeaderStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="cod_subrubro" />
                                                    <asp:BoundField DataField="desc_subrubro" HeaderText="Rubro" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="desc_subrubro"/>
                                                        
                                                     <asp:TemplateField HeaderText="Foto" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:HyperLink NavigateUrl='<%# String.Concat("/docs/fotosRepuestos/", Eval("foto")) %>' Target="_blank" ID="foto" runat="server"><%# IIf(Eval("foto") <> "", "Ver Foto", "")%></asp:HyperLink>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:BoundField DataField="observaciones" HeaderText="Obs." ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="desc_subrubro"/>
                                                    
                                                </Columns>
                                            </asp:GridView>

                                        </div>
                                        <asp:LinqDataSource ID="dsPartes" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="FechaInicio desc" TableName="vStMantOrdenesPendientes" Where='(fechaCierre == null or (fechaCierreOrdenEntrega == null and fechaConfeccion <> null))'>
                                        </asp:LinqDataSource>

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
