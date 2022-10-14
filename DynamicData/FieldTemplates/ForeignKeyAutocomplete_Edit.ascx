<%@ Control Language="VB" CodeBehind="ForeignKeyAutocomplete_Edit.ascx.vb" Inherits="Dynamic_Data.ForeignKeyAutocomplete_EditField" %>

<asp:DropDownList ID="DropDownList1" CssClass="select2" style="width: 100%" runat="server" > 
<%--<asp:DropDownList ID="DropDownList2" CssClass="chosen-select" runat="server" Width="100%">--%> 
</asp:DropDownList>


<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" CssClass="DDControl DDValidator" ControlToValidate="DropDownList1" Display="Dynamic" Enabled="false" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" CssClass="DDControl DDValidator" ControlToValidate="DropDownList1" Display="Dynamic" />

