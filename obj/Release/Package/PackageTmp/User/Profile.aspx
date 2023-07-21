<%@ Page Title="" Language="C#" MasterPageFile="~/User/user.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Bitirme_Restoran.User.Profile" %>
<%@ Import Namespace="Bitirme_Restoran" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%
        string ResimUrl = Session["ResimUrl"].ToString();
        %>

    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">

                <h2>Kullanıcı bilgisi</h2>
            </div>

            <div class="row">

                <div class="col-12">
                    <div class="card">
                        <div class="card-body">

                            <div class="card-title mb-4">

                                <div class="d-flex justify-content-start">

                                    <div class="image-container">

                                        <img  src="<%= Utils.GetImageUrl(ResimUrl)  %>" id="imgProfile" style="width:200px;height:200px" 
                                            class="img-thumbnail"/>

                                        
                                        <div class="middle pt-2 text-info">
                                            <a href="Registration.aspx?id=<%Response.Write(Session["KullanıcıId"]); %>" class="btn btn-warning">
                                                <i class="fa fa-pencil">Detayları Duzenle</i>
                                            </a>
                                        </div>

                                        
                                    </div>

                                    <div class="userData ml-3 text-info">
                                    <h2 class="d-block" style="font-size: 1.5rem; font-weight: bold">
                                        <a href="javascript:void(0);"><%Response.Write(Session["isim"]); %></a>

                                    </h2>
                                    <h6 class="d-block text-info">
                                        <a href="javascript:void(0)">

                                        <asp:Label ID="lblUsername" runat="server" ToolTip="Benzersiz Kullanıcı Adı">
                                            @<%Response.Write(Session["KullaniciAdi"]); %>
                                        </asp:Label>
                                        </a> 

                                    </h6>

                                        <h6 class="d-block text-info">
                                        <a href="javascript:void(0)">

                                        <asp:Label ID="lblEmail" runat="server" ToolTip="Kullanıcı e-postası">
                                            <%Response.Write(Session["Email"]); %>
                                        </asp:Label>
                                        </a> 

                                    </h6>
                                       

                                        <h6 class="d-block text-info">
                                        <a href="javascript:void(0)">

                                        <asp:Label ID="lblCreateDate" runat="server" ToolTip="Hesap Oluşturma Tarihi">
                                            <%Response.Write(Session["OlusturmaTarihi"]); %>
                                        </asp:Label>
                                        </a> 

                                    </h6>
                                </div>

                                </div>
                            </div>

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

                                      <%--  Order History Starts--%>

                                        <div class="tab-pane fade" id="connectedServices" role="tabpanel" aria-labelledby="ConnectedServices-tab">
                                            <h3>Satın Alma Geçmişi</h3>

                                        </div>
                                     <%--  Order History Starts--%>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
