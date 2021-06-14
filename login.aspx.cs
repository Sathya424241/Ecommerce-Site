using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Default2 : System.Web.UI.Page
{
    private string ConnectionSql = ConfigurationManager.ConnectionStrings["Demo_DBConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
       protected void Button1_Click(object sender, EventArgs e)
    {
        //getting users details
        string user_mailID = u_eid.Text;
        string password = password_1.Text;


        bool b1 = string.IsNullOrEmpty(user_mailID);
        bool b2 = string.IsNullOrEmpty(password);

        if ( b1 !=true || b2 != true)
        {
              //Validate user
            try
            {

                DataSet dt = new DataSet();
                SqlConnection con = new SqlConnection(ConnectionSql);
                con.Open();
                SqlCommand cmd = con.CreateCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "VALIDATE_USER";
                cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = password;
                cmd.Parameters.Add("@user_mail_id", SqlDbType.VarChar).Value = user_mailID;
                //SqlParameter Param_new_UserID = new SqlParameter()
                //{
                //    ParameterName = "@new_UserID",
                //    Value = -1,
                //    Direction = ParameterDirection.Output
                //};
                //cmd.Parameters.Add(Param_new_UserID);

                SqlDataAdapter _sqlDataAdapter = new SqlDataAdapter(cmd);
                _sqlDataAdapter.Fill(dt);
                var count = dt.Tables[0].Rows[0][0].ToString();

                if (count.Contains("0"))
                {
                    ErroMsg.Visible = true;
                }
                else
                {
                    Response.Redirect("BuyORselling.aspx?User=" + user_mailID + "");
                }
            }

            catch (Exception ex)
            {

            }
            
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Type Your MailID & Password')", true);
        }


       

        

        }
    }
    