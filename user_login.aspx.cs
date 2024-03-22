using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace AppointmentWebApp
{
    public partial class user_login : System.Web.UI.Page
    {
        string strconnect = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strconnect);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string login = UserIdBox.Text.Trim().Replace("'", "");
                string password = PasswrdBox.Text.Trim().Replace("'", "");

                SqlCommand cmd = new SqlCommand("SELECT * FROM doctor_master_tbl where doctor_id='" + login + "' AND password='" + password + "'", con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('Login Successful');</script>");
                        Session["username"] = dr.GetValue(5).ToString();
                        Session["fullname"] = dr.GetValue(0).ToString();
                        Session["role"] = "doctor";
                        Session["status"] = dr.GetValue(7).ToString();
                        Session["profPic"] = dr.GetValue(4).ToString();

                        string QandA = Session["username"] + "_question_answer_tbl";
                    }

                    Response.Redirect("user_page.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Credentials!');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        // User Defined Function
    }
}