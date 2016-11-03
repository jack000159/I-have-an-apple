<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        string errMessage;
        if(PubsMembership.CreateUser(txtUserName.Text,txtPassword.Text,out errMessage)){
            Label1.Text = "註冊成功";
        }
        else
        {
            Label1.Text = errMessage;
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CP1" Runat="Server">
    <h2>會員註冊</h2>
    <p>帳號:<asp:TextBox ID="txtUserName" runat="server"></asp:TextBox></p>
    <p>密碼:<asp:TextBox ID="txtPassword" runat="server" EnableTheming="True" TextMode="Password"></asp:TextBox></p>
    <p> <asp:Label ID="Label1" runat="server"></asp:Label></p>
    <p><asp:Button ID="btnRegister" runat="server" Text="註冊" OnClick="btnRegister_Click" /></p>

        
</asp:Content>

