<%@ Page Title="" Language="vb" AutoEventWireup="false" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/st/SiteST.master" CodeBehind="cMvs.aspx.vb" Inherits="Dynamic_Data.cMvs" %>

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
                                        <span class="label bg-danger pull-right">Movimientos</span>
                                        <div class="form-inline">
                                            Movimientos de Stock&nbsp;&nbsp; 
                                            <asp:TextBox ID="desdeFecha" runat="server" ClientIDMode="Static" CssClass="input-sm form-control datepicker" Width="80px"></asp:TextBox>
                                            <asp:Button ID="buttondesdeFecha" display="dynamic" ClientIDMode="Static" runat="server" Text="Button" type="hidden" Style="display: none" />
                                            <asp:TextBox ID="hastaFecha" runat="server" ClientIDMode="Static" CssClass="input-sm form-control datepicker" Width="80px"></asp:TextBox>
                                            <asp:Button ID="buttonhastaFecha" display="dynamic" ClientIDMode="Static" runat="server" Text="Button" type="hidden" Style="display: none" />
                                            &nbsp;&nbsp;
                                            <asp:CheckBox ID="cbMostrarTodo"  runat="server" Checked="true" Text="Ver Todos los dias" />
                                            <asp:Label ID="Label2" runat="server" Text="Label">---</asp:Label>
                                            <asp:DropDownList ID="ddDepositos" AppendDataBoundItems="true" runat="server" CssClass="form-control input-sm entTab" DataTextField="Deposito" DataValueField="idDeposito">
                                            </asp:DropDownList>
                                            <asp:TextBox ID="tbCodigo" CssClass="form-control input-sm clickbutton" data-button="buttonBuscar" Width="70" placeholder="# Rep." runat="server"></asp:TextBox>
                                            <asp:Button ID="buttonBuscar" OnClick="buttonBuscar_Click" ClientIDMode="Static" runat="server" Text="Buscar" />

                                        </div>
                                    </header>
                                    <section style="//height: 200px" class="panel-body scrollbar scroll-y m-b">
                                        <div class="panel">

                                            <asp:Label Text="" ID="lError" runat="server" ForeColor="Red"></asp:Label>

                                            <asp:GridView ID="gvPartes" HeaderStyle-HorizontalAlign="Center" runat="server" DataKeyNames="idMov" AutoGenerateColumns="False" DataSourceID="dsPartes" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnSelectedIndexChanged="gvPartes_SelectedIndexChanged" OnPreRender="GVPreRender">
                                                <Columns>


                                                    <asp:TemplateField HeaderText="Fecha" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Format(Eval("fecha"), "dd/MM/yy")%>'></asp:Label>
                                                            <asp:HiddenField ID="hfCant" ClientIDMode="Static" runat="server" Value='<%# Eval("cant")%>' />
                                                            <asp:HiddenField ID="hfidDetalle" ClientIDMode="Static" runat="server" Value='<%# Eval("idMov")%>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="tipoMov" HeaderText="T.Mov."></asp:BoundField>
                                                    <asp:BoundField DataField="codRepuesto" HeaderText="Cod.Repuesto" ></asp:BoundField>
                                                    <asp:BoundField DataField="Desc_Repuesto" HeaderText="Repuesto" ></asp:BoundField>
                                                    <asp:BoundField DataField="cant" HeaderText="Cant."></asp:BoundField>
                                                    <asp:BoundField DataField="depositoOut" HeaderText="Deposito Orig."></asp:BoundField>
                                                    <asp:BoundField DataField="depositoIn" HeaderText="Deposito Dest."></asp:BoundField>
                                                   <asp:BoundField DataField="ref" HeaderText="Referencia"></asp:BoundField>
                                                   

                                                </Columns>
                                            </asp:GridView>

                                        </div>

                                        <asp:LinqDataSource ID="LinqDataSource4" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="Motivo" TableName="stMotivos">
                                        </asp:LinqDataSource>

                                        <asp:LinqDataSource ID="dsPartes" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="Fecha" TableName="vStMovimientosStock" Where='(@okFecha == -1 or (fecha >= @fechaDesde and fecha <= @fechaHasta)) and ((idDepositoIn == @ddDepositos and aceptado == true) or (idDepositoOut == @ddDepositos and enviada == true) ) and (codRepuesto = @tbCodigo or @tbCodigo = -1)'>
                                            <WhereParameters>
                                                <asp:Parameter DefaultValue="20-06-2016" Name="fechaDesde" Type="DateTime" />
                                                <asp:Parameter DefaultValue="20-06-2016" Name="fechaHasta" Type="DateTime" />
                                                <asp:Parameter DefaultValue="1" Name="okFecha" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddDepositos" DefaultValue="-1" Name="ddDepositos" Type="Int32" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="tbCodigo" DefaultValue="-1" Name="tbCodigo" Type="Int32" PropertyName="Text" />
                                            </WhereParameters>
                                        </asp:LinqDataSource>
                                    
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
