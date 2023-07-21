<%@ Page Title="" Language="C#" MasterPageFile="~/User/user.Master" AutoEventWireup="true" CodeBehind="Yorumlar.aspx.cs" Inherits="Bitirme_Restoran.User.Yorumlar" %>
<%@ Import Namespace="Bitirme_Restoran" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="row">
                                <div class="col-12">

                                    <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active text-info" id="basicInfo-tab" data-toggle="tab" href="#basicInfo" role="tab" 
                                            aria-controls="basicInfo" aria-selected="true"><i class=" fa fa-id-badge mr-2"></i> Temel bilgiler</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link text-info" id="connectedServices-tab" data-toggle="tab" href="#connectedServices" role="tab"
                                            aria-controls="connectedServices" aria-selected="false"><i  class="fa  fa-clock mr-2"></i>Satın Alma Geçmişi</a>
                                    </li>
                                </ul>

                                    <div class="tab-content ml-1" id="myTabContent">
                                       <%-- basic user info--%>
                                        <div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">
                                            <asp:Repeater ID="rUserProfile" runat="server">
                                                <ItemTemplate>

                                                    <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">Tam İsim</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                               <%# Eval("isim") %>
                                            </div>
                                        </div>
                                        <hr />

                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">Kullanıcı Adı</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                               @<%# Eval("KullaniciAdi") %>
                                            </div>
                                        </div>
                                        <hr />
                                        
                                        
                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">Telefon No</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <%# Eval("Telefon") %>
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">Email Adress</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                 <%# Eval("Email") %>
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">Posta kodu</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                               <%# Eval("PostaKodu") %>
                                            </div>
                                        </div>
                                                    <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">Adres</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                               <%# Eval("Adres") %>
                                            </div>
                                        </div>

                                                </ItemTemplate>
                                            </asp:Repeater>

                                        </div>
    <section>
        <h2>Yorum Yazma Bölümü</h2>
        <form action="#" method="POST">
           
            
            <input type="text" id="ad" name="ad" required><br><br>
            <label for="yorum">Yorumunuz:</label><br>
            <textarea id="yorum" name="yorum" rows="5" cols="30" required></textarea><br><br>
            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-info" ValidationGroup="cod" OnClick="lbYorum_Click">
                                            <i class="fa fa-cart-arrow-down mr-2"></i>Yorum Yap</asp:LinkButton>
        </form>
    </section>

</asp:Content>