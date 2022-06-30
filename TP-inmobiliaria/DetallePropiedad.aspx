<%@ Page Title="La Inmobiliaria" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DetallePropiedad.aspx.cs" Inherits="TP_inmobiliaria.DetallePropiedad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<%--<img src="<%= propiedad.link %>" alt="Propiedad" />--%>
<div class="row">
<div class="col col-md-8">
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
            <img src="<%= propiedad.link %>" class="d-block w-100"  width="100" height= "600" alt="">
        </div>
            
        <% foreach (dominio.multimedia item in listaMultimedia)
            { %>
                <div class="carousel-item">
                    <img src="<%= item.link%>" class="d-block w-100" width="100" height="600 "alt="...">
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

</div><%-- / .carousel slide--%>
</div> <%-- / .col col-md-8--%>
<div class="colorder-1 col-md-4">
    <div class="row">
    <div class="col-lg-8">
        <h2 class="fw-normal">Heading</h2>
        <p>Some representative placeholder content for the three columns of text below the carousel. This is the first column.</p>

    </div><!-- /.col-lg-4 -->
    <div class="w-100"></div>
    <div class="col-lg-8">
        <h2 class="fw-normal">Heading</h2>
        <p>Another exciting bit of representative placeholder content. This time, we've moved on to the second column.</p>
    </div><!-- /.col-lg-4 -->
    <div class="w-100"></div>
    <div class="col-lg-8">
        <h2 class="fw-normal">Heading</h2>
        <p>And lastly this, the third column of representative placeholder content.</p>
    </div><!-- /.col-lg-4 -->
</div> <!-- /.colorder-1 col-md-4-->
</div><!-- /.row -->
</div>
<%--Google maps --%>

<div id="map-container-google-1" class="z-depth-1-half map-container" style="height: auto">
  <iframe height="400" width="1600" src="https://maps.google.com/maps?q=buenosaires&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0"
    style="border:0" allowfullscreen="auto"></iframe>
</div>
<%--Google maps ACA FALTA MODIFICAR ESTO DE QUE QUEDE ANCHO AUTOMATICO Y CAMBIARLE Q= POR LA DIRECCION--%>  


</asp:Content>
