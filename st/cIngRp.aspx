<%@ Page Title="" Language="vb" AutoEventWireup="false" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/st/SiteST.master" CodeBehind="cIngRp.aspx.vb" Inherits="Dynamic_Data.cIngRp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <section id="content">
        <section class="main padder">
            <form id="form1" runat="server" onsubmit="ShowLoading()">
                <div class="row no-gutter">

                    <div class="col-sm-12">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Ingresos de repuestos</span>
                                        <div class="form-inline">
                                            Consulta de Ingresos&nbsp;&nbsp; 
                                            <asp:TextBox ID="desdeFecha" runat="server" ClientIDMode="Static" CssClass="input-sm form-control datepicker" Width="80px"></asp:TextBox>
                                            <asp:Button ID="buttondesdeFecha" display="dynamic" ClientIDMode="Static" runat="server" Text="Button" type="hidden" Style="display: none" />
                                            <asp:TextBox ID="hastaFecha" runat="server" ClientIDMode="Static" CssClass="input-sm form-control datepicker" Width="80px"></asp:TextBox>
                                            <asp:Button ID="buttonhastaFecha" display="dynamic" ClientIDMode="Static" runat="server" Text="Button" type="hidden" Style="display: none" />
                                            &nbsp;&nbsp;
                                            <%--<asp:CheckBox ID="cbMostrarTodo"  runat="server" Checked="true" Text="Ver Todos los dias" />--%>
                                            <asp:Label ID="Label2" runat="server" Text="Label">---</asp:Label>
                                            <%--<asp:DropDownList ID="ddDepositos" AppendDataBoundItems="true" runat="server" CssClass="form-control input-sm entTab" DataTextField="Deposito" DataValueField="idDeposito">
                                            </asp:DropDownList>--%>
                                            <asp:TextBox ID="tbIdRepuesto" CssClass="form-control input-sm clickbutton" data-button="buttonBuscar" Width="90" placeholder="# Repuesto" runat="server"></asp:TextBox>
                                            <asp:Button ID="buttonBuscar" OnClick="buttonBuscar_Click" ClientIDMode="Static" runat="server" Text="Buscar" />
                                            <asp:Button ID="nNuevoIngreso" OnClick="nNuevoIngreso_Click" ClientIDMode="Static" runat="server" Text="Cargar Ingreso" />

                                        </div>
                                    </header>
                                    <section style="//height: 200px" class="panel-body scrollbar scroll-y m-b">
                                        <div class="panel">

                                            <asp:Label Text="" ID="lError" runat="server" ForeColor="Red"></asp:Label>

                                            <asp:GridView ID="gvIngresos" runat="server"
                                                AutoGenerateColumns="False"
                                                CssClass="table table-striped table-bordered"
                                                AllowPaging="true"
                                                PageSize="100"
                                                OnPageIndexChanging="gvIngresos_PageIndexChanging">

                                                <PagerSettings Mode="NextPreviousFirstLast"
                                                    FirstPageText="<<"
                                                    LastPageText=">>"
                                                    NextPageText=">"
                                                    PreviousPageText="<" />
                                                <PagerStyle CssClass="pager-bootstrap" HorizontalAlign="Center" />

                                                <Columns>
                                                    <asp:BoundField DataField="fecha" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" />
                                                    <asp:BoundField DataField="codComprobante" HeaderText="Tipo Comp." />
                                                    <asp:BoundField DataField="nroComprobante" HeaderText="Nº Comp." />
                                                    <asp:BoundField DataField="Proveedor" HeaderText="Proveedor" />
                                                    <asp:BoundField DataField="idCatalogo" HeaderText="Cod.Repuesto" />
                                                    <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
                                                    <asp:BoundField DataField="cant" HeaderText="Cant" />
                                                    <asp:BoundField DataField="precio" HeaderText="Precio" DataFormatString="{0:N2}" />
                                                </Columns>


                                            </asp:GridView>

                                        </div>

                                    </section>
                                    <%--</div>--%>
                                    <div class="form-group text-center">
                                        <div class="col-lg-12">
                                            <asp:Button ID="cancelar" runat="server" Enabled="true" Text="Cancelar" Visible="true" CssClass="btn btn-white btn-xs" />
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

        var objDiv = document.getElementById("divCaja");
        //objDiv.scrollTop = objDiv.scrollHeight;

        function set(textbox, cant, cb) {
            if (document.getElementById(cb).checked) {
                document.getElementById(textbox).value = cant;
            } else {
                document.getElementById(textbox).value = '';
            }

        }


        //  $("#fechaCaja").datepicker({ format: 'dd/mm/yy' })
        //  .on('changeDate', function (ev) {
        //      $(this).datepicker('hide');
        //      $("#buttonFechaCaja").click();
        //  });

        //  $("#fechaVentas").datepicker({ format: 'dd/mm/yy' })
        //.on('changeDate', function (ev) {
        //    $(this).datepicker('hide');
        //    $("#buttonFechaVentas").click();
        //});




    </script>
</asp:Content>
