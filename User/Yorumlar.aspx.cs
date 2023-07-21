using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bitirme_Restoran.User
{
    public partial class Yorumlar : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        private string imagePath;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                //getyorum();
                getyorum2();



            }
        }


        //private void getyorum()
        //{
        //    con = new SqlConnection(connection.GetConnectionString());
        //    cmd = new SqlCommand("Yorum2_Crud", con);
        //    cmd.Parameters.AddWithValue("@Action", "GETYORUM");
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    sda = new SqlDataAdapter(cmd);
        //    dt = new DataTable();
        //    sda.Fill(dt);
        //    rYorum.DataSource = dt;
        //    rYorum.DataBind();
        //}
        private void Clear()
        {
            txtyorum.Text = string.Empty;
           
            
        }
        private void getyorum2()
        {
            con = new SqlConnection(connection.GetConnectionString());
            cmd = new SqlCommand("Yorum_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "ACTIVECAT");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rYorum2.DataSource = dt;
            rYorum2.DataBind();
        }
        protected void lbYorum_Click(object sender, EventArgs e)
        {

        }

        //protected void btnYorum_Click(object sender, EventArgs e)
        //{

            
        //    string yorum = txtyorum.Text.Trim();
           
        //    string isim = txtİsim.Text.Trim();
           

        //    con = new SqlConnection(connection.GetConnectionString());
        //    cmd = new SqlCommand("Yorum2_Crud", con);
        //    cmd.Parameters.AddWithValue("@Action", "INSERT");
        //    cmd.Parameters.AddWithValue("@isim", isim);
        //    cmd.Parameters.AddWithValue("@yorum", yorum);

        //    cmd.CommandType = CommandType.StoredProcedure;
        //    try
        //    {
        //        con.Open();
        //        cmd.ExecuteNonQuery();
                
        //        lblMsg.Visible = true;
        //        lblMsg.Text = "Kategori" + " " + "Başarıyla Eklendi!";
        //        lblMsg.CssClass = "alert alert-success";
        //        getyorum();
                
        //    }
        //    catch (Exception ex)
        //    {
        //        lblMsg.Visible = true;
        //        lblMsg.Text = "error-" + ex.Message;
        //        lblMsg.CssClass = "alert alert-danger";
        //    }
        //    finally
        //    {
        //        con.Close();
        //    }


        //    // Veritabanından kullanıcının diğer bilgilerini çekme
        //}
      
        protected void denemeYorum_Click(object sender, EventArgs e)
        {

            string yorum = txtyorum.Text.Trim();
            string fileExtension = string.Empty;
            string imagePath = string.Empty;
         






            con = new SqlConnection(connection.GetConnectionString());
            cmd = new SqlCommand("Yorum_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "INSERT");
            cmd.Parameters.AddWithValue("@KullanıcıId", Session["KullanıcıId"]);
            cmd.Parameters.AddWithValue("@KullaniciAdi", Session["KullaniciAdi"]);
            //cmd.Parameters.AddWithValue("@ResimUrl", Session["ResimUrl"].ToString());

            //cmd.Parameters.AddWithValue("@ResimUrl", Session["ResimUrl"].ToString());















            cmd.Parameters.AddWithValue("@yorum", yorum);
          



            cmd.CommandType = CommandType.StoredProcedure;
            if (Session["KullanıcıId"] != null)
            {
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();

                    lblMsg.Visible = true;
                    lblMsg.Text = "Yorum" + " " + "Başarıyla Eklendi!";
                    lblMsg.CssClass = "alert alert-success";
                    getyorum2();
                    Clear();

                }
                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "error-" + ex.Message;
                    lblMsg.CssClass = "alert alert-danger";
                }
                finally
                {
                    con.Close();
                }
            }
            else
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Kullanıcı Girişi Yapmadan Yorum Yapamazsın"  ;
                lblMsg.CssClass = "alert alert-danger";
            }
            

        }
    }
}