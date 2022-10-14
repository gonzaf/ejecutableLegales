<%@ Control Language="VB" CodeBehind="DateCalendar_Edit.ascx.vb" AutoEventWireup="true" Inherits="Dynamic_Data.DateCalendar_EditField" %>

<asp:TextBox ID="TextBox1" runat="server" Text='<%# GetDateString() %>'></asp:TextBox>
<asp:Calendar ID="Calendar1" runat="server" 
  VisibleDate=
  '<%# If(FieldValue,DateTime.Now)%>'
  SelectedDate=
  '<%# If(FieldValue,DateTime.Now) %>'
  OnSelectionChanged="Calendar1_SelectionChanged"/>

<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="TextBox1" Display="Dynamic" Enabled="false" />
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="TextBox1" Display="Dynamic" Enabled="false" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="TextBox1" Display="Dynamic" />
