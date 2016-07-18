<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="webSaglikProjesi.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="dlstUrunler" runat="server" RepeatColumns="1" Width="510px" OnItemCommand="dlstUrunler_ItemCommand">
        <ItemTemplate>
            <div style="text-align:center">
                <asp:Label ID="lblUrunAd" runat="server" Text='<%#Eval("urunad") %>'></asp:Label><br />
                <asp:ImageButton ID="imgResim1" runat="server" ImageUrl='<%#Eval("urunresimyolu2") %>' Width="220px" Height="240px" AlternateText='<%#Eval("urunad") %> ' /><br />
                <asp:Label ID="lblFiyat" runat="server" Text='<%#Eval("urunfiyat","{0:C}") %>'></asp:Label>&nbsp;
                <asp:TextBox ID="txtAdet" runat="server" TextMode="Number" Width="26px" Text="1"></asp:TextBox><br />
                <asp:ImageButton ID="btnSepeteAt" ImageUrl="~/Content/style/images/btnSepeteAt.png" runat="server" CommandName="sepet" CommandArgument='<%#Eval("urunid") %>' />
                <asp:Label ID="lblUrunBilgisi" runat="server" Text='<%#Eval("urunbilgisi") %>'></asp:Label>
            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
