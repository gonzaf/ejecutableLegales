<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/st/SiteST.master"
    EnableEventValidation="false" CodeBehind="altaOrdenesAsistencia.aspx.vb" Inherits="Dynamic_Data.AltaOrdenesAsistencia" %>

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

        .flex-wrap {
            flex-wrap: wrap;
        }

        .flex-column {
            flex-direction: column
        }

        .flex-end {
            justify-content: end;
        }

        .flex-align-bottom {
            align-items: flex-start;
        }

        .margin-1-rem {
            margin: 1rem;
        }

        .bold {
            font-weight: bold
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section id="content">
        <section class="main padder">
            <form id="form1" runat="server">
                <div class="row no-gutter">

                    <div class="row">
                        <div class="panel-body">

                            <section class="panel">
                                <header class="panel-heading">
                                    <div class="form-inline"><b>Alta Orden Asistencia</b></div>
                                </header>
                                <div class="panel-body" style="padding: 10px 30px 10px 30px">
                                    <div class="form-horizontal">

                                        <div class="form-group flex flex-align-bottom flex-column">

                                            <div class="flex">
                                                <div class="col margin-1-rem">
                                                    <label class="col control-label">Nro Quedo</label>
                                                    <asp:TextBox ID="nroQuedo"
                                                        runat="server"
                                                        AutoCompleteType="Disabled"
                                                        ClientIDMode="Static"
                                                        data-next="mecanico"
                                                        Enabled="false"
                                                        CssClass="entTab form-control input-sm">
                                                    </asp:TextBox>
                                                </div>

                                                <div class="col margin-1-rem">
                                                    <label class="col control-label">Fecha</label>
                                                    <asp:TextBox ID="fecha"
                                                        runat="server"
                                                        AutoCompleteType="Disabled"
                                                        ClientIDMode="Static"
                                                        data-next="mecanico"
                                                        Enabled="false"
                                                        CssClass="entTab form-control input-sm">
                                                    </asp:TextBox>
                                                </div>

                                                <div class="col margin-1-rem">
                                                    <label class="col control-label">Interno</label>
                                                    <asp:TextBox ID="interno"
                                                        runat="server"
                                                        AutoCompleteType="Disabled"
                                                        ClientIDMode="Static"
                                                        data-next="mecanico"
                                                        Enabled="false"
                                                        CssClass="entTab form-control input-sm">
                                                    </asp:TextBox>
                                                </div>

                                                <div class="col margin-1-rem">
                                                    <label class="col control-label">Chofer</label>
                                                    <asp:TextBox ID="chofer"
                                                        runat="server"
                                                        AutoCompleteType="Disabled"
                                                        ClientIDMode="Static"
                                                        data-next="mecanico"
                                                        Enabled="false"
                                                        Style="width: auto"
                                                        CssClass="entTab form-control input-sm">
                                                    </asp:TextBox>
                                                </div>
                                            </div>



                                            <hr />
                                            <h6 class="margin-1-rem bold">Seleccione los valores requeridos para generar la orden</h6>
                                            <div class="flex flex-wrap">
                                                <div class="col margin-1-rem">
                                                    <label class="col control-label">Tipo</label>
                                                    <div class="col">
                                                        <asp:DropDownList ID="ddTipo" AppendDataBoundItems="true" runat="server" CssClass="form-control input-sm entTab" DataTextField="Label" DataValueField="id"  AutoPostBack="true">
                                                            <asp:ListItem Text="Seleccione Tipo" Value="-2" Selected="True"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="col margin-1-rem">
                                                    <label class="col control-label">Auxiliador</label>
                                                    <asp:DropDownList ID="ddAuxiliador" AppendDataBoundItems="true" runat="server" CssClass="form-control input-sm entTab" DataTextField="Label" DataValueField="Id">
                                                        <asp:ListItem Text="Seleccione Auxiliador" Value="-2" Selected="True"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="col margin-1-rem">
                                                    <asp:CheckBox runat="server" ID="checkSiPerdidaKms" Checked="false" Text="Pérdida Kms" />
                                                </div>
                                            </div>

                                            <div class="flex">
                                                <div class="col margin-1-rem">
                                                    <label class="col control-label">Detalle</label>
                                                    <asp:TextBox ID="detalle"
                                                        TextMode="MultiLine"
                                                        Columns="50"
                                                        Rows="5"
                                                        runat="server"
                                                        AutoCompleteType="Disabled"
                                                        ClientIDMode="Static"
                                                        data-next="mecanico"
                                                        Enabled="true"
                                                        CssClass="entTab form-control input-sm">
                                                    </asp:TextBox>
                                                </div>
                                            </div>


                                            <div class="col margin-1-rem">
                                                <asp:Button ID="btn_guardar"
                                                    runat="server"
                                                    ControlStyle-CssClass="btn btn-primary"
                                                    Style="color: #242424;"
                                                    Text="Guardar"
                                                    CommandName="buscar" />
                                            </div>

                                        </div>


                                    </div>
                                </div>

                            </section>

                        </div>
                    </div>


                    <div class="flex flex-end">
                        <div>
                            <asp:Button ID="volver" runat="server" Text="Volver"
                                CssClass="btn btn-primary"
                                Style="color: #242424; cursor: pointer;" />

                        </div>
                    </div>

                </div>


            </form>
        </section>
    </section>

</asp:Content>
