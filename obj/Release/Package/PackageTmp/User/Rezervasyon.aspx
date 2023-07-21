<%@ Page Title="" Language="C#" MasterPageFile="~/User/user.Master" AutoEventWireup="true" CodeBehind="Rezervasyon.aspx.cs" Inherits="Bitirme_Restoran.User.Rezervasyon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <section class="book_section layout_padding">
        <div class="container">
          <div class="heading_container">
            <h2>
              Rezervasyon Yap
            </h2>
          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="form_container">
                <form action="">
                  <div>
                    <input type="text" class="form-control" placeholder="İsminiz" />
                  </div>
                  <div>
                    <input type="number" class="form-control" placeholder="Telefon Numaranız" />
                  </div>
                  <div>
                    <input type="email" class="form-control" placeholder="e-mail adresiniz" />
                  </div>
                  <div>
                    <select class="form-control nice-select wide">
                      <option value="" disabled selected>
                        Kaç Kişisiniz..
                      </option>
                      <option value="">
                        1
                      </option>
                      <option value="">
                        2
                      </option>
                      <option value="">
                        3
                      </option>
                      <option value="">
                        4
                      </option>
                      <option value="">
                        5
                      </option>
                      <option value="">
                        6
                      </option>
                      <option value="">
                        7
                      </option>
                      <option value="">
                        8
                      </option>
                      <option value="">
                        9
                      </option>
                      <option value="">
                        10
                      </option>
                    </select>
                  </div>
                  <div>
                    <input type="date" class="form-control">
                  </div>
                  <div class="btn_box">
                    <button>
                      Rezervasyon Yap
                    </button>
                  </div>
                </form>
              </div>
            </div>
            <div class="row">
                <iframe width="600px" height="400px"
                class="map"
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d13883.607250291212!2d29.235444075088505!3d40.99392889237259!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14cacfd9faca7d5b%3A0x4e6711b3fe29151f!2sEgeboyu%20Sitesi!5e0!3m2!1str!2str!4v1683299830142!5m2!1str!2str" 
                   loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
      </section>

</asp:Content>
