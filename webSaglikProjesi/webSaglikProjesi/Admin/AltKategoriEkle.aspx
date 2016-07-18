<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AltKategoriEkle.aspx.cs" Inherits="webSaglikProjesi.Admin.AltKategoriEkle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div>
           <asp:DropDownList ID="ddlKategoriler" runat="server" AutoPostBack="True" Height="17px" Width="163px" OnSelectedIndexChanged="ddlKategoriler_SelectedIndexChanged"></asp:DropDownList><br /><br />
        <asp:GridView ID="gvAltKategoriler" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" ForeColor="#333333" GridLines="None" Width="400px" OnSelectedIndexChanged="gvAltKategoriler_SelectedIndexChanged" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField SelectText="&gt;&gt;" ShowSelectButton="True" />
                <asp:BoundField DataField="altkategoriad" HeaderText="altkategori" >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="aciklama" HeaderText="açıklama" >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="230px" />
                </asp:BoundField>
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
        <asp:LinkButton ID="lbYeniAltKategori" runat="server" OnClick="lbYeniAltKategori_Click">Yeni Alt Kategori</asp:LinkButton>
        <br /><br />
        <asp:Panel ID="pnlEkle" runat="server" Visible="false">
            <table>
                <tr>
                    <td><asp:Label ID="Label1" runat="server" Text="AltKategori"></asp:Label></td>
                    <td><asp:TextBox ID="txtAltKategori" runat="server" Width="161px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Label ID="Label2" runat="server" Text="Açıklama"></asp:Label></td>
                    <td><asp:TextBox ID="txtAciklama" runat="server" Width="161px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Button ID="btnKaydet" CssClass="bluebutton" runat="server" Text="Kaydet" Width="60px" OnClick="btnKaydet_Click" /></td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnDegistir" CssClass="bluebutton" runat="server" Text="Değiştir" Width="60px" OnClick="btnDegistir_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnSil" CssClass="bluebutton" runat="server" Text="Sil" Width="60px" OnClick="btnSil_Click" OnClientClick="return confirm('Silmek İstiyor Musunuz?')" /></td>
                </tr>
            </table>
        </asp:Panel>
    </div>
</asp:Content>
