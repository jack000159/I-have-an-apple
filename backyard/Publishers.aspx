<%@ Page Title="" Language="C#" MasterPageFile="~/backyard/admin.master" %>

<script runat="server">

    protected void SqlDataSource1_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            Label1.Text = e.Exception.Message;
            e.ExceptionHandled = true;
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="編號" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="編號" HeaderText="編號" ReadOnly="True" SortExpression="編號" />
            <asp:BoundField DataField="品名" HeaderText="品名" SortExpression="品名" />
            <asp:BoundField DataField="售價" HeaderText="售價" SortExpression="售價" />
            <asp:BoundField DataField="庫存" HeaderText="庫存" SortExpression="庫存" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:productConnectionString %>" DeleteCommand="DELETE FROM [stock] WHERE [編號] = @編號" InsertCommand="INSERT INTO [stock] ([編號], [品名], [售價], [庫存]) VALUES (@編號, @品名, @售價, @庫存)" SelectCommand="SELECT [編號], [品名], [售價], [庫存] FROM [stock]" UpdateCommand="UPDATE [stock] SET [品名] = @品名, [售價] = @售價, [庫存] = @庫存 WHERE [編號] = @編號" OnDeleted="SqlDataSource1_Deleted">
        <DeleteParameters>
            <asp:Parameter Name="編號" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="編號" Type="String" />
            <asp:Parameter Name="品名" Type="String" />
            <asp:Parameter Name="售價" Type="String" />
            <asp:Parameter Name="庫存" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="品名" Type="String" />
            <asp:Parameter Name="售價" Type="String" />
            <asp:Parameter Name="庫存" Type="String" />
            <asp:Parameter Name="編號" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

