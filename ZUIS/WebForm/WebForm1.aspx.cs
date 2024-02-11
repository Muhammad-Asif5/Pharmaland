using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ZUIS.WebForm
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        //private static string GetConStr
        //{
        //    get
        //    {
        //        string strConnection = System.Configuration.ConfigurationManager.ConnectionStrings["ZUIS.Properties.Settings.Setting"].ConnectionString;
        //        return strConnection;
        //    }
        //}
        //SqlConnection con = new SqlConnection(GetConStr);

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    report();
            //}
        }
//        public void report()
//        {
//            SqlCommand cmd = new SqlCommand("SELECT I.Stock_no,I.Brand_name, "
//+ " 	   Items_Available = SUM(isnull(SrDet.Items_Available,0)) "
//+ " FROM   Stock_ReceiptDET SrDet "
//+ "        RIGHT OUTER JOIN (SELECT Supp_Invno "
//+ "                         FROM   Stock_Receipt  "
//+ "                         WHERE  Received_date between '01-JUL-2019' and '31-JUL-2019') Sr "
//+ "                     ON Sr.Supp_Invno = SrDet.Supp_Invno "
//+ "        RIGHT OUTER JOIN (SELECT Stock_no, Brand_name "
//+ "                         FROM   Item_Stock where Manufacturer_Code='104') I "
//+ "                     ON I.Stock_no = SrDet.Stock_no  "
//+ " 				group by I.Stock_no,I.Brand_name",con);
//            SqlDataAdapter da = new SqlDataAdapter(cmd);
//            DataTable dt = new DataTable();
//            da.Fill(dt);
//            GridView1.DataSource = dt;
//            GridView1.DataBind();
//        }
    }
}