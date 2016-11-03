<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CP1" Runat="Server">
    <asp:Wizard ID="Wizard1" runat="server">
        <WizardSteps>
            <asp:WizardStep runat="server" title="Step 1">
            </asp:WizardStep>
            <asp:WizardStep runat="server" title="Step 2">
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
</asp:Content>

