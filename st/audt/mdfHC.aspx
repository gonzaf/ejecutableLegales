<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/st/SiteST.master" CodeBehind="mdfHC.aspx.vb" Inherits="Dynamic_Data.mdfHC" %>

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
                                        <span class="label bg-danger pull-right">Auditoria</span>
                                        <div class="form-inline">
                                            Modificacion de Cubierta en Interno&nbsp;&nbsp; 
                                        </div>
                                    </header>
                                    <div class="panel-body" style="padding: 10px 30px 10px 30px">

                                         <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-12">
                                                    <label for="ddUbic">Estado</label>
                                                    
                                                </div>
                                                <div class="col-sm-0">
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-4">
                                                   <label for="detalle">Interno</label>
                                                    <asp:TextBox ID="tbCoche" runat="server" Enabled="false" ClientIDMode="Static" data-next="ubicacion" data-button="buttonCoche" CssClass="form-control input-sm clickButton" Text=""></asp:TextBox>
                                                </div>
                                                <div class="col-sm-4">
                                                  <label for="detalle">Fecha Colocacion</label>
                                                  <asp:TextBox ID="tbFecha" Enabled="false" runat="server" ClientIDMode="Static" data-next="tbKms" autocomplete="off" CssClass="form-control input-sm" Text=""></asp:TextBox>
                                                </div>
                                                <%--<div class="col-sm-4">
                                                    <label for="detalle">Kms.Iniciales.Coche</label>
                                                    <asp:TextBox ID="tbKms" runat="server" Enabled="false" ClientIDMode="Static" data-next="ubicacion" data-button="buttonPrecio" CssClass="form-control input-sm" Text=""></asp:TextBox>
                                                   
                                                </div>--%>
                                            </div>
                                        </div>

                                         <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-12">
                                                    <label for="ddDeposito">Partida Actual</label><asp:TextBox ID="tbPartidaActual" runat="server" Enabled="false" ClientIDMode="Static" data-next="ubicacion" data-button="buttonPrecio" CssClass="form-control input-sm" Text=""></asp:TextBox>
                                                </div>
                                                <div class="col-sm-0">
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-12">
                                                    <label for="ddDeposito">Partida Correcta</label><asp:DropDownList ID="ddPartidas" CssClass="form-control input-sm entTab" data-next="ddMecanico" ClientIDMode="Static" runat="server" DataTextField="completo" DataValueField="id"></asp:DropDownList>
                                                     <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Green" Font-Bold="true" CssClass="DDValidator" Display="Dynamic" />
                                                    <asp:CustomValidator ID="CustomValidator1" runat="server" Visible="false" ErrorMessage="CustomValidator" Display="Dynamic"> </asp:CustomValidator>

                                                </div>
                                                <div class="col-sm-0">
                                                </div>
                                            </div>

                                        </div>

                                       

                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-4">
                                                 <%--  <label for="detalle">Coche</label>
                                                    <asp:TextBox ID="tbCoche" runat="server" placeholder="Enter para buscar" ClientIDMode="Static" data-next="ubicacion" data-button="buttonCoche" CssClass="form-control input-sm clickButton" Text=""></asp:TextBox>
                                                    <asp:Button ID="buttonCoche" Style="display: none" OnClick="buttonCoche_Click" ClientIDMode="Static" CssClass=" btn form-control btn-primary btn-xs" runat="server" Text="Agregar" />--%>
                                                </div>
                                                <div class="col-sm-4">
                                                  <%--<label for="detalle">Fecha</label>
                                                  <asp:TextBox ID="fecha" runat="server" ClientIDMode="Static" data-next="tbKms" autocomplete="off" CssClass="form-control input-sm datepicker entTab" Text=""></asp:TextBox>--%>
                                                </div>
                                                <div class="col-sm-4">
                                                  <%--  <label for="detalle">Kms.Iniciales.Coche</label>
                                                    <asp:TextBox ID="tbKms" runat="server" ClientIDMode="Static" data-next="ubicacion" data-button="buttonPrecio" CssClass="form-control input-sm clickButton" Text=""></asp:TextBox>
                                                    <br />--%>
                                                    <asp:Button ID="buttonPrecio" OnClick="buttonPrecio_Click" OnClientClick="return finalizar();" ClientIDMode="Static" CssClass=" btn form-control btn-primary btn-xs" runat="server" Text="Guardar" />
                                                    <%--<label for="ddDepositoDestino">Ubicacion 2</label><asp:DropDownList ID="ddUbicacion2" CssClass="form-control input-sm entTab" data-next="ddMecanico" ClientIDMode="Static" runat="server" DataTextField="Deposito" DataValueField="idDeposito" OnSelectedIndexChanged="ddDeposito_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>--%>
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
            var confirma = confirm('Esta seguro?');
            return confirma;
        }

        function eliminar() {
            var confirma = confirm('Queres eliminar la factura?');
            return confirma;
        }





    </script>

</asp:Content>
