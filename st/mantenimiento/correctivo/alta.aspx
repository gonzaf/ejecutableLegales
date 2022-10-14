<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/st/SiteST.master" CodeBehind="alta.aspx.vb"
      Inherits="Dynamic_Data.AltaCorrectivo" %>

      <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <style type="text/css">
                  .auto-style1 {}

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

                  .flex-wrap {
                      flex-wrap: wrap;
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
                                                            <div class="form-inline"><b>Correctivo</b></div>
                                                      </header>
                                                      <div class="panel-body" style="padding: 10px 30px 10px 30px">
                                                            <div class="form-horizontal">

                                                                  <div class="form-group flex flex-align-bottom">
                                                                        <div class="margin-1-rem">
                                                                              <label for="nroCoche">Nro Coche</label>
                                                                              <asp:TextBox ID="nroCoche"
                                                                                    ClientIDMode="Static"
                                                                                    data-button="Button1" runat="server"
                                                                                    CssClass="form-control clickButton">
                                                                              </asp:TextBox>
                                                                              <asp:ValidationSummary
                                                                                    ID="ValidationSummary1"
                                                                                    runat="server" ForeColor="Red"
                                                                                    Font-Bold="true"
                                                                                    CssClass="DDValidator"
                                                                                    Display="Dynamic" />
                                                                              <asp:CustomValidator ID="CustomValidator1"
                                                                                    runat="server" Visible="false"
                                                                                    ErrorMessage="CustomValidator"
                                                                                    Display="Dynamic">
                                                                              </asp:CustomValidator>
                                                                        </div>
                                                                        <div class="margin-1-rem">
                                                                              <label
                                                                                    for="autoCompletePatente">Patente</label>
                                                                              <asp:TextBox ID="autoCompletePatente"
                                                                                    ClientIDMode="Static" runat="server"
                                                                                    CssClass="form-control">
                                                                              </asp:TextBox>
                                                                              <asp:Button ID="Button1"
                                                                                    ClientIDMode="Static" runat="server"
                                                                                    Style="display: none" Text=""
                                                                                    Display="Dynamic" />
                                                                        </div>

                                                                        <div class="margin-1-rem">
                                                                              <label>Fecha Vencimiento</label>
                                                                              <div class="col">
                                                                                    <asp:TextBox ID="fecha_vencimiento"
                                                                                          runat="server"
                                                                                        AutoComplete="off"                                                                                        
                                                                                          onkeypress="return false"
                                                                                          ClientIDMode="Static"
                                                                                          data-next="codigoTarea"
                                                                                          CssClass="entTab form-control datepicker input-lg"
                                                                                          onfocus="this.select()"
                                                                                          onblur="convert_date(this)">
                                                                                    </asp:TextBox>
                                                                              </div>
                                                                        </div>

                                                                  </div>

                                                                  <hr />

                                                                  <div class="form-group flex flex-align-bottom flex-wrap">

                                                                        <div class="margin-1-rem">
                                                                              <label for="codigoTarea">Código
                                                                                    Tarea</label>
                                                                              <asp:TextBox ID="codigoTarea"
                                                                                    ClientIDMode="Static"
                                                                                    data-button="Button2" runat="server"
                                                                                    CssClass="form-control clickButton">
                                                                              </asp:TextBox>
                                                                              <asp:ValidationSummary
                                                                                    ID="ValidationSummary2"
                                                                                    runat="server" ForeColor="Red"
                                                                                    Font-Bold="true"
                                                                                    CssClass="DDValidator"
                                                                                    Display="Dynamic" />
                                                                              <asp:CustomValidator ID="CustomValidator2"
                                                                                    runat="server" Visible="false"
                                                                                    ErrorMessage="CustomValidator"
                                                                                    Display="Dynamic">
                                                                              </asp:CustomValidator>
                                                                        </div>

                                                                        <div class="margin-1-rem">
                                                                              <label for="autoCompleteTarea">Descripción
                                                                                    Tarea</label>
                                                                              <asp:TextBox ID="autoCompleteTarea"
                                                                                    ClientIDMode="Static" runat="server"
                                                                                    CssClass="form-control" 
                                                                                    Style="width: 40rem">
                                                                              </asp:TextBox>
                                                                              <asp:Button ID="Button2"
                                                                                    ClientIDMode="Static" runat="server"
                                                                                    Style="display: none" Text=""
                                                                                    Display="Dynamic" />
                                                                        </div>

                                                                        <div class="margin-1-rem">
                                                                              <label>Observaciones</label>
                                                                                    <asp:TextBox ID="observaciones"
                                                                                        Style="min-width: 40rem"
                                                                                          runat="server"
                                                                                        AutoCompleteType="Disabled"
                                                                                          ClientIDMode="Static"
                                                                                          data-next="btnAgregarTarea"
                                                                                          CssClass="entTab form-control">
                                                                                    </asp:TextBox>
                                                                        </div>

                                                                        <div class="margin-1-rem">
                                                                                    <asp:TextBox ID="nroPlanilla"
                                                                                        placeholder="Nro. Planilla"
                                                                                        Style="min-width: 40rem"
                                                                                        runat="server"
                                                                                        Visible="false"
                                                                                        AutoCompleteType="Disabled"
                                                                                        ClientIDMode="Static"
                                                                                        data-next="btnAgregarTarea"
                                                                                        CssClass="entTab form-control">
                                                                                    </asp:TextBox>
                                                                        </div>

                                                                        <div class="margin-1-rem">
                                                                              <p ID="labelSubtarea" 
                                                                                  Visible="false" 
                                                                                  runat="server"
                                                                                  Style="color: red; font-size: 1.4rem;">
                                                                                  Posee tareas relacionadas
                                                                              </p>
                                                                        </div>



                                                                        <div class="margin-1-rem">
                                                                            <asp:Button ID="btnAgregarTarea" 
                                                                                runat="server" 
                                                                                Text="+ Agregar Tarea"
                                                                                CssClass="btn btn-warning"
                                                                                Style="color: #242424; cursor: pointer;"/>
                                                                        </div>
                                                                  </div>
                                                            </div>
                                                      </div>

                                                </section>
                                          </div>
                                    </div>

                                    <div class="row">
                                          <div class="panel-body">
                                                <section class="panel">
                                                      <header class="panel-heading"><b>Tareas</b></header>
                                                      <div>
                                                            <asp:GridView ID="GridViewTareas" runat="server"
                                                                  ShowFooter="true" AutoGenerateColumns="False"
                                                                  DataKeyNames="id"
                                                                  CssClass="table table-striped m-b-none text-small"
                                                                  BorderStyle="None" GridLines="None"
                                                                  OnPreRender="GVPreRender">

                                                                  <Columns>
                                                                        <asp:BoundField DataField="id"
                                                                              HeaderText="ID"
                                                                              SortExpression="id"
                                                                              HeaderStyle-CssClass="text-center"
                                                                              ItemStyle-HorizontalAlign="Center">
                                                                              <HeaderStyle HorizontalAlign="Center">
                                                                              </HeaderStyle>
                                                                        </asp:BoundField>

                                                                        <asp:BoundField DataField="mTareas.Descripcion"
                                                                              HeaderText="Tarea"
                                                                              SortExpression="idTarea"
                                                                              HeaderStyle-CssClass="text-center"
                                                                              ItemStyle-HorizontalAlign="Center">
                                                                              <HeaderStyle HorizontalAlign="Center">
                                                                              </HeaderStyle>
                                                                        </asp:BoundField>

                                                                        <asp:BoundField DataField="observaciones"
                                                                              HeaderText="Observaciones"
                                                                              SortExpression="observaciones"
                                                                              HeaderStyle-CssClass="text-center"
                                                                              ItemStyle-HorizontalAlign="Center">
                                                                              <HeaderStyle HorizontalAlign="Center">
                                                                              </HeaderStyle>
                                                                        </asp:BoundField>

                                                                        <asp:BoundField DataField="nroPlanilla"
                                                                              HeaderText="Nro. Planilla"
                                                                              SortExpression="nroPlanilla"
                                                                              HeaderStyle-CssClass="text-center"
                                                                              ItemStyle-HorizontalAlign="Center">
                                                                              <HeaderStyle HorizontalAlign="Center">
                                                                              </HeaderStyle>
                                                                        </asp:BoundField>


                                                                      <asp:TemplateField>
	                                                                    <ItemTemplate>
		                                                                    <asp:Button ID="btn_borrar" runat="server"
			                                                                    ControlStyle-CssClass="btn btn-warning btn-xs"
                                                                                Style="color: #242424; background-color: red"
			                                                                    Text="Borrar"
			                                                                    CommandName="editar" CommandArgument='<%# Eval("id") %>' />
	                                                                    </ItemTemplate>
                                                                    </asp:TemplateField>


                                                                  </Columns>

                                                                  <RowStyle CssClass="td"></RowStyle>
                                                            </asp:GridView>

                                                      </div>
                                                </section>
                                          </div>
                                    </div>

                                    <div class="flex flex-end">
                                          <div>
                                                <asp:Button ID="cancelar" runat="server" Enabled="true" Text="Cancelar"
                                                      Visible="true" CssClass="btn btn-white" Style="color: #242424; cursor: pointer;" />

                                                <asp:Button ID="guardar" runat="server" Text="Guardar"
                                                      CssClass="btn btn-primary" Style="color: #242424; cursor: pointer;" />

                                          </div>
                                    </div>
                              </div>


                        </form>
                  </section>
            </section>



            <script>

      <%-- 
            <% If mostrarDialogo Then %>
                        $('#myModal').modal('show');
            <% End If %>
        

            <% If controlFocus <> "" Then %>
                        setearFoco('<%=controlFocus%>')
                        <% End If %>
                              --%>

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