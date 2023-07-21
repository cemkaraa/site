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

    public partial class Default : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
           
                getCategories();



            }
        }

        private void getCategories()
        {
            con = new SqlConnection(connection.GetConnectionString());
            cmd = new SqlCommand("Category_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "ACTIVECAT");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rCategory.DataSource = dt;
            rCategory.DataBind();
        }

        protected void Gönder_Click(object sender, EventArgs e)
        {
            if (Session["KullanıcıId"] != null)
            {
                try
                {


                    lblMsg.Visible = true;
                    lblMsg.Text = "Şikayetiniz/Öneriniz" + " " + "Bize  Ulaşmıştır!" + " Teşekkürler!";
                    lblMsg.CssClass = "alert alert-success";


                }
                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "error-" + ex.Message;
                    lblMsg.CssClass = "alert alert-danger";
                }

            }
            else
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Kullanıcı Girişi Yapmadan Şikayet/Öneri Yapamazsın";
                lblMsg.CssClass = "alert alert-danger";
            }
        }

    }





    




}



    
