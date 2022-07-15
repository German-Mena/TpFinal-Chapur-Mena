<%@ Page Title="La Inmobiliaria" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Propiedades.aspx.cs" Inherits="TP_inmobiliaria.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style> 
        html, body{
            padding: 0;
        }

        body{
            width: auto;
            height: auto;
            font-family: sans-serif;
            letter-spacing: 0.03em;
            line-height: 1.6;
        }

        .title{
            text-align: center;
            font-size: 40px;
            color: #6a6a6a;
            margin-top: 100px;
            font-weight: 100;
        }

        .containerProductos{
            width: 100%;
            max-width: 1200px;
            height: 430px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin: 30px;
        }

        .containerProductos .card{
            width: 300px;
            height: 400px;
            border-radius: 8px;
            box-shadow: 0 2px 2px rgba(0,0,0,0.2);
            overflow: hidden;
            margin: 30px;
            text-align: center;
            transition: all 0.25s;
        }

        .containerProductos .card:hover{
            transform: translateY(-15px);
            box-shadow: 0 12px 16px rgba(0,0,0,0.2);
        }

        .containerProductos .card img{
            width: 330px;
            height: 220px;
        }

        .containerProductos .card h4{
            font-weight: 600;
        }

        .containerProductos .card p{
            padding: 0 1rem;
            font-size: 16px;
            font-weight: 300;
        }

        .container .card a{
            font-weight: 500;
            text-decoration: none;
            color: #3498db;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
<!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <body>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <hr />
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                
                <div class="row">
                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                        <div
                          class="collapse navbar-collapse justify-content-center"
                          id="navbarCenteredExample"
                        >
                        <ul class="navbar-nav mb-2 mb-lg-0">
                        <div class="col" style="margin:5px">
                            <asp:dropdownlist runat="server" id="ddlTipoContrato" cssclass="btn btn-outline-dark dropdown-toggle" 
                             onselectedindexchanged="ddlTipoContrato_SelectedIndexChanged">
                            </asp:dropdownlist>
                        </div>
                        <div class="col" style="margin:5px">
                            <asp:DropDownList runat="server" ID="ddlTipoPropiedad" CssClass="btn btn-outline-dark dropdown-toggle"
                                  OnSelectedIndexChanged="ddlTipoPropiedad_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                        <div class="col" style="margin:5px">
                            <asp:Button runat="server" Text= "Cargar" ID="btnCargar" CssClass="btn btn-primary" autopostback="true"
                             OnClick="btnCargar_Click"/>
                        </div>
                        </ul>
                        </div>
                    </nav>
                    <div class="containerProductos">
            
                        <% foreach (dominio.propiedad item in listaPropiedades)
                            { %>
                                <div class="card">
                                    <img src="<%= item.link %>" alt="Propiedad" />
                                    <h4><%= item.descripcion %></h4>
                                    <p><%= item.valor %></p>
                                    <%--<asp:Button ID="btn_verPropiedad" runat="server" Text="Ver Propiedad" OnClick="btn_verPropiedad_Click"/>--%>
                                    <a href="DetallePropiedad.aspx?idPropiedad=<%= item.ID %>">Ver detalle</a> 
                                </div>
                        <% } %>

                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <hr />

        </body>
    </html>
</asp:Content>
