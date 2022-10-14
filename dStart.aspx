<%@ Page Title="" Language="vb" AutoEventWireup="false" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/Site.master" CodeBehind="dStart.aspx.vb" Inherits="Dynamic_Data.dStart" %>

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
                                        <span class="label bg-danger pull-right">Pendientes</span>
                                        <div class="form-inline">
                                            Siniestros&nbsp;&nbsp; 
                                            <asp:TextBox ID="fechaVentas" runat="server" ClientIDMode="Static" CssClass="input-sm form-control datepicker" Width="80px"></asp:TextBox>
                                            <asp:Button ID="buttonfechaVentas" OnClick="buttonfechaVentas_Click" display="dynamic" ClientIDMode="Static" runat="server" Text="Button" type="hidden" Style="display: none" />
                                            &nbsp;&nbsp;
                                            <asp:CheckBox ID="cbMostrarTodo" AutoPostBack="true" OnCheckedChanged="cbMostrarTodo_CheckedChanged" runat="server" Text="Ver Todos los dias" />
                                            &nbsp;&nbsp;<asp:TextBox ID="tbSiniestro" CssClass="form-control input-sm" Width="80" placeholder="#Siniestro" runat="server"></asp:TextBox>
                                            <asp:Label ID="Label2" runat="server" Text="Label">Legajo</asp:Label>
                                            <asp:DropDownList ID="ddLegajos" AppendDataBoundItems="true" runat="server" AutoPostBack="true" CssClass="form-control input-sm entTab" DataSourceID="dsLegajos" DataTextField="Apellido" DataValueField="idLegajo">
                                                <asp:ListItem Text="Todos los legajos" Value="-1"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:TextBox ID="tbLegajo" CssClass="form-control input-sm" Width="60" placeholder="#Leg." runat="server"></asp:TextBox>
                                            <asp:TextBox ID="tbApellido" CssClass="form-control input-sm" Width="100" placeholder="Apellido" runat="server"></asp:TextBox>
                                            <asp:LinqDataSource ID="dsLegajos" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="Apellido" Select="new (Nombre, Apellido, idLegajo)" TableName="vLegajo">
                                            </asp:LinqDataSource>
                                            &nbsp;&nbsp;
                                            <asp:Label ID="Label3" runat="server" Text="Label">Coche</asp:Label>
                                            <asp:DropDownList ID="ddCoches" AppendDataBoundItems="true" runat="server" AutoPostBack="true" CssClass="form-control input-sm entTab" DataSourceID="dsCoches" DataTextField="coche" DataValueField="idCoche">
                                                <asp:ListItem Text="Todos los coches" Value="-1"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:TextBox ID="tbInterno" CssClass="form-control input-sm" Width="50" placeholder="# Int." runat="server"></asp:TextBox>
                                            <asp:TextBox ID="tbLinea" CssClass="form-control input-sm" Width="50" placeholder="# Lin." runat="server"></asp:TextBox>
                                            <asp:LinqDataSource ID="dsCoches" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="idCoche" Select='new (idCoche, idCoche & " - " & Patente as coche)' TableName="vCoche">
                                            </asp:LinqDataSource>
                                        </div>
                                    </header>
                                    <section style="//height: 200px" class="panel-body scrollbar scroll-y m-b">
                                        <div class="panel">
                                        <asp:GridView ID="gvPartes" runat="server" DataKeyNames="idHeader" AutoGenerateColumns="False" DataSourceID="dsPartes" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnSelectedIndexChanged="gvPartes_SelectedIndexChanged" OnPreRender="GVPreRender">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Siniestro" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="hlMasInfoo" OnCommand="hlMasInfo_Command" CommandArgument='<%# Eval("idHeader") %>' runat="server"><%# Eval("siniestroCia") %></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="30px"></HeaderStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Fec.Siniestro" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Format(Eval("fechaSiniestro"), "dd/MM/yy")%>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="30px"></HeaderStyle>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Linea" HeaderText="Linea" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="Linea">
                                                    <HeaderStyle Width="30px"></HeaderStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Interno" HeaderText="Interno" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="Interno">
                                                    <HeaderStyle Width="30px"></HeaderStyle>
                                                </asp:BoundField>
                                                

                                                <asp:BoundField DataField="Patente" HeaderText="Patente" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="100px" ReadOnly="True" SortExpression="Patente"></asp:BoundField>
                                                <asp:BoundField DataField="Legajo" HeaderText="Legajo" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="Legajo">
                                                    <HeaderStyle Width="30px"></HeaderStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Apellido" HeaderText="Apellido" HeaderStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="Apellido" />
                                                
                                                
                                                <asp:TemplateField HeaderText="#Damnificados" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                    <ItemTemplate>
                                                        <%--<div class="pull-right hidden-sm text-right m-t">--%>
                                                        <b class="badge bg-danger" hidden="hidden" data-toggle="tooltip"><%#IIf(Eval("cantLesionados") > 0, Eval("cantLesionados"), "")%></b>
                                                        <%--</div>--%>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="30px"></HeaderStyle>
                                                </asp:TemplateField>
                                                
                                                <asp:BoundField DataField="PosibleRecupero" HeaderText="Pos.Recupero" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="PosibleRecupero">
                                                        <HeaderStyle Width="30px"></HeaderStyle>
                                                </asp:BoundField>
                                                
                                                <asp:BoundField DataField="recuperoIniciado" HeaderText="Recu.Iniciado" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="recuperoIniciado">
                                                        <HeaderStyle Width="30px"></HeaderStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="reclamoIniciado" HeaderText="Recl.Iniciado" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ReadOnly="True" SortExpression="reclamoIniciado">
                                                        <HeaderStyle Width="30px"></HeaderStyle>
                                                </asp:BoundField>
                                                </Columns>
                                        </asp:GridView>

                                        </div>
                                        <asp:LinqDataSource ID="dsPartes" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="FechaSiniestro desc, HoraSiniestro desc" Select="new (Idheader, siniestroCia,FechaSiniestro, HoraSiniestro, Linea, Interno, Patente, Legajo, Apellido, CantLesionados,PosibleRecupero,recuperoIniciado,reclamoIniciado)" TableName="vPartes" Where='(@okFecha == -1 or FechaSiniestro == @FechaSiniestro) and (Legajo == @Legajo or @Legajo == -1) and  (Patente == @Patente or @patente == "-1") and (siniestroCia == @tbSiniestro or @tbSiniestro == -1) and (linea != @l1 and linea != @l2 and linea != @l3 and linea != @l4 and linea != @l5 and linea != @l6 and linea != @l7 and linea != @l8 and linea != @l9 and linea != @l10 and linea != @l11 and linea != @l12) '>
                                            <WhereParameters>
                                                <asp:Parameter DefaultValue="20-06-2016" Name="FechaSiniestro" Type="DateTime" />
                                                <asp:Parameter DefaultValue="1" Name="okFecha" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddLegajos" Name="Legajo" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddCoches" Name="Patente" PropertyName="SelectedValue" Type="String" />
                                                <asp:ControlParameter ControlID="tbLegajo" DefaultValue="-1" Name="tbLegajo" Type="Int32" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="tbSiniestro" DefaultValue="-1" Name="tbSiniestro" Type="Int32" PropertyName="Text" />
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
                                        <asp:QueryExtender TargetControlID="dsPartes" runat="server">
                                            <asp:RangeExpression DataField="Legajo" MaxType="Inclusive" MinType="Inclusive">
                                                <asp:ControlParameter ControlID="tbLegajo"
                                                    PropertyName="Text" Type="Int32" />
                                                <asp:ControlParameter ControlID="tbLegajo"
                                                    PropertyName="Text" Type="Int32" />
                                            </asp:RangeExpression>
                                            <asp:SearchExpression ComparisonType="OrdinalIgnoreCase" DataFields="Apellido" SearchType="Contains">
                                                <asp:ControlParameter ControlID="tbApellido" PropertyName="Text" Type="String" />
                                            </asp:SearchExpression>
                                            <asp:RangeExpression DataField="Interno" MaxType="Inclusive" MinType="Inclusive">
                                                <asp:ControlParameter ControlID="tbInterno"
                                                    PropertyName="Text" Type="Int32" />
                                                <asp:ControlParameter ControlID="tbInterno"
                                                    PropertyName="Text" Type="Int32" />
                                            </asp:RangeExpression>
                                            <asp:RangeExpression DataField="Linea" MaxType="Inclusive" MinType="Inclusive">
                                                <asp:ControlParameter ControlID="tbLinea"
                                                    PropertyName="Text" Type="Int16" />
                                                <asp:ControlParameter ControlID="tbLinea"
                                                    PropertyName="Text" Type="Int16" />
                                            </asp:RangeExpression>

                                        </asp:QueryExtender>
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
