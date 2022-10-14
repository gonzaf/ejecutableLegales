<%@ Page Title="" Language="vb" AutoEventWireup="false" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/st/SiteST.master" CodeBehind="st.aspx.vb" Inherits="Dynamic_Data.st" %>

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
                                        <span class="label bg-danger pull-right">Stock Actual</span>
                                        <div class="form-inline">
                                            Stock Actual
                                            <asp:TextBox ID="tbCodigo" autocomplete="off" CssClass="form-control input-sm clickbutton" data-button="buttonBuscar" Width="70" placeholder="# Rep." runat="server"></asp:TextBox>
                                            <asp:TextBox ID="tbDescripcion" autocomplete="off" CssClass="form-control input-sm clickbutton" Width="100" data-button="buttonBuscar" placeholder="Desc.Repuesto" runat="server"></asp:TextBox>
                                            <asp:DropDownList ID="ddRubro" AppendDataBoundItems="true" OnSelectedIndexChanged="ddRubro_SelectedIndexChanged" runat="server" AutoPostBack="true" CssClass="form-control input-sm entTab" DataTextField="descRubro" DataValueField="codRubro">
                                                <asp:ListItem Text="Todos" Selected="True" Value="-1"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddDepositos" AppendDataBoundItems="true" OnSelectedIndexChanged="ddDepositos_SelectedIndexChanged" runat="server" AutoPostBack="true" CssClass="form-control input-sm entTab" DataTextField="Deposito" DataValueField="idDeposito">
                                                <asp:ListItem Text="Todos" Value="-1"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:Button ID="buttonBuscar" OnClick="buttonBuscar_Click" ClientIDMode="Static" runat="server" Style="display: none" Text="" Display="Dynamic" />
                                        </div>
                                    </header>


                                    <section style="//height: 200px" class="panel-body scrollbar scroll-y m-b">
                                        <div class="panel">
                                           <span runat="server" id="mostrarError" visible="false" class="label bg-danger pull-right">No tiene permisos</span>
                                            
                                            <asp:GridView ID="gvPartes" runat="server" DataKeyNames="codRepuesto" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnSelectedIndexChanged="gvPartes_SelectedIndexChanged" OnPreRender="GVPreRender">
                                                <Columns>

                                                    <asp:TemplateField HeaderText="Cod" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                             <asp:Label ID="dfdfdf" runat="server" Text='<%# Eval("codRepuesto")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Descripcion" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" SortExpression="Desc_Repuesto">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label23231" runat="server" Text='<%# Eval("DescRepuesto")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="30px"></HeaderStyle>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="stock" HeaderStyle-Width="30px" HeaderText="Cant." ItemStyle-HorizontalAlign="center" HeaderStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="cod_rubro" />
                                                    <asp:BoundField DataField="descrubro" HeaderText="Rubro" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="desc_rubro" />
                                                    <asp:BoundField DataField="precioUltCompra" HeaderText="P.Ult.Compra" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="desc_rubro" />


                                                    <%--<asp:BoundField DataField="observaciones" HeaderText="Obs." ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="desc_subrubro"/>--%>
                                                </Columns>
                                            </asp:GridView>
                                            
                                            <asp:GridView ID="gvStockXdeposito" runat="server" DataKeyNames="codRepuesto" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnSelectedIndexChanged="gvPartes_SelectedIndexChanged" OnPreRender="GVPreRender">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Cod" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:HyperLink NavigateUrl='<%# String.Concat("/st/cMvs.aspx?rep=", Eval("codRepuesto"), "&dep=", Eval("idDeposito")) %>' ID="foto" runat="server"><%# Eval("codRepuesto")%></asp:HyperLink>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Descripcion" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" SortExpression="Desc_Repuesto">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label23231" runat="server" Text='<%# Eval("DescRepuesto")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="30px"></HeaderStyle>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="stock" HeaderStyle-Width="30px" HeaderText="Cant." ItemStyle-HorizontalAlign="center" HeaderStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="cod_rubro" />
                                                    <asp:BoundField DataField="descrubro" HeaderText="Rubro" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="desc_rubro" />
                                                    <asp:BoundField DataField="deposito" HeaderText="Deposito" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="desc_rubro" />
                                                    <asp:BoundField DataField="precioUltCompra" HeaderText="P.Ult.Compra" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="desc_rubro" />

                                                    <%-- <asp:TemplateField HeaderText="Foto" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:HyperLink NavigateUrl='<%# String.Concat("/docs/fotosRepuestos/", Eval("foto")) %>' Target="_blank" ID="foto" runat="server"><%# IIf(Eval("foto") <> "", "Ver Foto", "")%></asp:HyperLink>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>

                                                    <%--<asp:BoundField DataField="observaciones" HeaderText="Obs." ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="desc_subrubro"/>--%>
                                                </Columns>
                                            </asp:GridView>


                                        </div>


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
