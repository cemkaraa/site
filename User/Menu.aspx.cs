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
    public partial class Menu : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getProducts();
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

        private void getProducts()
        {
            con = new SqlConnection(connection.GetConnectionString());
            cmd = new SqlCommand("Product_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "ACTIVEPROD");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rProducts.DataSource = dt;
            rProducts.DataBind();

        }

        protected void rProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if(Session["KullanıcıId"] != null)
            {
                bool isCartItemUpdated = false;
                int i = isItemExistInCart(Convert.ToInt32(e.CommandArgument));

                if (i == 0)
                {

                    con = new SqlConnection(connection.GetConnectionString());
                    cmd = new SqlCommand("Cart_Crud", con);
                    cmd.Parameters.AddWithValue("@Action", "INSERT");
                    cmd.Parameters.AddWithValue("@UrunID", e.CommandArgument);
                    cmd.Parameters.AddWithValue("@miktar", 1);
                    cmd.Parameters.AddWithValue("@KullanıcıId", Session["KullanıcıId"]);
                    cmd.CommandType = CommandType.StoredProcedure;
                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                    catch(Exception ex)
                    {
                        Response.Write("<script>alert('Error -" + ex.Message + "');<script>"); ;
                    }
                    finally
                    {
                        con.Close();
                    }
                }
                else
                {
                    Utils utils = new Utils();
                    isCartItemUpdated = utils.updateCartQuantity(i+1,Convert.ToInt32(e.CommandArgument),
                        Convert.ToInt32(Session["KullanıcıId"]));
                    
                }
                lblMsg.Visible = true;
                lblMsg.Text = "Ürün başarılı bir şekilde sepete eklendi!";
                lblMsg.CssClass = "alert alert-success";
                Response.AddHeader("REFRESH", "1;URL=Cart.aspx");
            }

            else
            {
                Response.Redirect("Login.aspx");

            }
        }


        int isItemExistInCart(int ProductId)
        {
            con = new SqlConnection(connection.GetConnectionString());
            cmd = new SqlCommand("Cart_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "GETBYID");
            cmd.Parameters.AddWithValue("@UrunID", ProductId);
            cmd.Parameters.AddWithValue("@KullanıcıId", Session["KullanıcıId"]);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            int quantity = 0;
            if (dt.Rows.Count > 0)
            {
                quantity = Convert.ToInt32(dt.Rows[0]["miktar"]);
            }

            return quantity;
        }
    }
       
}