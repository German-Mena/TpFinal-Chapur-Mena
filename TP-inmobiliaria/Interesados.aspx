<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Interesados.aspx.cs" Inherits="TP_inmobiliaria.Interesados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <% foreach (dominio.Interesado item in ListaInteresados)
        { %>
            <div class="card text-center">
                <div class="card-header">
                    <%= item.Propiedad.ubicacion.ciudad%>, <%= item.Propiedad.ubicacion.provincia%>, <%= item.Propiedad.ubicacion.pais%>
                </div>
                <div class="card-body">
                    <h5 class="card-title"><%= item.Usuario.Nombre%> <%= item.Usuario.Apellido%>, <%= item.Usuario.Mail%>, <%=item.Usuario.Telefono%> </h5>
                    <p class="card-text"><%= item.Propiedad.descripcion %></p>
                    <p class="card-text"><%= item.Propiedad.ubicacion.calle%> <%= item.Propiedad.ubicacion.altura  %></p>
                    <p class="card-text"><%= item.Mensaje %></p>
                    <asp:Button ID="btn_Eliminar" runat="server" CssClass="btn btn-primary"  Text="Eliminar de interesados" OnClick="btn_Eliminar_Click1" />
                </div>

            </div>
            
            <%--<p><%=item.Propiedad.ID%> <%=item.Usuario.ID %></p>--%>
            
      <% } %> 

</asp:Content>
