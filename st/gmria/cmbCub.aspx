<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/st/SiteST.master" CodeBehind="cmbCub.aspx.vb" Inherits="Dynamic_Data.cmbCub" %>

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
                                            Cambio de Cubierta&nbsp;&nbsp;
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
                                                    <label for="ddUbicacion">Ubic.A Retirar</label>
                                                    <asp:ListBox ID="ddUbicacion" Height="100" runat="server" CssClass="form-control input-sm entTab" DataTextField="text" DataValueField="id"></asp:ListBox>
                                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Font-Bold="true" CssClass="DDValidator" Display="Dynamic" />
                                                    <asp:CustomValidator ID="CustomValidator1" runat="server" Visible="false" ErrorMessage="CustomValidator" Display="Dynamic"> </asp:CustomValidator>
                                                    <br />
                                                    <label id="Label1" runat="server" visible="true" for="ddAccionBajaXError">Reparacion Inmediata</label>
                                                    <asp:DropDownList ID="ddReparacion" Visible="true" CssClass="form-control input-sm entTab" data-next="ddMecanico" ClientIDMode="Static" runat="server" DataTextField="Deposito" DataValueField="idDeposito">
                                                        <asp:ListItem Value="4" Text="Valvula"></asp:ListItem>
                                                        <asp:ListItem Value="5" Text="Pinchada"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <br />
                                                    <br />
                                                    <asp:Button ID="bReparar" OnClick="bReparar_Click" ClientIDMode="Static" CssClass=" btn form-control btn-primary btn-xs" runat="server" Text="Reparar" />
                                                </div>
                                                <div class="col-sm-8">
                                                    <label for="detalle">Cubierta a Colocar</label>
                                                    <asp:ListBox ID="lbPartidas" Height="100" runat="server" CssClass="form-control input-sm entTab" DataTextField="completo" DataValueField="id"></asp:ListBox>
                                                    <br />
                                                    <label for="ddAccion">Destino de cubierta retirada</label>
                                                    <asp:DropDownList ID="ddAccion" AutoPostBack="true" OnSelectedIndexChanged="ddAccion_SelectedIndexChanged" CssClass="form-control input-sm entTab" data-next="ddMecanico" ClientIDMode="Static" runat="server" DataTextField="Accion" DataValueField="id" DataSourceID="LinqDataSource2">
                                                    </asp:DropDownList>
                                                    <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="stTipoAccionRevision" Where="id != 9 && cubiertas == true">
                                                    </asp:LinqDataSource>
                                                    <br />
                                                    <%--<label for="ddMotivo">Motivo Baja</label>--%>
                                                    <asp:DropDownList Visible="false" ID="ddMotivo" AppendDataBoundItems="false" CssClass="form-control input-sm entTab" data-next="ddMecanico" ClientIDMode="Static" runat="server" DataTextField="Motivo" DataValueField="id" DataSourceID="ldsMotivos">
                                                    </asp:DropDownList>
                                                    <asp:LinqDataSource ID="ldsMotivos" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" TableName="stMotivosBaja">
                                                    </asp:LinqDataSource>

                                                    <label id="lPartida" visible="false" runat="server" for="tbPartidaCoche">Partida encontrada</label><asp:TextBox ID="tbPartidaCoche" Visible="false" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>

                                                    <label id="lDestino" runat="server" visible="false" for="ddAccionBajaXError">Destino de partida encontrada</label>
                                                    <asp:DropDownList ID="ddAccionBajaXError" Visible="false" AutoPostBack="true" OnSelectedIndexChanged="ddAccion_SelectedIndexChanged" CssClass="form-control input-sm entTab" data-next="ddMecanico" ClientIDMode="Static" runat="server" DataTextField="Accion" DataValueField="id" DataSourceID="LinqDataSource2">
                                                    </asp:DropDownList>


                                                    
                                                    <label id="lDestinoNuevo" runat="server" visible="false" for="ddAccionBajaXError">Deposito Destino</label>
                                                    <asp:DropDownList ID="ddDestinoNuevo" Visible="false" AutoPostBack="true" CssClass="form-control input-sm entTab" data-next="ddMecanico" ClientIDMode="Static" runat="server" DataTextField="Deposito" DataValueField="idDeposito">
                                                    </asp:DropDownList>




                                                    <asp:CheckBox ID="cbGenerarOrdenRevision" Text="Generar orden de Revision" Visible="false" runat="server" />
                                                    <br />
                                                    <asp:Button ID="buttonPrecio" OnClientClick="this.style.visibility = 'hidden'" OnClick="buttonPrecio_Click" ClientIDMode="Static" CssClass=" btn form-control btn-primary btn-xs" runat="server" Text="Cambiar" />
                                                    <%--<label for="ddDepositoDestino">Ubicacion 2</label><asp:DropDownList ID="ddUbicacion2" CssClass="form-control input-sm entTab" data-next="ddMecanico" ClientIDMode="Static" runat="server" DataTextField="Deposito" DataValueField="idDeposito" OnSelectedIndexChanged="ddDeposito_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>--%>
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
                                        Cambios de cubiertas
                                    </header>
                                    <div>
                                        <asp:GridView ID="GridView1" runat="server" ShowFooter="true" AutoGenerateColumns="False" DataKeyNames="id" OnRowDeleting="GridView1_RowDeleting" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender">
                                            <Columns>
                                                <asp:BoundField DataField="stOrdenGomeriaDetalle.stUbicaciones.Ubicacion" HeaderText="Ubcacion" SortExpression="stOrdenGomeriaDetalle.stUbicaciones.Ubicacion" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                </asp:BoundField>

                                                <asp:BoundField DataField="stPartidas.nroPartida" HeaderText="Colocar" SortExpression="Desc_Repuesto" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                </asp:BoundField>

                                                <asp:BoundField DataField="stPartidas1.nroPartida" HeaderText="Retirar" SortExpression="nroPartida" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
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
