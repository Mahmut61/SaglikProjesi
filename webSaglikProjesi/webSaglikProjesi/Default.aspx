<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="webSaglikProjesi.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="dlstUrunler" runat="server" RepeatColumns="3" Width="510px" OnItemCommand="dlstUrunler_ItemCommand">
        <ItemTemplate>
            <div style="text-align:center">
                <asp:Label ID="lblUrunAd" runat="server" Text='<%#Eval("urunad") %>'></asp:Label><br />
                <asp:ImageButton ID="imgResim1" runat="server" ImageUrl='<%#Eval("urunresimyolu1") %>' Width="100px" Height="120px" AlternateText='<%#Eval("urunad") %>' CommandName="detay" CommandArgument='<%#Eval("urunid") %>' /><br />
                <asp:Label ID="lblFiyat" runat="server" Text='<%#Eval("urunfiyat","{0:C}") %>'></asp:Label>&nbsp;
                <asp:TextBox ID="txtAdet" runat="server" TextMode="Number" Width="26px" Text="1"></asp:TextBox><br />
                <asp:ImageButton ID="btnSepeteAt" ImageUrl="~/Content/style/images/btnSepeteAt.png" runat="server" CommandName="sepet" CommandArgument='<%#Eval("urunid") %>' />
            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
