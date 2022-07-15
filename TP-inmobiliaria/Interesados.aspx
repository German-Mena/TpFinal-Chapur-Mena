<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Interesados.aspx.cs" Inherits="TP_inmobiliaria.Interesados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%if (ListaInteresados.Count() == 0)
        {%>
            <div style="padding-top: 10px; padding-left: 10px">
                <div class="card col-md-4">
                    <div class="card-header">
                        Ops! 
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Aún no tenés clientes interesados en alguna de las propiedades que vendés.</h5>
                        <p class="card-text">No te preocupes! Ya van a llegar tus nuevos clientes! Segui asi!</p>
                        <%--<a href="#" class="btn btn-primary">Go somewhere</a>--%>
                    </div>
                </div>
            </div>
    <%} %>

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
