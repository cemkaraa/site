<%@ Page Title="" Language="C#" MasterPageFile="~/User/user.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Bitirme_Restoran.User.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        window.onload = function () {

            var seconds = 5;
            setTimeout(function () {

                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);

        };
    </script>

    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgUser.ClientID%>').prop('src', e.target.result)

                        .widget(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }

        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="book_section layout_padding">
        <div class="container">

            <div class="heading_container">

                <div class="align-self-end">

                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                </div>
                    <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2>Kullanıcı Kaydı</h2>"></asp:Label>
            </div>
            <div class="row">

                <div class="col-md-6">
                    <div class="form_container">

                        <div>

                           
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="İsim gerekli" ControlToValidate="txtİsim"
                               ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revName" runat="server" ErrorMessage="isim yalnızca karakter olmalıdır"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"  ValidationExpression="^[a-zA-Z\s]+$"
                               ControlToValidate="txtİsim" ></asp:RegularExpressionValidator>
                             <asp:TextBox ID="txtİsim" runat="server" CssClass="form-control" placeholder="tam adınızı giriniz.."
                               ToolTip="Ful İsim" ></asp:TextBox>
                        </div>

                        <div>

                            <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="Kullanıcı Adı gerekli"
                                ControlToValidate="txtKullaniciadi" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtKullaniciadi" runat="server" CssClass="form-control" placeholder="Kullanıcı adınızı giriniz.."
                               ToolTip="Kullanıcı Adı" ></asp:TextBox>
                        </div>


                        <div>

                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email  gerekli"
                                ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email adresinizi giriniz.."
                               ToolTip="Email" TextMode="Email" ></asp:TextBox>
                        </div>

                        <div>
                            <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ErrorMessage="Telefon No gerekli" ControlToValidate="txtTelefon"
                               ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revMobile" runat="server" ErrorMessage="telefon numarası. 11 haneli olmalıdır"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"  ValidationExpression="^[0-9]{11}$"
                               ControlToValidate="txtTelefon" ></asp:RegularExpressionValidator>

                            <asp:TextBox ID="txtTelefon" runat="server" CssClass="form-control" placeholder="Telefon Numaranızı  giriniz.."
                               ToolTip="Telefon No" TextMode="Number" ></asp:TextBox>
                        </div>

                    </div>

                </div>


                 <div class="col-md-6">
                    <div class="form_container">


                        <div>
                            <asp:RequiredFieldValidator ID="rfvAdress" runat="server" ErrorMessage="Adres gerekli" ControlToValidate="txtAdres"
                               ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ></asp:RequiredFieldValidator>

                            <asp:TextBox ID="txtAdres" runat="server" CssClass="form-control" placeholder=" Adresinizi giriniz.."
                               ToolTip="Adres" TextMode="MultiLine" ></asp:TextBox>

                           
                        </div>

                        <div>
                            <asp:RequiredFieldValidator ID="rfvPostCode" runat="server" ErrorMessage="posta kodu  gerekli"
                                ControlToValidate="txtPostaKodu" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revPostCode" runat="server" ErrorMessage="PostaKodu 5 basamaklı olmalıdır"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"  ValidationExpression="^[0-9]{5}$"
                               ControlToValidate="txtPostaKodu" ></asp:RegularExpressionValidator>

                            <asp:TextBox ID="txtPostaKodu" runat="server" CssClass="form-control" placeholder="posta kodunuzu giriniz.."
                               ToolTip="posta kodu" TextMode="Number" ></asp:TextBox>
                        </div>


                        <div>
                            
                            <asp:FileUpload ID="fuUserImage" runat="server" CssClass="form-control" ToolTip="User Image" onchange="ImagePreiew(this);" />

                        </div>

                        <div>

                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Şifre  gerekli" ControlToValidate="txtPassword"
                               ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Şifrenizi   giriniz.."
                               ToolTip="Şifre"  TextMode="Password"></asp:TextBox>
                            
                        </div>

                    </div>

                </div>
                    
                <div class="row pl-4">
                    <div class="btn-box">


                        <asp:Button ID="btnRegister" runat="server" Text="Kayıt Ol" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" 
                          ONclick="btnRegister_Click"  />

                        <asp:Label ID="lblAlreadyUser" runat="server" CssClass="pl-3 text-black-100"
                            text="zaten Kayıtlımısın? <a href='Login.aspx' class='badge badge-info'>Oturum Aç</a>">

                        </asp:Label>

                    </div>
                </div>

                <div class="row p-5">

                    <div style="align-items:center">
                        <asp:Image ID="imgUser" runat="server" CssClass="img-thumbnail" />
                    </div>
                </div>

            </div
        </div>

    </section>

</asp:Content>