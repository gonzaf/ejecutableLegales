<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.master" CodeBehind="rclms.aspx.vb" Inherits="Dynamic_Data.rclms" %>

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
                                        <span class="label bg-danger pull-right">Abiertos</span>
                                        <div class="form-inline">
                                            Reclamos&nbsp;&nbsp; 
                                            <%--                                            <asp:TextBox ID="fechaVentas" runat="server" ClientIDMode="Static" CssClass="input-sm form-control datepicker" Width="80px"></asp:TextBox>
                                            <asp:Button ID="buttonfechaVentas" OnClick="buttonfechaVentas_Click" ClientIDMode="Static" runat="server" Text="Button" Style="visibility: hidden" />--%>
                                            <asp:DropDownList ID="ddRubros" AutoPostBack="true" OnSelectedIndexChanged="ddRubros_SelectedIndexChanged" AppendDataBoundItems="true" CssClass="form-control input-sm entTab" runat="server">
                                                <asp:ListItem Selected="True" Value="Express">Express</asp:ListItem>
                                                <asp:ListItem Value="Extrajudicial">Extrajudicial</asp:ListItem>
                                                <asp:ListItem Value="Mediacion">Mediacion</asp:ListItem>
                                                <asp:ListItem Value="Juicio">Juicio</asp:ListItem>
                                                <asp:ListItem Value="gf">Todos</asp:ListItem>
                                            </asp:DropDownList>


                                            <asp:DropDownList ID="ddTiposNovedades" AutoPostBack="true" AppendDataBoundItems="true" CssClass="form-control input-sm entTab" runat="server" DataSourceID="dsTiposNovedades" DataTextField="n" DataValueField="idTipoNovedad">
                                                <asp:ListItem Selected="True" Value="-2">Rubro-Etapa</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:LinqDataSource ID="dsTiposNovedades" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" Select="new (rubro & '-' & Novedad  as n, idTipoNovedad)" TableName="tTipoNovedad" Where='reclamo == true and (idTipoNovedad != 0) and (rubro == @rubro or @rubro == "gf")'>
                                                <WhereParameters>
                                                    <asp:Parameter DefaultValue="0" Name="idTipoNovedad" Type="Int32" />
                                                    <asp:ControlParameter ControlID="ddRubros" Name="rubro" PropertyName="SelectedValue" Type="String" />
                                                </WhereParameters>
                                            </asp:LinqDataSource>

                                              <asp:DropDownList ID="ddNovedadesAgrupadas" AutoPostBack="true" AppendDataBoundItems="true" CssClass="form-control input-sm entTab" runat="server" DataSourceID="dsNA" DataTextField="Novedad" DataValueField="Novedad">
                                                <asp:ListItem Selected="True" Value="todos">Etapa</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:LinqDataSource ID="dsNA" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="vTipoNovedadAgrupada" Where='reclamo == false'>
                                            </asp:LinqDataSource>

                                            <asp:DropDownList ID="ddNivelGravedad" AutoPostBack="true" AppendDataBoundItems="true" CssClass="form-control input-sm entTab" runat="server">
                                                <asp:ListItem Selected="True" Value="-2">Nivel de Gravedad</asp:ListItem>
                                                <asp:ListItem Value="1">Leve</asp:ListItem>
                                                <asp:ListItem Value="2">Grave</asp:ListItem>
                                            </asp:DropDownList>


                                        </div>
                                    </header>
                                    <section class="panel-body scrollbar scroll-y m-b">

                                        <asp:GridView ID="gvReclamos" runat="server" DataKeyNames="idReclamo" AllowSorting="true" AutoGenerateColumns="False" DataSourceID="dsReclamos" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Siniestro" HeaderStyle-Width="60px" SortExpression="pHeader.siniestroCia">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="verSiniestro" OnCommand="verParte_Command" CommandArgument='<%# Eval("idParte") %>' runat="server"><%# Eval("pHeader.siniestroCia") %></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--   <asp:TemplateField HeaderText="Parte" HeaderStyle-Width="60px">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="verParte" OnCommand="verParte_Command" CommandArgument='<%# Eval("idParte") %>' runat="server"><%# Eval("idParte") %></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>

                                                <asp:TemplateField HeaderText="Titulo" HeaderStyle-Width="250px" SortExpression="titulo">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="verReclamo" OnCommand="verReclamo_Command" CommandArgument='<%# Eval("idReclamo") %>' runat="server"><%# Eval("titulo") %></asp:LinkButton>
                                                    </ItemTemplate>

                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Fec.Siniestro" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" SortExpression="pHeader.fechaSiniestro">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%# Format(Eval("pHeader.fechaSiniestro"), "dd/MM/yy")%>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="30px"></HeaderStyle>

                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Ult.Oferta Aut." ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" SortExpression="ultimaOferta">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Labe1111l1" runat="server" Text='<%# Eval("ultimaOferta")%>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="30px"></HeaderStyle>

                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>
                                                <%-- <asp:TemplateField HeaderText="Fec.Parte" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Labe11l1" runat="server" Text='<%# Format(Eval("pHeader.fechaParte"), "dd/MM/yy")%>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="30px"></HeaderStyle>

                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>--%>
                                                <%-- <asp:TemplateField HeaderText="Fec.Reclamo" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Labe111l1" runat="server" Text='<%# Format(Eval("fecha"), "dd/MM/yy")%>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="30px"></HeaderStyle>

                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>--%>

                                                <asp:TemplateField HeaderText="Fec.Res." ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" SortExpression="fechaResolucion">
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


                                                <asp:TemplateField HeaderText="Rubro" HeaderStyle-Width="250px" SortExpression="tTipoNovedad.rubro">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2ss2ss" runat="server" Text='<%# Eval("tTipoNovedad.rubro")  %>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="250px"></HeaderStyle>
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText="Estado" HeaderStyle-Width="250px" SortExpression="tTipoNovedad.novedad">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label22" runat="server" Text='<%# Eval("tTipoNovedad.novedad")  %>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="250px"></HeaderStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Empresa" HeaderStyle-Width="250px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label231" runat="server" Text='<%# Eval("pHeader.EmpresaAbreviada")  %>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="250px"></HeaderStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Apertura" HeaderStyle-Width="250px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2311" runat="server" Text='<%# Format(Eval("fechaUltApertura"), "dd/MM/yy")%>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="250px"></HeaderStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Nivel Gravedad" HeaderStyle-Width="250px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Labeldd2ss2" runat="server" Text='<%# IIf(Eval("idNivelGravedad") = 1, "Leve", IIf(Eval("idNivelGravedad") = 2, "Grave", ""))   %>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="250px"></HeaderStyle>
                                                </asp:TemplateField>

                                            </Columns>
                                        </asp:GridView>


                                        <asp:LinqDataSource ID="dsReclamos" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="fecha desc" TableName="rReclamos"  Where='(ttiponovedad.novedad == @novedad or @novedad == "todos") and (idNivelGravedad == @gravedad or @gravedad == -2) and esRecupero == false and (idUsuarioBaja == null) and (ttiponovedad.rubro == @rubro or @rubro == "gf") and (idUltimaNovedad == @idUltimaNovedad or -2 = @idUltimaNovedad) and (pHeader.linea != @l1 and pHeader.linea != @l2 and pHeader.linea != @l3 and pHeader.linea != @l4 and pHeader.linea != @l5 and pHeader.linea != @l6 and pHeader.linea != @l7 and pHeader.linea != @l8 and pHeader.linea != @l9 and pHeader.linea != @l10 and pHeader.linea != @l11 and pHeader.linea != @l12) '>
                                            <WhereParameters>
                                                <asp:ControlParameter ControlID="ddTiposNovedades" Name="idUltimaNovedad" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddNovedadesAgrupadas" Name="novedad" PropertyName="SelectedValue" Type="String" />
                                                <asp:ControlParameter ControlID="ddNivelGravedad" Name="gravedad" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddRubros" Name="rubro" PropertyName="Text" Type="String" />
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
