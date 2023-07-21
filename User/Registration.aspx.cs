using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bitirme_Restoran.User
{
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null/* && Session["KullanıcıId"] != null*/)
                {

                    getUserDetails();
                }
                else if (Session["KullanıcıId"] != null)
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {

            string actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;

            bool isValidToExecute = false;
            int userid = Convert.ToInt32(Request.QueryString["id"]);
            con = new SqlConnection(connection.GetConnectionString());
            cmd = new SqlCommand("User_Crud", con);
            cmd.Parameters.AddWithValue("@Action", userid == 0 ? "INSERT" : "UPDATE");
            cmd.Parameters.AddWithValue("@KullanıcıId", userid);
            cmd.Parameters.AddWithValue("@isim", txtİsim.Text.Trim());
            cmd.Parameters.AddWithValue("@KullaniciAdi", txtKullaniciadi.Text.Trim());
            cmd.Parameters.AddWithValue("@Telefon", txtTelefon.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Adres", txtAdres.Text.Trim());
            cmd.Parameters.AddWithValue("@PostaKodu", txtPostaKodu.Text.Trim());
            cmd.Parameters.AddWithValue("@Sifre", txtPassword.Text.Trim());
            if (fuUserImage.HasFile)
            {
                if (Utils.IsValidExtension(fuUserImage.FileName))
                {

                    Guid obj = Guid.NewGuid();
                    fileExtension = Path.GetExtension(fuUserImage.FileName);
                    imagePath = "Images/User/" + obj.ToString() + fileExtension;
                    fuUserImage.PostedFile.SaveAs(Server.MapPath("~/Images/User/") + obj.ToString() + fileExtension);
                    cmd.Parameters.AddWithValue("@ResimUrl", imagePath);
                    isValidToExecute = true;
                }
                else
                {

                    lblMsg.Visible = true;
                    lblMsg.Text = "Lütfen .png .jpg veya .jpeg resmi seçin";
                    lblMsg.CssClass = "alert alert-danger";
                    isValidToExecute = false;
                }

            }
            else
            {
                isValidToExecute = true;
            }


           


            if (isValidToExecute)
            {

                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    actionName = userid == 0 ?
                        "kayıt başarılı ! <b><a href='Login.aspx'>Buraya Tıklayın</a></b>giriş yapmak için" :
                        "Detaylar başarılı bir şekilde güncellendi <b><a href='Profile.aspx'>Buradan kontrol edebilirsiniz</a></b>";
                    lblMsg.Visible = true;
                    lblMsg.Text = "<b>" + txtKullaniciadi.Text.Trim() + "</b> " + actionName;
                    lblMsg.CssClass = "alert alert-success";
                    if (userid != 0)
                    {
                        Response.AddHeader("REFRESH", "1;URL=Profile.aspx");
                    }
                    Clear();
                }
                catch (SqlException ex)
                {
                    if (ex.Message.Contains("Violation of UNIQUE KEY constraint"))
                    {
                       lblMsg.Visible = true;
                       lblMsg.Text = "<b>" + txtKullaniciadi.Text.Trim() + "</b> kullanıcı adı yada" +"<b>" + txtEmail.Text.Trim()+ " </b> mail adresi zaten mevcut, yenisini deneyin.. ! ";
                       lblMsg.CssClass = "alert alert-danger";
                       
                    }


                }
                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Error" + ex.Message;
                    lblMsg.CssClass = "alert alert-danger";

                }
                finally
                {
                    con.Close();
                }

            }



        }

        void getUserDetails()
        {
            con = new SqlConnection(connection.GetConnectionString());
            cmd = new SqlCommand("User_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT4PROFILE");
            cmd.Parameters.AddWithValue("@KullanıcıId", Request.QueryString["id"]);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count == 1)
            {
                txtİsim.Text = dt.Rows[0]["isim"].ToString();
                txtKullaniciadi.Text = dt.Rows[0]["KullaniciAdi"].ToString();
                txtTelefon.Text = dt.Rows[0]["Telefon"].ToString();
                txtEmail.Text = dt.Rows[0]["Email"].ToString();
                txtAdres.Text = dt.Rows[0]["Adres"].ToString();
                txtPostaKodu.Text = dt.Rows[0]["PostaKodu"].ToString();
                imgUser.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["ResimUrl"].ToString())
                    ? "../Images/No_image.png" : "../" + dt.Rows[0]["ResimUrl"].ToString();
                imgUser.Height = 200;
                imgUser.Width = 200;
                txtPassword.TextMode = TextBoxMode.SingleLine;
                txtPassword.ReadOnly = true;
                txtPassword.Text = dt.Rows[0]["Sifre"].ToString();
            }
            lblHeaderMsg.Text = "<h2>Profili düzenle</h2>";
            btnRegister.Text = "Güncelle";
            lblAlreadyUser.Text = "";
        }


        private void Clear()
        {
            txtİsim.Text = string.Empty;
            txtKullaniciadi.Text = string.Empty;
            txtTelefon.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtAdres.Text = string.Empty;
            txtPostaKodu.Text = string.Empty;
            txtPassword.Text = string.Empty;
        }
    }
}