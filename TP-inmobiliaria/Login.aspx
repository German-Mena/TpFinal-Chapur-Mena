<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TP_inmobiliaria.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label Text="" runat="server" ID="lblMensaje" Font-Size="Larger"/>

    <%--<div>
        <asp:Button ID="BtnNuevoUsuario" runat="server" Text="No tengo usuario en La Inmobiliaria" Onclick="BtnNuevoUsuario_Click"/>
    </div>

    <div>
        <asp:Button ID="BtnIngresar" runat="server" Text="Ya tengo un usuario registrado" Onclick="BtnIngresar_Click"/>
    </div>--%>

    <div class="accordion" id="accordionExample">
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingOne">
                <button runat="server" id="btn_ingresar" class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    Ya tengo un usuario en la inmobiliaria
                </button>
            </h2>
            <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                <div class="accordion-body">
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
                        <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" CssClass="btn btn-primary" onclick="btnIngresar_Click1" />
                    </div>
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingTwo">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    Quiero crear un nuevo usuario 
                </button>
            </h2>
            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <div class="col-md-4">
                        <div class="mb-3">
                            <label class="form-label">Usuario</label>
                            <asp:TextBox ID="TextBox1" placeholder="Usuario" CssClass="form-control" runat="server"></asp:TextBox>
                            <div id="emailHelp" class="form-text">Elegi el nombre de tu usuario</div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Contraseña</label>
                            <asp:TextBox ID="TextBox2" placeholder="Contraseña" runat="server" CssClass="form-control"></asp:TextBox>
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

                        <asp:Button ID="btn_nuevoUser" runat="server" Text="Ingresar" CssClass="btn btn-primary" OnClick="btn_nuevoUser_Click"   />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
