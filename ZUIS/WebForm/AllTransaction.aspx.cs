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
    public partial class AllTransaction : System.Web.UI.Page
    {
        Entities db = new Entities();
        ds_PO ds;
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
                ReportDocument doc = (ReportDocument)Session["AllPO"];
                AllPurchaseOrder.ReportSource = doc;
            }
        }
        public void ChangeFunction()
        {
            ds = new ds_PO();
            SqlCommand cmd = new SqlCommand("SELECT Purchase_Order.PO_Title, Purchase_Order.PO_Date, Vendor.Name, Purchase_Order.PO_No, Purchase_Order.Delivery_date, Purchase_Order.Gross_Amount "
+ " FROM     Purchase_Order INNER JOIN "
+ " Vendor ON Purchase_Order.Vendor_code = Vendor.vendor_code ORDER BY Purchase_Order.PO_Date DESC", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds, "DataTable3");

            ReportDocument rpDoc = new ReportDocument();
            //rpDoc.Load(Server.MapPath("~/Reports/CLO_Report.rpt"));
            rpDoc.Load(Server.MapPath("~/Reports/rptPOAllTransaction.rpt"));
            rpDoc.SetDataSource(ds);
            Session["AllPO"] = rpDoc;
            AllPurchaseOrder.ReportSource = rpDoc;
            AllPurchaseOrder.DataBind();
            AllPurchaseOrder.RefreshReport();
            
            ViewReport();
        }
        private void ViewReport()
        {
            this.AllPurchaseOrder.BestFitPage = true;
            this.AllPurchaseOrder.HasExportButton = true;
            this.AllPurchaseOrder.EnableDrillDown = true;
            this.AllPurchaseOrder.ShowAllPageIds = true;
            this.AllPurchaseOrder.Zoom(100);
            this.AllPurchaseOrder.HasPrintButton = true;
            this.AllPurchaseOrder.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;
            //this.AllPurchaseOrder.SeparatePages = false;

            this.AllPurchaseOrder.PrintMode = CrystalDecisions.Web.PrintMode.ActiveX;
            //this.AllPurchaseOrder.ShowAllPageIds = true;

            int myFOpts = (int)(CrystalDecisions.Shared.ViewerExportFormats.ExcelRecordFormat | CrystalDecisions.Shared.ViewerExportFormats.PdfFormat | CrystalDecisions.Shared.ViewerExportFormats.RptrFormat | CrystalDecisions.Shared.ViewerExportFormats.ExcelFormat | CrystalDecisions.Shared.ViewerExportFormats.WordFormat | CrystalDecisions.Shared.ViewerExportFormats.XLSXFormat);
            this.AllPurchaseOrder.AllowedExportFormats = myFOpts;
        }
    }
}