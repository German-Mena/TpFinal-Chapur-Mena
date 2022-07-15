<%@ Page Title="La Inmobiliaria" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DetallePropiedad.aspx.cs" Inherits="TP_inmobiliaria.DetallePropiedad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<script type="text/javascript">
function openModal() {
    $('#exampleModal').modal('show');
}
</script>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<%--<img src="<%= propiedad.link %>" alt="Propiedad" />--%>
<div class="row">
<div class="col col-md-8">
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">

<div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" class="active" aria-current="true" aria-label="Slide 1"></button>
    <% for (int i = 0; i < ListaMultimedia.Count; i++)
        { %>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide <%= i + 1 %>"></button>
    <% } %>
</div>

<div class="carousel-inner">
    <div class="carousel-item active">
        <img src="<%= Propiedad.link %>" class="d-block w-100"  width="100" height= "600" alt="">
    </div>
            
    <% foreach (dominio.multimedia item in ListaMultimedia)
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

</div>
<%-- / .carousel slide--%>
</div>
<%-- / .col col-md-8--%>
<div class="colorder-1 col-md-4">
    <div class="row">
        <div class="col-lg-8" style="margin: 9px">
            <h2 class="fw-normal"> <%=Propiedad.ubicacion.ciudad%>, <%=Propiedad.ubicacion.provincia%>, <%=Propiedad.ubicacion.pais%> </h2>
            <p><i class="fas fa-map-marker-alt"></i> <%=Propiedad.ubicacion.calle%>,altura: <%=Propiedad.ubicacion.altura%></p>
            <p><i class="fas fa-money-check-alt"></i> <%=((float)Propiedad.valor)%></p>
        </div>
        <!-- /.col-lg-4 -->
        <div class="col-lg-8" style="margin: 9px">
            <p><i class="fas fa-tag"></i> Tipo de transacción: <%=Propiedad.tipoContrato.descripcion%> </p>
            <p><i class="fas fa-bath"></i> Baños: <%=Propiedad.cantidadBaños%></p>
            <p><i class="fas fa-bed"></i> Ambientes: <%=Propiedad.cantidadAmbientes%></p>
            <p><i class="fas fa-car-alt"></i> Cocheras: <%=Propiedad.cantidadCocheras%></p>
            <p><i class="fas fa-calendar-alt"></i> Año de la propiedad: <%=Propiedad.fechaConstruccion.Year%></p>
        </div>
        <!-- /.col-lg-4 -->
        <div class="col-lg-8" style="margin: 9px">
            <h3 class="fw-normal">Descripción</h3>
            <p><%=Propiedad.descripcion%></p>
            <%if (Session["User"] != null && btnFavorito.Text == "Me interesa")
              {%> 
              <asp:TextBox ID="TxtMsj" runat="server"></asp:TextBox>
            <%}%>
            <p><asp:Label ID="Label1" runat="server"></asp:Label></p>
            <asp:Button ID = "btnFavorito" runat = "server" Text = "Me interesa" OnClick = "btnFavorito_Click" />
           
        </div>
    </div>
</div>
</div>

<%--Google maps --%>

<div id="map-container-google-1" class="z-depth-1-half map-container" style="height: auto">
    <iframe height="400" src=<%="https://maps.google.com/maps?q=" + Propiedad.ubicacion.calle.Replace(" ","+") + "+" + Convert.ToString(Propiedad.ubicacion.altura) + "+" + Propiedad.ubicacion.ciudad + "+" + Propiedad.ubicacion.provincia.Replace(" ","+") + "&t=&z=13&ie=UTF8&iwloc=&output=embed"%> frameborder="0"
        style="border: 0; width: 100%"></iframe>
</div>
</asp:Content>
