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
    public partial class _748INVReport : System.Web.UI.Page
    {
        Entities db = new Entities();
        ds_748INV ds;
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
                //string CourseId = Request.QueryString["c_id"];
                //string CompID = Request.QueryString["comid"];
                //string SemID = Request.QueryString["semid"];
                //string SectionID = Request.QueryString["SectionID"];

                ChangeFunction();
            }
            else
            {
                ReportDocument doc = (ReportDocument)Session["myCLO_Report"];
                c748INV.ReportSource = doc;
            }
        }
        public void ChangeFunction()
        {
            ds = new ds_748INV();
            SqlCommand cmd = new SqlCommand("SELECT Company.Branch_Code, Sale_Invoice.Invoice_no, Sale_Invoice.Invoice_date, "
+ " Customer.Customer_code, City.City_code, Item_Stock.Stock_no, Item_Stock.Brand_name, Sale_InvDET.Batch_NO,  "
+ " Sale_InvDET.PPrice_PerItem, Sale_InvDET.SQty, Sale_Invoice.Disc_Percentage, Sale_Invoice.NET_Amount , City.City_NAME"
+ " FROM     Item_Stock INNER JOIN "
+ " Sale_InvDET ON Item_Stock.Stock_no = Sale_InvDET.Stock_no INNER JOIN "
+ " Sale_Invoice ON Sale_InvDET.Invoice_no = Sale_Invoice.Invoice_no INNER JOIN "
+ " Customer ON Sale_Invoice.Customer_Code = Customer.Customer_code INNER JOIN "
+ " City ON Customer.City_code = City.City_code INNER JOIN "
+ " Company ON City.City_code = Company.City_code", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds, "Table");

            ReportDocument rpDoc = new ReportDocument();
            //rpDoc.Load(Server.MapPath("~/Reports/CLO_Report.rpt"));
            rpDoc.Load(Server.MapPath("~/Reports/_748INV.rpt"));
            rpDoc.SetDataSource(ds);
            Session["myCLO_Report"] = rpDoc;
            c748INV.ReportSource = rpDoc;
            c748INV.DataBind();
            c748INV.RefreshReport();

            this.c748INV.BestFitPage = true;
            this.c748INV.HasExportButton = true;
            this.c748INV.EnableDrillDown = true;
            this.c748INV.ShowAllPageIds = true;
            this.c748INV.Zoom(100);
            this.c748INV.HasPrintButton = true;
            this.c748INV.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;
            //ViewReport();
        }
        private void ViewReport()
        {
            this.c748INV.BestFitPage = true;
            this.c748INV.HasExportButton = true;
            this.c748INV.EnableDrillDown = true;
            this.c748INV.ShowAllPageIds = true;
            this.c748INV.Zoom(100);
            this.c748INV.HasPrintButton = true;
            this.c748INV.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;
            //this.c748INV.SeparatePages = false;

            this.c748INV.PrintMode = CrystalDecisions.Web.PrintMode.ActiveX;
            //this.c748INV.ShowAllPageIds = true;

            int myFOpts = (int)(CrystalDecisions.Shared.ViewerExportFormats.ExcelRecordFormat | CrystalDecisions.Shared.ViewerExportFormats.PdfFormat | CrystalDecisions.Shared.ViewerExportFormats.RptrFormat | CrystalDecisions.Shared.ViewerExportFormats.ExcelFormat | CrystalDecisions.Shared.ViewerExportFormats.WordFormat | CrystalDecisions.Shared.ViewerExportFormats.XLSXFormat);
            this.c748INV.AllowedExportFormats = myFOpts;
        }
    }
}