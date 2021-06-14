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

public partial class Default2 : System.Web.UI.Page
{
    private string ConnectionSql = ConfigurationManager.ConnectionStrings["Demo_DBConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetProductsData();
        }
    }

    //Get Products Details to Display
    protected void GetProductsData()
    {
        try
        {
            string id = Request.QueryString["id"];

            DataSet dt = new DataSet();

            SqlConnection objSqlConnection = new SqlConnection(ConnectionSql);
            objSqlConnection.Open();
            SqlCommand _sqlCommand = objSqlConnection.CreateCommand();
            _sqlCommand.Connection = objSqlConnection;
            _sqlCommand.CommandText = "STP_GetProductDetails";
            _sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
            _sqlCommand.Parameters.Add("@Id", SqlDbType.Int).Value = id;

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
    //protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    //{
    //    //NewEditIndex property used to determine the index of the row being edited.  
    //    GridView1.EditIndex = e.NewEditIndex;
    //    GetProductsData();
    //}
    //protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    //{
    //    string id = Request.QueryString["id"];
    //    //Finding the controls from Gridview for the row which is going to update  
    //   // Label id = GridView1.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
    //    TextBox name = GridView1.Rows[e.RowIndex].FindControl("txt_Name") as TextBox;
    //    TextBox desc = GridView1.Rows[e.RowIndex].FindControl("txt_City") as TextBox;
    //   SqlConnection con = new SqlConnection(ConnectionSql);
    //    con.Open();
    //    //updating the record  
    //    SqlCommand cmd = new SqlCommand("Update Products_Details set P_Model_Name='" + name.Text + "',P_Description='" + desc.Text + "' where ID=" + Convert.ToInt32(id), con);
    //    cmd.ExecuteNonQuery();
    //    con.Close();
    //    //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
    //    GridView1.EditIndex = -1;
    //    //Call ShowData method for displaying updated data  
    //    GetProductsData();
    //}  


    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }
    
}