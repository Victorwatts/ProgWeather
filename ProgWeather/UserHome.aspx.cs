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
    public partial class UserHome : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            else
            {

                lbl_Session.Text = Session["username"].ToString();
                Label4.Text = Session["username"].ToString();

            }

            BindGridview1();

            BindGridview3();

        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }
      
       
       

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void InsertData()
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");
            
            //inserts the users fav cities into the DB along with the user id
            SqlCommand cmd = new SqlCommand("Insert into UserFav (User_ID,City) VALUES (@UserID,@CityName)", con);
            cmd.Parameters.AddWithValue("@UserID", Session["User"].ToString());
            cmd.Parameters.AddWithValue("@CityName", TextBox1.Text);
           
            cmd.CommandType = CommandType.Text;
            try

            {
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                lblmsg.Text = "Insert Complete";
                lblmsg.ForeColor = System.Drawing.Color.Green;
            }

            catch (Exception)

            {
                lblmsg.Text = "Failed to insert";
                lblmsg.ForeColor = System.Drawing.Color.Red;

            }

            SqlCommand cmd2 = new SqlCommand("Insert into UserFav (User_ID,City) VALUES (@UserID,@CityName)", con);
            cmd2.Parameters.AddWithValue("@UserID", Session["User"].ToString());
            cmd2.Parameters.AddWithValue("@CityName", TextBox2.Text);

            cmd2.CommandType = CommandType.Text;
            try

            {
                con.Open();
                cmd2.ExecuteNonQuery();
                con.Close();
                lblmsg.Text = "Insert Complete";
                lblmsg.ForeColor = System.Drawing.Color.Green;
            }

            catch (Exception)

            {
                lblmsg.Text = "Failed to insert";
                lblmsg.ForeColor = System.Drawing.Color.Red;

            }
        }

      


        protected void Button1_Click(object sender, EventArgs e)
        {
            InsertData();
        }

        protected void BindGridview1()
        {

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("SELECT City FROM UserFav Where User_ID = @UserID", con);
            cmd.Parameters.AddWithValue("@UserID", Session["User"].ToString());
            con.Open();
            string Result = (string)cmd.ExecuteScalar();
            con.Close();
            Session["Uid"] = Result;
         //fetches the city name that = the userid  
        }

        protected void BindGridview3()
        {
            //gets the users fav cities
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from WEATHER where City = @CityName  ", con);
            cmd.Parameters.AddWithValue("@CityName", Session["Uid"].ToString());
            //cmd.Parameters.AddWithValue("@CityName2", Session["Uid2"].ToString());


            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            GridView1.DataSource = ds;
            GridView1.DataBind();
            //binds the data to the gridview


        }

        protected void Button3_Click(object sender, EventArgs e)
        {

            BindGridview1();

            BindGridview3();
          //calls the methods


        }
    }
}