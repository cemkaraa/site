using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bitirme_Restoran.User
{
    public partial class Rezervasyon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Rezervasyon_Click(object sender, EventArgs e)
        {
            if (Session["KullanıcıId"] != null)
            {
                try
                {
                    

                    lblMsg.Visible = true;
                    lblMsg.Text = "Rezervasyonunuz" + " " + "Başarıyla Alınmıştır!" + " Teşekkürler!";
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
                lblMsg.Text = "Kullanıcı Girişi Yapmadan Rezervasyon Yapamazsın";
                lblMsg.CssClass = "alert alert-danger";
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Session["KullanıcıId"] != null)
            {
                try
                {


                    lblMsg.Visible = true;
                    lblMsg.Text = "Rezervasyonunuz" + " " + "Başarıyla Alınmıştır!" + " Teşekkürler!";
                    lblMsg.CssClass = "alert alert-success";


                }
                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "error-" + ex.Message;
                    lblMsg.CssClass = "alert alert-danger";
                }
                finally
                {

                }
            }
            else
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Kullanıcı Girişi Yapmadan Rezervasyon Yapamazsın";
                lblMsg.CssClass = "alert alert-danger";
            }
        }
    }
}