using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

namespace ProgWeather
{
    public partial class EditWeather : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");

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
            //determines user accces level
            if (Session["CanInsert"].ToString() == "True")
            {
                Label1.Text = "User: " + "\n" + Session["username"].ToString() + "\n" + " has access to insert new weather information";
                Label1.ForeColor = System.Drawing.Color.Green;
            }
            else if (Session["CanInsert"].ToString() == "False")
            {
                Label1.Text = "User:" + "\n" + Session["username"].ToString() + "\n" + " does not have access to insert new weather information";
                Label1.ForeColor = System.Drawing.Color.Red;
            }

            if (!IsPostBack)
            {
                BindGridview();
            }
        }
        protected void BindGridview()
        {//gets all weather data
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from WEATHER order by City", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                gvDetails.DataSource = ds;
                gvDetails.DataBind();
            }
            else
            {
                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                gvDetails.DataSource = ds;
                gvDetails.DataBind();
                int columncount = gvDetails.Rows[0].Cells.Count;
                gvDetails.Rows[0].Cells.Clear();
                gvDetails.Rows[0].Cells.Add(new TableCell());
                gvDetails.Rows[0].Cells[0].ColumnSpan = columncount;
                gvDetails.Rows[0].Cells[0].Text = "No Records Found";
            }
        }
        protected void gvDetails_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDetails.EditIndex = e.NewEditIndex;
            BindGridview();
        }
        protected void gvDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (Session["CanInsert"].ToString() == "True")
            {
                //allows user to edit data and enter new data, omly if they have the access
                int ID = Convert.ToInt32(gvDetails.DataKeys[e.RowIndex].Value.ToString());
                TextBox txtcity = (TextBox)gvDetails.Rows[e.RowIndex].FindControl("txtcity");
                TextBox txtInputDate = (TextBox)gvDetails.Rows[e.RowIndex].FindControl("txtInputDate");
                TextBox txtMinTemperature = (TextBox)gvDetails.Rows[e.RowIndex].FindControl("txtMinTemperature");
                TextBox txtMaxTemperature = (TextBox)gvDetails.Rows[e.RowIndex].FindControl("txtMaxTemperature");
                TextBox txtPrecipitation = (TextBox)gvDetails.Rows[e.RowIndex].FindControl("txtPrecipitation");
                TextBox txtHumidity = (TextBox)gvDetails.Rows[e.RowIndex].FindControl("txtHumidity");
                TextBox txtWindSpeed = (TextBox)gvDetails.Rows[e.RowIndex].FindControl("txtWindSpeed");
                con.Open();
                SqlCommand cmd = new SqlCommand("update WEATHER set City='" + txtcity.Text + "',InputDate='" + txtInputDate.Text + "', MinTemperature='" + txtMinTemperature.Text + "', MaxTemperature='" + txtMaxTemperature.Text + "', Precipitation='" + txtPrecipitation.Text + "', Humidity='" + txtHumidity.Text + "',  WindSpeed='" + txtWindSpeed.Text + "'where ID=" + ID, con);
                cmd.ExecuteNonQuery();
                con.Close();
                lblresult.ForeColor = Color.Green;
                lblresult.Text = ID + " Details Updated successfully";
                gvDetails.EditIndex = -1;
                BindGridview();
            }
            else
            {
                lblresult.Text = "Failed to insert, access denied";
                lblresult.ForeColor = System.Drawing.Color.Red;
            }
        }
        protected void gvDetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvDetails.EditIndex = -1;
            BindGridview();
            //cancels the edit
        }
        protected void gvDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {//allows user to delete data
            if (Session["CanInsert"].ToString() == "True")
            {
                int ID = Convert.ToInt32(gvDetails.DataKeys[e.RowIndex].Values["ID"].ToString());
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from WEATHER where ID=" + ID, con);
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result == 1)
                {
                    BindGridview();
                    lblresult.ForeColor = Color.Red;
                    lblresult.Text = ID + " details deleted successfully";
                }
            }
            else
            {
                lblresult.Text = "Failed to insert, access denied";
                lblresult.ForeColor = System.Drawing.Color.Red;
            }
        }
        protected void gvDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {//validates users access, if true they can insert data
            if (Session["CanInsert"].ToString() == "True")
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    TextBox txtcity = (TextBox)gvDetails.FooterRow.FindControl("txtftrcity");
                    TextBox txtInputDate = (TextBox)gvDetails.FooterRow.FindControl("txtftrInputDate");
                    TextBox txtMinTemperature = (TextBox)gvDetails.FooterRow.FindControl("txtftrMinTemperature");
                    TextBox txtMaxTemperature = (TextBox)gvDetails.FooterRow.FindControl("txtftrMaxTemperature");
                    TextBox txtPrecipitation = (TextBox)gvDetails.FooterRow.FindControl("txtftrPrecipitation");
                    TextBox txtHumidity = (TextBox)gvDetails.FooterRow.FindControl("txtftrHumidity");
                    TextBox txtWindSpeed = (TextBox)gvDetails.FooterRow.FindControl("txtftrWindSpeed");
                    //inserts into DB
                    con.Open();
                    SqlCommand cmd =
                    new SqlCommand(
                    "insert into WEATHER(City,InputDate,MinTemperature,MaxTemperature,Precipitation,Humidity,WindSpeed) values('" + txtcity.Text + "','" +
                    txtInputDate.Text + "','" + txtMinTemperature.Text + "','" + txtMaxTemperature.Text + "','" + txtPrecipitation.Text + "','" + txtHumidity.Text + "','" + txtWindSpeed.Text + "')", con);
                    int result = cmd.ExecuteNonQuery();
                    con.Close();
                    if (result == 1)
                    {
                        BindGridview();
                        lblresult.ForeColor = Color.Green;
                        lblresult.Text = txtcity.Text + " Details inserted successfully";
                        //success
                    }
                    else
                    {
                        lblresult.ForeColor = Color.Red;
                        lblresult.Text = txtcity.Text + " Details not inserted";
                        //fail
                    }
                }
            }
            else
            {
                lblresult.Text = "Failed to insert, access denied";
                lblresult.ForeColor = System.Drawing.Color.Red;
                //no access
            }
        }

                // protected void Button1_Click(object sender, EventArgs e)
                // {
                //     BindGridview();
                // }

                protected void Button2_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }
    }
}