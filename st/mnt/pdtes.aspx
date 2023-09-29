<%@ Page Title="" Language="vb" AutoEventWireup="false" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/st/SiteST.master" CodeBehind="pdtes.aspx.vb" Inherits="Dynamic_Data.pdtes" %>

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

                    <div class="col-sm-12">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Mantenimiento Preventivo</span>
                                        <div class="form-inline">
                                            <asp:TextBox ID="tbNroCoche" autocomplete="off" ClientIDMode="Static" CssClass="form-control input-sm clickbutton" data-button="buttonBuscar" Width="70" placeholder="# Coche" runat="server"></asp:TextBox>


                                            <asp:DropDownList ID="ddEmpresa" AppendDataBoundItems="true" runat="server" CssClass="form-control input-sm entTab" DataTextField="Nombre" DataValueField="idEmpresa">
                                                <asp:ListItem Text="Todos las Empresas" Value="-2" Selected="True"></asp:ListItem>
                                            </asp:DropDownList>

                                            <asp:DropDownList ID="ddCabeceras" AppendDataBoundItems="true" runat="server" CssClass="form-control input-sm entTab" DataTextField="Nombre" DataValueField="idCabecera">
                                                <asp:ListItem Text="Todos las Cabeceras" Value="-2" Selected="True"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddKms" runat="server" CssClass="form-control input-sm entTab">
                                                <asp:ListItem Text="Kms/Dias" Value="todos"></asp:ListItem>
                                                <asp:ListItem Text="Kms" Value="kms"></asp:ListItem>
                                                <asp:ListItem Text="Dias" Value="dias"></asp:ListItem>
                                            </asp:DropDownList>

                                            <asp:DropDownList ID="ddRubro" DataSourceID="rubrosLDS" AppendDataBoundItems="true" DataTextField="Descripcion" DataValueField="id" runat="server" CssClass="form-control col-6 input-sm entTab">
                                                <asp:ListItem Text="Todos los Rubros" Value="-2" Selected="True"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:LinqDataSource ID="rubrosLDS" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="Descripcion" TableName="mRubros">
                                            </asp:LinqDataSource>

                                            <asp:DropDownList ID="ddTareas" ClientIDMode="Static" DataSourceID="tareasLDS" AppendDataBoundItems="true" DataTextField="Descripcion" DataValueField="id" runat="server" CssClass="form-control col-6 input-sm entTab">
                                                <asp:ListItem Text="Todas las Tareas" Value="-2" Selected="True"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:LinqDataSource ID="tareasLDS" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="Descripcion" TableName="mTareas">
                                            </asp:LinqDataSource>

                                            <asp:DropDownList ID="ddLineas" DataSourceID="LinqDataSource1" AppendDataBoundItems="true" DataTextField="Descripcion" DataValueField="idLinea" runat="server" CssClass="form-control col-6 input-sm entTab">
                                                <asp:ListItem Text="Todas las Lineas" Value="-2" Selected="True"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="Descripcion" TableName="tLinea">
                                            </asp:LinqDataSource>

                                            Orden
                                            <asp:DropDownList ID="ddOrden" runat="server" CssClass="form-control input-sm entTab">
                                                <asp:ListItem Text="Interno" Value="nroCoche"></asp:ListItem>
                                                <asp:ListItem Text="Fecha" Value="fecha"></asp:ListItem>
                                                <asp:ListItem Text="Origen" Selected="True" Value="orden"></asp:ListItem>
                                                <asp:ListItem Text="Kms.Parc" Value="kmsParciales"></asp:ListItem>
                                                <asp:ListItem Text="Dias Parc" Value="diasParciales"></asp:ListItem>
                                                <asp:ListItem Text="Tarea" Value="tarea"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddAsc" runat="server" CssClass="form-control input-sm entTab">
                                                <asp:ListItem Text="Asc." Value="asc"></asp:ListItem>
                                                <asp:ListItem Text="Desc." Value="desc"></asp:ListItem>
                                            </asp:DropDownList>
                                            <br />
                                            <br />
                                            <div class="flex flex-column flex-align-center">
                                                <p class="green-badge"><a href="../asistencia/ordenesAsistencia.aspx" style="color: black"> Ordenes Asistencia en Curso: <%= cantidadOrdenesAsistencia %></a></p>
                                                <p class="red-badge"><a href="../asistencia/ordenesAsistencia.aspx" style="color: black">Quedos Pendientes: <%= cantidadQuedosPendientes %></a></p>
                                            </div>
                                            <br />
                                            <br />
                                            <asp:CheckBox ID="cbChecklist" runat="server" Checked="true" Text="Checklist" />
                                            &nbsp;&nbsp;
                                            <asp:CheckBox ID="cbPreventivo" runat="server" Checked="true" Text="Preventivo" />
                                            &nbsp;&nbsp;
                                            <asp:CheckBox ID="cbRevision" runat="server" Checked="true" Text="Revision" />
                                            &nbsp;&nbsp;
                                            <asp:CheckBox ID="cbCorrectivo" runat="server" Checked="true" Text="Correctivo" />
                                            &nbsp;&nbsp;
                                            <asp:CheckBox ID="cbAuxilio" Visible="false" runat="server" Checked="true" Text="Auxilio" />
                                            &nbsp;&nbsp;
                                            <asp:CheckBox ID="cbVtv" runat="server" Checked="true" Text="VTV" />
                                            &nbsp;&nbsp;
                                            <asp:CheckBox ID="cbSoloInterrumpidos" runat="server" Text="Solo Interrumpidos" />
                                            &nbsp;&nbsp;
                                            <asp:CheckBox ID="cbVerUltimasTareas" ClientIDMode="Static" runat="server" Checked="false" Text="Ver Ultimas Tareas" />

                                            <asp:Button ID="buttonBuscar" OnClientClick="return verificarCoche()" OnClick="buttonBuscar_Click" ClientIDMode="Static" runat="server" Text="Buscar" Display="Dynamic" />

                                        </div>
                                    </header>
                                    <section style="//height: 200px" class="panel-body scrollbar scroll-y m-b">
                                        <div class="panel">

                                            <asp:Label Text="" ID="lError" runat="server" ForeColor="Red"></asp:Label>



                                            <asp:GridView ID="gvPreventivo" runat="server" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnSelectedIndexChanged="gvPartes_SelectedIndexChanged" OnPreRender="GVPreRender">
                                                <Columns>


                                                    <asp:BoundField DataField="nroCoche" HeaderText="Coche" HeaderStyle-HorizontalAlign="Center" SortExpression="nroCoche"></asp:BoundField>
                                                    <%--<asp:BoundField ItemStyle-BackColor='<%="red" %>' DataField="origen" HeaderText="Origen" HeaderStyle-HorizontalAlign="Center" SortExpression="origen"></asp:BoundField>--%>
                                                    <asp:TemplateField HeaderText="Origen" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <%--<asp:LinkButton runat="server" Visible='<%#IIf(Eval("motivo") = "", "false", "true")%>' Value='<%# Eval("idEmpresa")%>'></asp:LinkButton>--%>
                                                            <asp:Label ID="Label22112" BackColor='<%# IIf(Eval("condicionante") = 1, Drawing.Color.Red, Drawing.Color.White) %>' ForeColor='<%# IIf(Eval("condicionante") = 1, Drawing.Color.White, Drawing.Color.Black) %>' runat="server" Text='<%# Eval("origen")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Fecha" ItemStyle-HorizontalAlign="Center" SortExpression="fecha" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label222" runat="server" Text='<%# Format(Eval("fecha"), "dd/MM/yy")%>'></asp:Label>
                                                            <asp:HiddenField ID="hfIdCoche" ClientIDMode="Static" runat="server" Value='<%# Eval("nroCoche")%>' />
                                                            <asp:HiddenField ID="hfIdEmpresa" ClientIDMode="Static" runat="server" Value='<%# Eval("idEmpresa")%>' />
                                                            <asp:HiddenField ID="hfIdLinea" ClientIDMode="Static" runat="server" Value='<%# Eval("idLinea")%>' />
                                                            <asp:HiddenField ID="hfKms" ClientIDMode="Static" runat="server" Value='<%# Eval("kmsActuales")%>' />
                                                            <asp:HiddenField ID="hfIdCabecera" ClientIDMode="Static" runat="server" Value='<%# Eval("idCabecera")%>' />
                                                            <asp:HiddenField ID="hfIdTarea" ClientIDMode="Static" runat="server" Value='<%# Eval("idTarea")%>' />
                                                            <asp:HiddenField ID="hfkmsPasados" ClientIDMode="Static" runat="server" Value='<%# Eval("kmsPasados")%>' />
                                                            <asp:HiddenField ID="hfFueraTolerancia" ClientIDMode="Static" runat="server" Value='<%# Eval("fueraTolerancia")%>' />
                                                            <asp:HiddenField ID="hfOrigen" ClientIDMode="Static" runat="server" Value='<%# Eval("origen")%>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--<asp:BoundField DataField="tarea" HeaderText="Tarea" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>--%>
                                                    <asp:TemplateField HeaderText="Interr." ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" Visible='<%#IIf(Eval("motivo") = "", "false", "true")%>' OnClientClick='<%#String.Format("alert(""Motivo: {0} \nObservaciones: {1}""); return false;", Eval("motivo"), Eval("obs")) %>'>Ver</asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Tarea" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelsssa2" runat="server"
                                                                BackColor='<%# IIf(Eval("origen") = "VTV" And Eval("kmsParciales") = -333, Drawing.Color.Red, IIf(Eval("origen") = "VTV" And Eval("kmsParciales") = -444, Drawing.Color.Green, Drawing.Color.White)) %>'
                                                                ForeColor='<%# IIf(Eval("origen") = "VTV" And Eval("kmsParciales") = -333, Drawing.Color.white, IIf(Eval("origen") = "VTV" And Eval("kmsParciales") = -444, Drawing.Color.white, Drawing.Color.black)) %>'
                                                                Text='<%#String.Concat(Eval("tarea"), " (", Eval("idTarea"), ")") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Ult.Serv" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Format(Eval("fechaUltServ"), "dd/MM/yy")%>'></asp:Label>
                                                            <%--  <asp:HiddenField ID="hfCant" ClientIDMode="Static" runat="server" Value='<%# Eval("cant")%>' />
                                                            <asp:HiddenField ID="hfidDetalle" ClientIDMode="Static" runat="server" Value='<%# Eval("idMov")%>' />--%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="kmsUltServ" HeaderText="Kms.US" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"></asp:BoundField>
                                                    <asp:BoundField DataField="kmsActuales" HeaderText="Kms.Act" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="Parc" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <%--<asp:Label ID="Labelss2" runat="server" Text='<%#IIf(Eval("controlDias") = 1, "Dias", "Kms")%>'></asp:Label>--%>
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("kmsParciales")%>' Visible='<%#IIf(Eval("controlDias") = "0", "true", "false")%>' ></asp:Label>
                                                            <%-- para la linea 105 va este <asp:Label ID="Label4" runat="server" Text='<%# Eval("kmsParciales")%>' Visible='<%#IIf(Eval("controlDias") = "0", "true", "false")%>' BackColor='<%# IIf(Eval("kmsparciales") > Eval("kmsDecision"), Drawing.Color.Red, Drawing.Color.White) %>' ForeColor='<%# IIf(Eval("kmsparciales") > Eval("kmsDecision"), Drawing.Color.White, Drawing.Color.Black) %>'></asp:Label>--%>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("diasParciales")%>' Visible='<%#IIf(Eval("controlDias") = "1", "true", "false")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="frecuencia" HeaderText="Frec" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"></asp:BoundField>

                                                    <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <%--<asp:CheckBox runat="server" ID="guardar" Text="Generar" Visible='<%#IIf(Eval("origen") = "Revision", "false", "true")%>' />--%>
                                                            <asp:LinkButton ID="hlGenerar" OnCommand="hlGenerar_Command" CommandArgument='<%#Eval("nroCoche")%>' Visible='<%#IIf(Eval("origen") = "Revision", "false", "true")%>' runat="server">Generar</asp:LinkButton>
                                                            <asp:LinkButton ID="hlMasInfoo" OnCommand="hlMasInfo_Command" CommandArgument='<%#String.Concat(Eval("idTarea"), "/", Eval("idCabecera")) %>' Visible='<%#IIf(Eval("origen") = "Revision", "true", "false")%>' runat="server">Procesar</asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>




                                                </Columns>
                                            </asp:GridView>




                                            <asp:GridView ID="gvUltTareas" runat="server" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnSelectedIndexChanged="gvPartes_SelectedIndexChanged" OnPreRender="GVPreRender">
                                                <Columns>


                                                    <asp:BoundField DataField="nroCoche" HeaderText="Coche" HeaderStyle-HorizontalAlign="Center" SortExpression="nroCoche"></asp:BoundField>
                                                    <asp:BoundField DataField="origen" HeaderText="Origen" HeaderStyle-HorizontalAlign="Center" SortExpression="origen"></asp:BoundField>

                                                    <asp:TemplateField HeaderText="Fecha" ItemStyle-HorizontalAlign="Center" SortExpression="fecha" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label222" runat="server" Text='<%# Format(Eval("fecha"), "dd/MM/yy")%>'></asp:Label>
                                                            <asp:HiddenField ID="hfIdCoche" ClientIDMode="Static" runat="server" Value='<%# Eval("nroCoche")%>' />
                                                            <asp:HiddenField ID="hfIdEmpresa" ClientIDMode="Static" runat="server" Value='<%# Eval("idEmpresa")%>' />
                                                            <asp:HiddenField ID="hfIdLinea" ClientIDMode="Static" runat="server" Value='<%# Eval("idLinea")%>' />
                                                            <asp:HiddenField ID="hfKms" ClientIDMode="Static" runat="server" Value='<%# Eval("kmsActuales")%>' />
                                                            <asp:HiddenField ID="hfIdCabecera" ClientIDMode="Static" runat="server" Value='<%# Eval("idCabecera")%>' />
                                                            <asp:HiddenField ID="hfIdTarea" ClientIDMode="Static" runat="server" Value='<%# Eval("idTarea")%>' />
                                                            <asp:HiddenField ID="hfkmsPasados" ClientIDMode="Static" runat="server" Value='<%# Eval("kmsPasados")%>' />
                                                            <asp:HiddenField ID="hfFueraTolerancia" ClientIDMode="Static" runat="server" Value='<%# Eval("fueraTolerancia")%>' />
                                                            <asp:HiddenField ID="hfOrigen" ClientIDMode="Static" runat="server" Value='<%# Eval("origen")%>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--<asp:BoundField DataField="tarea" HeaderText="Tarea" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>--%>
                                                    <asp:TemplateField HeaderText="Tarea" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelsssa2" runat="server" Text='<%#String.Concat(Eval("descripcion"), " (", Eval("idTarea"), ")") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Ult.Serv" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Format(Eval("fechaCierre"), "dd/MM/yy")%>'></asp:Label>
                                                            <%--  <asp:HiddenField ID="hfCant" ClientIDMode="Static" runat="server" Value='<%# Eval("cant")%>' />
                                                            <asp:HiddenField ID="hfidDetalle" ClientIDMode="Static" runat="server" Value='<%# Eval("idMov")%>' />--%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="kmsCierre" HeaderText="Kms.US" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"></asp:BoundField>
                                                    <asp:BoundField DataField="kmsActuales" HeaderText="Kms.Act" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="Parc" Visible="false" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <%--<asp:Label ID="Labelss2" runat="server" Text='<%#IIf(Eval("controlDias") = 1, "Dias", "Kms")%>'></asp:Label>--%>
                                                            <%--<asp:Label ID="Labelss2" runat="server" Text='<%# Eval("kmsActuales") - Eval("kmsCierre")%>' Visible='<%#IIf(Eval("controlDias") = "0", "true", "false")%>'></asp:Label>--%>
                                                            <%--<asp:Label ID="Label1" runat="server" Text='<%# DateDiff(DateInterval.Day, Eval("fechaCierre"), Now())%>' Visible='<%#IIf(Eval("controlDias") = "1", "true", "false")%>'></asp:Label>--%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="frecuencia" HeaderText="Frec" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"></asp:BoundField>

                                                    <asp:TemplateField HeaderText="" Visible="false" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <%--<asp:CheckBox runat="server" ID="guardar" Text="Generar" Visible='<%#IIf(Eval("origen") = "Revision", "false", "true")%>' />--%>
                                                            <asp:LinkButton ID="hlGenerar" OnCommand="hlGenerar_Command" CommandArgument='<%#Eval("nroCoche")%>' Visible='<%#IIf(Eval("origen") = "Revision", "false", "true")%>' runat="server">Generar</asp:LinkButton>
                                                            <asp:LinkButton ID="hlMasInfoo" OnCommand="hlMasInfo_Command" CommandArgument='<%#String.Concat(Eval("idTarea"), "/", Eval("idCabecera")) %>' Visible='<%#IIf(Eval("origen") = "Revision", "true", "false")%>' runat="server">Procesar</asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>




                                                </Columns>
                                            </asp:GridView>

                                        </div>

                                        <asp:LinqDataSource ID="LinqDataSource4" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="Motivo" TableName="stMotivos">
                                        </asp:LinqDataSource>

                                        <asp:LinqDataSource ID="dsPartes" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="Fecha desc" TableName="vStMovimientosStock" Where='idTipoMov != 2 and (cantAceptada == null) and (@okFecha == -1 or (fecha >= @fechaDesde and fecha <= @fechaHasta)) and 1 == @paramCabecera'>
                                            <WhereParameters>
                                                <asp:Parameter DefaultValue="20-06-2016" Name="fechaDesde" Type="DateTime" />
                                                <asp:Parameter DefaultValue="20-06-2016" Name="fechaHasta" Type="DateTime" />
                                                <asp:Parameter DefaultValue="1" Name="okFecha" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddCabeceras" DefaultValue="-1" Name="paramCabecera" Type="Int16" PropertyName="SelectedValue" />
                                            </WhereParameters>
                                        </asp:LinqDataSource>

                                    </section>
                                    <%--</div>--%>
                                    <div class="form-group text-center">
                                        <div class="col-lg-12">
                                            <asp:Button ID="terminar" runat="server" Text="Guardar" OnClientClick="return finalizar();" Visible="false" CssClass="btn btn-primary btn-xs" />

                                            <asp:Button ID="cancelar" runat="server" Enabled="true" Text="Cancelar" Visible="true" CssClass="btn btn-white btn-xs" />
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

        function verificarCoche() {

            if (document.getElementById('cbVerUltimasTareas').checked == true) {

                if (document.getElementById('tbNroCoche').value == "" && document.getElementById('ddTareas').value == -2) {
                    Swal.fire('Debe Ingresar un Coche o una tarea');
                    return false;
                }

            }

            return true;
        }

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
