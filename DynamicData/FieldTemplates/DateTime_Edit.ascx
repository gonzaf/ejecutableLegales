<%@ Control Language="VB" CodeBehind="DateTime_Edit.ascx.vb" Inherits="Dynamic_Data.DateTime_EditField" %>


<asp:TextBox ID="TextBox1" runat="server" Width="100px" onkeydown="return false;" CssClass="form-control datepicker" Text='<%# FieldValueEditString %>'  Columns="20" onfocus="this.select()" onblur="convert_date(this);"></asp:TextBox>

<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" CssClass="DDControl DDValidator" ControlToValidate="TextBox1" Display="Dynamic" Enabled="false" />
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" CssClass="DDControl DDValidator" ControlToValidate="TextBox1" Display="Dynamic" Enabled="false" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" CssClass="DDControl DDValidator" ControlToValidate="TextBox1" Display="Dynamic" />
<asp:CustomValidator runat="server" ID="DateValidator" CssClass="DDControl DDValidator" ControlToValidate="TextBox1" Display="Dynamic" EnableClientScript="false" Enabled="false" OnServerValidate="DateValidator_ServerValidate" />

