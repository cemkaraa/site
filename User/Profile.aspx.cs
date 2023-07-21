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
    public partial class Profile : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["KullanıcıId"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    getUserDetails();
                }
            }
        }


        void getUserDetails()
        {
            con = new SqlConnection(connection.GetConnectionString());
            cmd = new SqlCommand("User_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT4PROFILE");
            cmd.Parameters.AddWithValue("@KullanıcıId", Session["KullanıcıId"]);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rUserProfile.DataSource = dt;
            rUserProfile.DataBind();
            if (dt.Rows.Count == 1)
            {
                Session["isim"] = dt.Rows[0]["isim"].ToString();
                Session["Email"] = dt.Rows[0]["Email"].ToString();
                Session["ResimUrl"] = dt.Rows[0]["ResimUrl"].ToString();
                Session["OlusturmaTarihi"] = dt.Rows[0]["OlusturmaTarihi"].ToString();
            }
           
        }

    }
}