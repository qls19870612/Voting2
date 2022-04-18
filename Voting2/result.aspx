<%@ Page Language="C#" AutoEventWireup="true" CodeFile="result.aspx.cs" Inherits="result" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>选举 - 结果</title>
    <link href="http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic" rel="stylesheet" type="text/css" />
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link rel="stylesheet" href="materialize-v1.0.0/materialize/css/materialize.min.css" />
</head>
<body>
    <form runat="server">
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

        <div class="container">
            
            <h4>结果:</h4>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="candidate" HeaderText="候选人" SortExpression="candidate" />
                    <asp:BoundField DataField="no_of_voters" HeaderText="总票数" ReadOnly="True" SortExpression="no_of_voters" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:votingdatabase %>" ProviderName="System.Data.SqlClient" SelectCommand="SELECT candidate, COUNT(voter) AS no_of_voters FROM votes WHERE ([eid] = @eid) GROUP BY candidate ORDER BY no_of_voters DESC">
                <SelectParameters>
                    <asp:QueryStringParameter Name="eid" QueryStringField="id" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="container">
            <br />
            <h4>各职业投票</h4>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="candidate" HeaderText="候选人" SortExpression="candidate" />
                    <asp:BoundField DataField="IT_votes" HeaderText="IT" ReadOnly="True" SortExpression="IT_votes" />
                    <asp:BoundField DataField="EDU_votes" HeaderText="教育" ReadOnly="True" SortExpression="EDU_votes" />
                    <asp:BoundField DataField="MED_votes" HeaderText="医疗" ReadOnly="True" SortExpression="MED_votes" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:votingdatabase %>" ProviderName="System.Data.SqlClient" SelectCommand="
    select DISTINCT vn.candidate, sq1.IT_votes,sq2.EDU_votes,sq3.MED_votes
    from votes as vn
    left outer join
    (select v.candidate,COUNT(v.voter) as IT_votes from votes as v
      join users on v.voter = users.id where users.branch = 'IT' 
      group by v.candidate)
      as sq1 on sq1.candidate = vn.candidate
     left outer join
     (select v.candidate,COUNT(v.voter) as EDU_votes from votes as v
      join users on v.voter = users.id where users.branch = 'EDU' 
      group by v.candidate)
      as sq2 on sq2.candidate = vn.candidate
       left outer join
     (select v.candidate,COUNT(v.voter) as MED_votes from votes as v
      join users on v.voter = users.id where users.branch = 'MED' 
      group by v.candidate)
      as sq3 on sq3.candidate = vn.candidate 
      where vn.eid = @eid">
                <SelectParameters>
                    <asp:QueryStringParameter Name="eid" QueryStringField="id" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>

    </form>

    <script src="Scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="materialize-v1.0.0/materialize/js/materialize.js"></script>
    <script src="Scripts/init.js" type="text/javascript"></script>
</body>
</html>
