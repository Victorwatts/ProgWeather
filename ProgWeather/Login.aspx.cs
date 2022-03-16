using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace ProgWeather
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            


            SqlCommand cmd = new SqlCommand("SELECT * FROM Users WHERE UserName = @Username AND UserPassword = @Password ", con);
            cmd.Parameters.AddWithValue("@Username", TextBox1.Text);
            cmd.Parameters.AddWithValue("@Password", TextBox2.Text);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();

            //Fetches the username and password from the DB

            if (dt.Rows.Count == 1)
            {
                
                SqlCommand cmdCanInsert = new SqlCommand("SELECT CanInsert FROM Users WHERE UserName = @Username AND UserPassword = @Password ", con);
                cmdCanInsert.Parameters.AddWithValue("@Username", TextBox1.Text);
                cmdCanInsert.Parameters.AddWithValue("@Password", TextBox2.Text);

                con.Open();
                Boolean Result = (Boolean)cmdCanInsert.ExecuteScalar();
                con.Close();

                Session["CanInsert"] = Result;
                //determines whether the user can edit data or not
               
                SqlCommand cmdUser = new SqlCommand("SELECT User_ID FROM Users WHERE UserName = @Username AND UserPassword = @Password ", con);
                cmdUser.Parameters.AddWithValue("@Username", TextBox1.Text);
                cmdUser.Parameters.AddWithValue("@Password", TextBox2.Text);

                SqlDataAdapter sdaUser = new SqlDataAdapter(cmdUser);
                DataTable dtUser = new DataTable();
                sdaUser.Fill(dtUser);
                con.Open();
                int UserID = (int)cmdUser.ExecuteScalar();
                con.Close();

                Session["User"] = UserID;

                Session["username"] = TextBox1.Text;
                Response.Redirect("~/UserHome.aspx");
               //saves the user name so that it indicates on the top of each page 
               //it also is used to give access and deny access to specific controls
            }
            else
            {
                Label3.Text = "Your username and Password are incorrect";
                Label3.ForeColor = System.Drawing.Color.Red;
                //error messege if details are wrong
            }

           
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Register.aspx");
        }
    }
}