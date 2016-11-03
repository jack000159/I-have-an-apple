<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void SqlDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        Label1.Text = string.Format("查詢到{0}筆資料.", e.AffectedRows);
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CP1" Runat="Server">
    <p>
    關鍵字:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="搜尋" />
</p>
    <p>
        <asp:Label ID="Label1" runat="server" EnableViewState="False"></asp:Label>
</p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" AllowPaging="True">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="編號" HeaderText="編號" SortExpression="編號" />
            <asp:HyperLinkField DataNavigateUrlFields="編號" DataNavigateUrlFormatString="phone.aspx?id={0}" DataTextField="品名" HeaderText="品名" />
            <asp:BoundField DataField="售價" HeaderText="售價" SortExpression="售價" DataFormatString="{0:c}" />
            <asp:BoundField DataField="庫存" HeaderText="庫存" SortExpression="庫存" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:productConnectionString %>" SelectCommand="SELECT [編號], [品名], [售價], [庫存] FROM [stock] WHERE ([品名] LIKE '%' + @品名 + '%')" OnSelected="SqlDataSource1_Selected">
    <SelectParameters>
        <asp:ControlParameter ControlID="TextBox1" Name="品名" PropertyName="Text" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>

