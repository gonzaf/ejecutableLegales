<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/st/SiteST.master" CodeBehind="masInfo.aspx.vb" Inherits="Dynamic_Data.masInfo" %>

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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




    <section id="content">
        <section class="main padder">
            <form id="form2" runat="server">
                <input type="hidden" id="imprimir" name="imprimir" value="true" />
                <div class="row no-gutter">
                    <div class="col-sm-5">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Gomeria</span>
                                        <div class="form-inline">
                                            Info de Cubierta&nbsp;&nbsp;
                                        </div>
                                    </header>
                                    <div class="panel-body" style="padding: 10px 30px 10px 30px">


                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-2">
                                                    <label for="ddDeposito">Partida</label><asp:TextBox ID="tbPartida" Enabled="false" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-5">
                                                    <label for="ddDepositoDestino">Kms</label><asp:TextBox ID="tbKms" Enabled="false" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-5">
                                                    <label for="ddDepositoDestino">Estado</label><asp:TextBox ID="tbEstado" Enabled="false" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-9">
                                                    <label for="tbWhere">-</label><asp:TextBox ID="tbWhere" Enabled="false" runat="server" CssClass="form-control input-sm" placeholder="Detalle"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-3">
                                                    <label for="tbWhere">Cod.Repuesto</label><asp:TextBox ID="tbCodigo" Enabled="false" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-0">
                                                </div>
                                                <div class="col-sm-12">
                                                    <label for="tbTipo">Tipo</label>
                                                    <asp:TextBox ID="tbTipo" Enabled="false" runat="server" CssClass="form-control input-sm" placeholder="Detalle"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                        </div>
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-12 text-right m-t-large">
                                                    <%--<asp:Button ID="terminar" runat="server" Text="Cerrar Orden" OnClientClick="return finalizar();" Visible="false" CssClass="btn btn-primary btn-xs" />
                                                    <asp:Button ID="guardar" runat="server" Text="Continuar luego" Width="120px" CssClass="btn btn-white btn-xs" />
                                                    <asp:Button ID="eliminar" runat="server" Enabled="True" Text="Eliminar" Visible="false" OnClientClick="return eliminar();" CssClass="btn btn-white btn-xs" />
                                                    <asp:Button ID="desvincular" runat="server" Enabled="true" Text="Desvincular" Visible="false" CssClass="btn btn-white btn-xs" />
                                                    <asp:Button ID="reimprimir" runat="server" Enabled="true" Text="Reimprimir" Visible="false" CssClass="btn btn-white btn-xs" />--%>
                                                    <asp:Button ID="reparar" runat="server" Enabled="true" Text="Reparar" Visible="true" CssClass="btn btn-primary btn-xs" />
                                                    <asp:Button ID="recapar" runat="server" Enabled="true" Text="Recapar" Visible="true" CssClass="btn btn-primary btn-xs" />
                                                    <asp:Button ID="reclamar" runat="server" Enabled="true" Text="Reclamar" Visible="true" CssClass="btn btn-primary btn-xs" />
                                                    <asp:Button ID="cancelar" runat="server" Enabled="true" Text="Volver" Visible="true" CssClass="btn btn-white btn-xs" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </section>
                            </div>
                        </section>


                    </div>

                    <div class="col-sm-7">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Cubiertas</span>
                                        Info de Cubierta
                                    </header>
                                    <div>
                                        <asp:GridView ID="GridView1" runat="server" ShowFooter="true" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="gridDataSource" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender">
                                            <Columns>
                                                <asp:BoundField DataField="nroInterno" HeaderText="Interno" SortExpression="stOrdenGomeriaDetalle.stUbicaciones.Ubicacion" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="F.Inicio" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Format(Eval("fechaInicio"), "dd/MM/yy")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="F.Fin" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Labelaaa2" runat="server" Text='<%# Format(Eval("fechaFin"), "dd/MM/yy")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:BoundField DataField="stUbicaciones.Ubicacion" HeaderText="Ubicacion" SortExpression="Desc_Repuesto" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="stEstado.Estado" HeaderText="Estado" SortExpression="Desc_Repuesto" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                </asp:BoundField>

                                                <asp:TemplateField HeaderText="Kms" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Labelss2" runat="server" Text='<%#IIf(Eval("kmsIniciales") > 0 And Eval("kmsFinales") > 0, Eval("kmsFinales") - Eval("kmsIniciales"), "")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Modif." ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lbModif" ToolTip="Modif" OnCommand="lbModif_Command" Visible="false" CommandArgument='<%#Eval("id")%>' runat="server">Modif</asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                            </Columns>

                                            <RowStyle CssClass="td"></RowStyle>
                                        </asp:GridView>


                                        <asp:LinqDataSource ID="gridDataSource" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="stHistoricoCubiertas" Where="idCubierta == @id">
                                            <WhereParameters>
                                                <asp:Parameter DefaultValue="-1" Name="id" Type="Int32" />
                                            </WhereParameters>

                                        </asp:LinqDataSource>



                                        <%--<input id="basics" />--%>
                                        <%-- <div id="the-basics">
                                            <input class="typeahead" type="text" placeholder="States of USA">
                                        </div>--%>
                                        <%-- <select class="js-data-example-ajax">
                                            <option value="3620194" selected="selected">select2/select2</option>
                                        </select>--%>
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

        <%If mostrarDialogo Then%>
        $('#myModal').modal('show');
        <%End If%>
        

         <%If controlFocus <> "" Then%>
        setearFoco('<%=controlFocus%>')
         <%End If%>

        function finalizar() {
            var confirma = confirm('Desea cerrar la orden?');
            var imprime = confirm('Queres imprimir?');
            $("#imprimir").val(false);
            if (imprime) $("#imprimir").val(true);
            //alert(imprime);
            //alert($("#imprime").val());
            return confirma;
            //return false;
        }

        function eliminar() {
            var confirma = confirm('Queres eliminar la factura?');
            return confirma;
        }





    </script>

</asp:Content>
