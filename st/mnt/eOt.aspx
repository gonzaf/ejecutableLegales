<%@ Page Title="" Language="vb" AutoEventWireup="false" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/st/SiteST.master" CodeBehind="eOt.aspx.vb" Inherits="Dynamic_Data.eOt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <section id="content">
        <section class="main padder">
            <form id="form1" runat="server">
                <div class="row no-gutter">

                    <div class="col-sm-12">
                        <section class="panel">
                            <div class="panel-body">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <span class="label bg-danger pull-right">Detalle</span>
                                        <div class="form-inline">
                                            Orden de Trabajo&nbsp;&nbsp;


                                            <asp:DropDownList ID="ddMecanico" Enabled="false" AppendDataBoundItems="true" DataTextField="apellido" DataValueField="idLegajo" runat="server" AutoPostBack="false" CssClass="form-control col-6 input-sm entTab">
                                                <asp:ListItem Text="Selecciones un Mecanico" Value="-2" Selected="True"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:HiddenField runat="server" ID="muestraModal" EnableViewState="true" Value="false" ClientIDMode="Static" />

                                            <asp:DropDownList ID="ddPrioridad" Visible="false" Enabled="false" AppendDataBoundItems="true" runat="server" AutoPostBack="true" CssClass="form-control input-sm entTab">
                                                <asp:ListItem Text="Prioridad" Value="-1" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="Prioridad Baja" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Prioridad Media" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Prioridad Alta" Value="1"></asp:ListItem>
                                            </asp:DropDownList>

                                            <%-- <asp:DropDownList ID="ddRubros" AppendDataBoundItems="true" DataTextField="descripcion" DataValueField="id" runat="server" AutoPostBack="false" CssClass="form-control col-6 input-sm entTab">
                                                <asp:ListItem Text="Seleccione un Rubro" Value="-2" Selected="True"></asp:ListItem>
                                            </asp:DropDownList>--%>
                                            <asp:TextBox ID="tbCoche" CssClass="form-control input-sm" Width="150" Enabled="false" Text="" placeholder="Informante" runat="server"></asp:TextBox>
                                            <asp:TextBox ID="tbOrden" CssClass="form-control input-sm" Width="150" Enabled="false" Text="" placeholder="Informante" runat="server"></asp:TextBox>
                                            <asp:TextBox ID="tbFecha" CssClass="form-control input-sm" Width="150" Enabled="false" Text="" placeholder="Informante" runat="server"></asp:TextBox>
                                        </div>

                                        <%--<div class="form-inline" style="visibility: hidden">
                                            Reclamos&nbsp;&nbsp; 
                                            <asp:TextBox ID="desdeFecha" runat="server" ClientIDMode="Static" CssClass="input-sm form-control datepicker" Width="80px"></asp:TextBox>
                                            <asp:Button ID="buttondesdeFecha" OnClick="buttonfecha_Click" display="dynamic" ClientIDMode="Static" runat="server" Text="Button" type="hidden" Style="display: none" />
                                            <asp:TextBox ID="hastaFecha" runat="server" ClientIDMode="Static" CssClass="input-sm form-control datepicker" Width="80px"></asp:TextBox>
                                            <asp:Button ID="buttonhastaFecha" OnClick="buttonfecha_Click" display="dynamic" ClientIDMode="Static" runat="server" Text="Button" type="hidden" Style="display: none" />
                                            &nbsp;&nbsp;
                                            <asp:CheckBox ID="cbMostrarTodo" AutoPostBack="true" OnCheckedChanged="cbMostrarTodo_CheckedChanged" runat="server" Checked="true" Text="Ver Todos los dias" />
                                            <asp:Label ID="Label2" runat="server" Text="Label">---</asp:Label>
                                            <asp:DropDownList ID="ddDepositos" AppendDataBoundItems="true" runat="server" AutoPostBack="true" CssClass="form-control input-sm entTab" DataTextField="Deposito" DataValueField="idDeposito">
                                            </asp:DropDownList>


                                            <asp:TextBox ID="tbInterno" CssClass="form-control input-sm" Width="50" placeholder="# Int." runat="server"></asp:TextBox>
                                            <asp:TextBox ID="tbRepuesto" CssClass="form-control input-sm" Width="100" placeholder="# Repuesto" runat="server"></asp:TextBox>
                                            <asp:TextBox ID="tbDescripcion" CssClass="form-control input-sm " Width="100" placeholder="Desc.Repuesto" runat="server"></asp:TextBox>
                                        </div>--%>
                                    </header>
                                    <section style="//height: 200px" class="panel-body scrollbar scroll-y m-b">
                                        <div class="panel">


                                            <asp:Label Text="" ID="lError" runat="server" ForeColor="Red"></asp:Label>

                                            <asp:GridView ID="gvPartes" runat="server" DataKeyNames="id" AutoGenerateColumns="False" CssClass="table table-striped m-b-none text-small" BorderStyle="None" GridLines="None" OnPreRender="GVPreRender">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Fecha Inicio" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="120px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Format(Eval("fechaInicio"), "dd/MM/yy HH:mm")%>'></asp:Label>
                                                            <asp:HiddenField ID="hfId" ClientIDMode="Static" runat="server" Value='<%# Eval("id")%>' />
                                                            <asp:HiddenField ID="hfResultado" ClientIDMode="Static" runat="server" Value='<%# Eval("resultado")%>' />
                                                            <asp:HiddenField ID="hfOrigen" ClientIDMode="Static" runat="server" Value='<%# Eval("origen")%>' />
                                                            <%--  <asp:HiddenField ID="idEstado" ClientIDMode="Static" runat="server" Value='<%# Eval("idEstado")%>' />
                                                            <asp:HiddenField ID="idCubierta" ClientIDMode="Static" runat="server" Value='<%# Eval("idPartidaSacada")%>' />
                                                            <asp:HiddenField ID="nroOrden" ClientIDMode="Static" runat="server" Value='<%# Eval("nroOrden")%>' />--%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="mTareas.descripcion" HeaderText="Tarea" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <%--<asp:BoundField DataField="deposito" HeaderText="Deposito" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="tipo" HeaderText="Cubierta" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="estado" HeaderText="Estado" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="nroPartida" HeaderText="Partida" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>
                                                    <asp:BoundField DataField="Accion" HeaderText="Accion" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Linea"></asp:BoundField>--%>
                                                    <%--<asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="cb" Text="Enviar" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>

                                                    <asp:TemplateField HeaderText="Accion" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="ddAccion" OnSelectedIndexChanged="ddAccion_SelectedIndexChanged" AutoPostBack="true" AppendDataBoundItems="false" CssClass="form-control input-sm entTab" data-next="ddMecanico" ClientIDMode="Static" runat="server">
                                                                <asp:ListItem Text="Accion" Value="-1" Selected="True"></asp:ListItem>
                                                                <asp:ListItem Text="Iniciar" Enabled="false" Value="5"></asp:ListItem>
                                                                <asp:ListItem Text="Posponer" Enabled="false" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="Cerrar" Enabled="false" Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="Descartar" Enabled="false" Value="3"></asp:ListItem>
                                                                <asp:ListItem Text="Interrumpir" Enabled="false" Value="4"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:DropDownList ID="ddDescartar" Visible="false" DataTextField="tipo" DataValueField="id" AppendDataBoundItems="false" CssClass="form-control input-sm entTab" data-next="ddMecanico" ClientIDMode="Static" runat="server">
                                                            </asp:DropDownList>
                                                            <asp:DropDownList ID="ddInterrumpir" Visible="false" DataTextField="tipo" DataValueField="id" AppendDataBoundItems="false" CssClass="form-control input-sm entTab" data-next="ddMecanico" ClientIDMode="Static" runat="server">
                                                            </asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField HeaderText="Fecha" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="text-center">
                                                        <ItemTemplate>
                                                            <%--<asp:HiddenField ID="hf" Value='<%# String.Concat(Eval("idCoche"), "-", Eval("idTipoAlerta"), "-", Eval("idDeposito"), "-" & Eval("idPartida"), "-" & Eval("id"))%>' runat="server" />--%>
                                                            <%--<asp:CheckBox ID='cbGuardar1' ClientIDMode="Static" CssClass="myClass2" runat="server" />--%>
                                                            <%--<asp:RadioButton ID="cbGuardarAlerta" runat="server" CssClass="myClass2" Text="Posponer" GroupName="SelectGroup" />
                                                            <asp:RadioButton ID="cbGuardarDesc" runat="server" Text="Descartar" GroupName="SelectGroup" />
                                                            <asp:RadioButton ID="RadioButton1" runat="server" Text="Realizado" GroupName="SelectGroup" />--%>
                                                            <%--<asp:RadioButton ID="cbPosponer" runat="server"  Text="Posponer" GroupName="SelectGroup" />--%>
                                                            <asp:TextBox ID="tbFecha" runat="server" ClientIDMode="Static" CssClass="input-sm form-control datepicker" Width="80px"></asp:TextBox>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Hora" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="text-center">
                                                        <ItemTemplate>
                                                            <%--<asp:HiddenField ID="hf" Value='<%# String.Concat(Eval("idCoche"), "-", Eval("idTipoAlerta"), "-", Eval("idDeposito"), "-" & Eval("idPartida"), "-" & Eval("id"))%>' runat="server" />--%>
                                                            <%--<asp:CheckBox ID='cbGuardar1' ClientIDMode="Static" CssClass="myClass2" runat="server" />--%>
                                                            <%--<asp:RadioButton ID="cbGuardarAlerta" runat="server" CssClass="myClass2" Text="Posponer" GroupName="SelectGroup" />
                                                            <asp:RadioButton ID="cbGuardarDesc" runat="server" Text="Descartar" GroupName="SelectGroup" />
                                                            <asp:RadioButton ID="RadioButton1" runat="server" Text="Realizado" GroupName="SelectGroup" />--%>
                                                            <%--<asp:RadioButton ID="cbPosponer" runat="server"  Text="Posponer" GroupName="SelectGroup" />--%>

                                                            <asp:TextBox AutoComplete="off" ID="tbHora" runat="server" ClientIDMode="Static" CssClass="input-sm form-control timepicker2" Width="80px"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>



                                                    <asp:TemplateField HeaderText="Detalle" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="detalle" runat="server" Text='<%# Eval("obs")%>' CssClass="form-control input-sm entTab"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                </Columns>
                                            </asp:GridView>




                                        </div>


                                        <div class="form-group text-center">
                                            <div class="col-lg-12">
                                                <button type="button" class="btn btn-primary btn-xs" onclick="mostrarModal()">
                                                    Agregar Tarea
                                                </button>

                                                <br />
                                                <br />
                                                <br />
                                            </div>
                                        </div>


                                        <section id="seccionVTV" visible="false" runat="server" class="panel">
                                            <header class="panel-heading font-bold">VTV</header>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="form-group">
                                                        <div class="col-sm-1">
                                                            <label class=" control-label">Fec.Venc</label>
                                                            <asp:TextBox ID="tbFecVenc" ClientIDMode="Static" Enabled="false" data-button="Button1" AutoComplete="off" runat="server" CssClass="form-control input-sm datepicker"></asp:TextBox>
                                                        </div>
                                                        <div class="col-sm-1">
                                                            <label class=" control-label">Turno</label>
                                                            <asp:TextBox ID="tbFechaTurnoVTV" Enabled="false" ClientIDMode="Static" data-button="Button1" AutoComplete="off" runat="server" CssClass="form-control input-sm datepicker"></asp:TextBox>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <label class="control-label">Traslado </label>
                                                            <asp:DropDownList ID="ddMecanicosVtv" ClientIDMode="Static" AppendDataBoundItems="true" runat="server" AutoPostBack="true" CssClass="form-control input-sm entTab" DataTextField="Apellido" DataValueField="idLegajo">
                                                                <asp:ListItem Text="Mecanico" Value="-1" Selected="True"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <label class=" control-label">Observaciones</label>
                                                            <asp:TextBox ID="tbObsVtv" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <label class="control-label">Estado </label>
                                                            <asp:DropDownList ID="ddEstado" ClientIDMode="Static" OnSelectedIndexChanged="ddEstado_SelectedIndexChanged" AppendDataBoundItems="true" runat="server" AutoPostBack="true" CssClass="form-control input-sm entTab">
                                                                <asp:ListItem Text="Pendiente" Value="1" Selected="True"></asp:ListItem>
                                                                <asp:ListItem Text="Apto" Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="No Apto" Value="3"></asp:ListItem>
                                                                <asp:ListItem Text="Condicional" Value="4"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <label class=" control-label">QR</label>
                                                            <asp:TextBox ID="tbQR" TextMode="Password" ClientIDMode="Static" runat="server"  data-button="buttonQR" CssClass="form-control input-sm clickbutton"></asp:TextBox>
                                                            <asp:Button runat="server" style="visibility: hidden" ID="buttonQR" OnClick="buttonQR_Click"/>
                                                        </div>


                                                    </div>
                                                </div>
                                                <asp:Label ID="resultado" Visible="false" runat="server" Text="Resultado" Font-Size="X-Large" Font-Bold="true" />
                                                <div id="resultadoApto" visible="false" runat="server" class="row">
                                                    <div class="form-group">

                                                        <div class="col-sm-1">
                                                            <label class="control-label">Prox.Vto</label>
                                                            <asp:TextBox ID="tbFechaProxVtoVTV" runat="server" AutoComplete="off" ClientIDMode="Static" CssClass="input-sm form-control datepicker"></asp:TextBox>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <label class=" control-label">Nro.Inspeccion</label>

                                                            <asp:TextBox ID="tbNroInspeccion" ClientIDMode="Static" data-button="Button1" AutoCompleteType="Disabled" runat="server" CssClass="form-control input-sm clickButton"></asp:TextBox>

                                                        </div>

                                                        <div class="col-sm-2">
                                                            <label class=" control-label">Nro.Oblea</label>

                                                            <asp:TextBox ID="tbNroOblea" ClientIDMode="Static" data-button="Button1" AutoCompleteType="Disabled" runat="server" CssClass="form-control input-sm clickButton"></asp:TextBox>

                                                        </div>

                                                    </div>
                                                </div>
                                                <div id="resultadoNoApto" visible="false" runat="server" class="row">
                                                    <div class="form-group">

                                                        <div class="col-sm-2">
                                                            <label class=" control-label">Motivo del Rechazo</label>
                                                            <asp:DropDownList ID="ddMotivoRechazo" DataSourceID="LinqDataSource1" AppendDataBoundItems="true" DataTextField="Motivo" DataValueField="id" runat="server" CssClass="form-control col-6 input-sm entTab">
                                                            </asp:DropDownList>
                                                            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="legLinq.LegalesDataContext" EntityTypeName="" OrderBy="Motivo" TableName="mVTVMotivosRechazos">
                                                            </asp:LinqDataSource>
                                                        </div>
                                                        <div class="col-sm-5">
                                                            <label class=" control-label">Observaciones</label>

                                                            <asp:TextBox ID="tbObsVtvRechazo" ClientIDMode="Static" data-button="Button1" AutoCompleteType="Disabled" runat="server" CssClass="form-control input-sm clickButton"></asp:TextBox>

                                                        </div>

                                                    </div>
                                                </div>

                                            </div>

                                        </section>

                                    </section>



                                    <%--</div>--%>
                                    <div class="form-group text-center">
                                        <div class="col-lg-12">
                                            <asp:Button ID="imprimir" runat="server" Text="Imprimir" OnClientClick="return finalizar();" Visible="false" CssClass="btn btn-primary btn-xs" />

                                            <asp:Button ID="guardar" runat="server" Text="Guardar" OnClientClick="return finalizar();" Visible="true" CssClass="btn btn-primary btn-xs" />

                                            <asp:Button ID="cerrar" runat="server" Text="Cerrar Orden" OnClientClick="return finalizar();" Visible="true" CssClass="btn btn-primary btn-xs" />

                                            <asp:Button ID="cancelar" runat="server" OnClick="cancelar_Click" Enabled="true" Text="Cancelar" Visible="true" CssClass="btn btn-white btn-xs" />
                                        </div>
                                    </div>




                                </section>
                            </div>
                        </section>
                    </div>










                </div>






                <div class="modal fade" id="myModal" data-background="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">Agregar Tarea</h4>
                            </div>
                            <div class="modal-body">

                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-sm-2">
                                            <label class=" control-label">Codigo Tarea</label>

                                            <asp:TextBox ID="codigoTarea" ClientIDMode="Static" data-button="Button2" AutoCompleteType="Disabled" runat="server" CssClass="form-control input-sm clickButton"></asp:TextBox>

                                        </div>

                                        <div class="col-sm-6">
                                            <label for="autoCompleteTarea">Descripción Tarea</label>

                                            <asp:TextBox ID="autoCompleteTarea" Width="400px" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                            <asp:Button ID="Button2" ClientIDMode="Static" runat="server" Style="display: none" Text="" Display="Dynamic" />



                                        </div>

                                        <div class="col-sm-4">
                                            <label class=" control-label">Observaciones</label>
                                            <asp:TextBox ID="tbObservaciones" ClientIDMode="Static" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                        </div>

                                    </div>


                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="bCancelarAgregar" OnClick="bCancelarAgregar_Click" CssClass="btn btn-default btn-xs" OnClientClick="verificar()" ClientIDMode="Static" runat="server" Text="Cancelar" Display="Dynamic" />
                                <asp:Button ID="bGuardarAgregar" OnClick="bGuardarAgregar_Click" CssClass="btn btn-primary btn-xs" ClientIDMode="Static" runat="server" Text="Guardar" Display="Dynamic" />
                            </div>
                        </div>
                    </div>
                </div>
















            </form>
        </section>
    </section>












    <script>


        if ($('#muestraModal').val() == 'true') {
            $('#myModal').modal('show');
        }


        function mostrarModal() {

            $('#muestraModal').val(true);

            $('#myModal').modal('show');
            $('#codigoTarea').focus();
        }


        //function verificar() {

        //    // tbDolares tbContado tbMay1 tbLista tbSuc1 tbMay2
        //    if (parseFloatG($("#tbContado").val()) > 0 || parseFloatG($("#tbDolares").val()) > 0 || parseFloatG($("#tbMay1").val()) > 0 ||
        //        parseFloatG($("#tbLista").val()) > 0 || parseFloatG($("#tbSuc1").val()) > 0 || parseFloatG($("#tbMay2").val()) > 0) {
        //        var actualiza = confirm('Queres Actualizar los Precios de Venta de Todos Los Productos?');
        //        if (actualiza) {
        //            $("#actualiza").val(true);
        //        } else { $("#actualiza").val(false); }
        //        return true;
        //    } else {
        //        $("#actualiza").val = false;
        //    }

        //}

        var objDiv = document.getElementById("divCaja");
        //objDiv.scrollTop = objDiv.scrollHeight;



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
