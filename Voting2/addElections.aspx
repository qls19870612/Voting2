<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addElections.aspx.cs" Inherits="addElections" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>选举-添加选举</title>
    <link href="http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic" rel="stylesheet" type="text/css" />
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link rel="stylesheet" href="materialize-v1.0.0/materialize/css/materialize.min.css" />
</head>
<body>
    <!--Nav bar-->
    <nav class="teal" role="navigation">
        <div class="nav-wrapper container">
            <a id="logo-container" href="Default.aspx" class="brand-logo">选举系统</a>
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
    <asp:Label ID="Label1" runat="server" CssClass="red-text"></asp:Label>
    <br />
    <br />
    <div class="container">
        <br />
        <h4><strong>添加选举:</strong></h4>
        <br />
        <form runat="server" id="form1" class="col s12">
            <div class="row">
                <div class="col s6 input-field">
                    <i class="material-icons prefix">account_circle</i>
                    <input id="title" type="text" class="validate" runat="server" />
                    <label for="title">选择主题</label>
                </div>
                <div class="input-field col s6">
                    <i class="material-icons prefix">account_circle</i>
                    <input id="description" type="text" class="validate" runat="server" />
                    <label for="description">描述</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s3">
                    <i class="material-icons prefix">today</i>
                    <input type="date" class="datepicker" id="startdate" runat="server" />
                    <label for="startdate">起始日期</label>
                </div>
                <div class="input-field col s3">
                    <i class="material-icons prefix">today</i>
                    <input type="time" id="starttime" runat="server" />
                    <label for="starttime"></label>
                </div>
                <div class="input-field col s3">
                    <i class="material-icons prefix">today</i>
                    <input type="date" class="datepicker" id="enddate" runat="server" />
                    <label for="enddate">结束日期</label>
                </div>
                <div class="input-field col s3">
                    <i class="material-icons prefix">today</i>
                    <input type="time" id="endtime" runat="server" />
                    <label for="endtime"></label>
                </div>
            </div>
        
      
            <div class="row">
                <div class="col s12">
                    <h6><strong>选择职业条件</strong></h6>
                    <asp:CheckBoxList ID="CheckBoxList3" runat="server" RepeatDirection="Horizontal" CssClass="no-autoinit">
                        <asp:ListItem Value="1">IT</asp:ListItem>
                        <asp:ListItem Value="1">教育</asp:ListItem>
                        <asp:ListItem Value="1">医疗</asp:ListItem>
                    </asp:CheckBoxList>
                </div>
            </div>
            <div class="row center">
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-large waves-effect waves-light teal lighten-1 hoverable" OnClick="LinkButton1_Click"><i class="material-icons left">person_add</i>Add ELection</asp:LinkButton>
            </div>
        </form>
    </div>


    <script src="Scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="materialize-v1.0.0/materialize/js/materialize.js"></script>
    <script src="Scripts/init.js" type="text/javascript"></script>
</body>
</html>
