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
    public partial class Tarifler : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                //getyorum();
                gettarif();



            }

        }

        private void gettarif()
        {
            con = new SqlConnection(connection.GetConnectionString());
            cmd = new SqlCommand("Tarif_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT4PROFILE");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rtarif.DataSource = dt;
            rtarif.DataBind();
        }


        

        protected void rProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}