<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Bitirme_Restoran.Admin.Product" %>

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

    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgProduct.ClientID%>').prop('src', e.target.result)

                        .widget(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }

        }  </script>

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
                                        <div class="row" >

                                            <div class="col-sm-6 col-md-4 col-lg-4">
                                                <h4 class="sub-title">Ürün</h4>
                                            <div>
                                            <div class="form-group">
                                                <label>Ürün İsmi</label> 
                                                        <div>
                                                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"
                                                                placeholder="Ürün ismini giriniz"></asp:TextBox>

                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                                ErrorMessage="İsim gerekli" ForeColor="Red" Display="Dynamic"
                                                                SetFocusOnError="true" ControlToValidate="txtName"></asp:RequiredFieldValidator>

                                                            <asp:HiddenField ID="hdnId" runat="server" Value="0" />


                                                        </div>

                                                    </div>

                                                    <div class="form-group">
                                                        <label>Ürün Tanımı</label>
                                                        <div>
                                                            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control"
                                                                placeholder="Ürün Tanımını giriniz" TextMode="MultiLine"></asp:TextBox>

                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                                                ErrorMessage="Tanım gerekli" ForeColor="Red" Display="Dynamic"
                                                                SetFocusOnError="true" ControlToValidate="txtDescription"></asp:RequiredFieldValidator>

                                                        </div>

                                                    </div>


                                                     <div class="form-group">
                                                        <label>>Ürün Fiyatı(₺)</label>
                                                        <div>
                                                            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"
                                                                placeholder="Ürün Fiyatını giriniz"></asp:TextBox>

                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                                                ErrorMessage="Fiyat gerekli" ForeColor="Red" Display="Dynamic"
                                                                SetFocusOnError="true" ControlToValidate="txtPrice"></asp:RequiredFieldValidator>

                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                                ErrorMessage="Fiyat ondalık olmalıdır" ForeColor="Red" Display="Dynamic"
                                                               SetFocusOnError="true" ControlToValidate="txtPrice"
                                                               ValidationExpression="^\d{0,8}(\.\d{1,4})?$"></asp:RegularExpressionValidator>

                                                        </div>

                                                    </div>



                                                    <div class="form-group">
                                                        <label>>Ürün Miktarı</label>
                                                        <div>
                                                            <asp:TextBox ID="txtQunatity" runat="server" CssClass="form-control"
                                                                placeholder="Ürün Miktarını giriniz"></asp:TextBox>

                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                                                ErrorMessage="Miktar gerekli" ForeColor="Red" Display="Dynamic"
                                                                SetFocusOnError="true" ControlToValidate="txtQunatity"></asp:RequiredFieldValidator>



                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Miktar negatif olmamalıdır"
                                                              ForeColor="Red" Display="Dynamic"
                                                               SetFocusOnError="true" ControlToValidate="txtPrice"
                                                               ValidationExpression="^([1-9]\d*|0)$"  ></asp:RegularExpressionValidator>


                                                        </div>

                                                    </div>



                                                    <div class="form-group">
                                                        <label>Ürün Resmi</label>
                                                        <div>
                                                            <asp:FileUpload ID="fuProductImage" runat="server" CssClass="form-control"
                                                                onchange="ImagePreview(this);" />

                                                        </div>
                                                    </div>


                                                     <div class="form-group">
                                                        <label>Ürün Kategorisi</label>
                                                        <div>
                                                          
                                                            <asp:DropDownList ID="ddlCategories" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="isim" DataValueField="KategoriId"
                                                                AppendDataBoundItems="true">
                                                                <asp:ListItem Value="0">Kategori seç</asp:ListItem>
                                                            </asp:DropDownList>

                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                                                ErrorMessage="Kategori gerekli" ForeColor="Red" Display="Dynamic"
                                                                SetFocusOnError="true" ControlToValidate="ddlCategories" InitialValue="0"></asp:RequiredFieldValidator>
                                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="SELECT [KategoriId], [isim] FROM [kategoriler]"></asp:SqlDataSource>

                                                        </div>

                                                    </div>

                                                    <div class="form-check pl-4">
                                                        <asp:CheckBox ID="cbIsActive" runat="server" Text="&nbsp; Aktifmi" CssClass="form-check-input" />

                                                    </div>
                                                    <div class="pb-5">
                                                        <asp:Button ID="btnAddOrUpdate" runat="server" Text="Ekle" CssClass="btn btn-primary"
                                                            OnClick="btnAddOrUpdate_Click" />

                                                        &nbsp;
                                                        <asp:Button ID="btnClear" runat="server" Text="Temizle" CssClass="btn btn-primary" CausesValidation="false"
                                                            OnClick="btnClear_Click" />
                                                    </div>

                                                </div>

                                                <div>
                                                    <asp:Image ID="imgProduct" runat="server" CssClass="img-thumbnail" />

                                                </div>
                                            </div>
                                        </div>




                                        <div class="col-12 mobile-inputs">
                                            <h4 class="sub-title">Kategori Listesi</h4>
                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">
                                                    <asp:Repeater ID="rProduct" runat="server" OnItemCommand="rProduct_ItemCommand" OnItemDataBound="rProduct_ItemDataBound">

                                                        <HeaderTemplate>
                                                            <table class="table data-table-export table-hover nowrap">
                                                                <thead>
                                                                    <tr>
                                                                       <th class="table-plus">isim</th>
                                                                            <th>Resim</th>
                                                                             <th>Fiyat(₺)</th>
                                                                             <th>Miktarı</th>
                                                                             <th>Kategori</th>
                                                                            <th>Aktifmi</th>
                                                                             <th>Tanım</th>
                                                                            <th>OluşturmaTarihi</th>
                                                                            <th class="datatable-nosort">Aksiyon</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td class="table-plus"><%# Eval("isim")%></td>
                                                                <td>
                                                                    <img alt="" width="50" src="<%# Utils.GetImageUrl( Eval("ResimUrl")) %>" />
                                                                </td>

                                                                 <td><%# Eval("fiyat") %></td>

                                                                
                                                                  <td>
                                                                      <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("miktar") %>'></asp:Label>
                                                                  </td>
                                                                <td><%# Eval("CategoryName") %></td>


                                                                      
                                                                <td>
                                                                    <asp:Label ID="lblIsActive" runat="server" Text='<%# Eval("Aktif") %>'></asp:Label></td>

                                                                <td><%# Eval("Tanım") %></td>

                                                                <td><%# Eval("OlusturmaTarihi")%></td>
                                                                <td>

                                                                    <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CssClass="badge badge-primary"
                                                                        CausesValidation="false"
                                                                        CommandArgument='<%# Eval("UrunID") %>' CommandName="edit">
                                                                                    <i class="ti-pencil"></i>   

                                                                    </asp:LinkButton>

                                                                    <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CommandName="delete"
                                                                        CssClass="badge bg-danger" CommandArgument='<%# Eval("UrunID") %>' OnClientClick="return confirm('Bu ürünü silmek istiyormusun ?');"
                                                                        CausesValidation="false">
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
            </div>

        </div>
</asp:Content>
