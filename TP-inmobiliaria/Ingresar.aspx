<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Ingresar.aspx.cs" Inherits="TP_inmobiliaria.Ingresar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-md-4">
        <div class="mb-3">
            <label class="form-label">Usuario</label>
            <asp:TextBox ID="txtUser" placeholder="Usuario" CssClass="form-control" runat="server"></asp:TextBox>
            <div id="emailHelp" class="form-text">Por favor ingresa el nombre de tu usuario</div>
        </div>
        <div class="mb-3">
            <label class="form-label">Contraseña</label>
            <asp:TextBox ID="txtPass" placeholder="Contraseña" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" CssClass="btn btn-primary" OnClick="btnIngresar_Click" />        
    </div>


</asp:Content>

