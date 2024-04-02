using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Security.Policy;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;
using System.Web.Script.Serialization;
using System.Web.Services.Discovery;
using static AppointmentWebApp.homepage;
using System.Web.Services;

namespace AppointmentWebApp
{

    public partial class homepage : System.Web.UI.Page
    {
        readonly string strconnect = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        public readonly List<string> Categories = new List<string>()
        {
            {"Akuşer-ginekolog" },
            {"Pediatr" },
            {"Terapewt" },
            {"Diş lukmany" },
            {"Gulak Burun Bokurdak lukmany" },
            
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                InitialUpload();

                try
                {
                    SqlConnection con = new SqlConnection(strconnect);

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                        string QandA = "homepage_question_answer_tbl";
                        SqlCommand cmd = new SqlCommand("SELECT * FROM " + QandA, con);
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        SqlDataReader dr = cmd.ExecuteReader();

                    if (dt.Rows.Count > 0)
                    {
                        FaqRepeater.DataSource = dr;
                        FaqRepeater.DataBind();
                    }
                    else
                    {

                        imgview.Attributes["src"] = "~/doctor_imgs/generaluser.png";
                        FullNameBox.Text = "";
                        CategBox.Text = "";
                        OfficeHoursBox.Text = "";
                        FullAdrsBox.Text = "";

                        cmd = new SqlCommand("SELECT * FROM " + QandA, con);
                        da = new SqlDataAdapter(cmd);
                        dt = new DataTable();

                        FaqRepeater.DataSource = dr;
                        FaqRepeater.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }

        // User Defined Functions

        private void InitialUpload()
        {
            foreach (var category in Categories)
            {
                CategDropDownList.Items.Add(new ListItem(category, category));
            }
        }


        protected void CategDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                imgview.Attributes["src"] = "~/doctor_imgs/generaluser.png";
                FullNameBox.Text = "";
                CategBox.Text = "";
                OfficeHoursBox.Text = "";
                FullAdrsBox.Text = "";

                SqlConnection con = new SqlConnection(strconnect);
                Dictionary<string, string> Doctors = new Dictionary<string, string>();

                string DocCateg = CategDropDownList.SelectedValue;

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM doctor_master_tbl WHERE category='" + DocCateg + "'", con);
                cmd.Parameters.AddWithValue("@category", DocCateg);
                
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                foreach (DataRow dr in dt.Rows) 
                {
                    Doctors.Add(dr["fullname"].ToString(), dr["doctor_id"].ToString());
                }

                if (dt.Rows.Count == 0)
                {
                    imgview.Attributes["src"] = "~/doctor_imgs/generaluser.png";
                    FullNameBox.Text = "";
                    CategBox.Text = "";
                    OfficeHoursBox.Text = "";
                    FullAdrsBox.Text = "";

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string QandA = "homepage_question_answer_tbl";
                    cmd = new SqlCommand("SELECT * FROM " + QandA, con);
                    da = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    SqlDataReader dr = cmd.ExecuteReader();

                    FaqRepeater.DataSource = dr;
                    FaqRepeater.DataBind();
                }


                DocDropDownList.Items.Clear();
                DocDropDownList.Items.Add("Lukmany saýlaň");
                foreach (var doctor in Doctors)
                {
                    DocDropDownList.Items.Add(new ListItem(doctor.Key, doctor.Value));
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void DocDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string SelectedDoc = DocDropDownList.SelectedValue;

                SqlConnection con = new SqlConnection(strconnect);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                imgview.Attributes["src"] = "~/doctor_imgs/generaluser.png";
                FullNameBox.Text = "";
                CategBox.Text = "";
                OfficeHoursBox.Text = "";
                FullAdrsBox.Text = "";

                SqlCommand cmd = new SqlCommand("SELECT * FROM doctor_master_tbl WHERE doctor_id='" + SelectedDoc + "'", con);

                cmd.Parameters.AddWithValue("@doctor_id", SelectedDoc);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    imgview.Attributes["src"] = dt.Rows[0]["profile_photo_link"].ToString().Trim();
                    FullNameBox.Text = dt.Rows[0]["fullname"].ToString().Trim();
                    CategBox.Text = dt.Rows[0]["category"].ToString().Trim();
                    OfficeHoursBox.Text = dt.Rows[0]["office_hours"].ToString().Trim().Replace(",", "-");
                    FullAdrsBox.Text = dt.Rows[0]["place_of_work"].ToString().Trim();

                    string QandA = dt.Rows[0]["doctor_id"].ToString().Trim() + "_question_answer_tbl";

                    cmd = new SqlCommand("SELECT * FROM " +  QandA, con);
                    SqlDataReader dr = cmd.ExecuteReader();

                    FaqRepeater.DataSource = dr;
                    FaqRepeater.DataBind();


                }
                else
                {
                    imgview.Attributes["src"] = "~/doctor_imgs/generaluser.png";
                    FullNameBox.Text = "";
                    CategBox.Text = "";
                    OfficeHoursBox.Text = "";
                    FullAdrsBox.Text = "";

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string QandA = "homepage_question_answer_tbl";
                    cmd = new SqlCommand("SELECT * FROM " + QandA, con);
                    da = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    SqlDataReader dr = cmd.ExecuteReader();

                    FaqRepeater.DataSource = dr;
                    FaqRepeater.DataBind();
                }
                

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}