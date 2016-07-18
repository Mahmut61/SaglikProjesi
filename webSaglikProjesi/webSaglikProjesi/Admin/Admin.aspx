<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="webSaglikProjesi.Admin.Admin1" %>

<%@ Register Src="~/Admin/ucLogin.ascx" TagPrefix="uc1" TagName="ucLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlLogin" runat="server" Visible="false">
        <uc1:ucLogin runat="server" id="ucLogin" />
    </asp:Panel>
</asp:Content>
