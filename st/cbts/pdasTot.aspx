<%@ Page Title="" Language="vb" AutoEventWireup="false" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/st/SiteST.master" CodeBehind="pdasTot.aspx.vb" Inherits="Dynamic_Data.pdasTot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <section id="content">
        <section class="main padder">
            <form id="form1" runat="server">
                <div class="row no-gutter">

                    <div runat="server" id="panel1" class="col-sm-12">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Partidas</span>
                                        <div class="form-inline">
                                            Cubiertas&nbsp;&nbsp; 
                                            <asp:TextBox ID="tbNroCoche" autocomplete="off" CssClass="form-control input-sm clickbutton" data-button="buttonBuscar" Width="70" placeholder="# Coche" runat="server"></asp:TextBox>
                                            <%--<asp:TextBox ID="tbDescripcion" autocomplete="off" CssClass="form-control input-sm clickbutton" Width="100" data-button="buttonBuscar" placeholder="Desc.Repuesto" runat="server"></asp:TextBox>--%>
                                            <asp:DropDownList ID="ddEstados" AppendDataBoundItems="true" OnSelectedIndexChanged="ddRubro_SelectedIndexChanged" runat="server" AutoPostBack="true" CssClass="form-control input-sm entTab" DataTextField="estado" DataValueField="id">
                                                <asp:ListItem Text="Todos los Estados" Selected="True" Value="-1"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddDepositos" AppendDataBoundItems="true" OnSelectedIndexChanged="ddDepositos_SelectedIndexChanged" runat="server" AutoPostBack="true" CssClass="form-control input-sm entTab" DataTextField="Deposito" DataValueField="idDeposito">
                                                <asp:ListItem Text="Todos los Depositos" Value="-1"></asp:ListItem>
                                            </asp:DropDownList>


                                              <br /><br />
                                            Cantidad de Cubiertas: <asp:Label ID="lCant" runat="server" Text="dskjakjds"></asp:Label>
                                                <br />


                                            <asp:Button ID="buttonBuscar" OnClick="buttonBuscar_Click" ClientIDMode="Static" runat="server" Style="display: none" Text="" Display="Dynamic" />
                                        </div>
                                    </header>
                                    <section style="//height: 200px" class="panel-body scrollbar scroll-y m-b">
                                        <div class="panel">

                                            <asp:Label Text="" ID="lError" runat="server" ForeColor="Red"></asp:Label>

                                            <asp:GridView ID="gvPartes" HeaderStyle-HorizontalAlign="Center" runat="server" DataKeyNames="id" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnSelectedIndexChanged="gvPartes_SelectedIndexChanged" OnPreRender="GVPreRender">
                                                <Columns>

                                                    <asp:BoundField DataField="nroPartida" HeaderText="#Partida"></asp:BoundField>

                                                    <%--<asp:BoundField DataField="kmsIniciales" HeaderText="Kms"></asp:BoundField>--%>
                                                    <asp:BoundField DataField="tipo" HeaderText="Tipo"></asp:BoundField>
                                                    <asp:BoundField DataField="estado" HeaderText="Estado"></asp:BoundField>

                                                    <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text='<%#If(Eval("where") = "d", "Deposito", If(Eval("where") = "c", "Coche", "")) %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <%--<asp:BoundField DataField="idWhere" HeaderText=""></asp:BoundField>--%>

                                                    <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label211" runat="server" Text='<%#If(Eval("where") = "d", Eval("deposito"), Eval("idWhere")) %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField HeaderText="Kms.Actuales" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Label ID="dsdsd" runat="server" Text='<%# Eval("kmsActuales") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    


                                                    <asp:TemplateField HeaderText="Mas Info." ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lbIngresar" ToolTip="Ingresar" OnCommand="lbIngresar_Command" CommandArgument='<%#Eval("id")%>' runat="server">Mas Info.</asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>
                                            </asp:GridView>


                                            <%--  <asp:LinqDataSource ID="dsPartes" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="nroPartida" TableName="vStPartidas" Where="where == 'c' or where == 'd'">
                                                <WhereParameters>
                                                    <asp:ControlParameter ControlID="ddRubro" Name="Estado" PropertyName="SelectedValue" Type="Int32" />
                                                    <asp:ControlParameter ControlID="ddDepositos" Name="Deposito" PropertyName="SelectedValue" Type="Int32" />

                                                </WhereParameters>
                                            </asp:LinqDataSource>--%>


                                            <div class="form-group text-center">
                                                <div class="col-lg-12">
                                                </div>
                                            </div>

                                        </div>

                                    </section>

                                </section>
                            </div>

                        </section>
                    </div>
            </form>
        </section>
    </section>












    <script>

        var objDiv = document.getElementById("divCaja");
        //objDiv.scrollTop = objDiv.scrollHeight;

        function set(textbox, cant, cb) {
            if (document.getElementById(cb).checked) {
                document.getElementById(textbox).value = cant;
            } else {
                document.getElementById(textbox).value = '';
            }

        }


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
