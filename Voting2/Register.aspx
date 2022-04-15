<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="images_Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Matdaan</title>
    <link href="http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic" rel="stylesheet" type="text/css" />
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link rel="stylesheet" href="materialize-v1.0.0/materialize/css/materialize.min.css" />
    <%--<link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css"/>--%>
    <style type="text/css">
        label {
            margin-right: 40px;
        }
    </style>
</head>
<body>


    <form id="form1" runat="server">
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
        <!--Nav bar End-->


        <div id="index-banner" class="parallax-container" style="height:280px">
            <div class="section no-pad-bot">
                <div class="container">
                    <br />
                    <br />
                    <h1 class="header center white-text">注册</h1>
                    <br />
                    <br />
                </div>
            </div>
            <div class="parallax">
                <img src="images/flag.jpg" alt="Unsplashed background img 1" />
            </div>
        </div>


        <div class="container">

            <div class="row">
                <div class="input-field col s6">
                    <i class="material-icons prefix">account_circle</i>
                    <input id="firstname" type="text" class="validate" runat="server" maxlength="20" />
                    <label for="firstname">姓名</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="不能为空！" ControlToValidate="firstname" CssClass="red-text"></asp:RequiredFieldValidator>
                </div>

                <div class="input-field col s6">
                    <i class="material-icons prefix">today</i>
                    <input type="date" class="datepicker" id="birthdate" runat="server" />
                    <label for="birthdate">生日</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="不能为空！" ControlToValidate="birthdate" CssClass="red-text"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6">
                    <i class="material-icons prefix">perm_identity</i>
                    <input id="rollnum" type="text" class="validate" runat="server" maxlength="18" />
                    <label for="rollnum">账号</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="不能为空！" ControlToValidate="rollnum" CssClass="red-text"></asp:RequiredFieldValidator>
                </div>
                <div class="input-field col s6">
                    <i class="material-icons prefix">location_on</i>
                    <input id="state" type="text" class="validate" runat="server" maxlength="30" />
                    <label for="state">联系地址</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="不能为空！" ControlToValidate="state" CssClass="red-text"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6">
                    <i class="material-icons prefix">phone</i>
                    <input id="mobile" type="text" class="validate" runat="server" maxlength="11" pattern="^1[358]\d{9}$" title="mob" />
                    <label for="mobile">手机号</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="不能为空！" ControlToValidate="mobile" CssClass="red-text"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="不是正确的手机号码" ValidationExpression="^1[358]\d{9}$" ControlToValidate="mobile" CssClass="red-text"></asp:RegularExpressionValidator>
                </div>
                <div class="input-field col s6">
                    <i class="material-icons prefix">email</i>
                    <input id="email" type="email" class="validate" runat="server" />
                    <label for="email">邮箱</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="不能为空！" ControlToValidate="email" CssClass="red-text"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="不是正确的邮件地址" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="email" CssClass="red-text"></asp:RegularExpressionValidator>
                </div>
            </div>
 
            
            <div class="row ">
                <div class="input-field col s6">
                    <asp:DropDownList ID="DropDownList5" runat="server">
                        <asp:ListItem Text="IT" Value="IT"></asp:ListItem>
                        <asp:ListItem Text="教育" Value="EDU"></asp:ListItem>
                        <asp:ListItem Text="医疗" Value="MED"></asp:ListItem>
                    </asp:DropDownList>
                    <label>职业</label>
                </div>
                <div class="row center input-field col s6">
                    <asp:DropDownList ID="RadioButtonList1" runat="server">
                        <asp:ListItem Value="m" Text="男"></asp:ListItem>
                        <asp:ListItem Value="f" Text="女"></asp:ListItem>
                    </asp:DropDownList>

                    <label>性别</label>
                </div>
            </div>
        </div>

        <div class="row center">
            <div class="col s4 offset-s4 input-field">
                <i class="material-icons prefix">fingerprint</i>
                <input id="pass" type="password" class="validate" runat="server" />
                <label for="pass">密码</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Password is required." ControlToValidate="pass" CssClass="red-text"></asp:RequiredFieldValidator>
            </div>
        </div>
        <br />
        <div class="row center">
            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-large waves-effect waves-light teal lighten-1 hoverable" OnClick="LinkButton1_Click"><i class="material-icons left">person_add</i>提交</asp:LinkButton>
        </div>
        </div>       
    </form>

    <!--Form End-->

    <script src="Scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="materialize-v1.0.0/materialize/js/materialize.js"></script>
    <script src="Scripts/init.js" type="text/javascript"></script>
    <%--<script src="Scripts/bootstrap.min.js" type="text/javascript"></script>--%>
</body>
</html>
