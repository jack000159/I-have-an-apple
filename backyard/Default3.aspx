<%@ Page Title="" Language="C#" MasterPageFile="~/backyard/admin.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Username" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:CommandField ShowDeleteButton="True" />
        <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
        <asp:BoundField DataField="HashPassword" HeaderText="HashPassword" SortExpression="HashPassword" />
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
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:productConnectionString2 %>" DeleteCommand="DELETE FROM [Members] WHERE [Username] = @Username" InsertCommand="INSERT INTO [Members] ([Username], [HashPassword]) VALUES (@Username, @HashPassword)" SelectCommand="SELECT * FROM [Members]" UpdateCommand="UPDATE [Members] SET [HashPassword] = @HashPassword WHERE [Username] = @Username">
    <DeleteParameters>
        <asp:Parameter Name="Username" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Username" Type="String" />
        <asp:Parameter Name="HashPassword" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="HashPassword" Type="String" />
        <asp:Parameter Name="Username" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>

