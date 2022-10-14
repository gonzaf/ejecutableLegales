<%@ Page Title="" Language="vb" AutoEventWireup="false" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/st/SiteST.master" CodeBehind="prev.aspx.vb" Inherits="Dynamic_Data.prev" %>

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
                                        <span class="label bg-danger pull-right">Preventivo</span>
                                        <div class="form-inline">
                                            Proceso de Ordenes&nbsp;&nbsp;
                                            <br />
                                            <br />

                                            <asp:DropDownList ID="ddDepositos" DataTextField="Deposito" AutoPostBack="true" DataValueField="idDeposito" runat="server" OnSelectedIndexChanged="ddDepositos_SelectedIndexChanged" CssClass="form-control col-6 input-sm entTab">
                                                <%--<asp:ListItem Text="Todos los Depositos" Value="-2" Selected="True"></asp:ListItem>--%>
                                            </asp:DropDownList>

                                            <asp:DropDownList ID="ddTareas" AppendDataBoundItems="true" DataSourceID="LinqDataSource4" DataTextField="tipoTarea" DataValueField="id" OnSelectedIndexChanged="ddDepositos_SelectedIndexChanged" runat="server" AutoPostBack="true" CssClass="form-control col-6 input-sm entTab">
                                                <asp:ListItem Text="Todas las Tareas" Value="-2" Selected="True"></asp:ListItem>
                                            </asp:DropDownList>

                                            <asp:LinqDataSource ID="LinqDataSource4" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="tipoTarea" TableName="prTipoTarea">
                                            </asp:LinqDataSource>

                                            <asp:DropDownList ID="ddTipoMant" AppendDataBoundItems="true" DataSourceID="LinqDataSource1" DataTextField="tipo" DataValueField="id" OnSelectedIndexChanged="ddDepositos_SelectedIndexChanged" runat="server" AutoPostBack="true" CssClass="form-control col-6 input-sm entTab">
                                                <asp:ListItem Text="Todos los Tipos" Value="-2" Selected="True"></asp:ListItem>
                                            </asp:DropDownList>

                                            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="tipo" TableName="prTipoMant">
                                            </asp:LinqDataSource>

                                            <asp:TextBox ID="tbNroCoche" autocomplete="off" CssClass="form-control input-sm clickbutton" data-button="buttonBuscar" Width="70" placeholder="# Coche" runat="server"></asp:TextBox>
                                            <asp:Button ID="buttonBuscar" OnClick="buttonBuscar_Click" ClientIDMode="Static" runat="server" Style="display: none" Text="" Display="Dynamic" />

                                            <label style="color: white">------------</label>



                                            <%--  <asp:CheckBox ID="verAlertas" AutoPostBack="true" runat="server" Checked="true" Text="Alertas" />
                                            <asp:CheckBox ID="verPreventivo" AutoPostBack="true" runat="server" Checked="true" Text="Preventivo" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                                        </div>
                                    </header>
                                    <section style="//height: 200px" class="panel-body scrollbar scroll-y m-b">
                                        <div class="panel">
                                            <label>Preventivo</label>
                                            <label style="color: white">--</label>
                                            <a id="marcarTodos" href="javascript: hola()" class="btn btn-primary btn-xs">Marcar Todos</a>
                                            <asp:GridView ID="gvPartes" runat="server" DataKeyNames="id" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnSelectedIndexChanged="gvPartes_SelectedIndexChanged" OnPreRender="GVPreRender">
                                                <Columns>

                                                    <asp:BoundField DataField="idCoche" HeaderText="Coche" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="tipoTarea" HeaderText="Tarea" ItemStyle-HorizontalAlign="left" SortExpression="Linea"></asp:BoundField>


                                                    <asp:TemplateField HeaderText="Fecha" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Format(Eval("fecha"), "dd/MM/yy")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:BoundField DataField="kmsCoche" HeaderText="Kms." ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" SortExpression="Linea"></asp:BoundField>

                                                    <asp:BoundField DataField="tipo" HeaderText="Tipo" ItemStyle-HorizontalAlign="left" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="kmsActuales" HeaderText="Kms.Actuales" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="Dias" HeaderText="Dias" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="Kms" HeaderText="Kms" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" SortExpression="Linea"></asp:BoundField>
                                                    
                                                    <asp:TemplateField HeaderText="Exc.Dias" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <%--<div class="pull-right hidden-sm text-right m-t">--%>
                                                            <asp:Label ID="Label11ss" runat="server" Text='<%#IIf(Eval("ExcesoDias") > 0, Eval("ExcesoDias"), "")%>'></asp:Label>
                                                            <%--</div>--%>
                                                        </ItemTemplate>

                                                        <HeaderStyle Width="30px"></HeaderStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Exc.Kms" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <%--<div class="pull-right hidden-sm text-right m-t">--%>
                                                            <asp:Label ID="Label1aa11" runat="server" Text='<%#IIf(Eval("ExcesoKms") > 0, Eval("ExcesoKms"), "")%>'></asp:Label>
                                                            <%--</div>--%>
                                                        </ItemTemplate>

                                                        <HeaderStyle Width="30px"></HeaderStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Generar" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="text-center">
                                                        <ItemTemplate>
                                                            <asp:HiddenField ID="hf" Value='<%# String.Concat(Eval("idCoche"), "-", Eval("idTipoTarea"), "-", Eval("idDeposito"))%>' runat="server" />
                                                            <asp:CheckBox ID="cbGuardar" ClientIDMode="Static" CssClass="myClass" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                </Columns>
                                            </asp:GridView>

                                        </div>

                                        <div class="panel">
                                            <label>Alertas</label>
                                            <label style="color: white">------</label>
                                            <a id="marcarTodosA" href="javascript: hola2()" class="btn btn-primary btn-xs">Marcar Todos</a>
                                            <asp:GridView ID="GridView3" runat="server" DataKeyNames="id" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnSelectedIndexChanged="gvPartes_SelectedIndexChanged" OnPreRender="GVPreRender">
                                                <Columns>

                                                    <asp:BoundField DataField="idCoche" HeaderText="Coche" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="tipoAlerta" HeaderText="Tarea" ItemStyle-HorizontalAlign="left" SortExpression="Linea"></asp:BoundField>

                                                    <asp:BoundField DataField="nroPartida" HeaderText="#Partida." ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" SortExpression="Linea"></asp:BoundField>

                                                    <asp:BoundField DataField="tipo" HeaderText="Tipo" ItemStyle-HorizontalAlign="left" SortExpression="Linea"></asp:BoundField>

                                                    <asp:BoundField DataField="kmsActuales" HeaderText="Kms.Actuales" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" SortExpression="Linea"></asp:BoundField>


                                                     <asp:TemplateField HeaderText="Kms Alerta" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <%--<div class="pull-right hidden-sm text-right m-t">--%>
                                                            <asp:Label ID="Labelssww111" runat="server" Text='<%#IIf(Eval("kmsAlerta") > 0, Eval("kmsAlerta"), "")%>'></asp:Label>
                                                            <%--</div>--%>
                                                        </ItemTemplate>

                                                        <HeaderStyle Width="30px"></HeaderStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Exc.Kms" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <%--<div class="pull-right hidden-sm text-right m-t">--%>
                                                            <asp:Label ID="Labelss111" runat="server" Text='<%#IIf(Eval("kmsAlerta") > 0, Eval("kmsActuales") - Eval("kmsAlerta"), "")  %>'></asp:Label>
                                                            <%--</div>--%>
                                                        </ItemTemplate>

                                                        <HeaderStyle Width="30px"></HeaderStyle>
                                                    </asp:TemplateField>

                                                    <%-- <asp:TemplateField HeaderText="Descartar" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="text-center">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID='cbGuardarDesc1' ClientIDMode="Static" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>


                                                    <asp:TemplateField HeaderText="Seleccionar" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="text-center">
                                                        <ItemTemplate>
                                                            <asp:HiddenField ID="hf" Value='<%# String.Concat(Eval("idCoche"), "-", Eval("idTipoAlerta"), "-", Eval("idDeposito"), "-" & Eval("idPartida"), "-" & Eval("id"))%>' runat="server" />
                                                            <%--<asp:CheckBox ID='cbGuardar1' ClientIDMode="Static" CssClass="myClass2" runat="server" />--%>
                                                            <asp:RadioButton ID="cbGuardarAlerta" runat="server" CssClass="myClass2" Text="Generar" GroupName="SelectGroup" />
                                                            <asp:RadioButton ID="cbGuardarDesc" runat="server" Text="Descartar" GroupName="SelectGroup" />
                                                            <%--<asp:RadioButton ID="cbPosponer" runat="server"  Text="Posponer" GroupName="SelectGroup" />--%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                </Columns>
                                            </asp:GridView>

                                        </div>

                                    </section>
                                    <%--</div>--%>
                                    <div class="form-group text-center">
                                        <div class="col-lg-12">
                                            <asp:Button ID="terminar" runat="server" Text="Guardar" OnClientClick="this.style.visibility = 'hidden'" OnClick="terminar_Click" Visible="true" CssClass="btn btn-primary btn-xs" />

                                            <asp:Button ID="Button4" runat="server" Enabled="true" Text="Cancelar" Visible="true" CssClass="btn btn-white btn-xs" />
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

        $('.myClass > input').addClass("myClass");
        $('.myClass2 > input').addClass("myClass2");

        c = false
        c = !c;
        function hola() {
            $(".myClass").each(function () {
                $(this).prop('checked', c);
            });
            c = !c;

        }

        c2 = false
        c2 = !c2;
        function hola2() {
            $(".myClass2").each(function () {
                $(this).prop('checked', c2);
            });
            c2 = !c2;

        }

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
