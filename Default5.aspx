<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CP1" Runat="Server">
    <p>
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="品名" DataValueField="編號" style="text-align: center">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:productConnectionString %>" SelectCommand="SELECT [編號], [品名], [售價], [庫存] FROM [stock]"></asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" AllowPaging="True">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="編號" HeaderText="編號" SortExpression="編號" />
            <asp:HyperLinkField DataNavigateUrlFields="編號" DataNavigateUrlFormatString="phone.aspx?id={0}" DataTextField="品名" HeaderText="品名" />
            <asp:BoundField DataField="售價" HeaderText="售價" SortExpression="售價" DataFormatString="{0:c}" />
            <asp:BoundField DataField="庫存" HeaderText="剩餘數量" SortExpression="庫存" />
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
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:productConnectionString %>" SelectCommand="SELECT * FROM [stock] WHERE ([編號] = @編號)">
    <SelectParameters>
        <asp:ControlParameter ControlID="DropDownList2" Name="編號" PropertyName="SelectedValue" Type="String" />
    </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

