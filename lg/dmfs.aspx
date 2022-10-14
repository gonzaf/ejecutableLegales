<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.master" CodeBehind="dmfs.aspx.vb" Inherits="Dynamic_Data.dmfs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section id="content">
        <section class="main padder">
            <form id="form1" runat="server">
                <div class="row no-gutter">
                    <asp:HiddenField ID="buscar" runat="server" />
                    <div class="col-sm-12">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Damnificados</span>
                                        <div class="form-inline">
                                            Damnificados&nbsp;&nbsp; 
                                          
                                        </div>
                                    </header>
                                    <section class="panel-body scrollbar scroll-y m-b">

                                        <asp:GridView ID="gvReclamos" runat="server" DataKeyNames="idRegistro" AutoGenerateColumns="False" DataSourceID="dsReclamos" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Siniestro" HeaderStyle-Width="60px">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="verParte" OnCommand="verParte_Command" CommandArgument='<%# Eval("idHeader") %>' runat="server"><%# Eval("siniestroCia") %></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Parte" HeaderStyle-Width="60px">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="verParte2" OnCommand="verParte_Command" CommandArgument='<%# Eval("idHeader") %>' runat="server"><%# Eval("idHeader") %></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Damnificado" HeaderStyle-Width="250px">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="verDamnificado" OnCommand="verDamnificado_Command" CommandArgument='<%# String.Concat(Eval("tipo"), "-", Eval("idRegistro"), "-", Eval("idHeader"))%>' runat="server"><%# Eval("Damnificado") %></asp:LinkButton>
                                                    </ItemTemplate>

                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Fec.Siniestro" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%# Format(Eval("fechaSiniestro"), "dd/MM/yy")%>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="30px"></HeaderStyle>

                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>


                                            </Columns>
                                        </asp:GridView>


                                        <asp:LinqDataSource ID="dsReclamos" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="Damnificado" TableName="vDamnificados" Where="(linea != @l1 and linea != @l2 and linea != @l3 and linea != @l4 and linea != @l5 and linea != @l6 and linea != @l7 and linea != @l8 and linea != @l9 and linea != @l10 and linea != @l11 and linea != @l12)">
                                            <%--     <WhereParameters>
                                                <asp:ControlParameter ControlID="ddTiposNovedades" Name="idUltimaNovedad" PropertyName="SelectedValue" Type="Int32" />
                                            </WhereParameters>--%>
                                                <WhereParameters>
                                              
                                                <asp:Parameter DefaultValue="-1" Name="l1" Type="int32" />
                                                <asp:Parameter DefaultValue="-2" Name="l2" Type="int32" />
                                                <asp:Parameter DefaultValue="-2" Name="l3" Type="int32" />
                                                <asp:Parameter DefaultValue="-2" Name="l4" Type="int32" />
                                                <asp:Parameter DefaultValue="-2" Name="l5" Type="int32" />
                                                <asp:Parameter DefaultValue="-2" Name="l6" Type="int32" />
                                                <asp:Parameter DefaultValue="-2" Name="l7" Type="int32" />
                                                <asp:Parameter DefaultValue="-2" Name="l8" Type="int32" />
                                                <asp:Parameter DefaultValue="-2" Name="l9" Type="int32" />
                                                <asp:Parameter DefaultValue="-2" Name="l10" Type="int32" />
                                                <asp:Parameter DefaultValue="-2" Name="l11" Type="int32" />
                                                <asp:Parameter DefaultValue="-2" Name="l12" Type="int32" />
                                            </WhereParameters>
                                        </asp:LinqDataSource>
                                        <asp:QueryExtender TargetControlID="dsReclamos" runat="server">
                                            <asp:SearchExpression ComparisonType="OrdinalIgnoreCase" DataFields="Damnificado" SearchType="Contains">
                                                <asp:ControlParameter ControlID="buscar" PropertyName="value" Type="String" />
                                            </asp:SearchExpression>
                                        </asp:QueryExtender>
                                    </section>
                                    <%--<input id="autoCompleteProductos" /></div>--%>
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
