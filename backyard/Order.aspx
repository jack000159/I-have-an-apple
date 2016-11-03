<%@ Page Title="" Language="C#" MasterPageFile="~/backyard/admin.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" Runat="Server">
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="Id" HeaderText="訂單編號" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="Username" HeaderText="姓名" SortExpression="Username" />
        <asp:BoundField DataField="CreateDate" HeaderText="下單時間" SortExpression="CreateDate" />
        <asp:BoundField DataField="OrderAddr" HeaderText="訂購地址" SortExpression="OrderAddr" />
        <asp:BoundField DataField="OrderPhone" HeaderText="訂購電話" SortExpression="OrderPhone" />
        <asp:BoundField DataField="ShipAddr" HeaderText="收件地址" SortExpression="ShipAddr" />
        <asp:BoundField DataField="ShipPhone" HeaderText="收件電話" SortExpression="ShipPhone" />
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
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:productConnectionString2 %>" DeleteCommand="DELETE FROM [Orders] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Orders] ([Username], [CreateDate], [OrderAddr], [OrderPhone], [ShipAddr], [ShipPhone]) VALUES (@Username, @CreateDate, @OrderAddr, @OrderPhone, @ShipAddr, @ShipPhone)" SelectCommand="SELECT * FROM [Orders]" UpdateCommand="UPDATE [Orders] SET [Username] = @Username, [CreateDate] = @CreateDate, [OrderAddr] = @OrderAddr, [OrderPhone] = @OrderPhone, [ShipAddr] = @ShipAddr, [ShipPhone] = @ShipPhone WHERE [Id] = @Id">
    <DeleteParameters>
        <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Username" Type="String" />
        <asp:Parameter Name="CreateDate" Type="DateTime" />
        <asp:Parameter Name="OrderAddr" Type="String" />
        <asp:Parameter Name="OrderPhone" Type="String" />
        <asp:Parameter Name="ShipAddr" Type="String" />
        <asp:Parameter Name="ShipPhone" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Username" Type="String" />
        <asp:Parameter Name="CreateDate" Type="DateTime" />
        <asp:Parameter Name="OrderAddr" Type="String" />
        <asp:Parameter Name="OrderPhone" Type="String" />
        <asp:Parameter Name="ShipAddr" Type="String" />
        <asp:Parameter Name="ShipPhone" Type="String" />
        <asp:Parameter Name="Id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>

