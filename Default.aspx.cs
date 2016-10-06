using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Text.RegularExpressions;

public partial class _Default : System.Web.UI.Page
{
    protected static string wrongLoginInfo = "账号密码长度在6到30个字符之间，只能包含字母、数字、下划线";
    protected static string wrongEmail = "请输入正确的邮箱";
    protected static string unEqualPassword = "两次密码不一致";
    protected static string wrongPassword = "账号或密码错误";
    protected static int cnt = 0;

    protected static int MIN_LEN = 6;
    protected static int MAX_LEN = 30;
    protected static Regex matchEmail = new Regex(@"([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])", RegexOptions.IgnoreCase);
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    // 账号密码长度在6到30个字符之间，只能包含字母、数字、下划线
    protected static bool checkInfo(string str)
    {
        if (str.Length < MIN_LEN || str.Length > MAX_LEN) return false;
        for(int i = 0; i < str.Length; i++)
        {
            if(!(str[i] <='z' && str[i] >='a') && !(str[i] <= 'Z' && str[i] >= 'A') &&
                !(str[i] <= '9' && str[i] >= '0') && str[i] != '_') return false;
        }

        return true;
    }

    protected static bool checkEmail(string str)
    {
        if (str == "") return false;
        return matchEmail.IsMatch(str);
    }

    protected static int countUsername(string uname)
    {
        // 有空改成存储过程或参数化sql查询，防止sql注入
        string queryString = "select count(*) from dbo.info where username='" + uname + "'";
        string connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ToString();
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand command = new SqlCommand(queryString, connection);
            connection.Open();
            return (int)command.ExecuteScalar();
        }
    }

    [WebMethod]
    public static string doBtnLogOn_Click(string username, string password)
    {
        
        if (!checkInfo(username) || !checkInfo(password))
        {
            return  wrongLoginInfo;
        }


        string queryString = "select password from dbo.info where username='" + username + "'";
        string connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ToString();
        bool loginSuccess = false;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand command = new SqlCommand(queryString, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            try
            {
                while (reader.Read())
                {
                    if (reader[0].ToString() == password) loginSuccess = true;
                }
            }
            finally
            {
                // Always call Close when done reading.
                reader.Close();
            }
        }

        if(!loginSuccess)
        {
            return wrongPassword;
        }
        else
        {
            return "Login Sussess~";
        }

    

    }

    [WebMethod]
    public static string doBtnRegisterSend_Click(string r_username, string r_password, string r_email, string r_confirm)
    {
        
        if (r_password != r_confirm)
        {
            return unEqualPassword;
        }

        if(!checkInfo(r_username) || !checkInfo(r_password) || !checkInfo(r_confirm))
        {
            return wrongLoginInfo;
        }        

        if(!checkEmail(r_email))
        {
            return wrongEmail;
        }

        if(countUsername(r_username) != 0)
        {
            return "用户名已存在";
        }

        string queryString = "insert into dbo.info (username, password, email) values ('" + r_username + "','" + r_password + "','" + r_email + "')";
        string connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ToString();

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand command = new SqlCommand(queryString, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            reader.Close();
        }

        return "Register complete!";
    }
    



    [WebMethod]
    public static string doBtnForgotSend_Click(string rec_email)
    {
        return "not defined~";
    }
    
}

public class ajaxHandler : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string callbackfun = context.Request["callbackfun"];
        context.Response.Write(callbackfun + "({name:\"John\", message:\"hello John\"})");
        context.Response.End();
    }

    public bool IsReusable
    {
        get { return false; }
    }
}