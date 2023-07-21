<%@ Page Title="" Language="C#" MasterPageFile="~/User/user.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Bitirme_Restoran.User.Cart" %>
<%@ Import Namespace="Bitirme_Restoran" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                     <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                </div>
                <h2>
          Alışveriş Sepetiniz
                    
        </h2>
            </div>
        </div>

        <div class="container">

            <asp:Repeater ID="rCartItem" runat="server" OnItemCommand="rCartItem_ItemCommand" OnItemDataBound="rCartItem_ItemDataBound">
                <HeaderTemplate>
                    <table class="table" >
                        <thead>
                            <tr>
                                  <th>İsim</th>
                                  <th>Resim</th>
                                  <th>Birim fiyat</th>
                                  <th>Miktar</th>
                                  <th>Toplam Fiyat</th>
                                  <th></th>
                            </tr>
                        </thead>
                        <tbody>

                       
                </HeaderTemplate>
                <ItemTemplate>
                  <tr>
                      <td>
                          <asp:Label ID="lblName" runat="server" Text='<%# Eval("isim") %>'></asp:Label>
                      </td>
                     

                      <td>
                      <img  height="90" width="90" object-fit: cover; src="<%# Utils.GetImageUrl(Eval("ResimUrl")) %>"  alt=""/>
                        </td>
                      <td>
                          <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("fiyat") %>'></asp:Label>₺
                          <asp:HiddenField ID="hdnProductId" runat="server" Value='<%# Eval("UrunID") %>' />
                           <asp:HiddenField ID="hdnQuantity" runat="server" Value='<%# Eval("qty") %>'/>
                           <asp:HiddenField ID="hdnPrdQuantity" runat="server" Value='<%# Eval("prdqty") %>'/>
                      </td>
                      <td>
                          <div class="product__details__option">
                              <div class="quantity">
                                  <div class="pro-qty">
                                      <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" Text='<%# Eval("miktar") %>'>

                                      </asp:TextBox>

                                      <asp:RegularExpressionValidator ID="revQuantity" runat="server" ErrorMessage="*" ForeColor="red" 
                                          Font-Size="Small" ValidationExpression="[1-9]*" ControlToValidate="txtQuantity"
                                          Display="Dynamic" SetFocusOnError="true" EnableClientScript="true"></asp:RegularExpressionValidator>
                                  </div>
                              </div>
                          </div>
                      </td>
                      <td>
                          <asp:Label ID="lblTotalPrice" runat="server" ></asp:Label>₺</td>

                      <td>
                          <asp:LinkButton ID="lbDelete" runat="server" Text="Sil" CommandName="remove"
                              CommandArgument='<%# Eval("UrunID") %>'
                              OnClientClick="return confirm('bu öğeyi sepetten kaldırmak istiyor musunuz?');"><i class="fa fa-close text-info " ></i></asp:LinkButton>
                      </td>
                  </tr>
                </ItemTemplate>
                <FooterTemplate>
                    <tr>
                        <td colspan="3"></td>
                         <td class="pl-lg-5">
                             <b>Genel toplam:</b>
                         </td>
                        <td>₺ <% Response.Write(Session["grandTotalPrice"]); %></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="continue__btn">
                            <a href="Menu.aspx" class="btn btn-warning "><i class="fa fa-arrow-circle-left mr-2"></i>Alışverişe devam et</a>
                        </td>
                        <td>
                            <asp:LinkButton ID="lbUpdateCart" runat="server" CommandName="updateCart" CssClass="btn btn-warning">
                                <i class="fa fa-refresh mr-2"></i>sepeti güncelle
                            </asp:LinkButton>
                        </td>
                        <td>
                            <asp:LinkButton ID="lbCheckout" runat="server" CommandName="checkout" CssClass="btn btn-success">
                                ödeme<i class="fa fa-arrow-circle-right ml-2"></i>
                            </asp:LinkButton>
                        </td>
                    </tr>
                       </tbody>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>

    </section>
</asp:Content>
