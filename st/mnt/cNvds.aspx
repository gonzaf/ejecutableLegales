<%@ Page Title="" Language="vb" AutoEventWireup="false" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/st/SiteST.master" CodeBehind="cNvds.aspx.vb" Inherits="Dynamic_Data.cNvds" %>

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
                                        <span class="label bg-danger pull-right">Novedades</span>
                                        <div class="form-inline">
                                            Consulta de Novedades&nbsp;&nbsp; 
                                            <asp:TextBox ID="desdeFecha" runat="server" ClientIDMode="Static" CssClass="input-sm form-control datepicker" Width="80px"></asp:TextBox>
                                            <asp:Button ID="buttondesdeFecha" display="dynamic" ClientIDMode="Static" runat="server" Text="Button" type="hidden" Style="display: none" />
                                            <asp:TextBox ID="hastaFecha" runat="server" ClientIDMode="Static" CssClass="input-sm form-control datepicker" Width="80px"></asp:TextBox>
                                            <asp:Button ID="buttonhastaFecha" display="dynamic" ClientIDMode="Static" runat="server" Text="Button" type="hidden" Style="display: none" />
                                            &nbsp;&nbsp;
                                            <%--<asp:CheckBox ID="cbMostrarTodo"  runat="server" Checked="true" Text="Ver Todos los dias" />--%>
                                            <asp:Label ID="Label2" runat="server" Text="Label">---</asp:Label>
                                            <%--<asp:DropDownList ID="ddDepositos" AppendDataBoundItems="true" runat="server" CssClass="form-control input-sm entTab" DataTextField="Deposito" DataValueField="idDeposito">
                                            </asp:DropDownList>--%>
                                            <asp:TextBox ID="tbNroCoche" CssClass="form-control input-sm clickbutton" data-button="buttonBuscar" Width="70" placeholder="# Coche" runat="server"></asp:TextBox>
                                            <asp:Button ID="buttonBuscar" OnClick="buttonBuscar_Click" ClientIDMode="Static" runat="server" Text="Buscar" />

                                        </div>
                                    </header>
                                    <section style="//height: 200px" class="panel-body scrollbar scroll-y m-b">
                                        <div class="panel">

                                            <asp:Label Text="" ID="lError" runat="server" ForeColor="Red"></asp:Label>

                                            <asp:GridView ID="gvPartes" HeaderStyle-HorizontalAlign="Center" runat="server" DataKeyNames="id" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnSelectedIndexChanged="gvPartes_SelectedIndexChanged" OnPreRender="GVPreRender">
                                                <Columns>

                                                    <%--o.fecha,c.nroCoche,nd.novedad,nd.detalle,u.Detalle as usuario--%>
                                                    <asp:TemplateField HeaderText="Fecha" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Format(Eval("fecha"), "dd/MM/yy")%>'></asp:Label>
                                                            <asp:HiddenField ID="hfCant" ClientIDMode="Static" runat="server" Value='<%# Eval("id")%>' />
                                                            <asp:HiddenField ID="hfidDetalle" ClientIDMode="Static" runat="server" Value='<%# Eval("id")%>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="nroCocHe" HeaderText="Nro.CocHe"></asp:BoundField>
                                                    <asp:BoundField DataField="novedad" HeaderText="Novedad"></asp:BoundField>
                                                    <asp:BoundField DataField="detalle" HeaderText="Obs"></asp:BoundField>
                                                    <asp:BoundField DataField="usuario" HeaderText="Usuario"></asp:BoundField>
                                                    <asp:BoundField DataField="obs" HeaderText="Obs"></asp:BoundField>
                                                    <asp:BoundField DataField="Realizada" HeaderText="Realizada"></asp:BoundField>
                                                    <asp:BoundField DataField="Reasignada" HeaderText="Reasignada"></asp:BoundField>
                                                    <%--<asp:BoundField DataField="codRepuesto" HeaderText="Cod.Repuesto"></asp:BoundField>
                                                    <asp:BoundField DataField="Desc_Repuesto" HeaderText="Repuesto"></asp:BoundField>
                                                    <asp:BoundField DataField="cant" HeaderText="Cant."></asp:BoundField>
                                                    <asp:BoundField DataField="depositoOut" HeaderText="Deposito Orig."></asp:BoundField>
                                                    <asp:BoundField DataField="depositoIn" HeaderText="Deposito Dest."></asp:BoundField>
                                                    <asp:BoundField DataField="ref" HeaderText="Referencia"></asp:BoundField>--%>


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
