<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="error.aspx.vb" Inherits="Dynamic_Data._error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Error: <%=Request.QueryString("Error") %>
        <br />
        Linea: <%=Request.QueryString("linea") %>
    </div>
    </form>
</body>
</html>
