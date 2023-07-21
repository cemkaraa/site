<%@ Page Title="" Language="C#" MasterPageFile="~/User/user.Master" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="Bitirme_Restoran.User.Invoice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                     <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                    <h2>Faturanız...</h2>
                </div>
           
            </div>
        </div>
        </section>
</asp:Content>
