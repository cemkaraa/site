using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bitirme_Restoran.User
{
    public partial class user : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.Url.AbsoluteUri.ToString().Contains("Default.aspx"))
            {
                form1.Attributes.Add("class", "sub_page");
            }
            else
            {
                form1.Attributes.Remove("class");
                Control HomeUserControl = (Control)Page.LoadControl("HomeUserControl.ascx");

                pnlHomeUC.Controls.Add(HomeUserControl);
            }


            if(Session["KullanıcıId"] != null)
            {
                lbLoginOrLogout.Text = "Çıkış Yap";
                Utils utils = new Utils();
                Session["cartCount"] = utils.cartCount(Convert.ToInt32(Session["KullanıcıId"])).ToString();
            }
            else
            {
                lbLoginOrLogout.Text = "Giriş Yap";
                Session["cartCount"] = "0";
            }
        }

        protected void lbLoginOrLogout_Click(object sender, EventArgs e)
        {
            if(Session["KullanıcıId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Session.Abandon();
                Response.Redirect("Login.aspx");
            }
        }

        protected void lblRegisterOrProfile_Click(object sender, EventArgs e)
        {
            if (Session["KullanıcıId"] != null)
            {
                lblRegisterOrProfile.ToolTip = "User  Profile";
                Response.Redirect("Profile.aspx");
            }
            else
            {
                lblRegisterOrProfile.ToolTip = "User  Registration";
                Response.Redirect("Registration.aspx");
            }
        }



        //protected void lblRegisterOrProfile_Click(object sender, EventArgs e)
        //{
        //    if(Session["KullanıcıId"] != null)
        //    {
        //        lblRegisterOrProfile.ToolTip = "user  Profile";
        //        Response.Redirect("Profile.aspx");
        //    }
        //    else
        //    {
        //        lblRegisterOrProfile.ToolTip = "user  Registration";
        //        Response.Redirect("Registration.aspx");
        //    }
        //}


    }
}