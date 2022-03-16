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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");

            //fetches user data to compare
            SqlCommand cmd = new SqlCommand("SELECT * FROM Users WHERE UserName = @Username AND UserPassword = @Password ", con);
            cmd.Parameters.AddWithValue("@Username", TextBox1.Text);
            cmd.Parameters.AddWithValue("@Password", TextBox2.Text);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            //validates user input
            if (TextBox1.Text == "")
            {
                Label3.Text = "Enter a username!";
                Label3.ForeColor = System.Drawing.Color.Red;
            }

            else if(TextBox2.Text == "")
            {
                Label3.Text = "Enter a Password!";
                Label3.ForeColor = System.Drawing.Color.Red;
            }

            else if (TextBox3.Text == "")
            {
                Label3.Text = "Confirm Password!";
                Label3.ForeColor = System.Drawing.Color.Red;
            }

            else if (TextBox2.Text != TextBox3.Text)
            {
                Label3.Text = "Passwords do not match";
                Label3.ForeColor = System.Drawing.Color.Red;
            }

            else if (dt.Rows.Count == 1)
            {
                Label3.Text = "User already exsits";
                Label3.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                SqlConnection conUser = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");

                //inserts new user data into DB
                SqlCommand cmdUser = new SqlCommand("Insert into Users (UserName,UserPassword) VALUES (@Username, @Password)", conUser);
                cmdUser.Parameters.AddWithValue("@Username", TextBox1.Text);
                cmdUser.Parameters.AddWithValue("@Password", TextBox2.Text);


                cmdUser.CommandType = CommandType.Text;
                try

                {
                    conUser.Open();
                    cmdUser.ExecuteNonQuery();
                    conUser.Close();
                    Label3.Text = "User successfully created, go to login";
                    Label3.ForeColor = System.Drawing.Color.Green;

                }

                catch (Exception)

                {


                }
            }
            
        }
    }
}