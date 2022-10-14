<%@ Control Language="VB" CodeBehind="ForeignKeyAutocomplete.ascx.vb" Inherits="Dynamic_Data.ForeignKeyAutocompleteField" %>

<asp:HyperLink ID="HyperLink1" runat="server"
    Text="<%# GetDisplayString() %>"
    NavigateUrl="<%# GetNavigateUrl() %>"  />

