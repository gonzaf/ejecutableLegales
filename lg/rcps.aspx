<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.master" CodeBehind="rcps.aspx.vb" Inherits="Dynamic_Data.rcps" %>

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
                                            Recuperos&nbsp;&nbsp; 
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
                                            <asp:LinqDataSource ID="dsTiposNovedades" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" Select="new (rubro & '-' & Novedad  as n, idTipoNovedad)" TableName="tTipoNovedad" Where='reclamo == false and (rubro == @rubro or @rubro == "gf")'>
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
                                                <asp:ListItem Selected="True" Value="-2">Nivel Gravedad</asp:ListItem>
                                                <asp:ListItem Value="1">Leve</asp:ListItem>
                                                <asp:ListItem Value="2">Grave</asp:ListItem>
                                            </asp:DropDownList>
                                         

                                            <asp:DropDownList ID="ddCiaSeguros" AutoPostBack="true" AppendDataBoundItems="true" CssClass="form-control input-sm entTab" runat="server" DataSourceID="LinqDataSource1" DataTextField="CiaDeSeguro" DataValueField="idCiaDeSeguro">
                                                <asp:ListItem Selected="True" Value="-2">Cia. de Seguro</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="CiaDeSeguro" TableName="tCiaDeSeguro">
                                            </asp:LinqDataSource>

                                        </div>
                                    </header>
                                    <section class="panel-body scrollbar scroll-y m-b">

                                        <asp:GridView ID="gvReclamos" runat="server" DataKeyNames="idReclamo" AutoGenerateColumns="False" AllowSorting="true" DataSourceID="dsReclamos" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Siniestro" SortExpression="nroSiniestro" HeaderStyle-Width="60px">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="verSiniestro" OnCommand="verParte_Command" CommandArgument='<%# Eval("idParte") %>' runat="server"><%# Eval("nroSiniestro") %></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--  <asp:TemplateField HeaderText="Parte" HeaderStyle-Width="60px" SortExpression="idParte">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="verParte" OnCommand="verParte_Command" CommandArgument='<%# Eval("idParte") %>' runat="server"><%# Eval("idParte") %></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>

                                                <asp:TemplateField HeaderText="Recupero" HeaderStyle-Width="250px" SortExpression="titulo">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="verReclamo" OnCommand="verReclamo_Command" CommandArgument='<%# Eval("idReclamo") %>' runat="server"><%# Eval("titulo") %></asp:LinkButton>
                                                    </ItemTemplate>

                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Fec.Siniestro" ItemStyle-HorizontalAlign="Center" SortExpression="fechaSiniestro" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%# Format(Eval("fechaSiniestro"), "dd/MM/yy")%>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="30px"></HeaderStyle>

                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>
                                                <%--<asp:TemplateField HeaderText="Fec.Parte" ItemStyle-HorizontalAlign="Center" SortExpression="pHeader.fechaParte"  HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Labe11l1" runat="server" Text='<%# Format(Eval("pHeader.fechaParte"), "dd/MM/yy")%>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="30px"></HeaderStyle>

                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>--%>
                                                <%--<asp:TemplateField HeaderText="Fec.Reclamo" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" SortExpression="fecha">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Labe111ssl1" runat="server" Text='<%# Format(Eval("fecha"), "dd/MM/yy")%>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="30px"></HeaderStyle>

                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>--%>



                                                <asp:TemplateField HeaderText="Fec.Res." ItemStyle-HorizontalAlign="Center" SortExpression="fechaResolucion" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Labe111sl1" runat="server" Text='<%# Format(Eval("fechaResolucion"), "dd/MM/yy")%>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="30px"></HeaderStyle>

                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>




                                                <asp:TemplateField HeaderText="Estado" HeaderStyle-Width="250px" SortExpression="novedad">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label22" runat="server" Text='<%# Eval("novedad")  %>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="250px"></HeaderStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Cia.Seguro" HeaderStyle-Width="250px" SortExpression="tCiaDeSeguro.CiaDeSeguro">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ciaDeSeguro")  %>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="250px"></HeaderStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Abogado" HeaderStyle-Width="250px" SortExpression="tAbogados.apellido">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1112" runat="server" Text='<%# Eval("abogado") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="250px"></HeaderStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Linea" HeaderStyle-Width="250px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label231" runat="server" Text='<%# Eval("Linea")  %>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="250px"></HeaderStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Monto" HeaderStyle-Width="250px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Labeldd231" runat="server" Text='<%# Eval("montoReclamado")  %>'></asp:Label>
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


                                        <asp:LinqDataSource ID="dsReclamos" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="fecha desc" TableName="vRecuperos" Where='(idNivelGravedad == @gravedad or @gravedad == -2) and (novedad == @novedad or @novedad == "todos") and (idCiaDeSeguro == @ciaSeg or @ciaSeg == -2) and esRecupero == true and (idUsuarioBaja == null) and (rubro == @rubro or @rubro =="gf") and  (idUltimaNovedad == @idUltimaNovedad or -2 = @idUltimaNovedad) and (linea != @l1 and linea != @l2 and linea != @l3 and linea != @l4 and linea != @l5 and linea != @l6 and linea != @l7 and linea != @l8 and linea != @l9 and linea != @l10 and linea != @l11 and linea != @l12)'>
                                            <WhereParameters>
                                                <asp:ControlParameter ControlID="ddTiposNovedades" Name="idUltimaNovedad" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddNivelGravedad" Name="gravedad" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddNovedadesAgrupadas" Name="novedad" PropertyName="SelectedValue" Type="String" />
                                                <asp:ControlParameter ControlID="ddRubros" Name="rubro" PropertyName="SelectedValue" Type="string" />
                                                <asp:ControlParameter ControlID="ddCiaSeguros" Name="ciaSeg" PropertyName="SelectedValue" Type="Int32" />
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
