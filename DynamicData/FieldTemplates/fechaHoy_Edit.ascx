<%@ Control Language="VB" CodeBehind="fechaHoy_Edit.ascx.vb" Inherits="Dynamic_Data.fechaHoy_EditField" %>


<asp:TextBox ID="TextBox1" runat="server" Width="100px" CssClass="DDTextBox" onFocus="this.select();" Text='<%# Today.ToString("dd/MM/yyyy")%>' Columns="20" onblur="convert_date(this);"></asp:TextBox>

<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" CssClass="DDControl DDValidator" ControlToValidate="TextBox1" Display="Dynamic" Enabled="false" />
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" CssClass="DDControl DDValidator" ControlToValidate="TextBox1" Display="Dynamic" Enabled="false" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" CssClass="DDControl DDValidator" ControlToValidate="TextBox1" Display="Dynamic" />
<asp:CustomValidator runat="server" ID="DateValidator" CssClass="DDControl DDValidator" ControlToValidate="TextBox1" Display="Dynamic" EnableClientScript="false" Enabled="false" OnServerValidate="DateValidator_ServerValidate" />

