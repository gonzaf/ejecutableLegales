﻿<%@ Control Language="VB" CodeBehind="Integer_Edit.ascx.vb" Inherits="Dynamic_Data.Integer_EditField" %>


<asp:TextBox ID="TextBox1" runat="server" CssClass="DDTextBox" Text='<%# FieldValueEditString %>' Columns="10"></asp:TextBox>


<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" CssClass="DDControl DDValidator" ControlToValidate="TextBox1" Display="Dynamic" Enabled="false" />
<asp:CompareValidator runat="server" ID="CompareValidator1" CssClass="DDControl DDValidator" ControlToValidate="TextBox1" Display="Dynamic"
    Operator="DataTypeCheck" Type="Integer"/>
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" CssClass="DDControl DDValidator" ControlToValidate="TextBox1" Display="Dynamic" Enabled="false" />
<asp:RangeValidator runat="server" ID="RangeValidator1" CssClass="DDControl DDValidator" ControlToValidate="TextBox1" Type="Integer"
    Enabled="false" EnableClientScript="true" MinimumValue="0" MaximumValue="100" Display="Dynamic" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" CssClass="DDControl DDValidator" ControlToValidate="TextBox1" Display="Dynamic" />

