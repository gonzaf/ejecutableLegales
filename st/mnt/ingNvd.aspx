<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/st/SiteST.master" CodeBehind="ingNvd.aspx.vb" Inherits="Dynamic_Data.ingNvd" %>

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


    <asp:DynamicDataManager ID="DynamicDataManager1" runat="server">
        <DataControls>

            <asp:DataControlReference ControlID="gridview1" />

        </DataControls>
    </asp:DynamicDataManager>



    <section id="content">
        <section class="main padder">
            <form id="form2" runat="server">
                <input type="hidden" id="imprimir" name="imprimir" value="true" />
                <div class="row no-gutter">
                    <div class="col-sm-6">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Novedades</span>
                                        <div class="form-inline">
                                            Ingreso de Novedades&nbsp;&nbsp;
                                        </div>
                                    </header>
                                    <div class="panel-body" style="padding: 10px 30px 10px 30px">


                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-2">
                                                    <label for="ddDeposito">Coche</label><asp:TextBox ID="tbCoche" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-3">
                                                    <label for="ddDepositoDestino">Patente</label><asp:TextBox ID="tbPatente" Enabled="false" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-3">
                                                    <label for="ddDepositoDestino">Legajo Solicitante</label><asp:TextBox ID="tbLegajo" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-4">
                                                    <label for="ddDepositoDestino">Rubro</label><asp:TextBox ID="tbRubro" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-lg-12">
                                                    <label for="ddDepositoDestino">Observaciones</label><asp:TextBox ID="tbObs" TextMode="MultiLine" Rows="3" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-0"></div>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="form-group">

                                                <div class="col-sm-10">
                                                    <label for="tbMedicion">Novedad</label>
                                                    <asp:TextBox ID="tbNovedad" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>

                                                </div>

                                                <div class="col-sm-2">
                                                    <label for="buttonPrecio">-</label>
                                                    <asp:Button ID="buttonPrecio" OnClick="buttonPrecio_Click" OnClientClick="this.style.visibility = 'hidden'" ClientIDMode="Static" CssClass=" btn form-control btn-primary btn-xs" runat="server" Text="Agregar" />
                                                    <%--<label for="ddDepositoDestino">Ubicacion 2</label><asp:DropDownList ID="ddUbicacion2" CssClass="form-control input-sm entTab" data-next="ddMecanico" ClientIDMode="Static" runat="server" DataTextField="Deposito" DataValueField="idDeposito" OnSelectedIndexChanged="ddDeposito_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>--%>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Font-Bold="true" CssClass="DDValidator" Display="Dynamic" />
                                            <asp:CustomValidator ID="CustomValidator1" runat="server" Visible="false" ErrorMessage="CustomValidator" Display="Dynamic"> </asp:CustomValidator>
                                            <asp:CheckBox ID="cbIgnorar" Text="Ignorar Medicion Incorrecta" Visible="false" runat="server" />
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
                                                    <asp:Button ID="Enviar" OnClientClick="this.style.visibility = 'hidden'" runat="server" Enabled="true" Text="Guardar" Visible="true" CssClass="btn btn-primary btn-xs" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </section>
                            </div>
                        </section>


                    </div>

                    <div class="col-sm-6">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Novedades</span>
                                        Novedades
                                    </header>
                                    <div>
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ds" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender" ShowFooter="True">
                                            <Columns>
                                                <asp:DynamicField DataField="detalle" HeaderText="Novedad" />
                                                <%--<asp:TemplateField ItemStyle-CssClass="btn-group">
                                                                <ItemTemplate>
                                                                        <asp:LinkButton ID="btnEditar" runat="server"
                                                                            CommandName="Edit" ToolTip="Editar">
                                                                            <i class="fa fa-pencil fa-lg " style="margin-right: 12px;"></i>
                                                                        </asp:LinkButton>
                                                                        <asp:LinkButton ID="LinkButton1" runat="server"
                                                                            CommandName="Delete" ToolTip="Borrar">
                                                                            <i class="fa fa-times fa-lg text-danger"></i>
                                                                        </asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>--%>
                                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="true" />
                                            </Columns>
                                        </asp:GridView>
                                        <asp:LinqDataSource ID="ds" runat="server" EnableDelete="True" EnableUpdate="true" ContextTypeName="leglinq.LegalesDataContext" EntityTypeName="" TableName="mNovedadDetalle" Where="idNovedad == @idNovedad">
                                            <WhereParameters>
                                                <asp:Parameter DefaultValue="-1" Name="idNovedad" Type="Int32" />
                                            </WhereParameters>
                                        </asp:LinqDataSource>
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
