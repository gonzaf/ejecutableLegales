<%@ Control Language="VB" CodeBehind="ForeignKeyReadOnly.ascx.vb" Inherits="Dynamic_Data.ForeignKeyReadOnly" %>

<asp:Literal runat="server" Visible="false" ID="Literal1" Text="<%# FieldValueString %>" />
<asp:TextBox runat="server"  CssClass="form-control" Enabled="false" Text="<%# GetDisplayString %>" ></asp:TextBox>