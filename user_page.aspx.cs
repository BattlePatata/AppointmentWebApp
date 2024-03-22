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

        protected List<FAQItem> Faqs = new List<FAQItem>()
        {
            new FAQItem { Question = "Can I upgrade or downgrade my plan later?", Answer = "Yes, you can easily upgrade or downgrade your plan at any time..." },
            // ... add more FAQ items
        };

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

                        OfficeHoursSqlDataSource.SelectCommand = OfficeHoursStr;

                        BindFaqs();
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
        private void BindFaqs()
        {
            var faqListPlaceHolder = FindControl("faqListPlaceHolder") as PlaceHolder;

            foreach (var faq in Faqs)
            {
                var faqItem = new LiteralControl();

                faqItem.Text = $@"
                <div class=""space-y-2"">
                    <h3>{faq.Question}</h3>
                    <div data-state=""closed"" class=""border-t border-gray-200 pt-2 dark:border-gray-800"">
                        <button class=""inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 h-10 px-4 py-2 font-semibold text-blue-600 hover:underline"" type=""button"" aria-controls=""radix-:r{Faqs.IndexOf(faq)}"" aria-expanded=""false"" data-state=""closed"">
                            Toggle answer
                        </button>
                    </div>
                </div>
            ";

                faqListPlaceHolder.Controls.Add(faqItem);
            }
        }
    }
}