<%@ Control Language="VB" CodeBehind="ForeignKey.ascx.vb" Inherits="Dynamic_Data.ForeignKeyFilter" %>

<asp:DropDownList runat="server" ID="DropDownList1" AutoPostBack="True" CssClass="DDFilter"
    OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    <asp:ListItem Text="Todos" Value="" />
</asp:DropDownList>

