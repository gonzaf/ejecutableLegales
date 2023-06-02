<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/st/SiteST.master"
    CodeBehind="ordenesAsistenciaDetalle.aspx.vb" Inherits="Dynamic_Data.OrdenesAsistenciaDetalle" %>

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

        .flex {
            display: flex;
        }

        .flex-end {
            justify-content: end;
        }

        .flex-align-bottom {
            align-items: flex-end;
        }

        .margin-1-rem {
            margin: 1rem;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="gLinq.StockDataContext"
        EntityTypeName="" OrderBy="Nombre" TableName="Personas">
    </asp:LinqDataSource>



    <section id="content">
        <section class="main padder">
            <form id="form2" runat="server">
                <input type="hidden" id="imprimir" name="imprimir" value="true" />
                <div class="row no-gutter">

                    <div class="row">
                        <div class="panel-body">
                            <section class="panel">
                                <header class="panel-heading">
                                    <div class="form-inline"><b>Detalle Orden de Trabajo</b></div>
                                </header>
                                <div class="panel-body" style="padding: 10px 30px 10px 30px">
                                    <div class="form-horizontal">

                                        <div class="form-group flex flex-align-bottom">

                                            <%--
                                                fecha ~
                                                interno ~ 
                                                cabecera ~
                                                chofer ~
                                                tipo ~
                                                estado ~
                                                empresa ~
                                            --%>

                                            <%--                        
                                                detalle x
                                                telefonoChofer x
                                                auxiliador x
                                                remolque x
                                                perdidaKms x
                                                taller x
                                                motivoSistema x
                                                motivoSubsistema x
                                                motivoComponente x
                                                otroMotivo x
                                                causa x
                                                recomendacion x
                                            --%>

                                            <div class="col">
                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Fecha Llamado</label>
                                                    <asp:TextBox ID="fecha" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>

                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Coche</label>
                                                    <asp:TextBox ID="interno" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>

                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Cabecera</label>
                                                    <asp:TextBox ID="cabecera" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>

                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Chofer</label>
                                                    <asp:TextBox ID="chofer" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>
                                            </div>


                                            <div class="col">
                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Tipo</label>
                                                    <asp:TextBox ID="tipo" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>

                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Detalle</label>
                                                    <asp:TextBox ID="detalle" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>

                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Telefono Chofer</label>
                                                    <asp:TextBox ID="telefonoChofer" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>

                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Causa</label>
                                                    <asp:TextBox ID="causa" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col">
                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Auxiliador</label>
                                                    <asp:TextBox ID="auxiliador" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>

                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Con Remolque</label>
                                                    <asp:TextBox ID="remolque" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>

                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Perdida Kms</label>
                                                    <asp:TextBox ID="perdidaKms" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>

                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Taller</label>
                                                    <asp:TextBox ID="taller" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col">
                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Motivo Sistema</label>
                                                    <asp:TextBox ID="motivoSistema" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>

                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Motivo Subsistema</label>
                                                    <asp:TextBox ID="motivoSubsistema" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>

                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Motivo Componente</label>
                                                    <asp:TextBox ID="motivoComponente" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>

                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Otros Motivos</label>
                                                    <asp:TextBox ID="otroMotivo" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col">

                                                <div class="margin-1-rem">
                                                    <label class="col control-label">Recomendación</label>
                                                    <asp:TextBox ID="recomendacion" runat="server" Enabled="false" ClientIDMode="Static" CssClass="entTab form-control">
                                                    </asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col margin-1-rem">
                                                <label class="col control-label">Estado</label>
                                                <div class="col">
                                                    <asp:DropDownList ID="ddEstado" AppendDataBoundItems="true" runat="server" CssClass="form-control input-sm entTab" DataTextField="Label" DataValueField="Id">
                                                        <asp:ListItem Text="Sin Estado" Value="-2" Selected="True"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                </div>

                            </section>
                        </div>
                    </div>

                    <div class="flex flex-end">
                        <div class="margin-1-rem">

                            <asp:Button ID="btnCerrar" runat="server" Text="Cerrar Orden de Asistencia"
                                Visible="false"
                                CssClass="btn btn-danger"
                                Style="color: #242424; cursor: pointer;" />

                        </div>
                        <div class="margin-1-rem">

                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar Cambios"
                                CssClass="btn btn-warning"
                                Style="color: #242424; cursor: pointer;" />

                        </div>
                        <div class="margin-1-rem">

                            <asp:Button ID="volver" runat="server" Text="Volver"
                                CssClass="btn btn-primary"
                                Style="color: #242424; cursor: pointer;" />

                        </div>
                    </div>
                </div>


            </form>
        </section>
    </section>



    <script>


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
