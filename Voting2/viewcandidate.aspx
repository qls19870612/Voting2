<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewcandidate.aspx.cs" Inherits="viewcandidate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Matdaan - View Candidate</title>
    <link href="http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic" rel="stylesheet" type="text/css" />
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link rel="stylesheet" href="materialize-v1.0.0/materialize/css/materialize.min.css" />
</head>
<body>
    <!--Nav bar-->
    <nav class="teal" role="navigation">
        <div class="nav-wrapper container">
            <a id="logo-container" href="Default.aspx" class="brand-logo" style="left: -46px; top: 0px">选举系统</a>
            <ul class="right hide-on-med-and-down">
                <li><a href="addElections.aspx">添加选举</a></li>
                <li><a href="editElections.aspx">编辑选举</a></li>
                <li><a href="addCandidates.aspx">添加候选人</a></li>
            </ul>

            <ul id="slide-out" class="sidenav">
                <li><a href="addElections.aspx">添加选举</a></li>
                <li><a href="editElections.aspx">编辑选举</a></li>
                <li><a href="addCandidates.aspx">添加候选人</a></li>
            </ul>
            <a href="#" data-target="slide-out" class="sidenav-trigger"><i class="material-icons">menu</i></a>
        </div>
    </nav>
    <!--Nav bar End-->
    <br />
    <br />

    <div class="container">
        <h4><strong>Candidate Details:</strong></h4>
        <br />
        <div class="row">
            <div class="col s6">
                <p>
                    <b>名字:     </b>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </p>
          
                <p>
                    <b>账号:     </b>
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </p>
                <p>
                    <b>手机:     </b>
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                </p>
                <p>
                    <b>邮箱:     </b>
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                </p>
                <p>
                    <b>联系地址:     </b>
                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                </p>
                <p>
                    <b>生日:     </b>
                    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                </p>
            </div>
            <div class="col s6">
        
                <p>
                    <b>性别:     </b>
                    <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                </p>
                <p>
                    <b>职业:     </b>
                    <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                </p>
            </div>
        </div>
    </div>



    <script src="Scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="materialize-v1.0.0/materialize/js/materialize.js"></script>
    <script src="Scripts/init.js" type="text/javascript"></script>
</body>
</html>
