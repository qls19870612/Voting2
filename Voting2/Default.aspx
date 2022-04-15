<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Matdaan - Home</title>
    <link href="http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic" rel="stylesheet" type="text/css" />
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link rel="stylesheet" href="materialize-v1.0.0/materialize/css/materialize.min.css" />
</head>
<body>
    <!--Login Form starts -->
    <form id="loginform" runat="server">
        <!--Nav bar-->
        <nav class="teal" role="navigation">
            <div class="nav-wrapper container">
                <a id="logo-container" href="Default.aspx" class="brand-logo">选举系统</a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="Elections.aspx">选举</a></li>
                    <li><a href="Register.aspx">注册</a></li>
                    <li style="text-transform: uppercase;">
                        <asp:LoginName ID="LoginName1" runat="server" />
                    </li>
                    <li style="text-transform: uppercase;">
                        <asp:LoginStatus ID="LoginStatus1" runat="server" />
                    </li>
                </ul>

                <ul id="slide-out" class="sidenav">
                    <li><a href="Elections.aspx">选举</a></li>
                    <li><a href="Register.aspx">注册</a></li>
                    <li>
                        <a href="#" style="text-transform: uppercase;">
                            <asp:LoginName ID="LoginName2" runat="server" />
                        </a>
                    </li>
                    <li style="text-transform: uppercase;">
                        <asp:LoginStatus ID="LoginStatus2" runat="server" />
                    </li>
                </ul>
                <a href="#" data-target="slide-out" class="sidenav-trigger"><i class="material-icons">menu</i></a>
            </div>
        </nav>

    <div id="index-banner" class="parallax-container">
        <div class="section no-pad-bot">
            <div class="container">
                <br/><br/>
                <h1 class="header center white-text">选举系统</h1>
                <div class="row center">
                    <h5 class="header col s12 light">在线投票</h5>
                </div>
                <div class="row center">
                    <asp:Label ID="Label1" runat="server" Text="Label" CssClass=" black-text indicator text-darken-4"></asp:Label>
                   
                </div>
                <br/><br/>

            </div>
        </div>
        <div class="parallax"><img src="images/flag.jpg" alt="Unsplashed background img 1" /></div>
    </div>

    
        
            <div class="row">
                <div class="col s4 offset-s4 input-field">
                    <i class="material-icons prefix">account_circle</i>
                    <input id="username" type="text" class="validate" runat="server" />
                    <label for="username">用户名</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="不能为空！" ControlToValidate="username" CssClass="red-text"></asp:RequiredFieldValidator>
                </div>
                <div class="col s4 offset-s4 offset-s4 input-field">
                    <i class="material-icons prefix">fingerprint</i>
                    <input id="password" type="password" class="validate" runat="server" />
                    <label for="password">密码</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="不能为空！" ControlToValidate="password" CssClass="red-text"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row center">
                <div class="col s4 offset-s4">
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-large waves-effect waves-light teal lighten-1 hoverable" OnClick="LinkButton1_Click">登录</asp:LinkButton>
                </div>
            </div>
        </form>
    <!--Login Form ends -->

    <script src="Scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="materialize-v1.0.0/materialize/js/materialize.js"></script>
    <script src="Scripts/init.js" type="text/javascript"></script>
    <%--<script src="Scripts/bootstrap.min.js" type="text/javascript"></script>--%>
</body>
</html>
