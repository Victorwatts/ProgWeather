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
    public partial class Retrieve : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            else
            lbl_Session.Text = Session["username"].ToString();
            Label4.Text = Session["username"].ToString();
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

        protected void BindGridview()
        {
            //Gets weather details based on city, start and end date
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True") ;
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from WEATHER where City = @CityName and InputDate between @Startdate and @Enddate  ", con);
            cmd.Parameters.AddWithValue("@CityName", TextBox1.Text);
            cmd.Parameters.AddWithValue("@Startdate", TextBox2.Text);
            cmd.Parameters.AddWithValue("@Enddate", TextBox3.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            BindGridview();
            //binds the data to the grid view
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //binds the gridview with all the weather details
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from WEATHER", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }
}
