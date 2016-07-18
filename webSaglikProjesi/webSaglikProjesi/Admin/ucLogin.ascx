<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucLogin.ascx.cs" Inherits="webSaglikProjesi.Admin.ucLogin" %>
<link href="../Content/style/style.css" rel="stylesheet" />
<div>
            <table style="text-align:left; width:280px">
            <tr>
                <td></td>
                <td style="text-align:center"><h4>Admin Giriş</h4></td>
            </tr>
            <tr>
                <td style="width:90px">
                    <asp:Label ID="Label1" runat="server" Text="username"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtUsername" runat="server" Width="160px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtUsername" ErrorMessage="kullanıcı adı boş geçilemez." ForeColor="Red" >*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="password"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Width="160px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSifre" runat="server" ControlToValidate="txtPassword" ErrorMessage="şifre boş geçilemez." ForeColor="Red" >*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td></td>
                <td style="text-align:center">
                    <asp:Button ID="btnGiris" CssClass="bluebutton" runat="server" Text="Giriş" Width="85px" OnClick="btnGiris_Click" />
                </td>
            </tr>
                <tr>
                    <td colspan="2" style="text-align:center">
                        <asp:Label ID="lblMesaj" runat="server" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                    </td>
                </tr>
        </table>
</div>