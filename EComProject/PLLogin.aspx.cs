using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;
using DataAccessLayer;
using System.Net;
using System.IO;
using System.Web.Script.Serialization;

namespace EComProject
{
    public partial class PLLogin : System.Web.UI.Page
    {
        BLLLogin bl = new BLLLogin();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        /*public class reCaptchaResponse
        {
            public bool success { get; set; }
            public List<string> errorCodes { get; set; }
        }

        private bool ValidateCaptcha(string response)
        {
            string secretKey = "6LfUhfQpAAAAAIWTf5MN6_vTBktoJncifoAAQDkD"; // Replace with your Secret Key
            string apiUrl = $"https://www.google.com/recaptcha/api/siteverify?secret={secretKey}&response={response}";

            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(apiUrl);
            using (WebResponse webResponse = request.GetResponse())
            {
                using (StreamReader stream = new StreamReader(webResponse.GetResponseStream()))
                {
                    string jsonResponse = stream.ReadToEnd();
                    JavaScriptSerializer js = new JavaScriptSerializer();
                    reCaptchaResponse data = js.Deserialize<reCaptchaResponse>(jsonResponse);
                    return data.success;
                }
            }
        }*/


        protected void Button1_Click1(object sender, EventArgs e)
        {
            string uname = TextBox1.Text;
            string pass = TextBox2.Text;
            string role = DropDownList1.Text;
            DataTable dt = bl.loginuser(uname, role, pass);
            string d, sid, rid, cid;

            //string captchaResponse = Request.Form["g-recaptcha-response"];
            //bool isCaptchaValid = ValidateCaptcha(captchaResponse);

            //if (isCaptchaValid)
            //{
                if (dt.Rows.Count > 0)
                {
                    if (role == "Customer")
                    {
                        bl.loginuser(uname, role, pass);
                        d = bl.getid(TextBox1.Text, DropDownList1.Text, TextBox2.Text);
                        global.messageSender = d;
                        cid = bl.getCart(d);
                        global.cartidSender = cid;
                        if (cid == null)
                        {
                            bl.createCart(d);
                            cid = bl.getCart(d);
                            Response.Redirect("PLHome.aspx");
                            global.cartidSender = cid;
                        }
                        else
                        {
                            Response.Redirect("PLHome.aspx");
                        }
                    }
                    else if (role == "Seller")
                    {
                        bool unique = bl.storeCreation(uname);
                        if (unique)
                        {
                            bl.loginuser(uname, role, pass);
                            d = bl.getid(TextBox1.Text, DropDownList1.Text, TextBox2.Text);
                            global.messageSender = d;
                            Response.Redirect($"PLCStore.aspx");
                        }
                        else
                        {
                            bl.loginuser(uname, role, pass);
                            d = bl.getid(TextBox1.Text, DropDownList1.Text, TextBox2.Text);
                            global.messageSender = d;
                            sid = bl.storeid(d);
                            global.storeidSender = sid;
                            Response.Redirect($"PLAddProduct.aspx");
                        }
                    }
                    else if (role == "Delivery")
                    {
                        bool unique = bl.riderCreation(uname);
                        if (unique)
                        {
                            bl.loginuser(uname, role, pass);
                            d = bl.getid(TextBox1.Text, DropDownList1.Text, TextBox2.Text);
                            global.messageSender = d;
                            Response.Redirect("PLCRider.aspx");
                        }
                        else
                        {
                            bl.loginuser(uname, role, pass);
                            d = bl.getid(TextBox1.Text, DropDownList1.Text, TextBox2.Text);
                            global.messageSender = d;
                            rid = bl.riderid(d);
                            global.rideridSender = rid;
                            Response.Redirect("PLIO.aspx");
                        }
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid Username, Password or Role ')</script>");

                }
           // }
            //else
            //{
                
                //Response.Write("<script>alert('Captcha validation failed. Please try again.');</script>");
            //}
        }  
    }

    public static class global
    {
        public static string messageSender = "";
        public static string storeidSender = "";
        public static string stotalSender = "";
        public static string totalbillSender = "";
        public static string cartidSender = "";
        public static string productidSender = "";
        public static string rideridSender = "";
    }
}