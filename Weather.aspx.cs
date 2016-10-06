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
using System.Net;
using System.IO;
using System.Text;

public partial class Weather : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    [WebMethod]
    public static string getMessage(string strUrl) {

        string strMsg = string.Empty;

        try {

            WebRequest request = WebRequest.Create(strUrl);

            WebResponse response = request.GetResponse();

            StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.GetEncoding("utf-8"));
            
            strMsg = reader.ReadToEnd();
            
            reader.Close();

            reader.Dispose();

            response.Close();

        }

        catch

        { }
        
        return strMsg;

    }
}