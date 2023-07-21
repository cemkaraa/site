<%@ Page Title="" Language="C#" MasterPageFile="~/User/user.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Bitirme_Restoran.User.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);

            // Klavye olaylarını dinleyen işlev
            document.onkeydown = function (event) {
                // Enter tuşuna basıldığında
                if (event.keyCode === 13) {
                    // btnLogin düğmesini tetikle
                    document.getElementById("<%=btnLogin.ClientID %>").click();
                    return false; // Sayfanın yeniden yüklenmesini önlemek için false döndür
                }
            };
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </div>
                <h2>Giriş</h2>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">
                        <img id="userLogin" src="../Images/login.jpg" alt="" class="img-thumbnail" />
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form_container">
                        <div>
                            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="kullanıcı adı gerekli"
                                ControlToValidate="txtUsername" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                Font-Size="Small"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Kullanıcı Adınızı Giriniz.."></asp:TextBox>
                        </div>

                        <div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Şifre gerekli"
                                ControlToValidate="txtPassword" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                Font-Size="Small"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Şifrenizi Giriniz.."
                                TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="btn_box">
                            <asp:Button ID="btnLogin" runat="server" Text="Giriş Yap" CssClass="btn_btn-success rounded-pill pl-4 pr-4 text-white"
                                BackColor="#ffbe33" onclick="btnLogin_Click" />
                            <span class="pl-3 text-info">Yeni kullanıcımısın? <a href="Registration.aspx" class="fa-id-badge badge-info"> Buradan Kayıt ol!</a></span>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
