using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class placeorder : System.Web.UI.Page
{
    private string ConnectionSql = ConfigurationManager.ConnectionStrings["Demo_DBConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

        Label1.Visible = false;
        HyperLink1.Visible = false;
        HyperLink2.Visible = false;

        try
        {
            string name = Request.QueryString["name"];

            DataSet dt = new DataSet();
            SqlConnection objSqlConnection = new SqlConnection(ConnectionSql);
            objSqlConnection.Open();
            SqlCommand _sqlCommand = objSqlConnection.CreateCommand();
            _sqlCommand.Connection = objSqlConnection;
            _sqlCommand.CommandText = "GetOrderDetails";
            _sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
            _sqlCommand.Parameters.Add("@P_Model_Name", SqlDbType.VarChar).Value = name;

            SqlDataAdapter sqldataadapter = new SqlDataAdapter(_sqlCommand);
            sqldataadapter.Fill(dt);
            //SqlDataReader sqldatareader = _sqlCommand.ExecuteReader();
            GridView1.DataSource = dt;
            GridView1.DataBind();
            objSqlConnection.Close();
        }
        catch (Exception ex)
        {

        }

    }
    public void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView dr = (DataRowView)e.Row.DataItem;

            string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["P_ImgData"]);
            (e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your Order was Placed Wait for a call,  Thanks For Purchasing..!')", true);

        Label1.Visible = true;
        HyperLink1.Visible = true;
        HyperLink2.Visible = true;
        GridView1.Visible = false;
        Label2.Visible = false;
        Button1.Visible = false;

    }
}