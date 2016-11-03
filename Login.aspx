<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        if (PubsMembership.VerifyUser(Login1.UserName, Login1.Password))
        {
            //產生驗證Cookie
            //FormsAuthentication.RedirectFromLoginPage(userName,false) 

            e.Authenticated = true;

        }
        else
        {
            e.Authenticated = false;

        }


    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CP1" Runat="Server">
    <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate">
    </asp:Login>
    <br />
    </asp:Content>

