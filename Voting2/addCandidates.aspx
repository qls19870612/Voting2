<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addCandidates.aspx.cs" Inherits="addCandidates" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title选举-添加后选人</title>
    <link href="http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic" rel="stylesheet" type="text/css" />
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link rel="stylesheet" href="materialize-v1.0.0/materialize/css/materialize.min.css" />
</head>
<body>
    <form id="form1" runat="server">
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
        <asp:Label ID="Label2" runat="server" CssClass=" red-text"></asp:Label>
        <br />
        <div class="container">
            <div class="row input-field">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="title" DataValueField="title" AutoPostBack="true">
                </asp:DropDownList>
                <label>选举名称</label>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:votingdatabase %>" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [title] FROM [elections]"></asp:SqlDataSource>
                <br />
                <h5>选择的选举ID</h5>
                <asp:Label ID="Label1" runat="server"></asp:Label>
                <h5>选择的选举对应的候选人列表</h5>
            </div>

            <div class="row">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="cid" HeaderText="候选人" SortExpression="cid" />
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="select" OnClick="select_Click">选择此候选人</asp:LinkButton>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:LinkButton runat="server" ID="details" OnClick="details_Click">查看详细信息</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:votingdatabase %>" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [cid] FROM [candidates] WHERE ([ename] = @ename)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="ename" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </form>

    <script src="Scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="materialize-v1.0.0/materialize/js/materialize.js"></script>
    <script src="Scripts/init.js" type="text/javascript"></script>
</body>
</html>
