<%@ Page Title="" Language="C#" MasterPageFile="~/User/user.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Bitirme_Restoran.User.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .photo-gallery {
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
}

.photo {
  width: 300px;
  height: 200px;
  margin: 10px;
  overflow: hidden;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
  border-radius: 5px;
  position: relative;
  z-index: 1;
  cursor: pointer;
}


.photo img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.3s;
}

.photo:hover img {
  transform: scale(1.1);
}
.photo-gallery {
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
  z-index: 1;
}

.photo {
  width: 300px;
  height: 200px;
  margin: 10px;
  overflow: hidden;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
  border-radius: 5px;
  cursor: pointer;
}

#modal {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.9);
  z-index: 9999;
}

#modal-image {
  display: block;
  max-width: 80%;
  max-height: 80%;
  margin: auto;
  margin-top: 5%;
  z-index: 9999;
}

.close {
  color: #fff;
  font-size: 30px;
  position: absolute;
  top: 20px;
  right: 30px;
  cursor: pointer;
  z-index: 9999;
}

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="about_section layout_padding">
            <div class="container  ">
        
              <div class="row">
                <div class="col-md-6 ">
                  <div class="img-box">
                    <img src="../Template/images/about.png" alt="">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="detail-box">
                    <div class="heading_container">
                      <h2>
                        Biz ceka Ailesiyiz
                      </h2>
                    </div>
                    <p>
                     Biz, Ceka Restoran ekibi olarak, misafirlerimize lezzetli yemekler sunmak ve keyifli bir yeme deneyimi yaşatmak için çalışıyoruz.
        
        Restoranımız, uzun yıllardır sektörde tecrübeli şeflerin yönetiminde hizmet vermektedir. Geleneksel lezzetleri modern tekniklerle bir araya getirerek, farklı damak zevklerine hitap eden bir menü sunuyoruz.
        
        Ceka Restoran olarak, taze ve kaliteli malzemeler kullanarak hazırladığımız yemeklerimizi, özenle dekore edilmiş ve sıcak bir atmosfere sahip mekanımızda sunuyoruz. Ayrıca, misafirlerimize özel günlerinde de hizmet vererek, unutulmaz anılar biriktirmelerine yardımcı oluyoruz.
        
        Misafirlerimize kaliteli hizmet sunmak için çalışıyor ve onların memnuniyetini her zaman önceliğimiz olarak görüyoruz. Ceka Restoran olarak, her zaman en iyisini sunmak için çaba gösteriyor ve sizleri ağırlamaktan mutluluk duyuyoruz.
                    </p>
                    
                  </div>
                </div>
              </div>
            </div>
          </section>

    <div class="photo-gallery">
  <div class="photo">
    <img src="../images/hakkında/şişe.jpg" alt="Restoran Fotoğrafı 1" onclick="openModal(this)">
  </div>
  <div class="photo">
    <img src="../images/hakkında/kadın.jpg" alt="Restoran Fotoğrafı 2" onclick="openModal(this)">
  </div>
  <div class="photo">
    <img src="../images/hakkında/duvar.jpg" alt="Restoran Fotoğrafı 3" onclick="openModal(this)">
  </div>
        <div class="photo">
    <img src="../images/hakkında/masa.jpg" alt="Restoran Fotoğrafı 4"onclick="openModal(this)">
  </div>
        <div class="photo">
    <img src="../images/hakkında/et.jpg" alt="Restoran Fotoğrafı 5"onclick="openModal(this)">
  </div>
        <div class="photo">
    <img src="../images/hakkında/tabak.jpg" alt="Restoran Fotoğrafı 6" onclick="openModal(this)">
  </div>
        <div class="photo">
    <img src="../images/hakkında/çift.jpg" alt="Restoran Fotoğrafı 7" onclick="openModal(this)">
  </div>
        <div class="photo">
    <img src="../images/hakkında/şef1.jpg" alt="Restoran Fotoğrafı 8" onclick="openModal(this)">
  </div>
        <div class="photo">
    <img src="../images/hakkında/şef2.jpg" alt="Restoran Fotoğrafı 9" onclick="openModal(this)">
  </div>

</div>

    <div id="modal">
  <span class="close" onclick="closeModal()">&times;</span>
  <img id="modal-image" src="" alt="Büyük Fotoğraf">
</div>


    <script>

        function openModal(img) {
            var modal = document.getElementById("modal");
            var modalImg = document.getElementById("modal-image");
            modal.style.display = "block";
            modalImg.src = img.src;
        }

        function closeModal() {
            var modal = document.getElementById("modal");
            modal.style.display = "none";
        }




    </script>
</asp:Content>
