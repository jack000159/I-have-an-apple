<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Wizard1_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        if (Wizard1.WizardSteps[e.CurrentStepIndex].Title == "訂購資訊")
        {
            if (chkTheSameAsShipper.Checked)
            {
                txtShipAddr.Text = txtOrderAddr.Text;
                txtShipName.Text = txtOrderName.Text;
                txtShipPhone.Text = txtOrderPhone.Text;

                Wizard1.MoveTo(wStepFinish);
            }
        }
    }

    protected void Wizard1_ActiveStepChanged(object sender, EventArgs e)
    {
        if (Wizard1.ActiveStep.Title == "確認")
        {
            lblOrderName.Text = txtOrderName.Text;
            lblOrderAddr.Text = txtOrderAddr.Text;
            lblOrderPhone.Text = txtOrderPhone.Text;

            lblShipName.Text = txtShipName.Text;
            lblShipAddr.Text = txtShipAddr.Text;
            lblShipPhone.Text = txtShipPhone.Text;

            DisplayCart();
        }
    }

    void DisplayCart()
    {
        List<Caritem> cart;
        cart = (List<Caritem>)Session["Cart"];
        GridView1.DataSource = cart;
        GridView1.DataBind();
    }

    protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {

        Order orders = new Order();
        orders.Username = User.Identity.Name;
        orders.OrderAddr = txtOrderAddr.Text;
        orders.OrderPhone = txtOrderPhone.Text;
        orders.ShipAddr = txtShipAddr.Text;
        orders.ShipPhone = txtShipPhone.Text;
        orders.CreateDate = DateTime.Now;

        //加入訂單明細
        List<Caritem> cart;
        cart = (List<Caritem>)Session["Cart"];
        Order_Details detail;
        for (int i =0; i < cart.Count; i++)
        {
            detail = new Order_Details();
            detail.ProductId = Convert.ToInt32(cart[i].Title_Id);
            //detail.Order =Convert.ToUInt32(cart[i].Title_Id);
            detail.Qty = cart[i].Quanty;
            orders.Order_Details.Add(detail);
        }

        //寫入資料庫
        productEntities1 db = new productEntities1();
        db.Orders.Add(orders);
        db.SaveChanges();

        lblOrderNo.Text = orders.Id.ToString();
        lblOrderCreateTime.Text = orders.CreateDate.ToString();


    }

    protected void Wizard1_Load(object sender, EventArgs e)
    {

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            txtOrderName.Text = User.Identity.Name;

            if (Session["Cart"] == null) {
                lblMessage.Text = "購物車無產品";

            }
            else {
                List<Caritem> cart;
                cart =(List<Caritem>) Session["Cart"];
                if (cart.Count==0) {
                    lblMessage.Text = "購物車中尚未有產品!";
                    Wizard1.Visible = false;
                }
            }
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CP1" Runat="Server">
    <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" CellPadding="10" OnNextButtonClick="Wizard1_NextButtonClick" OnActiveStepChanged="Wizard1_ActiveStepChanged" BackColor="#F7F6F3" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" OnFinishButtonClick="Wizard1_FinishButtonClick" OnLoad="Wizard1_Load">
        <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" Font-Size="0.9em" ForeColor="White" HorizontalAlign="Left" />
        <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
        <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
        <SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em" VerticalAlign="Top" />
        <StepStyle BorderWidth="0px" ForeColor="#5D7B9D" />
        <WizardSteps>
            <asp:WizardStep runat="server" title="訂購資訊">
                訂購姓名:<asp:TextBox ID="txtOrderName" runat="server"></asp:TextBox>
                <br />
                訂購地址:<asp:TextBox ID="txtOrderAddr" runat="server"></asp:TextBox>
                <br />
                訂購電話:<asp:TextBox ID="txtOrderPhone" runat="server"></asp:TextBox>
                <br />
                <asp:CheckBox ID="chkTheSameAsShipper" runat="server" Text="同收貨人" />
            </asp:WizardStep>
            <asp:WizardStep runat="server" title="出貨資訊">
                收件姓名:<asp:TextBox ID="txtShipName" runat="server"></asp:TextBox>
                <br />
                收件地址:<asp:TextBox ID="txtShipAddr" runat="server"></asp:TextBox>
                <br />
                收件電話:<asp:TextBox ID="txtShipPhone" runat="server"></asp:TextBox>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="確認" StepType="Finish" ID="wStepFinish">
                訂購姓名:<asp:Label ID="lblOrderName" runat="server"></asp:Label>
                <br />
                訂購地址:<asp:Label ID="lblOrderAddr" runat="server"></asp:Label>
                <br />
                訂購電話:<asp:Label ID="lblOrderPhone" runat="server"></asp:Label>
                <br />
                <br />
                收件人:<asp:Label ID="lblShipName" runat="server"></asp:Label>
                <br />
                收件地址:<asp:Label ID="lblShipAddr" runat="server"></asp:Label>
                <br />
                收件電話:<asp:Label ID="lblShipPhone" runat="server"></asp:Label>
                <br />
                <asp:GridView ID="GridView1" runat="server">
                </asp:GridView>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="完成" StepType="Complete">
                訂單編號:
                <asp:Label ID="lblOrderNo" runat="server"></asp:Label>
                <br />
                訂單建立時間:
                <asp:Label ID="lblOrderCreateTime" runat="server"></asp:Label>
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
</asp:Content>

