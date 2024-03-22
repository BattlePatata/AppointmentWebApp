using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppointmentWebApp
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals(""))
                {
                    LoginButton.Visible = true; // Login LinkButton
                    SignUpButton.Visible = true; // Sign Up LinkButton

                    LogoutButton.Visible = false; // Logout LinkButton
                    UserPageButton.Visible = false; // Hello User LinkButton

                    AdminButton.Visible = true; // Admin login LinkButton
                    UserMngmt.Visible = false; // User Management LinkButton
                }
                else if (Session["role"].Equals("doctor"))
                {
                    LoginButton.Visible = false; // Login LinkButton
                    SignUpButton.Visible = false; // Sign Up LinkButton

                    LogoutButton.Visible = true; // Logout LinkButton
                    UserPageButton.Visible = true; // Hello User LinkButton
                    UserPageButton.Text = "Hello " + Session["fullname"].ToString();

                    AdminButton.Visible = true; // Admin login LinkButton
                    UserMngmt.Visible = false; // User Management LinkButton

                    
                }
                else if (Session["role"].Equals("admin"))
                {
                    LoginButton.Visible = false; // Login LinkButton
                    SignUpButton.Visible = false; // Sign Up LinkButton

                    LogoutButton.Visible = true; // Logout LinkButton
                    UserPageButton.Visible = true; // Hello User LinkButton
                    UserPageButton.Text = "Hello " + Session["username"].ToString() + " Admin";

                    AdminButton.Visible = false; // Admin login LinkButton
                    UserMngmt.Visible = true; // User Management LinkButton
                }
            }
            catch 
            {
                LoginButton.Visible = true; // Login LinkButton
                SignUpButton.Visible = true; // Sign Up LinkButton

                LogoutButton.Visible = false; // Logout LinkButton
                UserPageButton.Visible = false; // Hello User LinkButton

                AdminButton.Visible = true; // Admin login LinkButton
                UserMngmt.Visible = false; // User Management LinkButton
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("user_login.aspx");
        }

        protected void SignUpButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("sign_up.aspx");
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            Response.Redirect("homepage.aspx");
        }

        protected void UserPageButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("user_page.aspx");
        }

        protected void AdminButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin_login.aspx");
        }

        protected void UserMngmt_Click(object sender, EventArgs e)
        {
            Response.Redirect("user_management.aspx");
        }
    }
}