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
    public partial class Insert : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {//determines if user is logged in
            
            if (Session["username"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            else
            {
               lbl_Session.Text = Session["username"].ToString();
            }
                
            //determines the users access level
           
            if (Session["CanInsert"].ToString() == "True")
            {
                Label8.Text = "User: " + "\n" + Session["username"].ToString() + "\n" + " has access to insert new weather information";
                Label8.ForeColor = System.Drawing.Color.Green;
            }
            else if (Session["CanInsert"].ToString() == "False")
            {
                Label8.Text = "User:" + "\n" + Session["username"].ToString() + "\n" + " does not have access to insert new weather information";
                Label8.ForeColor = System.Drawing.Color.Red;
            }
           
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox5_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox6_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox7_TextChanged(object sender, EventArgs e)
        {

        }


        protected void InsertData_Click(object sender, EventArgs e)
        {
            //validates user input
            if (TextBox1.Text == "")
            {
                Label9.Text = "Enter city";
                Label9.ForeColor = System.Drawing.Color.Red;
            }
            else if (TextBox2.Text == "")
            {
                Label9.Text = "Enter Date";
                Label9.ForeColor = System.Drawing.Color.Red;
            }
            else if (TextBox3.Text == "")
            {
                Label9.Text = "Enter Min Temp";
                Label9.ForeColor = System.Drawing.Color.Red;
            }
            else if (TextBox4.Text == "")
            {
                Label9.Text = "Enter Max Temp";
                Label9.ForeColor = System.Drawing.Color.Red;
            }
            else if (TextBox5.Text == "")
            {
                Label9.Text = "Enter Precipitation";
                Label9.ForeColor = System.Drawing.Color.Red;
            }
            else if (TextBox6.Text == "")
            {
                Label9.Text = "Enter Humidity";
                Label9.ForeColor = System.Drawing.Color.Red;
            }
            else if (TextBox7.Text == "")
            {
                Label9.Text = "Enter WindSpeed";
                Label9.ForeColor = System.Drawing.Color.Red;
            }else
            if (Session["CanInsert"].ToString() == "True")
            {

                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");
                //inserts weather data into the DB

                SqlCommand cmd = new SqlCommand("Insert into WEATHER (City,InputDate,MinTemperature,MaxTemperature,Precipitation,Humidity,WindSpeed) VALUES (@CityName, @Date, @MinTemp, @MaxTemp, @Precipitation ,@Humidity ,@WindSpeed)", con);
                cmd.Parameters.AddWithValue("@CityName", TextBox1.Text);
                cmd.Parameters.AddWithValue("@Date", TextBox2.Text);
                cmd.Parameters.AddWithValue("@MinTemp", TextBox3.Text);
                cmd.Parameters.AddWithValue("@MaxTemp", TextBox4.Text);
                cmd.Parameters.AddWithValue("@Precipitation", TextBox5.Text);
                cmd.Parameters.AddWithValue("@Humidity", TextBox6.Text);
                cmd.Parameters.AddWithValue("@WindSpeed", TextBox7.Text);

                cmd.CommandType = CommandType.Text;
                try

                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Label9.Text = "Insert Complete";
                    Label9.ForeColor = System.Drawing.Color.Green;
                }

                catch (Exception)

                {


                }
            }
            else 
            {
                Label9.Text = "Failed to insert, access denied";
                Label9.ForeColor = System.Drawing.Color.Red;
            }

        }

        protected void RetrieveData_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Retrieve.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }
    }

       
    
}