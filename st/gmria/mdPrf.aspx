<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/st/SiteST.master" CodeBehind="mdPrf.aspx.vb" Inherits="Dynamic_Data.mdPrf" %>

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
                    <div class="col-sm-6">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Gomeria</span>
                                        <div class="form-inline">
                                            Medicion de Profundidad&nbsp;&nbsp;
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
                                                <div class="col-sm-4">
                                                    <label for="ddUbicacion">Ubicacion</label>
                                                    <asp:ListBox ID="ddUbicacion" Height="100" runat="server" CssClass="form-control input-sm entTab" DataTextField="text" DataValueField="id"></asp:ListBox>


                                                </div>
                                                <div class="col-sm-4">
                                                    <label for="tbMedicion">Profundidad</label>
                                                    <asp:TextBox ID="tbMedicion" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>

                                                    <label id="lDestino" runat="server" for="ddAccionBajaXError">Inconveniente</label>
                                                    <asp:DropDownList ID="ddInconveniente" AppendDataBoundItems="true" CssClass="form-control input-sm entTab" data-next="ddMecanico" ClientIDMode="Static" runat="server" DataTextField="Tipo" DataValueField="id" DataSourceID="LinqDataSource2">
                                                        <asp:ListItem Value="-2" Selected="True">Sin Inconvenientes</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="prTipoInconveniente" Where="idTipoTarea == 2">
                                                    </asp:LinqDataSource>
                                                </div>



                                                <div class="col-sm-4">
                                                    <label for="buttonPrecio">-</label>
                                                    <asp:Button ID="buttonPrecio" OnClick="buttonPrecio_Click" OnClientClick="this.style.visibility = 'hidden'" ClientIDMode="Static" CssClass=" btn form-control btn-primary btn-xs" runat="server" Text="Ingresar" />
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
                                        <span class="label bg-danger pull-right">Cubiertas</span>
                                        Mediciones de Profundidad
                                    </header>
                                    <div>
                                        <asp:GridView ID="GridView1" runat="server" ShowFooter="true" AutoGenerateColumns="False" DataKeyNames="id" OnRowDeleting="GridView1_RowDeleting" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender">
                                            <Columns>
                                                <asp:BoundField DataField="Ubicacion" HeaderText="Ubcacion" SortExpression="stOrdenGomeriaDetalle.stUbicaciones.Ubicacion" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                </asp:BoundField>

                                                <asp:BoundField DataField="nroPartida" HeaderText="# Partida" SortExpression="Desc_Repuesto" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                </asp:BoundField>

                                                <asp:BoundField DataField="ulTimaMedicion" HeaderText="Ultima Medicion" SortExpression="nroPartida" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                </asp:BoundField>

                                                <asp:BoundField DataField="medicion" HeaderText="Profundidad" SortExpression="nroPartida" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                </asp:BoundField>

                                                <asp:CommandField ShowDeleteButton="True" DeleteText="Borrar" ItemStyle-HorizontalAlign="Center" />

                                            </Columns>

                                            <RowStyle CssClass="td"></RowStyle>
                                        </asp:GridView>


                                        <%-- <asp:LinqDataSource ID="gridDataSource" runat="server" ContextTypeName="gLinq.StockDataContext" EntityTypeName="" TableName="DetalleFactura" EnableDelete="True" EnableUpdate="True" Where="idFactura == @idFactura">
                                            <WhereParameters>
                                                <asp:Parameter DefaultValue="1" Name="idFactura" Type="Int32" />
                                            </WhereParameters>

                                        </asp:LinqDataSource>--%>



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
