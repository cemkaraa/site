using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bitirme_Restoran.Admin
{
    public partial class Tarif : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../User/Login.aspx");
            }
            else
            {
                gettarif();

            }
        }

        protected void btnAddOrUpdate_Click(object sender, EventArgs e)
        {
            string actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
            bool isValidToExecute = false;
            int categoryId = Convert.ToInt32(hdnId.Value);
            con = new SqlConnection(connection.GetConnectionString());
            cmd = new SqlCommand("Tarif_Crud", con);
            cmd.Parameters.AddWithValue("@Action", categoryId == 0 ? "INSERT" : "UPDATE");
      
            cmd.Parameters.AddWithValue("@isim", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@malzemeler", malzeme.Text.Trim());
            cmd.Parameters.AddWithValue("@tarif", tarif.Text.Trim());

            if (fuCategoryImage.HasFile)
            {

                if (Utils.IsValidExtension(fuCategoryImage.FileName))
                {

                    Guid obj = Guid.NewGuid();
                    fileExtension = Path.GetExtension(fuCategoryImage.FileName);
                    imagePath = "Images/tarif/" + obj.ToString() + fileExtension;
                    fuCategoryImage.PostedFile.SaveAs(Server.MapPath("~/Images/tarif/") + obj.ToString() + fileExtension);
                    cmd.Parameters.AddWithValue("@resim", imagePath);
                    isValidToExecute = true;
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "please select .jpg,.jpeg or .png image";
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
                    actionName = categoryId == 0 ? "inserted" : "updated";
                    lblMsg.Visible = true;
                    lblMsg.Text = "Kategori" + " " + "Başarıyla Eklendi!";
                    lblMsg.CssClass = "alert alert-success";
                    gettarif();
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

    }
        private void Clear()
        {
            malzeme.Text = string.Empty;
            tarif.Text = string.Empty;
            txtName.Text = string.Empty;
            cbIsActive.Checked = false;
            hdnId.Value = "0";
            btnAddOrUpdate.Text = "Ekle";
            imgCategory.ImageUrl = String.Empty;
        }
        private void gettarif()
        {
            con = new SqlConnection(connection.GetConnectionString());
            cmd = new SqlCommand("Tarif_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rCategory.DataSource = dt;
            rCategory.DataBind();
        }

        protected void rCategory_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void rCategory_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }
    }
}