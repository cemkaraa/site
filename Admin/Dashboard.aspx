<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Bitirme_Restoran.Admin.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
       /* Stil ayarları */
        .welcome-text {
            font-family: Arial, sans-serif;
            font-size: 36px;
            font-weight: bold;
            text-align: center;
            position: relative;
            overflow: hidden;
            height: 100px;
            animation: slide-up 4s linear infinite;
        }
        
        .welcome-text span {
            position: absolute;
            display: block;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            transform: translateY(100%);
            animation: slide-down 4s linear infinite;
        }
        
        @keyframes slide-up {
            0%, 100% {
                transform: translateY(100%);
            }
            20%, 80% {
                transform: translateY(0%);
            }
        }
        
        @keyframes slide-down {
            0%, 100% {
                transform: translateY(-100%);
            }
            20%, 80% {
                transform: translateY(0%);
            }
        }
    </style>
</asp:Content>
<asp:Content 
    ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <<div class="welcome-text">
        <span>Admin Paneline Hoş Geldin</span>
    </div>
</asp:Content>
