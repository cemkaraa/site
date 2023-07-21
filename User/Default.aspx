<%@ Page Title="" Language="C#" MasterPageFile="~/User/user.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Bitirme_Restoran.User.Default" %>
<%@ Import Namespace="Bitirme_Restoran" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- offer section -->

    <section class="offer_section layout_padding-bottom">
        <div class="heading_container heading_center">
            <h2>Çeşitler...
            </h2>
        </div>
        <div class="offer_container">
            <div class="container ">
                <div class="row">
                    <asp:Repeater ID="rCategory" runat="server">
                        <ItemTemplate>
                            <div class="col-md-6  ">
                                <div class="box ">
                                    <div class="img-box">
                                        <a href="Menu.aspx?id=<%# Eval("KategoriId") %>">
                                            <img src="<%# Utils.GetImageUrl( Eval("ResimUrl")) %>" alt="">
                                        </a>
                                    </div>
                                    <div class="detail-box">
                                        <h5><%# Eval("isim") %>"
                                        </h5>
                                        <h6>
                                            
                                        </h6>
                                        <a href="Menu.aspx?id=<%# Eval("KategoriId") %>">Sipariş Ver 
                    <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background: new 0 0 456.029 456.029;" xml:space="preserve">
                        <g>
                            <g>
                                <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                     c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                            </g>
                        </g>
                        <g>
                            <g>
                                <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                     C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                     c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                     C457.728,97.71,450.56,86.958,439.296,84.91z" />
                            </g>
                        </g>
                        <g>
                            <g>
                                <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                     c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                            </g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                    </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>


                </div>
            </div>
        </div>
    </section>

    <!-- end offer section -->



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
                            <h2>Ceka Ailesi
                            </h2>
                        </div>
                        <p>
                            misafirlerimize unutulmaz bir yemek deneyimi sunan, kaliteli hizmet ve lezzetli yemeklerle öne çıkan bir markadır. Müşteri memnuniyetine odaklanarak, lezzetli yemeklerimizle damakları şenlendiriyor, samimi ve sıcak atmosferimizle de misafirlerimize keyifli anlar yaşatıyoruz.

Misyonumuz, taze ve kaliteli malzemeler kullanarak en iyi lezzetleri sunmak, misafirlerimizin beklentilerini aşmak ve onları mutlu etmektir. Yemeklerimizi hazırlarken en iyi şeflerimizle çalışıyor, geleneksel ve modern mutfak tekniklerini bir araya getirerek özgün ve lezzetli tarifler yaratıyoruz.
                        </p>
                        <a class="buton" href="About.aspx">Tamamını Oku
                        </a>
                    </div>
                </div>
            </div>
        </div>


    </section>
    <section class="book_section layout_padding">
        <div class="container">

            <div class="heading_container">

                <div class="align-self-end">

                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                </div>
                    <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2>Şikayet/Öneri </h2>"></asp:Label>
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

                         <div>
                            <asp:RequiredFieldValidator ID="rfvŞikayet" runat="server" ErrorMessage="Şikayet/Öneri gerekli" ControlToValidate="txtşikayet"
                               ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ></asp:RequiredFieldValidator>

                            <asp:TextBox ID="txtşikayet" runat="server" CssClass="form-control" placeholder=" Şikayet/Önerinizi giriniz.."
                               ToolTip="Şikayet/Öneri" TextMode="MultiLine" ></asp:TextBox>

                           
                        </div>
                        <div class="row pl-4">
                    <div class="btn-box">


                        <asp:Button ID="gönder" runat="server" Text=" Gönder" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" 
                          ONclick="Gönder_Click" />

                        

                    </div>
                </div>
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
