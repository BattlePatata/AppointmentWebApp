﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppointmentWebApp
{
    public partial class user_management : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"].ToString() == "" || Session["username"] == null)
                {
                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                    Response.Redirect("admin_login.aspx");
                }
                else
                {

                }
            }
            catch
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("admin_login.aspx");
            }
        }

        protected void IdButton_Click(object sender, EventArgs e)
        {

        }

        protected void ActiveButton_Click(object sender, EventArgs e)
        {

        }

        protected void PengindButton_Click(object sender, EventArgs e)
        {

        }

        protected void DeactiveButton_Click(object sender, EventArgs e)
        {

        }

        protected void DeleteDoctorButton_Click(object sender, EventArgs e)
        {

        }
    }
}