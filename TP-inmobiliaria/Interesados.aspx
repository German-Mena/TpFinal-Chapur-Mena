﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Interesados.aspx.cs" Inherits="TP_inmobiliaria.Interesados" %>
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
                    <p class="card-text"><%= item.Propiedad.ubicacion.calle%> <%= item.Propiedad.ubicacion.altura %></p>
                    <a href="#" class="btn btn-primary">Eliminar de interesados</a>
                    <asp:Button ID="Button1" runat="server" Text="Button" />
                </div>
                <div class="card-footer text-muted">
                    El cliente prefiere comunicarse entre las 18 y 20 HS
                </div>
            </div>
            
            <%--<p><%=item.Propiedad.ID%> <%=item.Usuario.ID %></p>--%>
            
      <% } %> 

</asp:Content>
