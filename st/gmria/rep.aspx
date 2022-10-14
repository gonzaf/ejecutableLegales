<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/st/SiteST.master" CodeBehind="rep.aspx.vb" Inherits="Dynamic_Data.rep" %>

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



    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="gLinq.StockDataContext" EntityTypeName="" OrderBy="Nombre" TableName="Personas">
    </asp:LinqDataSource>



    <section id="content">
        <section class="main padder">
            <form id="form2" runat="server">
                <input type="hidden" id="imprimir" name="imprimir" value="true" />
                <div class="row no-gutter">
                    <div class="col-sm-8">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Gomeria</span>
                                        <div class="form-inline">
                                            Reparacion&nbsp;&nbsp;
                                        </div>
                                    </header>
                                    <div class="panel-body" style="padding: 10px 30px 10px 30px">


                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-2">
                                                    <label for="ddDeposito">Coche</label><asp:TextBox ID="tbCoche" Enabled="false" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-5">
                                                    <label for="ddDepositoDestino">Taller</label><asp:TextBox ID="tbTaller" Enabled="false" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-5">
                                                    <label for="ddDepositoDestino">Gomero</label><asp:TextBox ID="tbGomero" Enabled="false" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-lg-12">
                                                    <label for="ddDepositoDestino">Observaciones</label><asp:TextBox ID="tbObs" Enabled="false" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>


                                                </div>
                                                <div class="col-lg-0"></div>
                                            </div>
                                        </div>
                                           <div class="row">
                                            <div class="form-group">
                                                <div class="col-lg-12">
                                                    <label for="ddDepositoDestino">Detalle</label><asp:TextBox ID="tbDetalle" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>


                                                </div>
                                                <div class="col-lg-0"></div>
                                            </div>
                                        </div>


                                        <%--  <div class="form-group">
                                              <div class="col-lg-12">
                                                    <asp:TextBox ID="observaciones" runat="server" class="form-control" placeholder="Detalle" Rows="4" TextMode="MultiLine"></asp:TextBox>
                                                    
                                                   
                                                </div>
                                            </div>--%>



                                        <div class="row">
                                            <div class="form-group">

                                                <br />

                                                <div class="col-sm-12">
                                                    <asp:GridView ID="GridView1" runat="server" ShowFooter="true" AutoGenerateColumns="False" DataKeyNames="idPartida1" OnRowDeleting="GridView1_RowDeleting" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender">
                                                        <Columns>
                                                            <asp:BoundField DataField="Detalle1" HeaderText="" SortExpression="stOrdenGomeriaDetalle.stUbicaciones.Ubicacion" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                            </asp:BoundField>

                                                            <asp:BoundField DataField="Detalle2" HeaderText="" SortExpression="Desc_Repuesto" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                            </asp:BoundField>


                                                            <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:HiddenField ID="hfIdPartida1" ClientIDMode="Static" runat="server" Value='<%# Eval("idPartida1")%>' />
                                                                    <asp:HiddenField ID="hfIdPartida2" ClientIDMode="Static" runat="server" Value='<%# Eval("idPartida2")%>' />
                                                                    <asp:HiddenField ID="hfIdDetalle" ClientIDMode="Static" runat="server" Value='<%# Eval("idDetalle")%>' />

                                                                    <asp:RadioButton ID="rbConf" Text="Confirmar" Checked="true" GroupName="RadioGroup1" runat="server" />
                                                                    --
                                                                    <asp:RadioButton ID="rbRecha" Text="Rechazar" GroupName="RadioGroup1" runat="server" />

                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                        </Columns>

                                                        <RowStyle CssClass="td"></RowStyle>
                                                    </asp:GridView>
                                                </div>


                                                <div class="col-sm-12">
                                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Font-Bold="true" CssClass="DDValidator" Display="Dynamic" />
                                                    <asp:CustomValidator ID="CustomValidator1" runat="server" Visible="false" ErrorMessage="CustomValidator" Display="Dynamic"> </asp:CustomValidator>

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
                                                    <asp:Button ID="cancelar" runat="server" Enabled="true" Text="Volver" Visible="true" CssClass="btn btn-white btn-xs" />
                                                    <asp:Button ID="reparada" OnClientClick="this.style.visibility = 'hidden'" runat="server" Enabled="true" Text="Reparada" Visible="true" CssClass="btn btn-primary btn-xs" />
                                                    <asp:Button ID="cambio" OnClientClick="this.style.visibility = 'hidden'" runat="server" Enabled="true" Text="Cambiar Cubierta" Visible="true" CssClass="btn btn-primary btn-xs" />
                                                </div>
                                            </div>
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
