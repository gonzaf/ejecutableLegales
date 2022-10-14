<%@ Page Title="" Language="vb" AutoEventWireup="false" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/st/SiteST.master" CodeBehind="rvs.aspx.vb" Inherits="Dynamic_Data.rvs" %>

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
                                        <span class="label bg-danger pull-right">Revision</span>
                                        <div class="form-inline">
                                            Revision&nbsp;&nbsp; 
                                            <asp:Label ID="Label2" runat="server" Text="Label">---</asp:Label>

                                            <asp:TextBox ID="desdeFecha" runat="server" autocomplete="off" ClientIDMode="Static" CssClass="input-sm form-control datepicker" Width="80px"></asp:TextBox>
                                            <asp:Button ID="buttondesdeFecha" display="dynamic" ClientIDMode="Static" runat="server" Text="Button" type="hidden" Style="display: none" />

                                            <asp:TextBox Visible="true" ID="tbMecanico" ClientIDMode="Static" CssClass="form-control input-sm" Width="100" placeholder="# Mecanico" runat="server"></asp:TextBox>
                                            <asp:DropDownList ID="ddMecanicos" ClientIDMode="Static" AppendDataBoundItems="true" runat="server" CssClass="form-control input-sm entTab" DataTextField="Apellido" DataValueField="idLegajo">
                                                <asp:ListItem Text="Mecanico" Value="-1" Selected="True"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddCabeceras" AppendDataBoundItems="true" runat="server" AutoPostBack="true" CssClass="form-control input-sm entTab" DataTextField="Nombre" DataValueField="idCabecera">
                                            </asp:DropDownList>


                                            <asp:TextBox ID="tbPlanilla" CssClass="form-control input-sm" Width="100" placeholder="# Planilla" runat="server"></asp:TextBox>
                                           <%-- <asp:DropDownList ID="ddPrioridad" AppendDataBoundItems="true" runat="server" AutoPostBack="true" CssClass="form-control input-sm entTab">
                                                <asp:ListItem Text="Prioridad" Value="-1" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="Prioridad Baja" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Prioridad Media" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Prioridad Alta" Value="1"></asp:ListItem>
                                            </asp:DropDownList>--%>

                                            <asp:Button ID="bMarcarTodos" OnClick="bMarcarTodos_Click" runat="server" Text="Marcar Todos" Visible="true" CssClass="btn btn-primary btn-xs" />

                                        </div>
                                    </header>
                                    <section style="//height: 200px" class="panel-body scrollbar scroll-y m-b">
                                        <div class="panel">

                                            <asp:Label ID="lError" Visible="false" ForeColor="Red" runat="server" Text="Debe seleccionar la Prioridad"></asp:Label>

                                            <asp:GridView ID="gvPartes" runat="server" AutoGenerateColumns="False" DataSourceID="dsPartes" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnSelectedIndexChanged="gvPartes_SelectedIndexChanged" OnPreRender="GVPreRender">
                                                <Columns>
                                                    <asp:BoundField DataField="nroCoche" HeaderText="Coche" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="tarea" HeaderText="Tarea" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="Fec.Ult.Serv" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>

                                                            <asp:Label ID="Label2" runat="server" Text='<%# Format(Eval("fechaUltServ"), "dd/MM/yy")%>'></asp:Label>
                                                            <asp:HiddenField ID="hfIdCoche" ClientIDMode="Static" runat="server" Value='<%# Eval("idCoche")%>' />
                                                            <asp:HiddenField ID="hfIdEmpresa" ClientIDMode="Static" runat="server" Value='<%# Eval("idEmpresa")%>' />
                                                            <asp:HiddenField ID="hfIdLinea" ClientIDMode="Static" runat="server" Value='<%# Eval("idLinea")%>' />
                                                            <asp:HiddenField ID="hfKms" ClientIDMode="Static" runat="server" Value='<%# Eval("kmsActuales")%>' />
                                                            <asp:HiddenField ID="hfIdCabecera" ClientIDMode="Static" runat="server" Value='<%# Eval("idCabecera")%>' />
                                                            <asp:HiddenField ID="hfIdTarea" ClientIDMode="Static" runat="server" Value='<%# Eval("idTarea")%>' />
                                                            <asp:HiddenField ID="hfkmsPasados" ClientIDMode="Static" runat="server" Value='<%# Eval("kmsPasados")%>' />
                                                            <asp:HiddenField ID="hfFueraTolerancia" ClientIDMode="Static" runat="server" Value='<%# Eval("fueraTolerancia")%>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="kmsUltServ" HeaderText="Kms.Ult.Serv." ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="kmsActuales" HeaderText="Kms.Actuales" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="Tope" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelss2" runat="server" Text='<%#IIf(Eval("controlDias") = 1, "Dias", "Kms")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="frecuencia" HeaderText="Frecuencia" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="guardar" Text="" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField Visible="false" HeaderText="Accion" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="ddPrioridad" AppendDataBoundItems="false" CssClass="form-control input-sm entTab" data-next="ddMecanico" ClientIDMode="Static" runat="server">
                                                                <asp:ListItem Text="Prioridad" Value="-1" Selected="True"></asp:ListItem>
                                                                <asp:ListItem Text="Prioridad Baja" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="Prioridad Media" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="Prioridad Alta" Value="1"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>

                                        </div>



                                        <asp:LinqDataSource ID="LinqDataSource4" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="proveedor" TableName="vStProveedor">
                                        </asp:LinqDataSource>

                                        <asp:LinqDataSource ID="dsPartes" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="nroCoche" TableName="vMpreventivo" Where='(idLinea = @idLinea or @idLinea = -2) and idTarea = @idTarea and origen = "Revision" and idCabecera = @idCabecera'>
                                            <WhereParameters>
                                                <asp:Parameter DefaultValue="1" Name="idTarea" Type="Int32" />
                                                <asp:Parameter DefaultValue="1" Name="idCabecera" Type="Int32" />
                                                <asp:Parameter DefaultValue="1" Name="idLinea" Type="Int32" />
                                            </WhereParameters>
                                        </asp:LinqDataSource>

                                    </section>
                                    <%--</div>--%>
                                    <div class="form-group text-center">
                                        <div class="col-lg-12">

                                            <asp:Button ID="imprimir" runat="server" Text="Imprimir" OnClientClick="return finalizar();" Visible="true" CssClass="btn btn-white btn-xs" />

                                            <asp:Button ID="terminar" runat="server" Text="Guardar" OnClientClick="return finalizar();" Visible="true" CssClass="btn btn-primary btn-xs" />

                                            <asp:Button ID="cancelar" runat="server" OnClick="cancelar_Click" Enabled="true" Text="Cancelar" Visible="true" CssClass="btn btn-white btn-xs" />
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

        $("#tbMecanico").keyup(function (event) {
            if (parseInt($("#tbMecanico").val()) > 0) {
                //event.preventDefault();
                //var boton = $(this).data("button");
                //$("#" + boton).click();
                $("#ddMecanicos").val($("#tbMecanico").val());
            } else {
                $("#ddMecanicos").val(-1);
                //alert($("#tbMecanico").val());
            }
        });

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
