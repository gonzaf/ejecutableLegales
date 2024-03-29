<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="export.aspx.vb" Inherits="Dynamic_Data.export" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

    <title>SL</title>


    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>




<body>





    <script type="text/javascript">
        var tableToExcel = (function () {
            var uri = 'data:application/vnd.ms-excel;base64,'
                , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta http-equiv="content-type" content="text/plain; charset=UTF-8"/></head><body><table>{table}</table></body></html>'
                , base64 = function (s) { return window.btoa(unescape(encodeURIComponent(s))) }
                , format = function (s, c) { return s.replace(/{(\w+)}/g, function (m, p) { return c[p]; }) }
            return function (table, name) {
                if (!table.nodeType) table = document.getElementById(table)
                var ctx = { worksheet: name || 'Worksheet', table: table.innerHTML }
                window.location.href = uri + base64(format(template, ctx))
            }
        })()
    </script>

    <h1>tableToExcel Demo</h1>
    <p>Exporting the W3C Example Table</p>

    <input type="button" onclick="tableToExcel('testTable', 'W3C Example Table')" value="Export to Excel">

    <table id="testTable" summary="Code page support in different versions of MS Windows." rules="groups"
        frame="hsides" border="2">
        <caption>CODE-PAGE SUPPORT IN MICROSOFT WINDOWS</caption>
        <colgroup align="center"></colgroup>
        <colgroup align="left"></colgroup>
        <colgroup span="2" align="center"></colgroup>
        <colgroup span="3" align="center"></colgroup>
        <thead valign="top">
            <tr>
                <th>Code-Page<br>
                    ID</th>
                <th>Name �,�,�</th>
                <th>ACP</th>
                <th>OEMCP</th>
                <th>Windows<br>
                    NT 3.1</th>
                <th>Windows<br>
                    NT 3.51</th>
                <th>Windows<br>
                    95</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1200</td>
                <td style="background-color: #00f; color: #fff">Unicode (BMP of ISO/IEC-10646)</td>
                <td></td>
                <td></td>
                <td>X</td>
                <td>X</td>
                <td>*</td>
            </tr>
            <tr>
                <td>1250</td>
                <td style="font-weight: bold">Windows 3.1 Eastern European</td>
                <td>X</td>
                <td></td>
                <td>X</td>
                <td>X</td>
                <td>X</td>
            </tr>
            <tr>
                <td>1251</td>
                <td>Windows 3.1 Cyrillic</td>
                <td>X</td>
                <td></td>
                <td>X</td>
                <td>X</td>
                <td>X</td>
            </tr>
            <tr>
                <td>1252</td>
                <td>Windows 3.1 US (ANSI)</td>
                <td>X</td>
                <td></td>
                <td>X</td>
                <td>X</td>
                <td>X</td>
            </tr>
            <tr>
                <td>1253</td>
                <td>Windows 3.1 Greek</td>
                <td>X</td>
                <td></td>
                <td>X</td>
                <td>X</td>
                <td>X</td>
            </tr>
            <tr>
                <td>1254</td>
                <td>Windows 3.1 Turkish</td>
                <td>X</td>
                <td></td>
                <td>X</td>
                <td>X</td>
                <td>X</td>
            </tr>
            <tr>
                <td>1255</td>
                <td>Hebrew</td>
                <td>X</td>
                <td></td>
                <td></td>
                <td></td>
                <td>X</td>
            </tr>
            <tr>
                <td>1256</td>
                <td>Arabic</td>
                <td>X</td>
                <td></td>
                <td></td>
                <td></td>
                <td>X</td>
            </tr>
            <tr>
                <td>1257</td>
                <td>Baltic</td>
                <td>X</td>
                <td></td>
                <td></td>
                <td></td>
                <td>X</td>
            </tr>
            <tr>
                <td>1361</td>
                <td>Korean (Johab)</td>
                <td>X</td>
                <td></td>
                <td></td>
                <td>**</td>
                <td>X</td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td>437</td>
                <td>MS-DOS United States</td>
                <td></td>
                <td>X</td>
                <td>X</td>
                <td>X</td>
                <td>X</td>
            </tr>
            <tr>
                <td>708</td>
                <td>Arabic (ASMO 708)</td>
                <td></td>
                <td>X</td>
                <td></td>
                <td></td>
                <td>X</td>
            </tr>
            <tr>
                <td>709</td>
                <td>Arabic (ASMO 449+, BCON V4)</td>
                <td></td>
                <td>X</td>
                <td></td>
                <td></td>
                <td>X</td>
            </tr>
            <tr>
                <td>710</td>
                <td>Arabic (Transparent Arabic)</td>
                <td></td>
                <td>X</td>
                <td></td>
                <td></td>
                <td>X</td>
            </tr>
            <tr>
                <td>720</td>
                <td>Arabic (Transparent ASMO)</td>
                <td></td>
                <td>X</td>
                <td></td>
                <td></td>
                <td>X</td>
            </tr>
        </tbody>
    </table>

</body>
</html>












