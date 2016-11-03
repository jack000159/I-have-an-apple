<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>


<script runat="server">

    void DisplayCart() {

        if (Session["Cart"]==null) {
            Label1.Text = "購物車中尚未加入商品";
            Button1.Visible = false;
        }
        else {
            Button1.Visible = true;
            List<Caritem> cart;
            cart =(List<Caritem>) Session["Cart"];
            if (cart.Count==0) {
                Label1.Text = "購物車中尚未加入商品";
            }
            GridView1.DataSource = cart;
            GridView1.DataBind();
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) //第一次進入
        {
            DisplayCart();
        }


    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string tid = (string)e.Keys["Title_Id"];
        //Response.Write(tid);

        //刪除 Session 購物車中對應的商品

        if (Session["Cart"] == null)
        {
            Label1.Text = "購物車中尚未加入商品";
            Button1.Visible = false;

        }
        else
        {
            Button1.Visible = true;
            List<Caritem> cart;
            cart = (List<Caritem>)Session["Cart"];
            for(int i =0; i < cart.Count; i++)
            {
                if (cart[i].Title_Id == tid)
                {
                    cart.RemoveAt(i);
                    break;
                }
            }
            DisplayCart();

        }
    }
    decimal total = 0;
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            object item = e.Row.DataItem;
            decimal subtotal = (decimal)DataBinder.Eval(item, "SubTotal");
            //Response.Write(subtotal + ",");
            total = total + subtotal;

        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {

            e.Row.Cells[3].Text = "總計";
            e.Row.Cells[4].Text = total.ToString();

        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CP1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="Title_Id" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True">
        <Columns>
            <asp:BoundField DataField="Title_Id" HeaderText="編號" />
            <asp:HyperLinkField DataNavigateUrlFields="Title_Id" DataNavigateUrlFormatString="phone.aspx?id={0}" DataTextField="name" Text="品名" HeaderText="品名" />
            <asp:BoundField DataField="Price" HeaderText="售價" DataFormatString="{0:c2}" />
            <asp:BoundField DataField="Quanty" HeaderText="數量" />
            <asp:BoundField DataField="SubTotal" HeaderText="小計" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
&nbsp;<asp:Button ID="Button1" runat="server" PostBackUrl="~/Checkout.aspx" Text="結帳" />
</asp:Content>

