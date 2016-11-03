<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Write(DropDownList1.SelectedItem.Value);
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CP1" Runat="Server">
    <p>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="品名" DataValueField="售價" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" style="height: 19px">
        </asp:DropDownList>
    </p>
    <p>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:productConnectionString %>" SelectCommand="SELECT [編號], [品名], [售價], [庫存] FROM [stock]"></asp:SqlDataSource>
        <br />
    </p>
</asp:Content>

