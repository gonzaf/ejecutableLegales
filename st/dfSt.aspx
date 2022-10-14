<%@ Page Title="" Language="vb" AutoEventWireup="false" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/st/SiteST.master" CodeBehind="dfSt.aspx.vb" Inherits="Dynamic_Data.dfst" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <section id="content">
        <section class="main padder">
            <form id="form1" onsubmit="ShowLoading()" runat="server">
                <div class="row no-gutter">

                    <div class="col-sm-12">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Ordenes de Reparacion</span>
                                        <div class="form-inline">
                                            Ordenes de Reparaciones
                                            <asp:TextBox ID="tbInterno" CssClass="form-control input-sm clickbutton" data-button="buttonBuscar" Width="50" placeholder="# Int." runat="server"></asp:TextBox>
                                            <asp:TextBox ID="tbOR" CssClass="form-control input-sm clickbutton" Width="50" data-button="buttonBuscar" placeholder="# OR." runat="server"></asp:TextBox>
                                            <asp:Button ID="buttonBuscar" OnClick="buttonBuscar_Click" ClientIDMode="Static" runat="server" Style="display: none" Text="" Display="Dynamic" />
                                        </div>
                                    </header>

                                   

                                    <section style="//height: 200px" class="panel-body scrollbar scroll-y m-b">
                                        <div class="panel">
                                            <asp:GridView ID="gvPartes" runat="server" DataKeyNames="nroOrden" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnSelectedIndexChanged="gvPartes_SelectedIndexChanged" OnPreRender="GVPreRender">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Nr.Or" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="hlMasInfoo" OnCommand="hlMasInfo_Command" CommandArgument='<%#String.Concat(Eval("nroOrden"), "/", Eval("idEmpresa")) %>' runat="server"><%# Eval("nroOrden") %></asp:LinkButton>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="30px"></HeaderStyle>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Fec.Inicio OR" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Format(Eval("fechaInicio"), "dd/MM/yy")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="30px"></HeaderStyle>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Fec.Cierre OR" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label23231" runat="server" Text='<%# Format(Eval("fechaCierre"), "dd/MM/yy")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="30px"></HeaderStyle>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="idCoche" HeaderText="Interno" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="Interno">
                                                        <HeaderStyle Width="30px"></HeaderStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="idTaller" HeaderText="Prioridad" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="100px" ReadOnly="True" SortExpression="Patente"></asp:BoundField>
                                                    <asp:BoundField DataField="idLegajo" HeaderText="Legajo" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="Legajo">
                                                        <HeaderStyle Width="30px"></HeaderStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="mecanico" HeaderText="Mecanico" HeaderStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="Apellido" />
                                                    <asp:TemplateField HeaderText="Fec.Confeccion Orden Entrega" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label111" runat="server" Text='<%# Format(Eval("fechaConfeccion"), "dd/MM/yy")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="30px"></HeaderStyle>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="deposito" HeaderText="Deposito" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="Deposito">
                                                        <HeaderStyle Width="30px"></HeaderStyle>
                                                    </asp:BoundField>
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
