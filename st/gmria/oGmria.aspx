<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/st/SiteST.master" CodeBehind="oGmria.aspx.vb" Inherits="Dynamic_Data.oGmria" %>

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
                    <div class="col-sm-5">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Gomeria</span>
                                        <div class="form-inline">
                                            Orden de Gomeria&nbsp;&nbsp; 
                                        </div>
                                    </header>
                                    <div class="panel-body" style="padding: 10px 30px 10px 30px">


                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-3">
                                                    <label for="ddDeposito">Coche</label><asp:TextBox ID="tbCoche" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-9">
                                                    <%--<label for="ddDepositoDestino">Gomero</label><asp:DropDownList ID="ddGomero" CssClass="form-control input-sm entTab" data-next="ddMecanico" ClientIDMode="Static" runat="server" DataTextField="Detalle" DataValueField="idUser" ></asp:DropDownList>--%>
                                                </div>
                                            </div>

                                        </div>

                                        <%--  <div class="form-group">
                                              <div class="col-lg-12">
                                                    <asp:TextBox ID="observaciones" runat="server" class="form-control" placeholder="Detalle" Rows="4" TextMode="MultiLine"></asp:TextBox>
                                                    
                                                   
                                                </div>
                                            </div>--%>


                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-6">
                                                    <label for="ddDepositoDestino">Tarea</label>
                                                    <asp:DropDownList ID="ddTipoAcciones" CssClass="form-control input-sm entTab" AutoPostBack="true" OnSelectedIndexChanged="ddTipoAcciones_SelectedIndexChanged" data-next="ddMecanico" ClientIDMode="Static" runat="server" DataTextField="Tarea" DataValueField="id">
                                                    </asp:DropDownList>
                                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Font-Bold="true" CssClass="DDValidator" Display="Dynamic" />
                                                    <asp:CustomValidator ID="CustomValidator1" runat="server" Visible="false" ErrorMessage="CustomValidator" Display="Dynamic"> </asp:CustomValidator>
                                                </div>
                                                <div class="col-sm-6">
                                                    <label for="ddDepositos">Deposito</label>
                                                    <asp:DropDownList ID="ddDepositos" AppendDataBoundItems="true" runat="server" AutoPostBack="true" CssClass="form-control input-sm entTab" DataTextField="Deposito" DataValueField="idDeposito">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-6">
                                                    <label for="ddUbicacion">Ubicacion</label>
                                                    <asp:ListBox ID="ddUbicacion" runat="server" CssClass="form-control input-sm entTab" style=height:157px DataTextField="Ubicacion" DataValueField="idUbicacion"></asp:ListBox>
                                                    <%--<asp:DropDownList ID="ddUbicacion1"  CssClass="form-control input-sm entTab" data-next="ddMecanico" ClientIDMode="Static" runat="server" DataTextField="Deposito" DataValueField="idDeposito" OnSelectedIndexChanged="ddDeposito_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>--%>
                                                   
                                                </div>

                                                <div id="divUb2" runat="server" class="col-sm-6">
                                                    <label for="ddUbicacion">Ubicacion 2</label>
                                                    <asp:ListBox ID="ddUbicacion2" runat="server" CssClass="form-control input-sm entTab" style=height:120px DataTextField="Ubicacion" DataValueField="idUbicacion"></asp:ListBox>
                                                    <%--<asp:DropDownList ID="ddUbicacion1"  CssClass="form-control input-sm entTab" data-next="ddMecanico" ClientIDMode="Static" runat="server" DataTextField="Deposito" DataValueField="idDeposito" OnSelectedIndexChanged="ddDeposito_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>--%>
                                                   
                                                    <div class="checkbox">
                                                        <label>
                                                          <asp:CheckBox ID="cbRetirar" Text="Retirar Cubierta" runat="server" />
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-12">
                                                    <label for="detalle">Observaciones</label>
                                                    <asp:TextBox ID="detalle" runat="server" TextMode="MultiLine" Rows="2" ClientIDMode="Static" data-next="ubicacion" data-button="buttonPrecio" CssClass="form-control input-sm" Text=""></asp:TextBox>
                                                    <br />
                                                    <asp:Button ID="buttonPrecio" OnClick="buttonPrecio_Click" ClientIDMode="Static" CssClass=" btn form-control btn-primary btn-xs" runat="server" Text="Agregar" />
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
                                                    <asp:Button ID="cancelar" runat="server" Enabled="true" Text="Cancelar" Visible="true" CssClass="btn btn-white btn-xs" />
                                                    <asp:Button ID="Enviar" runat="server" Enabled="true" Text="Guardar" Visible="true" CssClass="btn btn-primary btn-xs" />
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
                                        <span class="label bg-danger pull-right">Tareas</span>
                                        Tareas a Realizar
                                    </header>
                                    <div>
                                        <asp:GridView ID="GridView1" runat="server" ShowFooter="true" DataSourceID="gridDataSource" AutoGenerateColumns="False" DataKeyNames="id" OnRowDeleting="GridView1_RowDeleting" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender">
                                            <Columns>
                                                <asp:BoundField DataField="id" HeaderText="Id." SortExpression="id" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                </asp:BoundField>

                                                <asp:BoundField DataField="stTipoTareaGomeria.Tarea" HeaderText="Tarea" SortExpression="stTipoTareaGomeria.Tarea" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                </asp:BoundField>

                                                <asp:BoundField DataField="stUbicaciones.Ubicacion" HeaderText="Ubicacion" SortExpression="stUbicaciones.Ubicacion" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                </asp:BoundField>




                                                <asp:CommandField ShowDeleteButton="True" DeleteText="Borrar" ItemStyle-HorizontalAlign="Center" />

                                            </Columns>

                                            <RowStyle CssClass="td"></RowStyle>
                                        </asp:GridView>


                                        <asp:LinqDataSource ID="gridDataSource" runat="server" ContextTypeName="legLinq.legalesdatacontext" EntityTypeName="" TableName="stOrdenGomeriaDetalle" EnableDelete="True" EnableUpdate="True" Where="idOrden == @idOrden">
                                            <WhereParameters>
                                                <asp:Parameter DefaultValue="1" Name="idOrden" Type="Int32" />
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
