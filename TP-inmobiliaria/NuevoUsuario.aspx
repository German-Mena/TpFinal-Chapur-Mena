<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="NuevoUsuario.aspx.cs" Inherits="TP_inmobiliaria.NuevoUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-md-4">

        <div class="mb-3">
            <label class="form-label">Usuario</label>
            <asp:TextBox ID="txtUser" placeholder="Usuario" CssClass="form-control" runat="server"></asp:TextBox>
            <div id="emailHelp" class="form-text">Elegi el nombre de tu usuario</div>
        </div>

        <div class="mb-3">
            <label class="form-label">Contraseña</label>
            <asp:TextBox ID="txtPass" placeholder="Contraseña" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="mb-3">
            <label class="form-label">Mail</label>
            <asp:TextBox ID="txtMail" placeholder="Mail" CssClass="form-control" runat="server"></asp:TextBox>
        </div>

        <div class="mb-3">
            <label class="form-label">Nombre</label>
            <asp:TextBox ID="txtNombre" placeholder="Nombre" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        
        <div class="mb-3">
            <label class="form-label">Apellido</label>
            <asp:TextBox ID="txtApellido" placeholder="Apellido" CssClass="form-control" runat="server"></asp:TextBox>
        </div>

        <div class="mb-3">
            <label class="form-label">Telefono</label>
            <asp:TextBox ID="txtTelefono" placeholder="Telefono" CssClass="form-control" runat="server"></asp:TextBox>
        </div>

        <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" CssClass="btn btn-primary" Onclick="btnIngresar_Click" />
    </div>

</asp:Content>
