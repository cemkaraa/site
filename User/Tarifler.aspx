<%@ Page Title="" Language="C#" MasterPageFile="~/User/user.Master" AutoEventWireup="true" CodeBehind="Tarifler.aspx.cs" Inherits="Bitirme_Restoran.User.Tarifler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <style>
    .tarif-kutusu {
      display: inline-block;
      width: 300px;
      background-color: #ffbe33;
      border-radius: 4px;
      padding: 10px;
      margin: 10px;
      cursor: pointer;
    }
    .tarif-baslik {
      font-size: 20px;
      font-weight: bold;
      margin-bottom: 10px;
    }
    .tarif-resim {
      width: 100%;
      height: auto;
      margin-bottom: 10px;
    }
    .tarif-detay {
      display: none;
      margin-top: 10px;
    }
  </style>
  <script>
      function toggleTarifDetay(elementId) {
          var tarifDetay = document.getElementById(elementId);
          tarifDetay.style.display = tarifDetay.style.display === 'none' ? 'block' : 'none';
      }
  </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Lezzetli Tarifler</h1>
    <asp:Repeater ID="rtarif" runat="server">
        <ItemTemplate>
          <div class="tarif-kutusu" onclick="toggleTarifDetay('tarifDetay<%# Container.ItemIndex %>')">
            <img src="<%# Eval("resim") %>" alt="Tarif Resmi" class="tarif-resim" />
            <h2 class="tarif-baslik"><%# Eval("isim") %></h2>
            <div id="tarifDetay<%# Container.ItemIndex %>" class="tarif-detay">
              <p class="malzemeler">Malzemeler:</p>
              <ul>
                <li><%# Eval("malzemeler") %></li>
              </ul>
              <p class="adimlar">Yapılış:</p>
              <ol>
                <li><%# Eval("tarif") %></li>
              </ol>
            </div>
          </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
