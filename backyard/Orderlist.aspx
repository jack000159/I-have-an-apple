<%@ Page Title="" Language="C#" MasterPageFile="~/backyard/admin.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" Runat="Server">
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="OrderId,ProductId" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="OrderId" HeaderText="訂單編號" ReadOnly="True" SortExpression="OrderId" />
        <asp:BoundField DataField="ProductId" HeaderText="產品編號" ReadOnly="True" SortExpression="ProductId" />
        <asp:BoundField DataField="Qty" HeaderText="訂購數量" SortExpression="Qty" />
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
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:productConnectionString2 %>" DeleteCommand="DELETE FROM [Order_Details] WHERE [OrderId] = @OrderId AND [ProductId] = @ProductId" InsertCommand="INSERT INTO [Order_Details] ([OrderId], [ProductId], [Qty]) VALUES (@OrderId, @ProductId, @Qty)" SelectCommand="SELECT * FROM [Order_Details]" UpdateCommand="UPDATE [Order_Details] SET [Qty] = @Qty WHERE [OrderId] = @OrderId AND [ProductId] = @ProductId">
    <DeleteParameters>
        <asp:Parameter Name="OrderId" Type="Int32" />
        <asp:Parameter Name="ProductId" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="OrderId" Type="Int32" />
        <asp:Parameter Name="ProductId" Type="Int32" />
        <asp:Parameter Name="Qty" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Qty" Type="Int32" />
        <asp:Parameter Name="OrderId" Type="Int32" />
        <asp:Parameter Name="ProductId" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>

