using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Default3 : System.Web.UI.Page
{
    private string ConnectionSql = ConfigurationManager.ConnectionStrings["Demo_DBConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CascadingDropdownlist();
        }
    }
    protected void CascadingDropdownlist()
    {
        SqlConnection con = new SqlConnection(ConnectionSql);
        con.Open();
        string query = "Select * from Countries";
        SqlCommand cmd = new SqlCommand(query,con);
        cmd.CommandType = CommandType.Text;
        CountryList.DataSource = cmd.ExecuteReader();
        CountryList.DataTextField = "Country_Name";
        CountryList.DataValueField = "Country_id";
        CountryList.DataBind();
        CountryList.Items.Insert(0,new ListItem("---Select Country---","0"));

    }
    protected void CountryList_SelectedIndexChanged(object sender, EventArgs e)
    {
        int country_id = Convert.ToInt32(CountryList.SelectedValue);
        SqlConnection con = new SqlConnection(ConnectionSql);
        con.Open();
        string query="select * from States where country_id="+country_id+"";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.CommandType = CommandType.Text;
        StateList.DataSource = cmd.ExecuteReader();
        StateList.DataTextField = "state_Name";
        StateList.DataValueField = "State_id";
        StateList.DataBind();
        StateList.Items.Insert(0,new ListItem("---Select State---","0"));
    }

    protected void StateList_SelectedIndexChanged(object sender, EventArgs e)
    {
        int state_id = Convert.ToInt32(StateList.SelectedValue);
        SqlConnection con = new SqlConnection(ConnectionSql);
        con.Open();
        string query = "select * from City where state_id=" + state_id + "";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.CommandType = CommandType.Text;
        CityList.DataSource = cmd.ExecuteReader();
        CityList.DataTextField = "City_Name";
        CityList.DataValueField = "City_id";
        CityList.DataBind();
        CityList.Items.Insert(0, new ListItem("---Select City---", "0"));
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        //getting text box values
        string User_name = Username.Text;
        string User_MaildId = UserMaild_id.Text;
        string password = Passowrd.Text;
        string gender = Gender.Text;
        string country = CountryList.SelectedItem.Text;
        string state = StateList.SelectedItem.Text;
        string city = CityList.SelectedItem.Text;
        string phone = PhoneNo.Text;
        //string UserAction = "sell";
        string bool_value = "";

        bool b1 = string.IsNullOrEmpty(User_name);
        bool b2 = string.IsNullOrEmpty(User_MaildId);
        bool b3 = string.IsNullOrEmpty(password);
        bool b4 = string.IsNullOrEmpty(gender);
        bool b5 = string.IsNullOrEmpty(country);
        bool b6 = string.IsNullOrEmpty(state);
        bool b7 = string.IsNullOrEmpty(city);
        bool b8 = string.IsNullOrEmpty(phone);

        if (b1 != true || b2 != true || b3 != true || b4 != true || b5 != true || b6 != true || b7 != true || b8 != true)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Must Fill All Fields')", true);
        }
        else
        {
            try
            {

                //string connectionSql = "Data Source=DELL-PC//SQL2008EXP;Initial Catalog=Demo_DB;Integrated Security=True";

                SqlConnection objSqlConnection = new SqlConnection(ConnectionSql);
                objSqlConnection.Open();
                SqlCommand _sqlCommand = objSqlConnection.CreateCommand();
                _sqlCommand.Connection = objSqlConnection;
                _sqlCommand.CommandText = "STP_UPDATE_USERDETAILS";
                _sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
                _sqlCommand.Parameters.Add("@U_name", SqlDbType.VarChar).Value = User_name;
                _sqlCommand.Parameters.Add("@U_eid", SqlDbType.VarChar).Value = User_MaildId;
                _sqlCommand.Parameters.Add("@password_1", SqlDbType.VarChar).Value = password;
                _sqlCommand.Parameters.Add("@gender", SqlDbType.VarChar).Value = gender;
                _sqlCommand.Parameters.Add("@country", SqlDbType.VarChar).Value = country;
                _sqlCommand.Parameters.Add("@state", SqlDbType.VarChar).Value = state;
                _sqlCommand.Parameters.Add("@city", SqlDbType.VarChar).Value = city;
                _sqlCommand.Parameters.Add("@phone", SqlDbType.VarChar).Value = phone;
                // _sqlCommand.Parameters.Add("@UserAction", SqlDbType.VarChar).Value = UserAction;
                _sqlCommand.ExecuteNonQuery();
                objSqlConnection.Close();

                bool_value = "true";
                if (bool_value == "true")
                {

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Registration Successfull')", true);
                    Response.Redirect("login.aspx.aspx");
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Registration UnSuccessfull')", true);
                }



            }
            catch (Exception ex)
            {

            }
        }

        
    }

    
}