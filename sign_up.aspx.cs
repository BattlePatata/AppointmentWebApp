using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace AppointmentWebApp
{
    public partial class sign_up : System.Web.UI.Page
    {
        string strconnect = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        // Sign up Button click event
        protected void SignUpButton_Click(object sender, EventArgs e)
        {
            if (checkDoctorExists())
            {
                Response.Write("<script>alert('Doctor Already Exist with this ID. Try another ID')</script>");
            }
            else
            {
                SignUpNewDoctor();
            }
        }

        // User Defined method

        bool checkDoctorExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strconnect);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM doctor_master_tbl where doctor_id='" + DoctorIdBox.Text.Trim() + "';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }

                return false;
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void SignUpNewDoctor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strconnect);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO doctor_master_tbl(fullname,category,place_of_work,office_hours,profile_photo_link,doctor_id,password,status) values(@fullname,@category,@place_of_work,@office_hours,@profile_photo_link,@doctor_id,@password,@status)", con);

                // Office Hours Logic
                if (OfficeHoursBox.Text.Trim().Length > 0 && OfficeHoursBox.Text.Trim().Length < 20) 
                {
                    string OfficeHours = OfficeHoursBox.Text.ToString().Replace('-', ',');
                    cmd.Parameters.AddWithValue("@office_hours", OfficeHours);
                }
                else
                {
                    Response.Write("<script>alert('Your Working hours Has to be like in example: 09:00-13:00.');</script>");
                }

                // Password creation logic
                if (PasswrdBox.Text.Trim().Length > 7 && PasswrdBox.Text.Trim().Length < 16)
                {
                    cmd.Parameters.AddWithValue("@password", PasswrdBox.Text.Trim());
                }
                else
                {
                    Response.Write("<script>alert('Your Password has to be no shorter than 8 symbols and no longer than 16 symbols.');</script>");
                }


                string filepath = "~/doctor_imgs/generaluser.png";
                string filename = Path.GetFileName(ProfilePicFileUpload.PostedFile.FileName);

                if (filename == "" || filename == null)
                {
                    Response.Write("<script>alert('You have to Upload your Profile photo.');</script>");
                }
                else
                {
                    ProfilePicFileUpload.SaveAs(Server.MapPath("doctor_imgs/" + filename));
                    filepath = "~/doctor_imgs/" + filename;
                    cmd.Parameters.AddWithValue("@profile_photo_link", filepath);
                }

                cmd.Parameters.AddWithValue("@fullname", FullNameBox.Text.Trim());
                cmd.Parameters.AddWithValue("@category", CategDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@place_of_work", FullAdrsBox.Text.Trim());
                cmd.Parameters.AddWithValue("@doctor_id", DoctorIdBox.Text.Trim());
                cmd.Parameters.AddWithValue("@status", "pending");
                
                cmd.ExecuteNonQuery();


                cmd = new SqlCommand("IF NOT EXISTS (SELECT * FROM sys.tables WHERE NAME LIKE '" + DoctorIdBox.Text.Trim() + "_office_hours_tbl') CREATE TABLE " + DoctorIdBox.Text.Trim() + "_office_hours_tbl (fullname varchar(100) null, phone_number varchar(50) not null, date varchar(100) null, constraint PK_phone_number primary key clustered(phone_number))", con);
                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("IF NOT EXISTS (SELECT * FROM sys.tables WHERE NAME LIKE '" + DoctorIdBox.Text.Trim() + "_question_answer_tbl') CREATE TABLE " + DoctorIdBox.Text.Trim() + "_question_answer_tbl (question varchar(max) not null, answer varchar(max) null)", con);
                cmd.ExecuteNonQuery();

                con.Close();
                Response.Write("<script>alert('Sign Up Successful. Go to User Login to Login');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}