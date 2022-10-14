<%@ Page Title="" Language="vb" AutoEventWireup="false" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/Site.master" CodeBehind="Default.aspx.vb" Inherits="Dynamic_Data._Default1" %>

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
                                        <span class="label bg-danger pull-right">Alertas</span>
                                        Alertas
                                    </header>
                                    <section style="//height: 200px" class="panel-body scrollbar scroll-y m-b">
                                        <div class="panel">

                                            Reclamos
                                            <asp:GridView ID="gvReclamos" runat="server" AllowSorting="true" AutoGenerateColumns="False" DataSourceID="dsReclamos" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Siniestro" HeaderStyle-Width="60px" SortExpression="pHeader.siniestroCia">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="verSiniestro" OnCommand="verParte_Command" CommandArgument='<%# Eval("ralertas.rReclamos.idParte") %>' runat="server"><%# Eval("ralertas.rReclamos.pHeader.siniestroCia") %></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField HeaderText="Titulo" HeaderStyle-Width="250px" SortExpression="titulo">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="verReclamo" OnCommand="verReclamo_Command" CommandArgument='<%# Eval("ralertas.idReclamo") %>' runat="server"><%# Eval("ralertas.rReclamos.titulo") %></asp:LinkButton>
                                                        </ItemTemplate>

                                                    </asp:TemplateField>

                                                    <asp:BoundField DataField="ralertas.nota" HeaderText="Nota" HeaderStyle-Width="350px" />

                                                    <asp:TemplateField HeaderText="Fec.Siniestro" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" SortExpression="pHeader.fechaSiniestro">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Format(Eval("ralertas.rReclamos.pHeader.fechaSiniestro"), "dd/MM/yy")%>'></asp:Label>
                                                        </ItemTemplate>

                                                        <HeaderStyle Width="30px"></HeaderStyle>

                                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <%--<asp:TemplateField HeaderText="Ult.Oferta Aut." ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" SortExpression="ultimaOferta">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Labe1111l1" runat="server" Text='<%# Eval("rReclamos.ultimaOferta")%>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="30px"></HeaderStyle>

                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>--%>



                                                    <%-- <asp:TemplateField HeaderText="Fec.Parte" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Labe11l1" runat="server" Text='<%# Format(Eval("pHeader.fechaParte"), "dd/MM/yy")%>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="30px"></HeaderStyle>

                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="Fec.Reclamo" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labe111l1" runat="server" Text='<%# Format(Eval("ralertas.rreclamos.fecha"), "dd/MM/yy")%>'></asp:Label>
                                                        </ItemTemplate>

                                                        <HeaderStyle Width="30px"></HeaderStyle>

                                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    </asp:TemplateField>

                                                    <%--                                                <asp:TemplateField HeaderText="Fec.Res." ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" SortExpression="fechaResolucion">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Labehh111l1" runat="server" Text='<%# Format(Eval("fechaResolucion"), "dd/MM/yy")%>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="30px"></HeaderStyle>

                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Monto Reclamado" HeaderStyle-Width="250px" SortExpression="tTipoNovedad.rubro">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2ss2" runat="server" Text='<%# IIf(Eval("montoreclamado") = 0, "", Eval("montoreclamado"))   %>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="250px"></HeaderStyle>
                                                </asp:TemplateField>

                                                    --%>
                                                    <asp:TemplateField HeaderText="Rubro" SortExpression="tTipoNovedad.rubro">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2ss2ss" runat="server" Text='<%# Eval("ralertas.rreclamos.tTipoNovedad.rubro")  %>'></asp:Label>
                                                        </ItemTemplate>

                                                       
                                                    </asp:TemplateField>


                                                    <asp:TemplateField HeaderText="Estado" SortExpression="tTipoNovedad.novedad">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label22" runat="server" Text='<%# Eval("ralertas.rreclamos.tTipoNovedad.novedad")  %>'></asp:Label>
                                                        </ItemTemplate>

                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Empresa">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label231" runat="server" Text='<%# Eval("ralertas.rreclamos.pHeader.EmpresaAbreviada")  %>'></asp:Label>
                                                        </ItemTemplate>

                                                    </asp:TemplateField>

                                                    <%-- <asp:TemplateField HeaderText="Apertura" HeaderStyle-Width="250px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2311" runat="server" Text='<%# Format(Eval("fechaUltApertura"), "dd/MM/yy")%>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="250px"></HeaderStyle>
                                                </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="Nivel Gravedad">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labeldd2ss2" runat="server" Text='<%# IIf(Eval("ralertas.rreclamos.idNivelGravedad") = 1, "Leve", IIf(Eval("ralertas.rreclamos.idNivelGravedad") = 2, "Grave", ""))   %>'></asp:Label>
                                                        </ItemTemplate>


                                                    </asp:TemplateField>

                                                </Columns>
                                            </asp:GridView>


                                            <asp:LinqDataSource ID="dsReclamos" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="ralertas.rReclamos.fecha desc" TableName="rAlertasUsuarios" Where='idUsuario = @idUsuario and ralertas.desdeFecha <= @hoy and ralertas.hastaFecha >= @hoy and ralertas.rReclamos.esRecupero == false and (ralertas.rReclamos.idUsuarioBaja == null)'>
                                                <WhereParameters>
                                                    <asp:Parameter DefaultValue="20211012" Name="hoy" Type="DateTime" />
                                                    <asp:Parameter DefaultValue="-1" Name="idUsuario" Type="Int32" />
                                                </WhereParameters>
                                            </asp:LinqDataSource>

                                        </div>


                                    </section>
                                    <%--</div>--%>






                                    <section style="//height: 200px" class="panel-body scrollbar scroll-y m-b">
                                        <div class="panel">

                                            Recuperos
                                            <asp:GridView ID="gvRecuperos" runat="server" AllowSorting="true" AutoGenerateColumns="False" DataSourceID="ldsRecuperos" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Siniestro" HeaderStyle-Width="60px" SortExpression="pHeader.siniestroCia">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="verSiniestro" OnCommand="verParte_Command" CommandArgument='<%# Eval("ralertas.rReclamos.idParte") %>' runat="server"><%# Eval("ralertas.rReclamos.pHeader.siniestroCia") %></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField HeaderText="Titulo" HeaderStyle-Width="250px" SortExpression="titulo">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="verReclamo" OnCommand="verReclamo_Command" CommandArgument='<%# Eval("ralertas.idReclamo") %>' runat="server"><%# Eval("ralertas.rReclamos.titulo") %></asp:LinkButton>
                                                        </ItemTemplate>

                                                    </asp:TemplateField>

                                                    <asp:BoundField DataField="ralertas.nota" HeaderText="Nota" HeaderStyle-Width="350px" />

                                                    <asp:TemplateField HeaderText="Fec.Siniestro" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" SortExpression="pHeader.fechaSiniestro">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Format(Eval("ralertas.rReclamos.pHeader.fechaSiniestro"), "dd/MM/yy")%>'></asp:Label>
                                                        </ItemTemplate>

                                                        <HeaderStyle Width="30px"></HeaderStyle>

                                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <%--<asp:TemplateField HeaderText="Ult.Oferta Aut." ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" SortExpression="ultimaOferta">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Labe1111l1" runat="server" Text='<%# Eval("rReclamos.ultimaOferta")%>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="30px"></HeaderStyle>

                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>--%>



                                                    <%-- <asp:TemplateField HeaderText="Fec.Parte" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Labe11l1" runat="server" Text='<%# Format(Eval("pHeader.fechaParte"), "dd/MM/yy")%>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="30px"></HeaderStyle>

                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>--%>
                                                    
                                                    <%--                                                <asp:TemplateField HeaderText="Fec.Res." ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" SortExpression="fechaResolucion">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Labehh111l1" runat="server" Text='<%# Format(Eval("fechaResolucion"), "dd/MM/yy")%>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="30px"></HeaderStyle>

                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Monto Reclamado" HeaderStyle-Width="250px" SortExpression="tTipoNovedad.rubro">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2ss2" runat="server" Text='<%# IIf(Eval("montoreclamado") = 0, "", Eval("montoreclamado"))   %>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="250px"></HeaderStyle>
                                                </asp:TemplateField>

                                                    --%>
                                                    <asp:TemplateField HeaderText="Rubro" SortExpression="tTipoNovedad.rubro">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2ss2ss" runat="server" Text='<%# Eval("ralertas.rreclamos.tTipoNovedad.rubro")  %>'></asp:Label>
                                                        </ItemTemplate>

                                                       
                                                    </asp:TemplateField>


                                                    <asp:TemplateField HeaderText="Estado" SortExpression="tTipoNovedad.novedad">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label22" runat="server" Text='<%# Eval("ralertas.rreclamos.tTipoNovedad.novedad")  %>'></asp:Label>
                                                        </ItemTemplate>

                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Empresa">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label231" runat="server" Text='<%# Eval("ralertas.rreclamos.pHeader.EmpresaAbreviada")  %>'></asp:Label>
                                                        </ItemTemplate>

                                                    </asp:TemplateField>

                                                    <%-- <asp:TemplateField HeaderText="Apertura" HeaderStyle-Width="250px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2311" runat="server" Text='<%# Format(Eval("fechaUltApertura"), "dd/MM/yy")%>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="250px"></HeaderStyle>
                                                </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="Nivel Gravedad">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labeldd2ss2" runat="server" Text='<%# IIf(Eval("ralertas.rreclamos.idNivelGravedad") = 1, "Leve", IIf(Eval("ralertas.rreclamos.idNivelGravedad") = 2, "Grave", ""))   %>'></asp:Label>
                                                        </ItemTemplate>


                                                    </asp:TemplateField>

                                                </Columns>
                                            </asp:GridView>


                                            <asp:LinqDataSource ID="ldsRecuperos" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="ralertas.rReclamos.fecha desc" TableName="rAlertasUsuarios" Where='idUsuario = @idUsuario and ralertas.desdeFecha <= @hoy and ralertas.hastaFecha >= @hoy and ralertas.rReclamos.esRecupero == true and (ralertas.rReclamos.idUsuarioBaja == null)'>
                                                <WhereParameters>
                                                    <asp:Parameter DefaultValue="20211012" Name="hoy" Type="DateTime" />
                                                    <asp:Parameter DefaultValue="-1" Name="idUsuario" Type="Int32" />
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
