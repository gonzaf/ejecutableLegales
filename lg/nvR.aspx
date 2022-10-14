<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.master" CodeBehind="nvR.aspx.vb" Inherits="Dynamic_Data.nvR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">





    <section id="content">
        <section class="main padder">
            <form id="form1" runat="server">

                <input type="hidden" id="imprimir" name="imprimir" value="true" />
                <div class="row no-gutter">
                    <div class="col-sm-5">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Inicio de Gestión</span>
                                        <div class="form-inline">
                                            Inicio de Gestión&nbsp;&nbsp; 
                                        </div>
                                    </header>
                                    <div class="panel-body">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Parte</label>
                                                <div class="col-sm-7">
                                                    <asp:DropDownList ID="ddParte" CssClass="form-control input-sm entTab" data-next="efectivo" ClientIDMode="Static" runat="server" DataSourceID="dsPartes" DataTextField="Idheader" DataValueField="Idheader" AutoPostBack="True">
                                                    </asp:DropDownList>
                                                    <asp:LinqDataSource ID="dsPartes" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" Select="new (Idheader)" TableName="pHeader">
                                                    </asp:LinqDataSource>
                                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Font-Bold="true" CssClass="DDValidator" Display="Dynamic" />
                                                    <asp:CustomValidator ID="CustomValidator1" runat="server" Visible="false" ErrorMessage="CustomValidator" Display="Dynamic"> </asp:CustomValidator>
                                                </div>
                                            </div>

                                          


                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">Fecha</label>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="fecha" runat="server" onkeypress="return false" ClientIDMode="Static" data-next="ddMoneda" CssClass="entTab form-control input-sm datepicker" onfocus="this.select()" onblur="convert_date(this)"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:DropDownList ID="ddTipoReclamo" CssClass="entTab form-control input-sm" ClientIDMode="Static" runat="server" data-next="rbEfectivo">
                                                        <asp:ListItem>Recupero</asp:ListItem>
                                                        <asp:ListItem Selected="True">Reclamo</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Titulo</label>
                                                <div class="col-sm-7">
                                                    <asp:TextBox ID="tbTitulo" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Abogado</label>
                                                <div class="col-sm-7">
                                                    <asp:DropDownList ID="ddAbogado" CssClass="form-control input-sm entTab" data-next="efectivo" ClientIDMode="Static" runat="server" DataSourceID="dsAbogados" DataTextField="nombre" DataValueField="idAbogado" AutoPostBack="True" OnDataBound="ddAbogado_DataBound">
                                                    </asp:DropDownList>
                                                    <asp:LinqDataSource ID="dsAbogados" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" Select="new (idAbogado, Apellido &amp; ' ' &amp; Nombre   as nombre)" TableName="tAbogados" OrderBy="Apellido">
                                                    </asp:LinqDataSource>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">Notas</label>
                                                <div class="col-lg-7">
                                                    <asp:TextBox ID="notas" runat="server" class="form-control" placeholder="Notas del abogado de la empresa" Rows="5" TextMode="MultiLine"></asp:TextBox>
                                                    <%--<textarea id="notas"  class="form-control" data-trigger="keyup" data-rangelength="[20,200]"></textarea>--%>
                                                </div>
                                            </div>



                                            <div class="form-group">
                                                <div class="col-lg-7 col-lg-offset-3">
                                                    <asp:Button ID="guardar" runat="server" Text="Guardar" OnClientClick="return finalizar();" CssClass="btn btn-primary btn-xs" />
                                                    <asp:Button ID="cancelar" runat="server" Enabled="true" Text="Cancelar" OnClientClick="return eliminar();" CssClass="btn btn-white btn-xs" />
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
                                        <span class="label bg-danger pull-right">Novedades</span>
                                        Partes
                                    </header>
                                    <div>



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
         
         <%If controlFocus <> "" Then%>
        setearFoco('<%=controlFocus%>')
         <%End If%>

        function finalizar() {
            var confirma = confirm('Desea guardar el ' + $("#ddTipoReclamo").val() +  '?');
            //var imprime = confirm('Queres imprimir?');
            //if (imprime) $("#imprime").val = true;
            return confirma;
        }

      
   



    </script>




</asp:Content>
