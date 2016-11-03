<%@ Page Title="" Language="C#" MasterPageFile="~/backyard/admin.master" %>

<script runat="server">

    protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {

    }

    protected void dsformview_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
        {
            GridView1.DataBind();

            FormView1.Visible = false;

        }
        else
        {
            Label1.Text = e.Exception.Message;
            e.ExceptionHandled = true;
        }
    }

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        FormView1.Visible = true;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        FormView1.Visible = true;
        FormView1.ChangeMode(FormViewMode.Insert);
        
    }

    protected void FormView1_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            FormView1.Visible = false;
        }
    }

    protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        FormView1.Visible = false;
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" Runat="Server">
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="新增" />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="編號" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" EnableViewState="False">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="編號" HeaderText="編號" SortExpression="編號" />
            <asp:BoundField DataField="品名" HeaderText="品名" SortExpression="品名" />
            <asp:BoundField DataField="售價" HeaderText="售價" SortExpression="售價" />
            <asp:BoundField DataField="庫存" HeaderText="庫存" SortExpression="庫存" />
            <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
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
    <br />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="編號" DataSourceID="dsformview" OnItemUpdated="FormView1_ItemUpdated" DefaultMode="Edit" OnItemCommand="FormView1_ItemCommand" OnItemInserted="FormView1_ItemInserted">
        <EditItemTemplate>
            品名:
            <asp:TextBox ID="品名TextBox" runat="server" Text='<%# Bind("品名") %>' Height="19px" Width="180px" BackColor="#FF99CC" />
            <br />
            售價:
            <asp:TextBox ID="售價TextBox" runat="server" Text='<%# Bind("售價") %>' Height="19px" Width="148px" />
            <br />
            庫存:
            <asp:TextBox ID="庫存TextBox" runat="server" Text='<%# Bind("庫存") %>' Height="19px" Width="146px" />
            <br />
            編號:
            <asp:Label ID="編號Label1" runat="server" Text='<%# Eval("編號") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
        </EditItemTemplate>
        <InsertItemTemplate>
            品名:
            <asp:TextBox ID="品名TextBox" runat="server" Text='<%# Bind("品名") %>' />
            <br />
            售價:
            <asp:TextBox ID="售價TextBox" runat="server" Text='<%# Bind("售價") %>' />
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="售價TextBox" ErrorMessage="請輸入1~99999之間的數字" MaximumValue="99999" MinimumValue="1" Type="Integer"></asp:RangeValidator>
            <br />
            庫存:
            <asp:TextBox ID="庫存TextBox" runat="server" Text='<%# Bind("庫存") %>' />
            <br />
            編號:
            <asp:TextBox ID="編號TextBox" runat="server" Text='<%# Bind("編號") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
        </InsertItemTemplate>
        <ItemTemplate>
            品名:
            <asp:Label ID="品名Label" runat="server" Text='<%# Bind("品名") %>' />
            <br />
            售價:
            <asp:Label ID="售價Label" runat="server" Text='<%# Bind("售價") %>' />
            <br />
            庫存:
            <asp:Label ID="庫存Label" runat="server" Text='<%# Bind("庫存") %>' />
            <br />
            編號:
            <asp:Label ID="編號Label" runat="server" Text='<%# Eval("編號") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="新增" />
        </ItemTemplate>
    </asp:FormView>
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <br />
    <asp:SqlDataSource ID="dsformview" runat="server" ConnectionString="<%$ ConnectionStrings:productConnectionString %>" DeleteCommand="DELETE FROM [stock] WHERE [編號] = @編號" InsertCommand="INSERT INTO [stock] ([品名], [售價], [庫存], [編號]) VALUES (@品名, @售價, @庫存, @編號)" SelectCommand="SELECT [品名], [售價], [庫存], [編號] FROM [stock] WHERE ([編號] = @編號)" UpdateCommand="UPDATE [stock] SET [品名] = @品名, [售價] = @售價, [庫存] = @庫存 WHERE [編號] = @編號" OnUpdated="dsformview_Updated">
        <DeleteParameters>
            <asp:Parameter Name="編號" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="品名" Type="String" />
            <asp:Parameter Name="售價" Type="Decimal" />
            <asp:Parameter Name="庫存" Type="Int32" />
            <asp:Parameter Name="編號" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="編號" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="品名" Type="String" />
            <asp:Parameter Name="售價" Type="Decimal" />
            <asp:Parameter Name="庫存" Type="Int32" />
            <asp:Parameter Name="編號" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:productConnectionString %>" DeleteCommand="DELETE FROM [stock] WHERE [編號] = @編號" InsertCommand="INSERT INTO [stock] ([編號], [品名], [售價], [庫存]) VALUES (@編號, @品名, @售價, @庫存)" SelectCommand="SELECT [編號], [品名], [售價], [庫存] FROM [stock]" UpdateCommand="UPDATE [stock] SET [品名] = @品名, [售價] = @售價, [庫存] = @庫存 WHERE [編號] = @編號" OnSelecting="SqlDataSource1_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="編號" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="編號" Type="Int32" />
            <asp:Parameter Name="品名" Type="String" />
            <asp:Parameter Name="售價" Type="Decimal" />
            <asp:Parameter Name="庫存" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="品名" Type="String" />
            <asp:Parameter Name="售價" Type="Decimal" />
            <asp:Parameter Name="庫存" Type="Int32" />
            <asp:Parameter Name="編號" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

