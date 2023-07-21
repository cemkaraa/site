<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="yorum.aspx.cs" Inherits="Bitirme_Restoran.Admin.yorum" %>
<%@ Import Namespace="Bitirme_Restoran" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script>
        window.onload = function () {

            var seconds = 5;
            setTimeout(function () {

                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);

        };
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pcoded-inner-content pt-0 ">
        <div class="align-align-self-end">
            <asp:Label ID="lblMsg" runat="server" Text="Label" Visible="false"></asp:Label>
        </div>


     <div class="main-body">
            <div class="page-wrapper">
                <div class="page-body">
                    <div class="row">

                        <div class="col-sm-12 ">
                            <div class="card">
                                <div class="card-header">
                                    <h5>İstatistik</h5>
                                    <div class="card-header-left ">
                                    </div>
                                    <div class="card-header-right">
                                    </div>
                                    <div class="card-block">
                                        <div class="row">

                                           
                                             <div class="col-12 mobile-inputs">
                                                  <h4 class="sub-title">Kategori Listesi</h4>
                                                    <div class="card-block table-border-style">
                                                        <div class="table-responsive">
                                                          <asp:Repeater ID="rYorum" runat="server" OnItemCommand="rYorum_ItemCommand">

                                                             <HeaderTemplate>
                                                                    <table class="table data-table-export table-hover nowrap">
                                                                        <thead>
                                                                        <tr>
                                                                            
                                                                            <th  class="table-plus">isim</th>
                                                                            <th>yorum</th>
                                                                            
                                                                             <th>yorum Tarihi</th>
                                                                            <th class="datatable-nosort">Sil</th>
                                                                        </tr>
                                                                    </thead>
                                                                        <tbody>
                                                                </HeaderTemplate>
                                                              <ItemTemplate>
                                                                  <tr>
                                                                        
                                                                        <td>  
                                                                            <%# Eval("KullaniciAdi") %>
                                                                        </td>
                                                                      <td><%# Eval("yorum") %>  </td>
                                                                      <td><%# Eval("yorumTarihi") %>  </td>
                                                                          
                                                                          
                                                                          <td>


                                                                              <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CommandName="delete"
                                                                                    CssClass="badge bg-danger" CommandArgument='<%# Eval("KullanıcıId") %>' OnClientClick="return confirm('Bu Yorumu silmek istiyormusun ?');">
                                                                                  <i class="ti-trash"></i>
                                                                              </asp:LinkButton>


                                                                          </td>
                                                                  </tr>
                                                              </ItemTemplate>
                                                              <FooterTemplate>
                                                                    </tbody>
                                                                    </table>
                                                                </FooterTemplate>
                                                              </asp:Repeater>
                                                      </div>
                                                  </div>

                                                <div>
                                                    </div>


  





                                      </div>

                                    </div>




                                    

                                
                            </div>
                        </div>
                    </div>
                </div>
         
     </div>
        </div>  </div>

</asp:Content>

