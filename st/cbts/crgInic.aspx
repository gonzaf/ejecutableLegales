<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/st/SiteST.master" CodeBehind="crgInic.aspx.vb" Inherits="Dynamic_Data.crgInic" %>

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
                                        <span class="label bg-danger pull-right">Cubiertas</span>
                                        <div class="form-inline">
                                            Carga Inicial de Cubiertas en los Internos&nbsp;&nbsp; 
                                        </div>
                                    </header>
                                    <div class="panel-body" style="padding: 10px 30px 10px 30px">


                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-12">
                                                    <label for="ddDeposito">Partida</label><asp:DropDownList ID="ddPartidas" CssClass="form-control input-sm entTab" data-next="ddMecanico" ClientIDMode="Static" runat="server" DataTextField="completo" DataValueField="id"></asp:DropDownList>
                                                     <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Green" Font-Bold="true" CssClass="DDValidator" Display="Dynamic" />
                                                    <asp:CustomValidator ID="CustomValidator1" runat="server" Visible="false" ErrorMessage="CustomValidator" Display="Dynamic"> </asp:CustomValidator>

                                                </div>
                                                <div class="col-sm-0">
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-12">
                                                    <label for="ddUbic">Ubicacion</label>
                                                    <asp:DropDownList ID="ddUbic" CssClass="form-control input-sm entTab" ClientIDMode="Static" runat="server" DataTextField="Ubicacion" DataValueField="idUbicacion"></asp:DropDownList>
                                                </div>
                                                <div class="col-sm-0">
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-4">
                                                   <label for="detalle">Coche</label>
                                                    <asp:TextBox ID="tbCoche" runat="server" placeholder="Enter para buscar" ClientIDMode="Static" data-next="ubicacion" data-button="buttonCoche" CssClass="form-control input-sm clickButton" Text=""></asp:TextBox>
                                                    <asp:Button ID="buttonCoche" Style="display: none" OnClick="buttonCoche_Click" ClientIDMode="Static" CssClass=" btn form-control btn-primary btn-xs" runat="server" Text="Agregar" />
                                                </div>
                                                <div class="col-sm-4">
                                                  <label for="detalle">Fecha</label>
                                                  <asp:TextBox ID="fecha" runat="server" ClientIDMode="Static" data-next="tbKms" autocomplete="off" CssClass="form-control input-sm datepicker entTab" Text=""></asp:TextBox>
                                                </div>
                                                <div class="col-sm-4">
                                                    <label for="detalle">Kms.Iniciales.Coche</label>
                                                    <asp:TextBox ID="tbKms" runat="server" ClientIDMode="Static" data-next="ubicacion" data-button="buttonPrecio" CssClass="form-control input-sm clickButton" Text=""></asp:TextBox>
                                                    <br />
                                                    <asp:Button ID="buttonPrecio" OnClick="buttonPrecio_Click" ClientIDMode="Static" CssClass=" btn form-control btn-primary btn-xs" runat="server" Text="Agregar" />
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
