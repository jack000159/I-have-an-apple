<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        Label 編號label = (Label)FormView1.FindControl("編號label");
        string tid = 編號label.Text;
        HttpCookie cookie = new HttpCookie("myfavorite");
        cookie.Value = tid;
        cookie.Expires = DateTime.Now.AddDays(7);
        Response.Cookies.Add(cookie);
    }

    protected void btnAddtocart_Click(object sender, EventArgs e)
    {
        //取得產品採購資訊(編號,售價,數量)
        Caritem item = new Caritem();


        //---用法1
        //Label lbl = (Label)FormView1.FindControl("編號label");
        //item.Title_Id = lbl.Text;
        //lbl = (Label)FormView1.FindControl("售價label");
        //item.Price = Convert.ToDecimal(lbl.Text);
        //item.Quanty = 1;

        //---用法2---售價有其他非數值資料
        FormView1.DataBind();
        object product = FormView1.DataItem; //直接取得FormView對應的那筆資料
        item.Title_Id = DataBinder.Eval(product, "編號").ToString();
        item.Price = (decimal)DataBinder.Eval(product, "售價");
        item.name = DataBinder.Eval(product, "品名").ToString();
        item.Quanty = 1;

        Response.Write(item.SubTotal);


        //取得原購物車內容(Session變數紀錄)
        //Caritem[] cart = new Caritem[100]; //不用陣列因為固定大小
        List<Caritem> cart; //用List較有彈性


        if (Session["Cart"] == null)
        {
            cart = new List<Caritem>();//建立全新的集合
        }
        else
        {
            cart = (List<Caritem>)Session["Cart"];
        }


        //購物車中已有的產品
        bool exists = false;//已存在
        for (int i =0; i < cart.Count; i++)
        {
            if (cart[i].Title_Id == item.Title_Id)
            {
                cart[i].Quanty = cart[i].Quanty+1; //已存在,數量加1
                exists = true;
            }
        }
        if (!exists) //新的產品
        {
            cart.Add(item);//加入購物車
        }

        //更新購物車
        Session["Cart"] = cart;
        Response.Redirect("Cart.aspx");//帶到購物車的頁面
        //加入購物車(Session變數紀錄)



    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CP1" Runat="Server">
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            編號:
            <asp:TextBox ID="編號TextBox" runat="server" Text='<%# Bind("編號") %>' />
            <br />
            品名:
            <asp:TextBox ID="品名TextBox" runat="server" Text='<%# Bind("品名") %>' />
            <br />
            售價:
            <asp:TextBox ID="售價TextBox" runat="server" Text='<%# Bind("售價") %>' />
            <br />
            庫存:
            <asp:TextBox ID="庫存TextBox" runat="server" Text='<%# Bind("庫存") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
        </EditItemTemplate>
        <InsertItemTemplate>
            編號:
            <asp:TextBox ID="編號TextBox" runat="server" Text='<%# Bind("編號") %>' />
            <br />
            品名:
            <asp:TextBox ID="品名TextBox" runat="server" Text='<%# Bind("品名") %>' />
            <br />
            售價:
            <asp:TextBox ID="售價TextBox" runat="server" Text='<%# Bind("售價") %>' />
            <br />
            庫存:
            <asp:TextBox ID="庫存TextBox" runat="server" Text='<%# Bind("庫存") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:Image ID="Image1" runat="server" Height="314px" ImageUrl='<%# Eval("編號", "covers/{0}.png") %>' style="text-align: left" Width="231px" />
            <br />
            編號:
            <asp:Label ID="編號Label" runat="server" Text='<%# Bind("編號") %>' />
            <br />
            品名:
            <asp:Label ID="品名Label" runat="server" Text='<%# Bind("品名") %>' />
            <br />
            售價:
            <asp:Label ID="售價Label" runat="server" Text='<%# Bind("售價") %>' />
            <br />
            <br />
            &nbsp;<br />

        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:productConnectionString %>" SelectCommand="SELECT * FROM [stock] WHERE ([編號] = @編號)">
        <SelectParameters>
            <asp:QueryStringParameter Name="編號" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Button ID="Button1" runat="server" Height="22px" OnClick="Button1_Click" Text="加入追蹤" style="margin-top: 0px" />
    <asp:Button ID="btnAddtocart" runat="server" Text="加入購物車" OnClick="btnAddtocart_Click" />
    </asp:Content>

