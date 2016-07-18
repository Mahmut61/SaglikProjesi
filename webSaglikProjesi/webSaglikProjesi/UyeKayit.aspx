<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UyeKayit.aspx.cs" Inherits="webSaglikProjesi.UyeKayit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        var Baslik = this.document.getElementById("ortaBaslik"); <%--Burada masterpage de olan middle altındaki id ortaBaslik ile --%>
        Baslik.innerText = "Yeni Üye Kayıt İşlemleri";<%--Sepet sayfasına gittiğimizde Başlık kısmını değiştirmiş olduk. --%>
    </script>
    <div style="float: left">
        <table style="text-align: left; width: 352px; height: 240px;">
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblMesaj" runat="server" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 120px">
                    <asp:Label ID="Label1" runat="server" Text="Kullanıcı Adı(email)"></asp:Label>

                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Width="189px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Kullanıcı adı boş geçilemez!" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email uygun formatta değil" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Şifre"></asp:Label>

                </td>
                <td>
                    <asp:TextBox ID="txtSifre" TextMode="Password" runat="server" Width="189px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSifre" runat="server" ControlToValidate="txtSifre" ErrorMessage="Şifre boş geçilemez!" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label9" runat="server" Text="Şifre Tekrar"></asp:Label>

                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtSifreTekrar" TextMode="Password" runat="server" Width="189px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSifreTekrar" runat="server" ControlToValidate="txtSifreTekrar" ErrorMessage="Şifre boş geçilemez!" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvSifreTekrar" runat="server" ControlToCompare="txtSifre" ControlToValidate="txtSifreTekrar" ErrorMessage="Şifreler Aynı Değil" ForeColor="#CC0000">*</asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Ad"></asp:Label>

                </td>
                <td>
                    <asp:TextBox ID="txtAd" runat="server" Width="189px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAd" runat="server" ControlToValidate="txtAd" ErrorMessage="Ad boş geçilemez!" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label8" runat="server" Text="Soyad"></asp:Label>

                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtSoyad" runat="server" Width="189px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSoyad" runat="server" ControlToValidate="txtSoyad" ErrorMessage="Soyad boş geçilemez!" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label10" runat="server" Text="TC Kimlik No"></asp:Label>

                </td>
                <td>
                    <asp:TextBox ID="txtTCKNo" runat="server" Width="189px" TextMode="Number" MaxLength="11"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTCKNo" runat="server" ControlToValidate="txtTCKNo" ErrorMessage="TC Kimlik No boş geçilemez!" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Telefon"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtTelefon" runat="server" Width="189px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTelefon" runat="server" ControlToValidate="txtTelefon" ErrorMessage="Telefon boş geçilemez!" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 120px">
                    <asp:Label ID="Label3" runat="server" Text="Teslim Adresi"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtAdres" TextMode="MultiLine" runat="server" Width="189px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="İlçe"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtIlce" runat="server" Width="189px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="İl"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtIl" runat="server" Width="189px"></asp:TextBox>
                </td>
            </tr>
            <tr style="text-align: center">
                <td colspan="2">
                    <asp:CheckBox ID="cbxOkudum" runat="server" Text="Gizlilik Sözleşmesini Okudum." /></td>
            </tr>
            <tr>
                <td></td>
                <td style="text-align: center">
                    <asp:Button ID="btnKayitOl" CssClass="bluebutton" runat="server" Text="Kaydet" Width="85px" OnClick="btnKayitOl_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnDevam" CssClass="bluebutton" runat="server" Text="Devam" Width="85px" Visible="False" OnClick="btnDevam_Click" />
                </td>
            </tr>
        </table>
    </div>
    <div style="float: left; width: 156px;">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        <asp:TextBox ID="txtSozlesme" runat="server" TextMode="MultiLine" Height="90px" Width="147px" Text="Gizlilik sözleşmesi gimiş olduğunuz kişisel bilgileriniz 3. Şahıs ve kurumlarla paylaşılmayacaktır.Hertürlü özel bilgi ve ödeme işlemleriniz 128 bit SSL güvenlik sertifikalarıyla gizlenecektir."></asp:TextBox>
    </div>
</asp:Content>
