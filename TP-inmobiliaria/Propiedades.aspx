﻿<%@ Page Title="La Inmobiliaria" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Propiedades.aspx.cs" Inherits="TP_inmobiliaria.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style> 
        html, body{
            margin: 40px;
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
            margin: auto;
        }

        .containerProductos .card{
            width: 330px;
            height: 430px;
            border-radius: 8px;
            box-shadow: 0 2px 2px rgba(0,0,0,0.2);
            overflow: hidden;
            margin: 20px;
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
            <%--   <asp:GridView ID="dgvTable" runat="server">
            </asp:GridView>--%>            
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
        </body>
    </html>
</asp:Content>