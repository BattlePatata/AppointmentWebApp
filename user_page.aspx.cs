using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppointmentWebApp
{
    public partial class user_page : System.Web.UI.Page
    {
        string strconnect = ConfigurationManager.ConnectionStrings["con"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"].ToString() == "" || Session["username"] == null)
                {
                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                    Response.Redirect("user_login.aspx");
                }
                else
                {
                    if (!IsPostBack)
                    {
                        string ProfPic = Session["ProfPic"].ToString();
                        imgview.Attributes["src"] = ProfPic;
                        AppointmentGridView.DataBind();

                        string OfficeHoursStr = "SELECT * FROM [" + Session["username"].ToString().Trim() + "_office_hours_tbl]";
                        string FAQStr = "SELECT * FROM [" + Session["username"].ToString().Trim() + "_question_answer_tbl]";

                        OfficeHoursSqlDataSource.SelectCommand = OfficeHoursStr;
                        FAQSqlDataSource.SelectCommand = FAQStr;
                    }
                }
            }
            catch
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("user_login.aspx");
            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {

        }

        // User Defined Functions 
        
        protected void QuestionButton_Click(object sender, EventArgs e)
        {

        }

        protected void AddButton_Click(object sender, EventArgs e)
        {

        }



        protected void DeleteButton_Click(object sender, EventArgs e)
        {

        }

        protected void Update_Button_Click(object sender, EventArgs e)
        {

        }
    }
}