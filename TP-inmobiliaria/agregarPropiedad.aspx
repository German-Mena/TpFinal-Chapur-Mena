<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="agregarPropiedad.aspx.cs" Inherits="TP_inmobiliaria.agregarPropiedad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script>

        function validarMail(mail) {
            if (mail === "") return false;
            var formato = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            if (mail.match(formato)) return true;
            return false;
        }

        function validarNumero(num) {
            if (num === "") return false;
            else return /^\d+$/.test(num);
        }

        function validarPropiedad() {

            var calle = document.getElementById("<%= txtCalle.ClientID %>").value;
            var altura = document.getElementById("<%= txtAltura.ClientID %>").value;
            var departamento = document.getElementById("<%= txtDepartamento.ClientID %>").value;
            var ciudad = document.getElementById("<%= txtCiudad.ClientID %>").value;
            var provincia = document.getElementById("<%= txtProvincia.ClientID %>").value;
            var pais = document.getElementById("<%= txtPais.ClientID %>").value;
            var imagen = document.getElementById("<%= txtImagen.ClientID %>").value;
            var fechaConstruccion = document.getElementById("<%= txtFechaConstruccion.ClientID %>").value;
            var ambientes = document.getElementById("<%= txtAmbientes.ClientID %>").value;
            var baños = document.getElementById("<%= txtBaños.ClientID %>").value;
            var cocheras = document.getElementById("<%= txtCocheras.ClientID %>").value;
            var descripcion = document.getElementById("<%= txtDescripcion.ClientID%>").value;
            var valor = document.getElementById("<%= txtValor.ClientID%>").value;

            var value = document.getElementById("<%=ddlVendedorAsignado.ClientID%>");
            var vendedor = value.options[value.selectedIndex].text;

            var valido = true;

            if (calle === "") {
                document.getElementById("<%= txtCalle.ClientID %>").classList.remove("is-valid");
                document.getElementById("<%= txtCalle.ClientID %>").classList.add("is-invalid");
                valido = false;
            }
            else {
                document.getElementById("<%= txtCalle.ClientID %>").classList.remove("is-invalid");
                document.getElementById("<%= txtCalle.ClientID %>").classList.add("is-valid");
            }

            if (!validarNumero(altura)) {
                document.getElementById("<%= txtAltura.ClientID %>").classList.remove("is-valid");
                document.getElementById("<%= txtAltura.ClientID %>").classList.add("is-invalid");
                valido = false;
            }
            else {
                document.getElementById("<%= txtAltura.ClientID %>").classList.remove("is-invalid");
                document.getElementById("<%= txtAltura.ClientID %>").classList.add("is-valid");
            }

            if (departamento === "") {
                document.getElementById("<%= txtDepartamento.ClientID %>").classList.remove("is-valid");
                document.getElementById("<%= txtDepartamento.ClientID %>").classList.add("is-invalid");
                valido = false;
            }
            else {
                document.getElementById("<%= txtDepartamento.ClientID %>").classList.remove("is-invalid");
                document.getElementById("<%= txtDepartamento.ClientID %>").classList.add("is-valid");
            }

            if (ciudad === "") {
                document.getElementById("<%= txtCiudad.ClientID %>").classList.remove("is-valid");
                document.getElementById("<%= txtCiudad.ClientID %>").classList.add("is-invalid");
                valido = false;
            }
            else {
                document.getElementById("<%= txtCiudad.ClientID %>").classList.remove("is-invalid");
                document.getElementById("<%= txtCiudad.ClientID %>").classList.add("is-valid");
            }

            if (provincia === "") {
                document.getElementById("<%= txtProvincia.ClientID %>").classList.remove("is-valid");
                document.getElementById("<%= txtProvincia.ClientID %>").classList.add("is-invalid");
                valido = false;
            }
            else {
                document.getElementById("<%= txtProvincia.ClientID %>").classList.remove("is-invalid");
                document.getElementById("<%= txtProvincia.ClientID %>").classList.add("is-valid");
            }

            if (pais === "") {
                document.getElementById("<%= txtPais.ClientID %>").classList.remove("is-valid");
                document.getElementById("<%= txtPais.ClientID %>").classList.add("is-invalid");
                valido = false;
            }
            else {
                document.getElementById("<%= txtPais.ClientID %>").classList.remove("is-invalid");
                document.getElementById("<%= txtPais.ClientID %>").classList.add("is-valid");
            }

            if (imagen === "") {
                document.getElementById("<%= txtImagen.ClientID %>").classList.remove("is-valid");
                document.getElementById("<%= txtImagen.ClientID %>").classList.add("is-invalid");
                valido = false;
            }
            else {
                document.getElementById("<%= txtImagen.ClientID %>").classList.remove("is-invalid");
                document.getElementById("<%= txtImagen.ClientID %>").classList.add("is-valid");
            }

            if (fechaConstruccion === "") {
                document.getElementById("<%= txtFechaConstruccion.ClientID %>").classList.remove("is-valid");
                document.getElementById("<%= txtFechaConstruccion.ClientID %>").classList.add("is-invalid");
                valido = false;
            }
            else {
                document.getElementById("<%= txtFechaConstruccion.ClientID %>").classList.remove("is-invalid");
                document.getElementById("<%= txtFechaConstruccion.ClientID %>").classList.add("is-valid");
            }

            if (!validarNumero(ambientes)) {
                document.getElementById("<%= txtAmbientes.ClientID %>").classList.remove("is-valid");
                document.getElementById("<%= txtAmbientes.ClientID %>").classList.add("is-invalid");
                valido = false;
            }
            else {
                document.getElementById("<%= txtAmbientes.ClientID %>").classList.remove("is-invalid");
                document.getElementById("<%= txtAmbientes.ClientID %>").classList.add("is-valid");
            }

            if (!validarNumero(baños)) {
                document.getElementById("<%= txtBaños.ClientID %>").classList.remove("is-valid");
                document.getElementById("<%= txtBaños.ClientID %>").classList.add("is-invalid");
                valido = false;
            }
            else {
                document.getElementById("<%= txtBaños.ClientID %>").classList.remove("is-invalid");
                document.getElementById("<%= txtBaños.ClientID %>").classList.add("is-valid");
            }

            if (!validarNumero(cocheras)) {
                document.getElementById("<%= txtCocheras.ClientID %>").classList.remove("is-valid");
                document.getElementById("<%= txtCocheras.ClientID %>").classList.add("is-invalid");
                valido = false;
            }
            else {
                document.getElementById("<%= txtCocheras.ClientID %>").classList.remove("is-invalid");
                document.getElementById("<%= txtCocheras.ClientID %>").classList.add("is-valid");
            }

            if (descripcion === "") {
                document.getElementById("<%= txtDescripcion.ClientID %>").classList.remove("is-valid");
                document.getElementById("<%= txtDescripcion.ClientID %>").classList.add("is-invalid");
                valido = false;
            }
            else {
                document.getElementById("<%= txtDescripcion.ClientID %>").classList.remove("is-invalid");
                document.getElementById("<%= txtDescripcion.ClientID %>").classList.add("is-valid");
            }

            if (descripcion === "") {
                document.getElementById("<%= txtDescripcion.ClientID %>").classList.remove("is-valid");
                document.getElementById("<%= txtDescripcion.ClientID %>").classList.add("is-invalid");
                valido = false;
            }
            else {
                document.getElementById("<%= txtDescripcion.ClientID %>").classList.remove("is-invalid");
                document.getElementById("<%= txtDescripcion.ClientID %>").classList.add("is-valid");
            }

            if (!validarNumero(valor)) {
                document.getElementById("<%= txtValor.ClientID %>").classList.remove("is-valid");
                document.getElementById("<%= txtValor.ClientID %>").classList.add("is-invalid");
                valido = false;
            }
            else {
                document.getElementById("<%= txtValor.ClientID %>").classList.remove("is-invalid");
                document.getElementById("<%= txtValor.ClientID %>").classList.add("is-valid");
            }

            if (vendedor === "Seleccionar Vendedor") {
                document.getElementById("<%= ddlVendedorAsignado.ClientID %>").classList.remove("is-valid");
                document.getElementById("<%= ddlVendedorAsignado.ClientID %>").classList.add("is-invalid");
                valido = false;
            }
            else {
                document.getElementById("<%= ddlVendedorAsignado.ClientID %>").classList.remove("is-invalid");
                document.getElementById("<%= ddlVendedorAsignado.ClientID %>").classList.add("is-valid");
            }

            return valido;
        }

    </script>
    <div class="col-md-4" style="padding-top: 20px; padding-left: 20px">
        <div class="mb-3">
            <label style="padding-right: 20px" class="form-label">Tipo de propiedad</label>
            <asp:DropDownList runat="server" ID="ddlTipoPropiedad" CssClass="btn btn-outline-dark dropdown-toggle"
                OnSelectedIndexChanged="ddlTipoPropiedad_SelectedIndexChanged">
            </asp:DropDownList>
        </div>

        <div class="mb-3">
            <label style="padding-right: 33px" class="form-label">Tipo de contrato</label>
            <asp:DropDownList runat="server" ID="ddlTipoContrato" CssClass="btn btn-outline-dark dropdown-toggle"
                OnSelectedIndexChanged="ddlTipoContrato_SelectedIndexChanged">
            </asp:DropDownList>
        </div>

        <div class="mb-3">
            <label class="form-label">Calle</label>
            <asp:TextBox ID="txtCalle" placeholder="Calle" runat="server"
                CssClass="form-control">
            </asp:TextBox>
            <div class="invalid-feedback">Por favor ingresa una calle para la nueva propiedad.</div>
            <div class="valid-feedback">Muy bien!</div>
        </div>

        <div class="mb-3">
            <label class="form-label">Altura</label>
            <asp:TextBox ID="txtAltura" placeholder="Altura" CssClass="form-control" runat="server">
            </asp:TextBox>
            <div class="invalid-feedback">Por favor ingresa una altura para la nueva propiedad.</div>
            <div class="valid-feedback">Muy bien!</div>
        </div>

        <div class="mb-3">
            <label class="form-label">Departamento</label>
            <asp:TextBox ID="txtDepartamento" placeholder="Departamento" CssClass="form-control" runat="server">
            </asp:TextBox>
        </div>

        <div class="mb-3">
            <label class="form-label">Ciudad</label>
            <asp:TextBox ID="txtCiudad" placeholder="Ciudad" CssClass="form-control" runat="server">
            </asp:TextBox>
            <div class="invalid-feedback">Por favor ingresa la ciudad de la nueva propiedad.</div>
            <div class="valid-feedback">Muy bien!</div>
        </div>

        <div class="mb-3">
            <label class="form-label">Provincia</label>
            <asp:TextBox ID="txtProvincia" placeholder="Provincia" CssClass="form-control" runat="server">
            </asp:TextBox>
            <div class="invalid-feedback">Por favor ingresa la provincia de la nueva propiedad.</div>
            <div class="valid-feedback">Muy bien!</div>
        </div>

        <div class="mb-3">
            <label class="form-label">Pais</label>
            <asp:TextBox ID="txtPais" placeholder="Pais" CssClass="form-control" runat="server">
            </asp:TextBox>
            <div class="invalid-feedback">Por favor ingresa el pais de la nueva propiedad.</div>
            <div class="valid-feedback">Muy bien!</div>
        </div>

        <div class="mb-3">
            <label class="form-label">Imagen principal</label>
            <asp:TextBox ID="txtImagen" placeholder="link de la imagen" CssClass="form-control" runat="server">
            </asp:TextBox>
            <div class="invalid-feedback">Por favor ingresa el link de la imagen principal.</div>
            <div class="valid-feedback">Muy bien!</div>
        </div>

        <div class="mb-3">
            <label class="form-label">Fecha de construccion</label>
            <asp:TextBox ID="txtFechaConstruccion" placeholder="Fecha de construccion" CssClass="form-control" runat="server">
            </asp:TextBox>
            <div class="invalid-feedback">Por favor ingresa la fecha en la que fue construida la propiedad.</div>
            <div class="valid-feedback">Muy bien!</div>
        </div>

        <div class="mb-3">
            <label class="form-label">Cantidad de ambientes</label>
            <asp:TextBox ID="txtAmbientes" placeholder="Cantidad de ambientes" CssClass="form-control" runat="server">
            </asp:TextBox>
            <div class="invalid-feedback">Por favor ingresa la cantidad de ambientes que tiene la propiedad.</div>
            <div class="valid-feedback">Muy bien!</div>
        </div>

        <div class="mb-3">
            <label class="form-label">Cantidad de baños</label>
            <asp:TextBox ID="txtBaños" placeholder="Cantidad de baños" CssClass="form-control" runat="server">
            </asp:TextBox>
            <div class="invalid-feedback">Por favor ingresa la cantidad de baños que tiene la propiedad.</div>
            <div class="valid-feedback">Muy bien!</div>
        </div>

        <div class="mb-3">
            <label class="form-label">Cantidad de cocheras</label>
            <asp:TextBox ID="txtCocheras" placeholder="Cantidad de cocheras" CssClass="form-control" runat="server">
            </asp:TextBox>
            <div class="invalid-feedback">Por favor ingresa la cantidad de cocheras que tiene la propiedad.</div>
            <div class="valid-feedback">Muy bien!</div>
        </div>

        <div class="mb-3">
            <label class="form-label">Descripcion de la propiedad</label>
            <asp:TextBox ID="txtDescripcion" placeholder="Descripcion de la propiedad" CssClass="form-control" runat="server">
            </asp:TextBox>
            <div class="invalid-feedback">Por favor ingresa la descripcion de la propiedad.</div>
            <div class="valid-feedback">Muy bien!</div>
        </div>

        <div class="mb-3">
            <label class="form-label">Valor de la propiedad</label>
            <asp:TextBox ID="txtValor" placeholder="Valor de la propiedad" CssClass="form-control" runat="server">
            </asp:TextBox>
            <div class="invalid-feedback">Por favor ingresa la descripcion de la propiedad.</div>
            <div class="valid-feedback">Muy bien!</div>
        </div>

        <div class="mb-3">
            <label style="padding-right: 20px;" class="form-label">Vendedor Asignado</label>
            <asp:DropDownList runat="server" ID="ddlVendedorAsignado" CssClass="btn btn-outline-dark dropdown-toggle"
                OnSelectedIndexChanged="ddlVendedorAsignado_SelectedIndexChanged">
            </asp:DropDownList>
            <div class="invalid-feedback">Por favor ingresa el vendedor asignado de la propiedad.</div>
            <div class="valid-feedback">Muy bien!</div>
        </div>

        <asp:Button Text="Ingresar" ID="btn_nuevoUser" CssClass="btn btn-primary" runat="server" OnClick="btnNuevaPropiedad_Click" OnClientClick="return validarPropiedad()" />
    </div>      
</asp:Content>
  
