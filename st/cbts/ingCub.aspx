<%@ Page Title="" Language="vb" AutoEventWireup="false" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/st/SiteST.master" CodeBehind="ingCub.aspx.vb" Inherits="Dynamic_Data.ingCub" %>

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
                                        <span class="label bg-danger pull-right">Ingreso de Cubiertas</span>
                                        <div class="form-inline">
                                            Ingreso de Cubiertas&nbsp;&nbsp; 
                                            <asp:TextBox ID="desdeFecha" runat="server" ClientIDMode="Static" CssClass="input-sm form-control datepicker" Width="80px"></asp:TextBox>
                                            <asp:Button ID="buttondesdeFecha" OnClick="buttonfecha_Click" display="dynamic" ClientIDMode="Static" runat="server" Text="Button" type="hidden" Style="display: none" />
                                            <asp:TextBox ID="hastaFecha" runat="server" ClientIDMode="Static" CssClass="input-sm form-control datepicker" Width="80px"></asp:TextBox>
                                            <asp:Button ID="buttonhastaFecha" OnClick="buttonfecha_Click" display="dynamic" ClientIDMode="Static" runat="server" Text="Button" type="hidden" Style="display: none" />
                                            &nbsp;&nbsp;
                                            <asp:CheckBox ID="cbMostrarTodo" Visible="false" Enabled="false" AutoPostBack="true" OnCheckedChanged="cbMostrarTodo_CheckedChanged" runat="server" Checked="true" Text="Ver Todos los dias" />
                                            <asp:Label ID="Label2" runat="server" Text="Label">---</asp:Label>
                                            <asp:DropDownList ID="ddDepositos" AppendDataBoundItems="true" runat="server" AutoPostBack="true" CssClass="form-control input-sm entTab" DataTextField="Deposito" DataValueField="idDeposito">
                                            </asp:DropDownList>
                                            <asp:TextBox ID="tbCodigo" CssClass="form-control input-sm clickbutton" data-button="buttonBuscar" Width="70" placeholder="# Rep." runat="server"></asp:TextBox>
                                            <asp:Button ID="buttonBuscar" OnClick="buttonBuscar_Click" ClientIDMode="Static" runat="server" Style="display: none" Text="" Display="Dynamic" />

                                        </div>
                                    </header>
                                    <section style="//height: 200px" class="panel-body scrollbar scroll-y m-b">
                                        <div class="panel">

                                            <asp:Label Text="" ID="lError" runat="server" ForeColor="Red"></asp:Label>

                                            <asp:GridView ID="gvPartes" HeaderStyle-HorizontalAlign="Center" runat="server" DataKeyNames="idMov" AutoGenerateColumns="False" DataSourceID="dsPartes" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnSelectedIndexChanged="gvPartes_SelectedIndexChanged" OnPreRender="GVPreRender">
                                                <Columns>

                                                    <%--<asp:BoundField DataField="id" HeaderText="Id.Ingreso"></asp:BoundField>--%>
                                                    <asp:TemplateField HeaderText="Fecha" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Format(Eval("fecha"), "dd/MM/yy")%>'></asp:Label>
                                                            <asp:HiddenField ID="hfCant" ClientIDMode="Static" runat="server" Value='<%# Eval("cant")%>' />
                                                            <asp:HiddenField ID="hfidDetalle" ClientIDMode="Static" runat="server" Value='<%# Eval("idMov")%>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:BoundField DataField="codRepuesto" HeaderText="Cod.Repuesto"></asp:BoundField>
                                                    <asp:BoundField DataField="Desc_Repuesto" HeaderText="Repuesto"></asp:BoundField>
                                                    <asp:BoundField DataField="cant" HeaderText="Cant."></asp:BoundField>

                                                    <asp:TemplateField HeaderText="Cant.Pendiente" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lbIngresar" ToolTip="Ingresar Partidas" OnCommand="lbIngresar_Command" CommandArgument='<%#Eval("id") %>' runat="server">Ingresar <%# Eval("cantPendiente") %></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:BoundField DataField="depositoIn" HeaderText="Deposito Dest."></asp:BoundField>
                                                    <asp:BoundField DataField="ref" HeaderText="Referencia"></asp:BoundField>

                                                </Columns>
                                            </asp:GridView>



                                            <asp:LinqDataSource ID="LinqDataSource4" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="Motivo" TableName="stMotivos">
                                            </asp:LinqDataSource>

                                            <asp:LinqDataSource ID="dsPartes" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="Fecha" TableName="vStPartidasPendientes" Where='partida == "Si" and (@okFecha == -1 or (fecha >= @fechaDesde and fecha <= @fechaHasta)) and ((idDepositoIn == @ddDepositos)) and (codRepuesto = @tbCodigo or @tbCodigo = "-1") and cantPendiente > 0'>
                                                <WhereParameters>
                                                    <asp:Parameter DefaultValue="20-06-2016" Name="fechaDesde" Type="DateTime" />
                                                    <asp:Parameter DefaultValue="20-06-2016" Name="fechaHasta" Type="DateTime" />
                                                    <asp:Parameter DefaultValue="1" Name="okFecha" Type="Int32" />
                                                    <asp:ControlParameter ControlID="ddDepositos" DefaultValue="-1" Name="ddDepositos" Type="Int32" PropertyName="Text" />
                                                    <asp:ControlParameter ControlID="tbCodigo" DefaultValue="-1" Name="tbCodigo" Type="String" PropertyName="Text" />
                                                </WhereParameters>
                                            </asp:LinqDataSource>


                                            <div class="form-group text-center">
                                                <div class="col-lg-12">
                                                    <asp:Button ID="cancelar" runat="server" Enabled="true" Text="Volver" Visible="true" CssClass="btn btn-white btn-xs" />
                                                </div>
                                            </div>

                                        </div>

                                    </section>

                                </section>
                            </div>

                        </section>
                    </div>






                    <div runat="server" id="panel2" visible="false" class="col-sm-5">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Ingreso de Cubiertas</span>
                                    </header>
                                    <section style="//height: 200px">
                                        <div class="panel-body" style="padding: 10px 30px 10px 30px">


                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-sm-9">
                                                        <label for="ddDeposito">Deposito</label><asp:TextBox ID="tbDeposito" Enabled="false" runat="server" ClientIDMode="Static" CssClass="input-sm form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <label for="ddDeposito">Fecha</label><asp:TextBox ID="tbFecha" runat="server" Enabled="false" ClientIDMode="Static" CssClass="input-sm form-control"></asp:TextBox>
                                                    </div>

                                                </div>

                                            </div>

                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-sm-3">
                                                        <label for="tbRepuesto">Codigo</label><asp:TextBox ID="tbCodigoRepuesto" runat="server" Enabled="false" ClientIDMode="Static" CssClass="input-sm form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="col-sm-9">
                                                        <label for="tbRepuesto">Repuesto</label><asp:TextBox ID="tbRepuesto" runat="server" Enabled="false" ClientIDMode="Static" CssClass="input-sm form-control"></asp:TextBox>
                                                    </div>

                                                </div>

                                            </div>


                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-sm-11">
                                                        <label for="ddCliente">Marca - Rodado - Modelo</label><asp:DropDownList ID="ddTipoCubierta" CssClass="form-control input-sm entTab" data-next="efectivo" ClientIDMode="Static" runat="server" DataTextField="Text" DataValueField="id"></asp:DropDownList>
                                                    </div>
                                                    <div class="col-sm-1">
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-sm-11">
                                                        <label for="ddCliente">Estado</label><asp:DropDownList ID="ddEstado" CssClass="form-control input-sm entTab" data-next="efectivo" ClientIDMode="Static" runat="server" DataTextField="Text" DataValueField="id"></asp:DropDownList>
                                                    </div>
                                                    <div class="col-sm-1">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-sm-10">
                                                        <label for="descripcion">Cant.Pendiente</label>
                                                        <asp:TextBox ID="tbCantPendiente" ClientIDMode="Static" runat="server" CssClass="form-control input-sm" Enabled="false"></asp:TextBox>
                                                    </div>
                                                    <div class="col-sm-2">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-sm-3">
                                                        <label for="tbCodigo">Cant.Ingresar</label>
                                                        <asp:TextBox ID="tbCantidad" ClientIDMode="Static" data-button="Button1" runat="server" CssClass="form-control input-sm clickButton"></asp:TextBox>

                                                    </div>
                                                    <div class="col-sm-4">
                                                        <label for="tbCodigo">Nro.Partida Inicial</label>
                                                        <asp:TextBox ID="tbNroPartidaInicial" ClientIDMode="Static" data-button="Button1" runat="server" CssClass="form-control input-sm clickButton"></asp:TextBox>
                                                    </div>
                                                
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-sm-4">
                                                        <label for="tbCodigo">Kms.Iniciales</label>
                                                        <asp:TextBox ID="tbKms" ClientIDMode="Static" data-button="Button1" runat="server" CssClass="form-control input-sm clickButton"></asp:TextBox>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <label for="buttonPrecio">-</label>
                                                        <asp:Button ID="Button1" OnClick="buttonPrecio_Click" ClientIDMode="Static" OnClientClick="return finalizar();" CssClass=" btn form-control btn-primary btn-xs" runat="server" Text="Agregar" />
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-sm-12">
                                                        <label for="tbCodigo">-</label>
                                                        <asp:Label ID="lbErrores" runat="server" Visible="false" ForeColor="Red" Text="Label"></asp:Label>
                                                    </div>

                                                </div>
                                            </div>


                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-sm-12 text-right m-t-large">
                                                        <%--<asp:Button ID="terminar" runat="server" Text="Cerrar Orden" OnClientClick="return finalizar();" Visible="false" CssClass="btn btn-primary btn-xs" />
                                                    <asp:Button ID="guardar" runat="server" Text="Continuar luego" Width="120px" CssClass="btn btn-white btn-xs" />
                                                    <asp:Button ID="eliminar" runat="server" Enabled="True" Text="Eliminar" Visible="false" OnClientClick="return eliminar();" CssClass="btn btn-white btn-xs" />
                                                    <asp:Button ID="desvincular" runat="server" Enabled="true" Text="Desvincular" Visible="false" CssClass="btn btn-white btn-xs" />
                                                    <asp:Button ID="reimprimir" runat="server" Enabled="true" Text="Reimprimir" Visible="false" CssClass="btn btn-white btn-xs" />
                                                    
                                                    <asp:Button ID="Enviar" runat="server" Enabled="true" Text="Enviar" Visible="true" CssClass="btn btn-primary btn-xs" />--%>
                                                        <asp:Button ID="cancelarFormulario" OnClick="cancelarFormulario_Click" runat="server" Enabled="true" Text="Volver" Visible="true" CssClass="btn btn-white btn-xs" />
                                                    </div>
                                                </div>
                                            </div>






                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-sm-12 text-right m-t-large">
                                                    </div>
                                                </div>
                                            </div>






                                        </div>

                                    </section>

                                </section>
                            </div>

                        </section>
                    </div>



                    <div runat="server" id="panel3" visible="false" class="col-sm-7">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Ingreso de Cubiertas</span>
                                    </header>
                                    <section style="//height: 200px">
                                        <div class="panel-body" style="padding: 10px 30px 10px 30px">

                                            <asp:GridView ID="GridView1" runat="server" ShowFooter="true" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="gridDataSource" OnRowDeleting="GridView1_RowDeleting" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender">
                                                <Columns>
                                                   <%-- <asp:TemplateField HeaderText="Id.Ingreso" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                                        <FooterTemplate>
                                                            
                                                        </FooterTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Eval("idIngreso")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="Nro.Partida" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-left">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Eval("nroPartida")%>'></asp:Label>
                                                        </ItemTemplate>

                                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <asp:BoundField DataField="stTiposCubiertas.completo" HeaderText="Tipo"></asp:BoundField>
                                                    <asp:BoundField DataField="stEstado.estado" HeaderText="Estado"></asp:BoundField>
                                                    <asp:BoundField DataField="kmsIniciales" HeaderText="Kms.Iniciales"></asp:BoundField>

                                                    <asp:CommandField ShowDeleteButton="True" DeleteText="Borrar" ItemStyle-HorizontalAlign="Center" />



                                                </Columns>

                                                <RowStyle CssClass="td"></RowStyle>
                                            </asp:GridView>


                                            <asp:LinqDataSource ID="gridDataSource" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="stPartidas" EnableDelete="True" EnableUpdate="True" Where="idIngreso == @idIngreso">
                                                <WhereParameters>
                                                    <asp:Parameter DefaultValue="-1" Name="idIngreso" Type="Int32" />
                                                </WhereParameters>

                                            </asp:LinqDataSource>

                                        </div>
                                    </section>
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
