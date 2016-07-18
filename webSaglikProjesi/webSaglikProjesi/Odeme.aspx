<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Odeme.aspx.cs" Inherits="webSaglikProjesi.Odeme" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        var Baslik = this.document.getElementById("ortaBaslik"); <%--Burada masterpage de olan middle altındaki id ortaBaslik ile --%>
        Baslik.innerText = "Ödeme İşlemleri";<%--Sepet sayfasına gittiğimizde Başlık kısmını değiştirmiş olduk. --%>
    </script>
    <div style="text-align:center">
        <img src="Content/style/images/odeme2.jpg" />
        <br /><br />
        <table style="text-align:center;width:370px">
            <tr>
                <td style="width:120px"><asp:Label ID="Label1" runat="server" Text="Adı"></asp:Label></td>
                <td><asp:Label ID="lblAdi" runat="server"></asp:Label></td>
            </tr>
             <tr>
                <td><asp:Label ID="Label2" runat="server" Text="Soyadı"></asp:Label></td>
                <td><asp:Label ID="lblSoyadı" runat="server"></asp:Label></td>
            </tr>
             <tr>
                <td><asp:Label ID="Label3" runat="server" Text="Alışveriş Tutarı"></asp:Label></td>
                <td><asp:Label ID="lblTutar" runat="server"></asp:Label></td>
            </tr>
            <tr><td></td><td></td></tr>
            <tr>
                <td>
                    <asp:Button ID="btnHavaleEFT" CssClass="bluebutton" runat="server" Text="Havale/EFT" Width="85px" OnClick="btnHavaleEFT_Click"/>
                </td>
                 <td style="text-align:right">
                    <asp:Button ID="btnKrediKarti" CssClass="bluebutton" runat="server" Text="Kredi Kartı" Width="85px" />
                </td>
            </tr>
        </table>
        <asp:Panel ID="pnlBankaBilgileri" runat="server" Visible="false">
            <table style="text-align:left;width:370px">
            <tr>
                <td style="width:120px"><asp:Label ID="Label4" runat="server" Text="Firma-Ünvan"></asp:Label></td>
                <td><asp:Label ID="lblFirma" runat="server" Text="MS-YAZ-8 SaglikUrunleri Ltd. Şti."></asp:Label></td>
            </tr>
             <tr>
                <td><asp:Label ID="Label6" runat="server" Text="Banka"></asp:Label></td>
                <td><asp:Label ID="Label7" runat="server" Text="Garanti Bankası"></asp:Label></td>
            </tr>
             <tr>
                <td><asp:Label ID="Label8" runat="server" Text="Şube"></asp:Label></td>
                <td><asp:Label ID="Label9" runat="server" Text="Barbaros Şb."></asp:Label></td>
            </tr>
                <tr>
                <td><asp:Label ID="Label5" runat="server" Text="Hesap No"></asp:Label></td>
                <td><asp:Label ID="Label10" runat="server" Text="35232354"></asp:Label></td>
            </tr>
                <tr>
                <td><asp:Label ID="Label11" runat="server" Text="IBAN"></asp:Label></td>
                <td><asp:Label ID="Label12" runat="server" Text="TR49 1223 5352 5746 3423 2452 89"></asp:Label></td>
            </tr>
                <tr><td></td><td></td></tr>
            <tr>
                <td>
                    <asp:Button ID="btnDavam" CssClass="bluebutton" runat="server" Text="Alışverişe Devam" Width="106px" OnClick="btnDavam_Click"/>
                </td>
                 <td style="text-align:right">
                    <asp:Button ID="btnCikis" CssClass="bluebutton" runat="server" Text="Güvenli Çıkış" Width="106px" OnClick="btnCikis_Click" />
                </td>
            </tr>
        </table>
        </asp:Panel>
    </div>
</asp:Content>
