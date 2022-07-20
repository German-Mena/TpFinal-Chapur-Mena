<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="agregarPropiedad.aspx.cs" Inherits="TP_inmobiliaria.agregarPropiedad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-md-4" style="padding-top: 20px; padding-left: 20px">
        <div class="mb-3">
            <label style="padding-right: 20px" class="form-label">Tipo de propiedad</label>            
            <asp:dropdownlist runat="server" id="ddlTipoPropiedad" cssclass="btn btn-outline-dark dropdown-toggle"
                onselectedindexchanged="ddlTipoPropiedad_SelectedIndexChanged">
            </asp:dropdownlist>
        </div>

        <div class="mb-3">
            <label style="padding-right: 33px" class="form-label">Tipo de contrato</label>            
            <asp:dropdownlist runat="server" id="ddlTipoContrato" cssclass="btn btn-outline-dark dropdown-toggle"
                onselectedindexchanged="ddlTipoContrato_SelectedIndexChanged">
            </asp:dropdownlist>
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
            <label style="padding-right: 20px" class="form-label">Vendedor Asignado</label>            
            <asp:dropdownlist placeholder="Seleccionar Vendedor" runat="server" id="ddlVendedorAsignado" cssclass="btn btn-outline-dark dropdown-toggle"
                 OnSelectedIndexChanged="ddlVendedorAsignado_SelectedIndexChanged"> 
            </asp:dropdownlist>
        </div>

        <asp:Button Text="Cargar" ID="btn_nuevaPropiedad" CssClass="btn btn-primary" runat="server" OnClick="btnNuevaPropiedad_Click" />

    </div>

</asp:Content>
