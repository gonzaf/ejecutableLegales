<%@ Control Language="VB" CodeBehind="ForeignKey_Edit.ascx.vb" Inherits="Dynamic_Data.ForeignKey_EditField" %>

<asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" > 

</asp:DropDownList>

<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" CssClass="DDControl DDValidator" ControlToValidate="DropDownList1" Display="Dynamic" Enabled="false" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" CssClass="DDControl DDValidator" ControlToValidate="DropDownList1" Display="Dynamic" />

