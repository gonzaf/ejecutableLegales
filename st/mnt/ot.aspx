<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/st/SiteST.master" CodeBehind="ot.aspx.vb" Inherits="Dynamic_Data.ot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
        }

        .auto-style2 {
            text-align: center;
        }

        .auto-style3 {
            width: 76%;
        }

        .auto-style4 {
            width: 78px;
        }

        .flex {
            display: flex;
        }

        .flex-column {
            flex-direction: column;
        }

        .flex-end {
            justify-content: end;
        }

        .flex-align-bottom {
            align-items: flex-end;
        }

        .flex-align-center {
            justify-content: center;
        }

        .flex-space-between {
            justify-content: space-between;
        }

        .flex-wrap {
            flex-wrap: wrap;
        }

        .margin-1-rem {
            margin: 1rem;
        }

        .hidden {
            display: none;
        }

        .green-badge {
            color: black;
            background-color: lightyellow;
            border-radius: 5px;
            padding: 0 5px 0 15px;
            font-weight: bold;
        }

        .red-badge {
            color: black;
            background-color: lightcoral;
            border-radius: 5px;
            padding: 0 5px 0 15px;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <section id="content">
        <section class="main padder">
            <form id="form1" runat="server">
                <div class="row no-gutter">

                    <div runat="server" id="panel1" class="col-sm-10">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Ordenes en Curso</span>

                                        <div class="form-inline">
                                            <asp:DropDownList ID="ddMecanicos" AppendDataBoundItems="true" DataTextField="text" DataValueField="id" runat="server" CssClass="form-control col-6 input-sm entTab">
                                                <asp:ListItem Text="Todas los Mecanicos" Value="-2" Selected="True"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddLineas" DataSourceID="LinqDataSource1" AppendDataBoundItems="true" DataTextField="Descripcion" DataValueField="idLinea" runat="server" CssClass="form-control col-6 input-sm entTab">
                                                <asp:ListItem Text="Todas las Lineas" Value="-2" Selected="True"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="Descripcion" TableName="tLinea">
                                            </asp:LinqDataSource>
                                            &nbsp;&nbsp; 
                                               <asp:DropDownList ID="ddCabeceras" Visible="false" AppendDataBoundItems="true" runat="server" CssClass="form-control input-sm entTab" DataTextField="Nombre" DataValueField="idCabecera">
                                                   <asp:ListItem Text="Todos las Cabeceras" Value="-2" Selected="True"></asp:ListItem>
                                               </asp:DropDownList>
                                            &nbsp;&nbsp; 
                                           Orden
                                            <asp:DropDownList ID="ddOrden" runat="server" CssClass="form-control input-sm entTab">
                                                <asp:ListItem Text="Coche" Selected="True" Value="nroCoche"></asp:ListItem>
                                                <asp:ListItem Text="Mecanico" Value="apellido"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddAsc" runat="server" CssClass="form-control input-sm entTab">
                                                <asp:ListItem Text="Asc." Value="asc"></asp:ListItem>
                                                <asp:ListItem Text="Desc." Value="desc"></asp:ListItem>
                                            </asp:DropDownList>
                                            &nbsp;&nbsp; 
                                            <asp:Button ID="buttonBuscar" OnClick="buttonBuscar_Click" ClientIDMode="Static" runat="server" Text="Buscar" Display="Dynamic" />
                                        </div>
                                    </header>
                                    <section style="//height: 200px" class="panel-body scrollbar scroll-y m-b">
                                        <div class="panel">

                                            <div class="flex flex-column flex-align-center">
                                                <p class="green-badge"><a href="../asistencia/ordenesAsistencia.aspx" style="color: black">Ordenes Asistencia en Curso: <%= cantidadOrdenesAsistencia %></a></p>
                                                <p class="red-badge"><a href="../asistencia/ordenesAsistencia.aspx" style="color: black">Quedos Pendientes: <%= cantidadQuedosPendientes %></a></p>

                                            </div>

                                            <asp:Label runat="server" Text="VTV" Font-Size="X-Large" Font-Bold="true" />
                                            <asp:Label Text="" ID="lError" runat="server" ForeColor="Red"></asp:Label>
                                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Font-Bold="true" CssClass="DDValidator" Display="Dynamic" />
                                            <asp:CustomValidator ID="CustomValidator1" runat="server" Visible="true" ErrorMessage="CustomValidator" Display="Dynamic"> </asp:CustomValidator>



                                            <asp:GridView ID="gvPartes2" HeaderStyle-HorizontalAlign="Center" runat="server" DataKeyNames="id" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender">
                                                <Columns>

                                                    <asp:BoundField DataField="id" HeaderText="#Orden"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="Fecha" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Format(Eval("fecha"), "dd/MM/yy")%>'></asp:Label>
                                                            <%-- <asp:HiddenField ID="hfCant" ClientIDMode="Static" runat="server" Value='<%# Eval("cant")%>' />
                                                            <asp:HiddenField ID="hfidDetalle" ClientIDMode="Static" runat="server" Value='<%# Eval("idMov")%>' />--%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--#IIf(Eval("idAccion") = 6 And Eval("preventivo"), "Reajuste Preventivo", Eval("tarea"))--%>
                                                    <%--  <asp:TemplateField HeaderText="Tarea" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label222" runat="server" Text='<%#IIf(Eval("idAccion") = 6 And Eval("preventivo"), IIf(Not Eval("observaciones") Is Nothing AndAlso Eval("observaciones").ToString.Contains("Alerta") = True, "Reajuste Un", "Reajuste Preventivo"), Eval("tarea")) %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>

                                                    <asp:BoundField DataField="nroCoche" HeaderText="Interno"></asp:BoundField>
                                                    <asp:BoundField DataField="descripcion" HeaderText="Tarea"></asp:BoundField>

                                                    <%-- <asp:TemplateField HeaderText="Estado" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label112" runat="server" Text='<%#IIf(Eval("estado") = 1, "Pendiente", IIf(Eval("estado") = 2, "Apto") %>'></asp:Label>
                                                           
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="Turno" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label222" runat="server" Text='<%# Format(Eval("fechaTurno"), "dd/MM/yy")%>'></asp:Label>
                                                            <%-- <asp:HiddenField ID="hfCant" ClientIDMode="Static" runat="server" Value='<%# Eval("cant")%>' />
                                                            <asp:HiddenField ID="hfidDetalle" ClientIDMode="Static" runat="server" Value='<%# Eval("idMov")%>' />--%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:BoundField DataField="apellido" HeaderText="Mecanico"></asp:BoundField>


                                                    <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lbIngresar" ToolTip="Ingresar" OnCommand="lbIngresar_Command" CommandArgument='<%# String.Concat(Eval("id"), "/", Eval("id"), "/", Eval("id")) %>' runat="server">Ingresar</asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>
                                            </asp:GridView>


                                            <%-- <asp:LinqDataSource ID="dsPartes" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="idOrden" TableName="vStOrdenesGomeriaPendientes" Where='((idUsuario == @idUsuario)) and guardada == true and finalizada == false'>
                                                <WhereParameters>
                                                    <asp:Parameter DefaultValue="20-06-2016" Name="fechaDesde" Type="DateTime" />
                                                    <asp:Parameter DefaultValue="20-06-2016" Name="fechaHasta" Type="DateTime" />
                                                    <asp:Parameter DefaultValue="1" Name="okFecha" Type="Int32" />
                                                    <asp:Parameter DefaultValue="26" Name="idUsuario" Type="Int32" />
                                                </WhereParameters>
                                            </asp:LinqDataSource>--%>


                                            <div class="form-group text-center">
                                                <div class="col-lg-12">
                                                </div>
                                            </div>

                                        </div>

                                    </section>


                                    
                                    <section style="//height: 200px" class="panel-body scrollbar scroll-y m-b">
                                        <div class="panel">
                                            <asp:Label runat="server" Text="Novedades" Font-Size="X-Large" Font-Bold="true" />
                                            <asp:Label Text="" ID="Label3" runat="server" ForeColor="Red"></asp:Label>
                                            <asp:ValidationSummary ID="ValidationSummary3" runat="server" ForeColor="Red" Font-Bold="true" CssClass="DDValidator" Display="Dynamic" />
                                            <asp:CustomValidator ID="CustomValidator3" runat="server" Visible="true" ErrorMessage="CustomValidator" Display="Dynamic"> </asp:CustomValidator>
                                            <asp:GridView ID="GridView1" HeaderStyle-HorizontalAlign="Center" runat="server" DataKeyNames="id" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender">
                                                <Columns>

                                                    <asp:BoundField DataField="id" HeaderText="#Orden"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="Fecha" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Format(Eval("fecha"), "dd/MM/yy")%>'></asp:Label>
                                                            <%-- <asp:HiddenField ID="hfCant" ClientIDMode="Static" runat="server" Value='<%# Eval("cant")%>' />
                                                            <asp:HiddenField ID="hfidDetalle" ClientIDMode="Static" runat="server" Value='<%# Eval("idMov")%>' />--%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--#IIf(Eval("idAccion") = 6 And Eval("preventivo"), "Reajuste Preventivo", Eval("tarea"))--%>
                                                    <%--  <asp:TemplateField HeaderText="Tarea" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label222" runat="server" Text='<%#IIf(Eval("idAccion") = 6 And Eval("preventivo"), IIf(Not Eval("observaciones") Is Nothing AndAlso Eval("observaciones").ToString.Contains("Alerta") = True, "Reajuste Un", "Reajuste Preventivo"), Eval("tarea")) %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>

                                                    <asp:BoundField DataField="nroCoche" HeaderText="Interno"></asp:BoundField>
                                                    <asp:BoundField DataField="descripcion" HeaderText="Tarea"></asp:BoundField>
                                                    <asp:BoundField DataField="apellido" HeaderText="Mecanico"></asp:BoundField>


                                                    <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lbIngresar" ToolTip="Ingresar" OnCommand="lbIngresar_Command" CommandArgument='<%# String.Concat(Eval("id"), "/", Eval("id"), "/", Eval("id")) %>' runat="server">Ingresar</asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>
                                            </asp:GridView>


                                            <%-- <asp:LinqDataSource ID="dsPartes" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="idOrden" TableName="vStOrdenesGomeriaPendientes" Where='((idUsuario == @idUsuario)) and guardada == true and finalizada == false'>
                                                <WhereParameters>
                                                    <asp:Parameter DefaultValue="20-06-2016" Name="fechaDesde" Type="DateTime" />
                                                    <asp:Parameter DefaultValue="20-06-2016" Name="fechaHasta" Type="DateTime" />
                                                    <asp:Parameter DefaultValue="1" Name="okFecha" Type="Int32" />
                                                    <asp:Parameter DefaultValue="26" Name="idUsuario" Type="Int32" />
                                                </WhereParameters>
                                            </asp:LinqDataSource>--%>


                                            <div class="form-group text-center">
                                                <div class="col-lg-12">
                                                </div>
                                            </div>

                                        </div>

                                    </section>





                                    <section style="//height: 200px" class="panel-body scrollbar scroll-y m-b">
                                        <div class="panel">
                                            <asp:Label runat="server" Text="Mantenimiento" Font-Size="X-Large" Font-Bold="true" />
                                            <asp:Label Text="" ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                                            <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" Font-Bold="true" CssClass="DDValidator" Display="Dynamic" />
                                            <asp:CustomValidator ID="CustomValidator2" runat="server" Visible="true" ErrorMessage="CustomValidator" Display="Dynamic"> </asp:CustomValidator>
                                            <asp:GridView ID="gvPartes" HeaderStyle-HorizontalAlign="Center" runat="server" DataKeyNames="id" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender">
                                                <Columns>

                                                    <asp:BoundField DataField="id" HeaderText="#Orden"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="Fecha" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Format(Eval("fecha"), "dd/MM/yy")%>'></asp:Label>
                                                            <%-- <asp:HiddenField ID="hfCant" ClientIDMode="Static" runat="server" Value='<%# Eval("cant")%>' />
                                                            <asp:HiddenField ID="hfidDetalle" ClientIDMode="Static" runat="server" Value='<%# Eval("idMov")%>' />--%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--#IIf(Eval("idAccion") = 6 And Eval("preventivo"), "Reajuste Preventivo", Eval("tarea"))--%>
                                                    <%--  <asp:TemplateField HeaderText="Tarea" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label222" runat="server" Text='<%#IIf(Eval("idAccion") = 6 And Eval("preventivo"), IIf(Not Eval("observaciones") Is Nothing AndAlso Eval("observaciones").ToString.Contains("Alerta") = True, "Reajuste Un", "Reajuste Preventivo"), Eval("tarea")) %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>

                                                    <asp:BoundField DataField="nroCoche" HeaderText="Interno"></asp:BoundField>
                                                    <asp:BoundField DataField="descripcion" HeaderText="Tarea"></asp:BoundField>
                                                    <asp:BoundField DataField="apellido" HeaderText="Mecanico"></asp:BoundField>


                                                    <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lbIngresar" ToolTip="Ingresar" OnCommand="lbIngresar_Command" CommandArgument='<%# String.Concat(Eval("id"), "/", Eval("id"), "/", Eval("id")) %>' runat="server">Ingresar</asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>
                                            </asp:GridView>


                                            <%-- <asp:LinqDataSource ID="dsPartes" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="idOrden" TableName="vStOrdenesGomeriaPendientes" Where='((idUsuario == @idUsuario)) and guardada == true and finalizada == false'>
                                                <WhereParameters>
                                                    <asp:Parameter DefaultValue="20-06-2016" Name="fechaDesde" Type="DateTime" />
                                                    <asp:Parameter DefaultValue="20-06-2016" Name="fechaHasta" Type="DateTime" />
                                                    <asp:Parameter DefaultValue="1" Name="okFecha" Type="Int32" />
                                                    <asp:Parameter DefaultValue="26" Name="idUsuario" Type="Int32" />
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
