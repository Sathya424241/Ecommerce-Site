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

public partial class Default5 : System.Web.UI.Page
{
    private string ConnectionSql = ConfigurationManager.ConnectionStrings["Demo_DBConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Label1.Visible = false;
            HyperLink1.Visible = false;
        }


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string Prod_name = P_Name.Text;
        string Prod_price = P_Price.Text;
        string Prod_desc = Request.Form["P_desc"];
        
        string Created_user = "";
        string P_Flag = "A";
        string P_soldto = "";
        string sold_date = "";

        // get posted file details
        HttpPostedFile postedFile = UploadImage.PostedFile;
        string image_Name = Path.GetFileName(postedFile.FileName);
        string ImgExtension = Path.GetExtension(image_Name);
        int ImgeSize = postedFile.ContentLength;

        //to check the image extension
        if (ImgExtension == ".jpg" || ImgExtension == ".png" || ImgExtension == ".gif" || ImgExtension == ".bmp")
        {
            Stream stream = postedFile.InputStream;
            BinaryReader binaryreader = new BinaryReader(stream);
            byte[] Imagebytes = binaryreader.ReadBytes((int)stream.Length);

            //uploading Product details to database
            try
            {
                SqlConnection objSqlConnection = new SqlConnection(ConnectionSql);
                objSqlConnection.Open();
                SqlCommand _sqlCommand = objSqlConnection.CreateCommand();
                _sqlCommand.Connection = objSqlConnection;
                _sqlCommand.CommandText = "STP_UPDATE_PRODUCT_DETAILS";
                _sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
                _sqlCommand.Parameters.Add("@Prod_name", SqlDbType.VarChar).Value = Prod_name;
                _sqlCommand.Parameters.Add("@Prod_price", SqlDbType.BigInt).Value = Convert.ToInt64(Prod_price);
                _sqlCommand.Parameters.Add("@Prod_desc", SqlDbType.VarChar).Value = Prod_desc;
                _sqlCommand.Parameters.Add("@image_Name", SqlDbType.VarChar).Value = image_Name;
                _sqlCommand.Parameters.Add("@image_url", SqlDbType.VarBinary).Value = Imagebytes;
                _sqlCommand.Parameters.Add("@image_size", SqlDbType.Int).Value = ImgeSize;
                _sqlCommand.Parameters.Add("@created_user", SqlDbType.VarChar).Value = Created_user;
                _sqlCommand.Parameters.Add("@created_date", SqlDbType.DateTime).Value = DateTime.Now.ToString();
                _sqlCommand.Parameters.Add("@P_flag", SqlDbType.VarChar).Value = P_Flag;
                _sqlCommand.Parameters.Add("@P_soldto", SqlDbType.VarChar).Value = P_soldto;
                _sqlCommand.Parameters.Add("@sold_date", SqlDbType.VarChar).Value = sold_date;
                //_sqlCommand.Parameters.Add("@new_prodID", SqlDbType.VarChar).Direction=ParameterDirection.Output();
                SqlParameter Param_new_prodID = new SqlParameter()
                {
                    ParameterName = "@new_prodID",
                    Value = -1,
                    Direction = ParameterDirection.Output
                };
                _sqlCommand.Parameters.Add(Param_new_prodID);
                _sqlCommand.ExecuteNonQuery();
                objSqlConnection.Close();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Product Uploaded Successfull')", true);

                Label1.Visible = true;
                HyperLink1.Visible = true;
                HyperLink1.NavigateUrl = "~/UploadedProduct_details.aspx?id=" + _sqlCommand.Parameters["@new_prodID"].Value.ToString();

                //"~/webform.aspx?id="+_sqlCommand.Parameters["@new_prodID].value.tostring();

            }
            catch (Exception ex)
            {
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('only images (.jpg, .png, .bmp, .gif) can be uploaded')", true);
        }
    }
}