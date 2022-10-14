<%@ Control Language="VB" CodeBehind="TextDisable.ascx.vb" Inherits="Dynamic_Data.TextDisableField" %>
<asp:Literal runat="server" Visible="false" ID="Literal1" Text="<%# FieldValueString %>" />
<asp:TextBox ID="TextBox1" runat="server" Enabled="false" Text='<%# FieldValueEditString %>' CssClass="form-control"></asp:TextBox>


