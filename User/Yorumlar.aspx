<%@ Page Title="" Language="C#" MasterPageFile="~/User/user.Master" AutoEventWireup="true" CodeBehind="Yorumlar.aspx.cs" Inherits="Bitirme_Restoran.User.Yorumlar" %>

<%@ Import Namespace="Bitirme_Restoran" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-color: #222831;
        }

        .heading_container h2 {
            position: relative;
            margin-bottom: 0;
            font-size: 35px;
            font-weight: bold;
            text-align: center;
            color: #fff;
        }

        .yorum-kutusu {
            background-color: #ffbe33;
            padding: 10px;
            width: 100%;
            clear: both;
            margin-bottom: 10px;
            border: 5px;
            display: flex; /* Flexbox kullanımı */
            align-items: center; /* Öğeleri dikey olarak ortala */
        }

        .image-container {
            margin-right: 10px;
            width: 50px; /* Resim boyutu */
            height: 50px; /* Resim boyutu */
        }

        .kullanici-adi {
            font-weight: bold;
            margin-bottom: 5px;
        }

        .yorum-metni {
            margin-bottom: 5px;
        }

        .yorum-tarihi {
            font-size: 12px;
            margin-top: 10px; /* Tarih ile mesafe */
            text-align: right;
            margin-left: auto; /* Tarihi sağa hizala */
        }

        hr {
            height: 2px;
            /* Çizgi kalınlığı */
            background-color: black;
            /* Çizgi rengi */
        }

        #yorum {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
       
        <div class="heading_container">
            <div class="align-self-end">
                <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
            </div>
            <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2>Yorum Yap</h2>"></asp:Label>
            <div class="comment_container">
                <asp:RequiredFieldValidator ID="rfvYorum" runat="server" ErrorMessage="Yorum Gerekli !" ControlToValidate="txtyorum"
                    ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtyorum" placeholder="Yorumunuzu Giriniz..." runat="server" TextMode="MultiLine" Rows="4" Columns="150"></asp:TextBox>
            </div>
            <div class="btn-box">
                <asp:Button ID="denemeYorum" runat="server" Text="Yorum Yap" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white"
                    OnClick="denemeYorum_Click" />
            </div>
        </div>
    </section>
    <section>
        

        <div class="heading_container heading_center">
            <h2>Yorumlar...</h2>
        </div>
        <asp:Repeater ID="rYorum2" runat="server">
            <ItemTemplate>
                <asp:Image ID="imgCategory" runat="server" CssClass="img-thumbnail"/>
               
                <div class="yorum-kutusu">
                    <div class="image-container">
                       <img alt=""  width="50" src="<%# Utils.GetImageUrl( Eval("ResimUrl")) %>" />
                    </div>
                    <div class="yorum-icerik">
                        <div class="kullanici-adi"><%# Eval("KullaniciAdi") %></div>
                        <div class="yorum-metni"><%# Eval("yorum") %></div>
                    </div>
                    <div class="yorum-tarihi"><%# Eval("yorumTarihi") %></div>
                </div>
                <div><hr /></div>
            </ItemTemplate>
        </asp:Repeater>
    </section>
</asp:Content>
