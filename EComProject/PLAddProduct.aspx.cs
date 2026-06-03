using BusinessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace EComProject
{
    public partial class AddProductPL : System.Web.UI.Page
    {
        string id = global.messageSender;
        BLAddProduct ba = new BLAddProduct();

        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string path = Server.MapPath("Images/");
                
                string filename = Path.GetFileName(FileUpload1.FileName);
                string extension = Path.GetExtension(filename);
                HttpPostedFile postedFile = FileUpload1.PostedFile;
                int length = postedFile.ContentLength;

                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".png" || extension.ToLower() == ".jpeg")
                {
                    if (length <= 2000000)
                    {
                        FileUpload1.SaveAs(path + filename);
                        string namefile = "Images/" + filename;
                        string name = TextBox1.Text;
                        string cate = DropDownList1.Text;
                        string sid = global.storeidSender;
                        string desc = Request.Form["textbox2"];
                        int price = int.Parse(Request.Form["textbox3"]);
                        int quan = int.Parse (Request.Form["textbox4"]);
                        if (price > 0 && quan > 0)
                        {
                            ba.addproduct(name, cate, sid, desc, price.ToString(), quan.ToString(), namefile);
                            Label1.Text = "Product added successfully";
                            Label1.ForeColor = System.Drawing.Color.Green;
                            Label1.Visible = true;
                        }
                        else 
                        {
                            Label1.Text = "Invalid data input";
                            Label1.ForeColor = System.Drawing.Color.Red;
                            Label1.Visible = true;
                        }
                    }
                    else
                    {
                        Label1.Text = "Image size should not exceed 2mb";
                        Label1.ForeColor = System.Drawing.Color.Red;
                        Label1.Visible = true;
                    }
                }
                else
                {
                    Label1.Text = "Image format not supported";
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Visible = true;
                }
            }
            else
            {
                Label1.Text = "Please Upload an images";
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Visible = true;
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}