<%@ Page Title="" Language="vb" AutoEventWireup="true" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/st/SiteST.master" CodeBehind="nc.aspx.vb" Inherits="Dynamic_Data.nc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <section id="content">
        <section class="main padder">
            <form id="form1" runat="server" onsubmit="ShowLoading()">
                <div class="row no-gutter">

                    <div class="col-sm-12">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Repuestos</span>
                                        <div class="form-inline">
                                            Necesidad de Compra&nbsp;&nbsp; 
                                            <asp:TextBox ID="tbRepuesto" CssClass="form-control input-sm" Width="100" placeholder="# Articulo" runat="server"></asp:TextBox>
                                            <asp:TextBox ID="tbDescripcion" CssClass="form-control input-sm " Width="150" placeholder="Articulo" runat="server"></asp:TextBox>

                                            <%--                                            <asp:CheckBox ID="cbMostrarTodo" AutoPostBack="true" runat="server" Checked="true" Text="_Ver Todos los dias" />--%>
                                            <asp:Label ID="Label2" runat="server" Text="Label">---</asp:Label>
                                            <asp:DropDownList ID="ddDepositos" AppendDataBoundItems="true" runat="server" CssClass="form-control input-sm entTab" DataTextField="Deposito" DataValueField="idDeposito">
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddRubro" AppendDataBoundItems="true" DataSourceID="LinqDataSource1" OnSelectedIndexChanged="ddRubro_SelectedIndexChanged" DataTextField="rubro" DataValueField="idRubro" runat="server" CssClass="form-control col-6 input-sm entTab">
                                                <asp:ListItem Text="Todos los Rubros" Value="-2" Selected="True"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="rubro" TableName="vStRubrosN">
                                            </asp:LinqDataSource>

                                            <asp:DropDownList ID="ddsubrubro" AppendDataBoundItems="true" DataSourceID="LinqDataSource2" DataTextField="subrubro" DataValueField="idsubRubro" runat="server" CssClass="form-control col-6 input-sm entTab">
                                                <asp:ListItem Text="Todos los SubRubros" Value="-2" Selected="True"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="subrubro" TableName="vStSubRubrosN" Where='(@ddr == idRubro or @ddr == -2)'>
                                                <WhereParameters>
                                                    <asp:ControlParameter ControlID="ddrubro" DefaultValue="-1" Name="ddr" Type="Int16" PropertyName="SelectedValue" />
                                                    <%--<asp:ControlParameter ControlID="ddsubrubro" DefaultValue="-1" Name="dds" Type="String" PropertyName="SelectedValue" />--%>
                                                </WhereParameters>
                                            </asp:LinqDataSource>


                                            <asp:DropDownList ID="ddCaracteristica" AppendDataBoundItems="true" runat="server" CssClass="form-control input-sm entTab">
                                                <asp:ListItem Text="Todos" Value="-2"></asp:ListItem>
                                                <asp:ListItem Text="Debajo del Punto" Value="1" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="Cero" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="Menor a 0" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:Button ID="buttonBuscar" OnClientClick="return verificarCoche()" OnClick="buttonBuscar_Click" ClientIDMode="Static" runat="server" Text="Buscar" Display="Dynamic" />

                                            <%--<asp:Button ID="Button1" runat="server" Text="Marcar Todos" OnClick="Button1_Click" Visible="true" CssClass="btn btn-primary btn-xs" />--%>
                                            <%--<asp:CheckBox ID="CheckBox1" OnCheckedChanged="CheckBox1_CheckedChanged" runat="server" />--%>
                                            <%--<a ID="marcarTodos" href="javascript: hola()" Class="btn btn-primary btn-xs">Marcar Todos</a>--%>
                                        </div>
                                    </header>




                                    <%--<section style="//height: 200px" class="panel-body scrollbar scroll-y m-b">--%>

                                    <div class="panel">
                                        <span class="pull-right">
                                            <asp:Button ID="bMarcarTodos" OnClick="bMarcarTodos_Click" runat="server" Text="Marcar Todos" Visible="true" CssClass="btn btn-primary btn-xs" />
                                        </span>
                                        <div class="tableFixHead">
                                            <asp:GridView ID="gvPartes" runat="server" DataKeyNames="idArticulo" AutoGenerateColumns="False" OnRowDataBound="gvPartes_RowDataBound" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnSelectedIndexChanged="gvPartes_SelectedIndexChanged" OnPreRender="GVPreRender">
                                                <Columns>
                                                    <asp:BoundField DataField="idArticulo" HeaderText="Cod.Articulo" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="Articulo" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <%--<asp:LinkButton ID="hlMasInfoo" CommandArgument='<%#Eval("idArticulo") %>' runat="server"><%# Eval("Articulo") %></asp:LinkButton>--%>
                                                            <asp:Label ID="Label2qq" runat="server" Text='<%# Eval("Articulo")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Deposito" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("deposito")%>'></asp:Label>
                                                            <asp:HiddenField ID="hfNecesidad" ClientIDMode="Static" runat="server" Value='<%# Eval("necesidadCompra")%>' />
                                                            <asp:HiddenField ID="hfIdArticulo" ClientIDMode="Static" runat="server" Value='<%# Eval("idArticulo")%>' />
                                                            <asp:HiddenField ID="hfIdDeposito" ClientIDMode="Static" runat="server" Value='<%# Eval("idDeposito")%>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="maximo" HeaderText="Maximo" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="stock" HeaderText="Stock" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="reposicion" HeaderText="Repos" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="Pdte" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:HyperLink NavigateUrl='<%# String.Concat("cPdt.aspx?id=", Eval("idArticulo"), "&idDep=", Eval("idDeposito")) %>' Target="_blank" ID="foto" runat="server"><%# Eval("Pdte")%></asp:HyperLink>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="necesidadCompra" HeaderText="Nec.Compra" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>


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
                                                    <asp:TemplateField HeaderText="Pedido" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">

                                                        <%--<HeaderTemplate>

                                                        <asp:CheckBox ID="checkAll" AutoPostBack="true" OnCheckedChanged="checkAll_CheckedChanged" Text="Todo" runat="server" />

                                                    </HeaderTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="cant" Width="10px" runat="server"></asp:TextBox>
                                                            <asp:CheckBox runat="server" ID="cb" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--<asp:TemplateField HeaderText="Detalle" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="detalle" runat="server"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                </Columns>
                                            </asp:GridView>
                                        </div>



                                    </div>






                                    <%--</section>--%>
                                    <%--</div>--%>

                                    <%--<asp:LinqDataSource ID="dsPartes" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="" TableName="vStNecesidadCompraCalculo" Where='1=0'>--%>
                                    <%-- este esta bien <asp:LinqDataSource ID="dsPartes" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="" TableName="vStNecesidadCompraCalculo" Where='(@dds == idSubRubro or @dds == "-2" ) and (@ddr == idRubro or @ddr == "-2" ) and (@tbRepuesto == idArticulo or @tbRepuesto == -1) and @ddDepositos == idDeposito and ((@ddCaracteristica == -2 and (stock > 0)) or (@ddCaracteristica == 1 and stock+pdte < reposicion) or (@ddCaracteristica == 2 and stock == 0) or (@ddCaracteristica == 3 and stock < 0))'>--%>
                                    <%--<asp:LinqDataSource ID="LinqDataSource3" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="" TableName="vStNecesidadCompraCalculo" Where='cantPendiente > 0 and (@okFecha == -1 or (fechaCierre >= @fechaDesde and fechaCierre <= @fechaHasta)) and idDeposito == @ddDepositos  and (codRepuesto == @tbRepuesto or @tbRepuesto == -1) and ((@ddCaracteristica == -2 and (analizable == "Si" or reparable == "Si")) or (@ddCaracteristica == 1 and analizable == "Si") or (@ddCaracteristica == 2 and reparable == "Si"))'>--%>
                                    <%--   <WhereParameters>
                                            <asp:Parameter DefaultValue="20-06-2016" Name="fechaDesde" Type="DateTime" />
                                            <asp:Parameter DefaultValue="20-06-2016" Name="fechaHasta" Type="DateTime" />
                                            <asp:Parameter DefaultValue="1" Name="okFecha" Type="Int32" />
                                            <asp:ControlParameter ControlID="ddDepositos" DefaultValue="-1" Name="ddDepositos" Type="Int32" PropertyName="Text" />
                                            <asp:ControlParameter ControlID="ddrubro" DefaultValue="-1" Name="ddr" Type="String" PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="ddsubrubro" DefaultValue="-1" Name="dds" Type="String" PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="ddCaracteristica" DefaultValue="-2" Name="ddCaracteristica" Type="Int32" PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="tbRepuesto" DefaultValue="-1" Name="tbRepuesto" Type="Int32" PropertyName="Text" />
                                        </WhereParameters>
                                    </asp:LinqDataSource>--%>
                                    <%-- <asp:QueryExtender TargetControlID="dsPartes" runat="server">
                                        <asp:SearchExpression ComparisonType="OrdinalIgnoreCase" DataFields="articulo" SearchType="Contains">
                                            <asp:ControlParameter ControlID="tbDescripcion" PropertyName="Text" Type="String" />
                                        </asp:SearchExpression>
                                    </asp:QueryExtender>--%>
                                </section>
                                <section style="height: 400px" class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Repuestos</span>
                                        Casos Especiales&nbsp;&nbsp; 
                                        
                                    </header>
                                    <div class="panel" style="height: 400px">

                                        <div class="form-inline">
                                            <div class="form-group">
                                                <label for="ddTipo">Tipo</label>
                                                <asp:DropDownList ID="ddTipo" runat="server" CssClass="form-control input-sm entTab">
                                                    <asp:ListItem Text="Repuestos Sin Stock" Value="2" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="Compra Extraordinaria por Oportunidad" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Compra Extraordinaria por Necesidad" Value="4"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>

                                            <div class="form-group">
                                                <label for="ddTipo"># Art.</label>
                                                <asp:TextBox ID="tbCodigo" ClientIDMode="Static" data-button="Button1" runat="server" CssClass="form-control input-sm clickButton" Width="70px"></asp:TextBox>
                                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Font-Bold="true" CssClass="DDValidator" Display="Dynamic" />
                                                <asp:CustomValidator ID="CustomValidator1" runat="server" Visible="false" ErrorMessage="CustomValidator" Display="Dynamic"> </asp:CustomValidator>
                                            </div>


                                            <div class="form-group">

                                                <asp:TextBox ID="autoCompleteArticulos" ClientIDMode="Static" Style="width: 360px;" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                                <asp:Button ID="Button1" ClientIDMode="Static" runat="server" Style="display: none" Text="" Display="Dynamic" />
                                            </div>

                                            <div class="form-group">
                                                <label for="ddTipo">Cant.</label>
                                                <asp:TextBox ID="tbCant" CssClass="form-control input-sm " Width="80" placeholder="Cantidad" runat="server"></asp:TextBox>
                                            </div>



                                            <asp:Button ID="bAgregar" runat="server" Text="Agregar" OnClick="bAgregar_Click" Visible="true" CssClass="btn btn-primary btn-xs" />

                                        </div>


                                        <asp:GridView ID="GridView3" runat="server" DataKeyNames="idArticulo" AutoGenerateColumns="False" DataSourceID="dsCasosEspeciales" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnSelectedIndexChanged="gvPartes_SelectedIndexChanged" OnPreRender="GVPreRender">
                                            <Columns>

                                                <asp:BoundField DataField="idArticulo" HeaderText="Cod.Articulo" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Articulo" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="hlMasInfoo" OnCommand="hlMasInfo_Command" CommandArgument='<%#Eval("idArticulo") %>' runat="server"><%# Eval("Articulo") %></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Tipo" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Lab11el2" runat="server" Text='<%# Eval("tipo")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Deposito" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("deposito")%>'></asp:Label>
                                                        <asp:HiddenField ID="hfIdDetalle" ClientIDMode="Static" runat="server" Value='<%# Eval("idDet")%>' />
                                                        <asp:HiddenField ID="hfIdArticulo" ClientIDMode="Static" runat="server" Value='<%# Eval("idArticulo")%>' />
                                                        <asp:HiddenField ID="hfIdDeposito" ClientIDMode="Static" runat="server" Value='<%# Eval("idDeposito")%>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>






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
                                                <asp:TemplateField HeaderText="Pedido" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2111" runat="server" Text='<%# Eval("cantidad")%>'></asp:Label>
                                                        <%--<asp:TextBox ID="cant" Width="10px" runat="server" Text='<%# Eval("idArticulo")%>'></asp:TextBox>--%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--<asp:TemplateField HeaderText="Detalle" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="detalle" runat="server"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>

                                                <asp:TemplateField HeaderText="Articulo" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="Eliminar" OnCommand="Eliminar_Command" CommandArgument='<%#Eval("idDet") %>' runat="server">Eliminar</asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                        </asp:GridView>

                                        <asp:LinqDataSource ID="dsCasosEspeciales" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="" TableName="vStNecesidadCompraCasosEspeciales" Where='idDeposito = @ddDepositos && idUsuario = @idUsuario && confirmada == false'>
                                            <%--<asp:LinqDataSource ID="LinqDataSource3" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="" TableName="vStNecesidadCompraCalculo" Where='cantPendiente > 0 and (@okFecha == -1 or (fechaCierre >= @fechaDesde and fechaCierre <= @fechaHasta)) and idDeposito == @ddDepositos  and (codRepuesto == @tbRepuesto or @tbRepuesto == -1) and ((@ddCaracteristica == -2 and (analizable == "Si" or reparable == "Si")) or (@ddCaracteristica == 1 and analizable == "Si") or (@ddCaracteristica == 2 and reparable == "Si"))'>--%>
                                            <WhereParameters>
                                                <asp:ControlParameter ControlID="ddDepositos" DefaultValue="-1" Name="ddDepositos" Type="Int32" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="ddCaracteristica" DefaultValue="-2" Name="ddCaracteristica" Type="Int32" PropertyName="SelectedValue" />
                                                <asp:ControlParameter ControlID="tbRepuesto" DefaultValue="-1" Name="tbRepuesto" Type="Int32" PropertyName="Text" />
                                                <asp:Parameter DbType="Int32" Name="idUsuario" DefaultValue="-1" />
                                            </WhereParameters>
                                        </asp:LinqDataSource>
                                        <%--  <asp:QueryExtender TargetControlID="dsPartes" runat="server">
                                            <asp:SearchExpression ComparisonType="OrdinalIgnoreCase" DataFields="Desc_Repuesto" SearchType="Contains">
                                                <asp:ControlParameter ControlID="tbDescripcion" PropertyName="Text" Type="String" />
                                            </asp:SearchExpression>

                                        </asp:QueryExtender>--%>
                                    </div>



                                    <div class="form-group text-center">
                                        <div class="col-lg-12">
                                            <asp:Button ID="bTerminar" runat="server" Text="Generar" OnClientClick="return finalizar();" Visible="true" CssClass="btn btn-primary btn-xs" />

                                            <asp:Button ID="bCancelar" runat="server" Enabled="true" Text="Cancelar" Visible="true" CssClass="btn btn-white btn-xs" />
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

        var ddRepuestos = document.getElementById("ddRepuestos");
        var tbCodigo = document.getElementById("tbCodigo");

        $("#tbCodigo").keyup(function () {
            valor = $("#tbCodigo").val();

            var exists = false;
            $('#ddRepuestos  option').each(function () {
                if (this.value == valor) {
                    exists = true;
                }
            });

            if (exists) {
                $('#ddRepuestos option[value=' + valor + ']').attr('selected', 'selected');
            } else {
                $('#ddRepuestos option[value=' + -2 + ']').attr('selected', 'selected');
            }

        });

        $("#ddRepuestos").change(function () {
            $("#tbCodigo").val($('#ddRepuestos').val());
        });



        function seleccionar() {

            if (document.form.idLegajoTexto.value.length > 0) {


                caracteres = document.form.idLegajoTexto.value.length;
                encontro = 0;
                for (x = 0; x < document.form.idLegajo.options.length; x++) {
                    //if(document.form.idLegajo.options[x].value.slice(0,caracteres)==document.form.idLegajoTexto.value){
                    if (document.form.idLegajo.options[x].value == document.form.idLegajoTexto.value) {
                        document.form.idLegajo.selectedIndex = x;
                        encontro = 1;
                        break;
                    }
                }

                if (encontro != 1) {
                    document.form.idLegajo.selectedIndex = 0;
                }


            }

            //document.form.idLegajo.value = document.form.idLegajoTexto.value;
        }



        //objDiv.scrollTop = objDiv.scrollHeight;

        function set(textbox, cant, cb) {
            if (document.getElementById(cb).checked) {
                document.getElementById(textbox).value = cant;
            } else {
                document.getElementById(textbox).value = '';
            }

        }

        //$('.myClass > input').addClass("myClass");

        function hola() {
            //$(".myClass").each(function () {
            //    $(this).prop('checked', true);
            //});

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
