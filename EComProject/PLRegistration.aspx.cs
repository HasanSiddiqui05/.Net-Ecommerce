using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;
using System.Net.Mail;
using System.Net;
using static System.Net.WebRequestMethods;

namespace EComProject
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        BLRegistration bl = new BLRegistration();

        protected void Button1_Click(object sender, EventArgs e)
        {
            bool unique = bl.verifyEmaiil("users", "email", TextBox3.Text);
            if (unique)
            {
                if (TextBox5.Text == TextBox6.Text)
                {
                    string otp = bl.generateOtp();
                    Session["otp"] = otp;  // Store the OTP in session
                    string email = TextBox3.Text;
                    bl.otpSender(TextBox1.Text, otp, TextBox3.Text);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showModal", "showModal();", true);
                }
                else
                {
                    Response.Write("<script>alert('Password do not match')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('There is already a account on this email')</script>");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string otp2 = TextBox7.Text;
            string sessionOtp = Session["otp"] as string;  // Retrieve the OTP from session

            if (sessionOtp == otp2)
            {
                bl.registerUser(TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, DropDownList1.Text, TextBox5.Text);
                Response.Redirect("PLLogin.aspx");
                Response.Write("<script>alert('Account created')</script>");
            }
            else
            {
                Response.Write("<script>alert('Invalid OTP')</script>");
            }
        }
    }
}