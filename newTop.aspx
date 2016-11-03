<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CP1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="編號" HeaderText="編號" SortExpression="編號" />
            <asp:BoundField DataField="品名" HeaderText="品名" SortExpression="品名" />
            <asp:BoundField DataField="售價" HeaderText="售價" SortExpression="售價" />
            <asp:BoundField DataField="銷售數量" HeaderText="銷售數量" SortExpression="銷售數量" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:productConnectionString %>" SelectCommand="SELECT TOP (10) 編號, 品名, 售價, 銷售數量 FROM sales ORDER BY 銷售數量 DESC"></asp:SqlDataSource>
</asp:Content>

