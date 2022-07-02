<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TP_inmobiliaria.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label Text="text" runat="server" ID="lblMensaje" Font-Size="Larger"/>

    <div>
        <asp:Button ID="BtnNuevoUsuario" runat="server" Text="No tengo usuario en La Inmobiliaria" Onclick="BtnNuevoUsuario_Click"/>
    </div>

    <div>
        <asp:Button ID="BtnIngresar" runat="server" Text="Ya tengo un usuario registrado" Onclick="BtnIngresar_Click"/>
    </div>

</asp:Content>
