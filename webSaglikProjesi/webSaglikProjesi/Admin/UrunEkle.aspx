<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UrunEkle.aspx.cs" Inherits="webSaglikProjesi.Admin.UrunEkle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
           <div>
           <asp:DropDownList ID="ddlKategoriler" runat="server" AutoPostBack="True" Height="17px" Width="163px" OnSelectedIndexChanged="ddlKategoriler_SelectedIndexChanged"></asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlAltkategoriler" runat="server" AutoPostBack="True" Height="17px" Width="163px" OnSelectedIndexChanged="ddlAltKategoriler_SelectedIndexChanged"></asp:DropDownList><br /><br />
        <asp:GridView ID="gvUrunler" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="urunid" ForeColor="#333333" GridLines="None" Width="508px" OnSelectedIndexChanged="gvUrunler_SelectedIndexChanged" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField SelectText="&gt;&gt;" ShowSelectButton="True" />
                <asp:BoundField DataField="urunid" HeaderText="ID" Visible="False" />
                <asp:BoundField DataField="urunkodu" HeaderText="ürünkodu" >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="urunad" HeaderText="ürünadı" >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="urunkategorino" HeaderText="KNo" Visible="False" />
                <asp:BoundField DataField="urunaltkategorino" HeaderText="AltKNo" Visible="False" />
                <asp:BoundField DataField="miktar" HeaderText="miktar">
                <ItemStyle HorizontalAlign="Center" Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="urunfiyat" HeaderText="fiyat">
                <ItemStyle HorizontalAlign="Right" Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="urunbilgisi" HeaderText="Bilgisi" Visible="False" />
                <asp:BoundField DataField="urunresimyolu1" HeaderText="ürünresimyolu1" Visible="False" />
                <asp:BoundField DataField="urunresimyolu2" HeaderText="ürünresimyolu2" Visible="False" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />

        </asp:GridView>
                <br />
        <asp:LinkButton ID="lbYeniUrun" runat="server" OnClick="lbYeniUrun_Click">Yeni Ürün Ekle</asp:LinkButton>
        <br /><br />
        <asp:Panel ID="pnlEkle" runat="server" Visible="false">
            <table>
                <tr>
                    <td><asp:Label ID="Label1" runat="server" Text="Ürün Kodu"></asp:Label></td>
                    <td><asp:TextBox ID="txtUrunKodu" runat="server" Width="230px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Label ID="Label2" runat="server" Text="Ürün Adı"></asp:Label></td>
                    <td><asp:TextBox ID="txtUrunAdi" runat="server" Width="230px"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td><asp:Label ID="Label3" runat="server" Text="Ürün Bilgisi"></asp:Label></td>
                    <td><asp:TextBox ID="txtUrunBilgisi" runat="server" Width="230px" TextMode="MultiLine"></asp:TextBox></td>
                </tr>
                  <tr>
                    <td><asp:Label ID="Label4" runat="server" Text="Miktar"></asp:Label></td>
                    <td><asp:TextBox ID="txtMiktar" runat="server" Width="230px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Label ID="Label5" runat="server" Text="Fiyat"></asp:Label></td>
                    <td><asp:TextBox ID="txtFiyat" runat="server" Width="230px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Label ID="Label6" runat="server" Text="Küçük Resim"></asp:Label></td>
                    <td><asp:FileUpload ID="fuKucukResim" runat="server" Width="230px" /></td>
                </tr>
                <tr>
                    <td><asp:Label ID="Label7" runat="server" Text="Büyük Resim"></asp:Label></td>
                    <td><asp:FileUpload ID="fuBuyukResim" runat="server" Width="230px" /></td>
                </tr>
                <tr>
                    <td><asp:Button ID="btnKaydet" CssClass="bluebutton" runat="server" Text="Kaydet" Width="60px" OnClick="btnKaydet_Click" /></td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; <asp:Button ID="btnDegistir" CssClass="bluebutton" runat="server" Text="Değiştir" Width="64px" OnClick="btnDegistir_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <asp:Button ID="btnSil" CssClass="bluebutton" runat="server" Text="Sil" Width="74px" OnClick="btnSil_Click" OnClientClick="return confirm('Silmek İstiyor Musunuz?')" /></td>
                </tr>
            </table>
        </asp:Panel>
    </div>
</asp:Content>
