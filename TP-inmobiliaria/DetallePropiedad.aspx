<%@ Page Title="La Inmobiliaria" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DetallePropiedad.aspx.cs" Inherits="TP_inmobiliaria.DetallePropiedad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--<img src="<%= propiedad.link %>" alt="Propiedad" />--%>

    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">

        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" class="active" aria-current="true" aria-label="Slide 1"></button>
            <% for (int i = 0; i < listaMultimedia.Count; i++)
                { %>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide <%= i + 1 %>"></button>
            <% } %>
        </div>

        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="<%= propiedad.link %>" class="d-block w-100" width="100" alt="">
            </div>
            
            <% foreach (dominio.multimedia item in listaMultimedia)
                { %>
                    <div class="carousel-item">
                        <img src="<%= item.link%>" class="d-block w-100" width="100" alt="...">
                   </div>
            <% } %>
        </div>

        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>

    </div>

    
</asp:Content>
