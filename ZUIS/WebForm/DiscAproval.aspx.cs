using CrystalDecisions.CrystalReports.Engine;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZUIS.Dataset;
using ZUIS.Models;

namespace ZUIS.WebForm
{
    public partial class DiscAproval : System.Web.UI.Page
    {
        Entities db = new Entities();
        ds_DiscAproval ds;
        DataTable dt = new DataTable();

        private static string GetConStr
        {
            get
            {
                string strConnection = System.Configuration.ConfigurationManager.ConnectionStrings["ZUIS.Properties.Settings.Setting"].ConnectionString;
                return strConnection;
            }
        }
        SqlConnection con = new SqlConnection(GetConStr);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string VC = Request.QueryString["vc"];
                string CC = Request.QueryString["cc"];
                string Sno = Request.QueryString["sno"];
                //string SectionID = Request.QueryString["SectionID"];

                ChangeFunction(VC,CC,Sno);
            }
            else
            {
                ReportDocument doc = (ReportDocument)Session["Disc_Report"];
                Discount_Aproval.ReportSource = doc;
            }
        }
        public void ChangeFunction(string vc, string cc, string sno)
        {
            ds = new ds_DiscAproval();
            SqlCommand cmd = new SqlCommand("SELECT Discount_Approval.Valid_Date_from, Discount_Approval.Valid_Date_to, Discount_Approval.Status, Customer.Cust_Name, Discount_ApprovalDET.Stock_no, Item_Stock.Brand_name, Item_Stock.Units_PerItem, "
+ " Item_Stock.Trade_PriceItem, Discount_ApprovalDET.Q_Percentage, Discount_ApprovalDET.Q_Rate, Discount_ApprovalDET.D_Percentage, Discount_ApprovalDET.D_Rate, Discount_ApprovalDET.Cum_Dis,  "
+ " Discount_ApprovalDET.Expected_BsUnits, Discount_Approval.SNO, Discount_Approval.Customer_code, Discount_Approval.vendor_code, Vendor.Name "
+ " FROM     Discount_Approval INNER JOIN "
+ " Discount_ApprovalDET ON Discount_Approval.vendor_code = Discount_ApprovalDET.vendor_code AND Discount_Approval.Customer_code = Discount_ApprovalDET.Customer_code AND  "
+ " Discount_Approval.SNO = Discount_ApprovalDET.SNO INNER JOIN "
+ " Item_Stock ON Discount_ApprovalDET.Stock_no = Item_Stock.Stock_no INNER JOIN "
+ " Customer ON Discount_Approval.Customer_code = Customer.Customer_code INNER JOIN "
+ " Vendor ON Discount_Approval.vendor_code = Vendor.vendor_code "
+ " WHERE  (Discount_Approval.Customer_code = '"+cc+"') AND (Discount_Approval.vendor_code = '"+vc+"') AND (Discount_Approval.SNO = '"+sno+"')", con); 

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds, "DataTable1");

            ReportDocument rpDoc = new ReportDocument();
            //rpDoc.Load(Server.MapPath("~/Reports/CLO_Report.rpt"));
            rpDoc.Load(Server.MapPath("~/Reports/rptDiscAproval.rpt"));
            rpDoc.SetDataSource(ds);
            Session["Disc_Report"] = rpDoc;
            Discount_Aproval.ReportSource = rpDoc;
            Discount_Aproval.DataBind();
            Discount_Aproval.RefreshReport();

            ViewReport();
        }
        private void ViewReport()
        {
            this.Discount_Aproval.BestFitPage = true;
            this.Discount_Aproval.HasExportButton = true;
            this.Discount_Aproval.EnableDrillDown = true;
            this.Discount_Aproval.ShowAllPageIds = true;
            this.Discount_Aproval.Zoom(100);
            this.Discount_Aproval.HasPrintButton = true;
            this.Discount_Aproval.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;
            //this.Discount_Aproval.SeparatePages = false;

            this.Discount_Aproval.PrintMode = CrystalDecisions.Web.PrintMode.ActiveX;
            //this.Discount_Aproval.ShowAllPageIds = true;

            int myFOpts = (int)(CrystalDecisions.Shared.ViewerExportFormats.ExcelRecordFormat | CrystalDecisions.Shared.ViewerExportFormats.PdfFormat | CrystalDecisions.Shared.ViewerExportFormats.RptrFormat | CrystalDecisions.Shared.ViewerExportFormats.ExcelFormat | CrystalDecisions.Shared.ViewerExportFormats.WordFormat | CrystalDecisions.Shared.ViewerExportFormats.XLSXFormat);
            this.Discount_Aproval.AllowedExportFormats = myFOpts;
        }
    }
}