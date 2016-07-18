<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Sepet.aspx.cs" Inherits="webSaglikProjesi.Sepet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        var Baslik = this.document.getElementById("ortaBaslik"); <%--Burada masterpage de olan middle altındaki id ortaBaslik ile --%>
        Baslik.innerText = "Sepet İşlemleri";<%--Sepet sayfasına gittiğimizde Başlık kısmını değiştirmiş olduk. --%>
    </script>
    <center>
    <img src="Content/style/images/sepetonay2.jpg" /><br />
    <asp:GridView ID="gvSepet" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="sepetID" ForeColor="#333333" GridLines="None" ShowFooter="True" Width="447px" OnRowDeleting="gvSepet_RowDeleting">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="urunAd" HeaderText="Ürün Adı" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="fiyat" HeaderText="Fiyat" >
            <HeaderStyle HorizontalAlign="Right" />
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="adet" HeaderText="Adet" >
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="tutar" HeaderText="Tutar" >
            <HeaderStyle HorizontalAlign="Right" />
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:CommandField DeleteText="sil" ShowDeleteButton="True" >
            <ItemStyle HorizontalAlign="Center" Width="30px" />
            </asp:CommandField>
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
        <EmptyDataTemplate>Sepetinizde ürün bulunmamaktadır.</EmptyDataTemplate><%--Sepet(gridview) boşsa griedview e bunu yazıcak--%>
    </asp:GridView>
        <br />
        
    <asp:Button ID="btnSepetiBosalt" CssClass="bluebutton" runat="server" Text="SepetiBoşalt" OnClick="btnSepetiBosalt_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnDevam" CssClass="bluebutton" runat="server" Text="AlışverişeDevam" OnClick="btnDevam_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnSatınAl" CssClass="bluebutton" runat="server" Text="Satın Al" OnClick="btnSatınAl_Click" />
        </center>
</asp:Content>
