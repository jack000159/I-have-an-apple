<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CP1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" CellPadding="20" DataSourceID="SqlDataSource2" RepeatColumns="5" RepeatDirection="Horizontal">
    <ItemTemplate>
        <asp:Image ID="Image1" runat="server"  Height="140px" ImageUrl='<%# Eval("編號", "covers/{0}.png" ) %>' Width="95px" />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("編號", "phone.aspx?id={0}") %>' Text='<%# Eval("品名") %>'></asp:HyperLink>
        <br />
        編號:
        <asp:Label ID="編號Label" runat="server" Text='<%# Eval("編號") %>' />
        <br />
        售價:
        <asp:Label ID="售價Label" runat="server" Text='<%# Eval("售價") %>' />
        <br />
        銷售數量:
        <asp:Label ID="銷售數量Label" runat="server" Text='<%# Eval("銷售數量") %>' />
        <br />
        <br />
    </ItemTemplate>
</asp:DataList>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:productConnectionString %>" SelectCommand="SELECT TOP (10) 編號, 品名, 售價, 銷售數量 FROM sales ORDER BY 銷售數量 DESC"></asp:SqlDataSource>
    </asp:Content>

