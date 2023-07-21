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


    public partial class Payment : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr, dr1;
        DataTable dt;
        SqlTransaction transaction = null;

        string _name = string.Empty; string _cardNo = string.Empty; string _expiryDate = string.Empty; string _cvv = string.Empty;
        string _adress = string.Empty;
        string _paymentMode = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["KullanıcıId"] == null)
                {
                    Response.Redirect("Login.aspx");
                }

            }
        }

        protected void lbCardSubmit_Click(object sender, EventArgs e)
        {
            _name = txtName.Text.Trim();
            _cardNo = txtCardNo.Text.Trim();
            _cardNo = string.Format("***********{0}", txtCardNo.Text.Trim().Substring(12, 4));
            _expiryDate = txtExpMonth.Text.Trim() + "/" + txtExpYear.Text.Trim();
            _cvv = txtCvv.Text.Trim();
            _adress = txtAddress.Text.Trim();
            _paymentMode = "card";
            if (Session["KullanıcıId"] != null)
            {
                OrderPayment(_name,_cardNo,_expiryDate,_cvv,_adress,_paymentMode);
            }
            else
            {
                Response.Redirect("Login.aspx");
            }


        }

        protected void lbCodSubmit_Click(object sender, EventArgs e)
        {
            _adress = txtCODAddress.Text.Trim();
            _paymentMode = "card";
            if (Session["KullanıcıId"] != null)
            {
                OrderPayment(_name, _cardNo, _expiryDate, _cvv, _adress, _paymentMode);

            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        void OrderPayment(string name, string cardNo, string expiryDate, string cvv, string address, string paymentMode)
        {

            int paymentId; int productId; int quantity;
            dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[7]
            {
                new DataColumn("SiparisNo",typeof(string)),
                 new DataColumn("UrunID",typeof(int)),
                  new DataColumn("miktar",typeof(int)),
                   new DataColumn("KullanıcıId",typeof(int)),
                    new DataColumn("durum",typeof(string)),
                     new DataColumn("OdemeID",typeof(int)),
                      new DataColumn("OlusturmaTarihi",typeof(DateTime)),
            });
            con = new SqlConnection(connection.GetConnectionString());
            con.Open();
            #region Sql Transaction
            transaction = con.BeginTransaction();
            cmd = new SqlCommand("Save_Payment", con);
            cmd.Transaction = transaction;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@isim", name);
            cmd.Parameters.AddWithValue("@KartNo", cardNo);
            cmd.Parameters.AddWithValue("@SonTarih", expiryDate);
            cmd.Parameters.AddWithValue("@CvvNo", cvv);
            cmd.Parameters.AddWithValue("@adres", address);
            cmd.Parameters.AddWithValue("@OdemeModu", paymentMode);
            cmd.Parameters.Add("@InsertedId", SqlDbType.Int);
            cmd.Parameters["@InsertedId"].Direction = ParameterDirection.Output;
            try
            {
                cmd.ExecuteNonQuery();
                paymentId = Convert.ToInt32(cmd.Parameters["@InsertedId"].Value);
                #region Getting Cart Item's
                cmd = new SqlCommand("Cart_Crud", con,transaction);
                cmd.Parameters.AddWithValue("@Action", "SELECT");
                cmd.Parameters.AddWithValue("@KullanıcıId", Session["KullanıcıId"]);
                cmd.CommandType = CommandType.StoredProcedure;
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    productId = (int)dr["UrunID"];
                    quantity = (int)dr["miktar"];
                    UpdateQuantity(productId,quantity,transaction,con);
                    DeleteCartItem(productId,transaction,con);




                    dt.Rows.Add(Utils.GetUniqueId(), productId, quantity, (int)Session["KullanıcıId"], "pending",
                        paymentId, Convert.ToDateTime(DateTime.Now));
                }
                dr.Close();
                #endregion Getting Cart Item's
                #region Order Details
                if (dt.Rows.Count > 0)
                {
                    cmd = new SqlCommand("Save_Orders", con, transaction);
                    cmd.Parameters.AddWithValue("@siparisler", dt);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();
                }
                #endregion Order Details
                transaction.Commit();
                lblMsg.Visible = true;
                lblMsg.Text = "Siparişiniz Başarılı!!!";
                lblMsg.CssClass = "alert alert-success";
                Response.AddHeader("REFRESH", "1;URL=Invoice.aspx?id" + paymentId);
            }
            catch (Exception e)
            {
                try
                {
                    if(transaction != null)
                    {
                transaction?.Rollback();

                    }

                }
                catch(Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            #endregion Sql Transaction
            finally
            {
                con.Close();
            }
        }

        void UpdateQuantity(int _productId,int _quantity,SqlTransaction sqlTransaction,SqlConnection sqlConnection)
        {
            int dbQuantity;
           
            cmd = new SqlCommand("Product_Crud", sqlConnection, sqlTransaction);
            cmd.Parameters.AddWithValue("@Action", "GETBYID");

            cmd.Parameters.AddWithValue("@UrunID", _productId);
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                dr1 = cmd.ExecuteReader();
                while (dr1.Read())
                {
                    dbQuantity = (int)dr1["miktar"];

                    if (dbQuantity > _quantity && dbQuantity > 2)
                    {
                        dbQuantity = dbQuantity - _quantity;
                        cmd = new SqlCommand("Product_Crud", sqlConnection, sqlTransaction);
                        cmd.Parameters.AddWithValue("@Action", "QTYUPDATE");
                        cmd.Parameters.AddWithValue("@miktar", dbQuantity);
                        cmd.Parameters.AddWithValue("@UrunID", _productId);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.ExecuteNonQuery();

                    }
                }
                dr1.Close();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            
        }

        void DeleteCartItem(int _productId,  SqlTransaction sqlTransaction, SqlConnection sqlConnection)
        {
            cmd = new SqlCommand("Cart_Crud", sqlConnection, sqlTransaction);
            cmd.Parameters.AddWithValue("@Action", "DELETE");
            cmd.Parameters.AddWithValue("@UrunID", _productId);
            cmd.Parameters.AddWithValue("@KullanıcıId", Session["KullanıcıId"]); ;
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                cmd.ExecuteNonQuery();
            }
           
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}