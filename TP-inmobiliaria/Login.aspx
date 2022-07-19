<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs"
    Inherits="TP_inmobiliaria.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script>

        function validarNuevoUsuario() {

                var usuario = document.getElementById("<%= txtUserNuevo.ClientID %>").value;
                var pass = document.getElementById("<%= txtPassNuevo.ClientID %>").value;
                var mail = document.getElementById("<%= txtMail.ClientID %>").value;
                var nombre = document.getElementById("<%= txtNombre.ClientID %>").value;
                var apellido = document.getElementById("<%= txtApellido.ClientID %>").value;
                var telefono = document.getElementById("<%= txtTelefono.ClientID %>").value;

                var valido = true;

                if (usuario === "") {

                    //Si jQuery estuviera incluida en el proyecto, se podria hacer de la siguiente forma: 
                    <%--$("#<%= txtUserNuevo.ClientID %>").removeClass("is-valid"); --%>

                    document.getElementById("<%= txtUserNuevo.ClientID %>").classList.remove("is-valid");
                    document.getElementById("<%= txtUserNuevo.ClientID %>").classList.add("is-invalid");
                    valido = false;
                }
                else {
                    document.getElementById("<%= txtUserNuevo.ClientID %>").classList.remove("is-invalid");
                    document.getElementById("<%= txtUserNuevo.ClientID %>").classList.add("is-valid");
                }

                if (pass === "") {
                    document.getElementById("<%= txtPassNuevo.ClientID %>").classList.remove("is-valid");
                    document.getElementById("<%= txtPassNuevo.ClientID %>").classList.add("is-invalid");
                    valido = false;
                }
                else {
                    document.getElementById("<%= txtPassNuevo.ClientID %>").classList.remove("is-invalid");
                    document.getElementById("<%= txtPassNuevo.ClientID %>").classList.add("is-valid");
                }

                if (mail === "") {
                    document.getElementById("<%= txtMail.ClientID %>").classList.remove("is-valid");
                    document.getElementById("<%= txtMail.ClientID %>").classList.add("is-invalid");
                    valido = false;
                }
                else {
                    document.getElementById("<%= txtMail.ClientID %>").classList.remove("is-invalid");
                    document.getElementById("<%= txtMail.ClientID %>").classList.add("is-valid");
                }

                if (nombre === "") {
                    document.getElementById("<%= txtNombre.ClientID %>").classList.remove("is-valid");
                    document.getElementById("<%= txtNombre.ClientID %>").classList.add("is-invalid");
                    valido = false;
                }
                else {
                    document.getElementById("<%= txtNombre.ClientID %>").classList.remove("is-invalid");
                    document.getElementById("<%= txtNombre.ClientID %>").classList.add("is-valid");
                }

                if (apellido === "") {
                    document.getElementById("<%= txtApellido.ClientID %>").classList.remove("is-valid");
                    document.getElementById("<%= txtApellido.ClientID %>").classList.add("is-invalid");
                    valido = false;
                }
                else {
                    document.getElementById("<%= txtApellido.ClientID %>").classList.remove("is-invalid");
                    document.getElementById("<%= txtApellido.ClientID %>").classList.add("is-valid");
                }

                if (telefono === "") {
                    document.getElementById("<%= txtTelefono.ClientID %>").classList.remove("is-valid");
                    document.getElementById("<%= txtTelefono.ClientID %>").classList.add("is-invalid");
                    valido = false;
                }
                else {
                    document.getElementById("<%= txtTelefono.ClientID %>").classList.remove("is-invalid");
                    document.getElementById("<%= txtTelefono.ClientID %>").classList.add("is-valid");
                }

            return valido;
        }

        function validarUsuario() {
                var usuario = document.getElementById("<%= txtUser.ClientID %>").value;
                var pass = document.getElementById("<%= txtPass.ClientID %>").value;

                var valido = true;

                if (usuario === "") {
                    document.getElementById("<%= txtUser.ClientID %>").classList.remove("is-valid");
                    document.getElementById("<%= txtUser.ClientID %>").classList.add("is-invalid");
                    valido = false;
                }
                else {
                    document.getElementById("<%= txtUser.ClientID %>").classList.remove("is-invalid");
                    document.getElementById("<%= txtUser.ClientID %>").classList.add("is-valid");
                }

                if (pass === "") {
                    document.getElementById("<%= txtPass.ClientID %>").classList.remove("is-valid");
                    document.getElementById("<%= txtPass.ClientID %>").classList.add("is-invalid");
                    valido = false;
                }
                else {
                    document.getElementById("<%= txtPass.ClientID %>").classList.remove("is-invalid");
                    document.getElementById("<%= txtPass.ClientID %>").classList.add("is-valid");
                }

            return valido;
        }

    </script>

    <%--<div>
            <asp:Button ID="BtnNuevoUsuario" runat="server" Text="No tengo usuario en La Inmobiliaria"
                Onclick="BtnNuevoUsuario_Click" />
            </div>

            <div>
                <asp:Button ID="BtnIngresar" runat="server" Text="Ya tengo un usuario registrado"
                    Onclick="BtnIngresar_Click" />
            </div>--%>

    <asp:Label Text="" runat="server" ID="lblMensaje" Font-Size="Larger" />

    <div class="accordion" id="accordionExample">
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingOne">
                <button runat="server" id="btn_ingresar" class="accordion-button" type="button"
                    data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true"
                    aria-controls="collapseOne">
                    Ya tengo un usuario en la inmobiliaria
                </button>
            </h2>
            <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <div class="col-md-4">
                        <div class="mb-3">
                            <label class="form-label">Usuario</label>
                            <asp:TextBox ID="txtUser" placeholder="Usuario" CssClass="form-control"
                                runat="server"></asp:TextBox>
                            <%--<div id="emailHelp" class="form-text">Por favor ingresa el nombre de tu usuario
                                </div>--%>
                            <div class="invalid-feedback">Por favor ingresa el nombre de tu usuario.</div>
                            <div class="valid-feedback">Muy bien!</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Contraseña</label>
                            <asp:TextBox ID="txtPass" placeholder="Contraseña" TextMode="Password" runat="server"
                                CssClass="form-control"></asp:TextBox>
                            <div class="invalid-feedback">Por favor ingresa la contraseña de tu usuario.</div>
                            <div class="valid-feedback">Muy bien!</div>
                        </div>
                        <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" CssClass="btn btn-primary"
                            OnClientClick="return validarUsuario()" OnClick="btnIngresar_Click1" />
                    </div>
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingTwo">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                    data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    Quiero crear un nuevo usuario
                </button>
            </h2>
            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <div class="col-md-4">
                        <div class="mb-3">
                            <label class="form-label">Usuario</label>
                            <asp:TextBox ID="txtUserNuevo" placeholder="Usuario" CssClass="form-control"
                                runat="server"></asp:TextBox>
                            <%--<div id="txtNuevoUser" class="form-text">Elegi el nombre de tu usuario
                            </div>--%>
                            <div class="invalid-feedback">Por favor ingresa un nombre de usuario.</div>
                            <div class="valid-feedback">Muy bien!</div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Contraseña</label>
                            <asp:TextBox ID="txtPassNuevo" placeholder="Contraseña" runat="server"
                                CssClass="form-control"></asp:TextBox>
                            <div class="invalid-feedback">Por favor ingresa una contraseña para tu nuevo usuario.</div>
                            <div class="valid-feedback">Muy bien!</div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Mail</label>
                            <asp:TextBox ID="txtMail" placeholder="Mail" CssClass="form-control" runat="server">
                            </asp:TextBox>
                            <div class="invalid-feedback">Por favor ingresa un mail para tu nuevo usuario.</div>
                            <div class="valid-feedback">Muy bien!</div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Nombre</label>
                            <asp:TextBox ID="txtNombre" placeholder="Nombre" CssClass="form-control" runat="server">
                            </asp:TextBox>
                            <div class="invalid-feedback">Por favor ingresa tu nombre.</div>
                            <div class="valid-feedback">Muy bien!</div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Apellido</label>
                            <asp:TextBox ID="txtApellido" placeholder="Apellido" CssClass="form-control" runat="server">
                            </asp:TextBox>
                            <div class="invalid-feedback">Por favor ingresa tu apellido.</div>
                            <div class="valid-feedback">Muy bien!</div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Telefono</label>
                            <asp:TextBox ID="txtTelefono" placeholder="Telefono" CssClass="form-control" runat="server">
                            </asp:TextBox>
                            <div class="invalid-feedback">Por favor ingresa un telefono.</div>
                            <div class="valid-feedback">Muy bien!</div>
                        </div>

                        <asp:Button Text="Ingresar" ID="btn_nuevoUser" OnClientClick="return validarNuevoUsuario()"
                            OnClick="btn_nuevoUser_Click" CssClass="btn btn-primary" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
