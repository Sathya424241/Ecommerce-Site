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

public partial class Buy : System.Web.UI.Page
{
    private string ConnectionSql = ConfigurationManager.ConnectionStrings["Demo_DBConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            DataSet dt = new DataSet();
            SqlConnection objSqlConnection = new SqlConnection(ConnectionSql);
            objSqlConnection.Open();
            SqlCommand _sqlCommand = objSqlConnection.CreateCommand();
            _sqlCommand.Connection = objSqlConnection;
            //_sqlCommand.CommandText = "STP_GetAllProductDetails";
            //_sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
            //_sqlCommand.Parameters.Add("@Id", SqlDbType.Int).Value = id;

            using (SqlDataAdapter sda = new SqlDataAdapter("select P_Model_Name, P_Description, P_Price, P_ImgData from Products_Details", objSqlConnection))
            {
                sda.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();

            }
            objSqlConnection.Close();
        }
        catch (Exception ex)
        {

        }


    }

    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView dr = (DataRowView)e.Row.DataItem;

            string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["P_ImgData"]);
            (e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;
        }
    }


    protected void chk_checkedchange(object sender, EventArgs e)
    {
        int rowid = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
        string str1 = GridView1.Rows[rowid].Cells[1].Text;

        Response.Redirect("placeorder.aspx?name=" + str1);
    }

}