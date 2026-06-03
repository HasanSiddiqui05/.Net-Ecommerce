using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using DataAccessLayer;
using System.Net;
using System.Net.Mail;


namespace BusinessLogicLayer
{
    public class BLRegistration
    {
        DARegistration obj = new DARegistration();

        public void registerUser(string name, string phoneno, string email, string address, string role, string password)
        {
            obj.insertData(name, phoneno, email, address, role, password);
        }

        public bool verifyEmaiil(string tablename, string columnname, string email) 
        {
            return obj.IsDataUnique(tablename, columnname, email);
        }

        public void otpSender(string name, string otp, string email)
        {
            string fromMail = "quickcartotp@gmail.com";
            string fromPassword = "obbbfemaktrwcrdg";
            MailMessage msg = new MailMessage();
            msg.Subject = "Account Verification";
            msg.From = new MailAddress(fromMail); // Add the sender's email address
            msg.To.Add(new MailAddress(email));
            msg.Body = $"<html><body> <b>{name}</b> your otp code is : <b>{otp}</b> </body></html>";
            msg.IsBodyHtml = true;

            using (var smtpClient = new SmtpClient("smtp.gmail.com", 587))
            {
                smtpClient.Credentials = new NetworkCredential(fromMail, fromPassword);
                smtpClient.EnableSsl = true;
                smtpClient.Send(msg);
            }
        }

        public string generateOtp()
        {
            Random random = new Random();
            int otp = random.Next(100000, 999999); // Generates a number between 100000 and 999999
            return otp.ToString();
        }
    }
}
