<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic" rel="stylesheet" type="text/css" />
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />

    <link rel="stylesheet" href="materialize-v1.0.0/materialize/css/materialize.css" />
    <style>
        [type="checkbox"]:not(:checked),
        [type="checkbox"]:checked {
            position: relative;
            opacity: 1;
            margin-right: 5px;
            pointer-events:painted;
        }
        [type="checkbox"] + label { 
            font-size:18px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:CheckBoxList ID="CheckBoxList3" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Value="1">IT</asp:ListItem>
                <asp:ListItem Value="1">教育</asp:ListItem>
                <asp:ListItem Value="1">医疗</asp:ListItem>
            </asp:CheckBoxList>

        </div>
    </form>
    <script src="materialize-v1.0.0/materialize/js/materialize.js"></script>
    <script src="Scripts/init.js" type="text/javascript"></script>
</body>
</html>
