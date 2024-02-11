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
    public partial class CustomerReport : System.Web.UI.Page
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
                ReportDocument doc = (ReportDocument)Session["myCLO_Report"];
                CustomerRep.ReportSource = doc;
            }
        }
        public void ChangeFunction()
        {
            ds = new ds_PO();
            SqlCommand cmd = new SqlCommand("SELECT Company.Branch_Code, Customer.Customer_code, Customer.Cust_Name, Customer.Address, "
            + " Customer.City, Customer.City_code, City.City_NAME FROM     City INNER JOIN "
            + " Customer ON City.City_code = Customer.City_code CROSS JOIN "
            + " Company", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds, "CustomerTable");

            ReportDocument rpDoc = new ReportDocument();
            //rpDoc.Load(Server.MapPath("~/Reports/CLO_Report.rpt"));
            rpDoc.Load(Server.MapPath("~/Reports/rptCustomer.rpt"));
            rpDoc.SetDataSource(ds);
            Session["myCLO_Report"] = rpDoc;
            CustomerRep.ReportSource = rpDoc;
            CustomerRep.DataBind();
            CustomerRep.RefreshReport();

            ViewReport();
        }
        private void ViewReport()
        {
            this.CustomerRep.BestFitPage = true;
            this.CustomerRep.HasExportButton = true;
            this.CustomerRep.EnableDrillDown = true;
            this.CustomerRep.ShowAllPageIds = true;
            this.CustomerRep.Zoom(100);
            this.CustomerRep.HasPrintButton = true;
            this.CustomerRep.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;
            //this.CustomerRep.SeparatePages = false;

            this.CustomerRep.PrintMode = CrystalDecisions.Web.PrintMode.ActiveX;
            //this.CustomerRep.ShowAllPageIds = true;

            int myFOpts = (int)(CrystalDecisions.Shared.ViewerExportFormats.ExcelRecordFormat | CrystalDecisions.Shared.ViewerExportFormats.PdfFormat | CrystalDecisions.Shared.ViewerExportFormats.RptrFormat | CrystalDecisions.Shared.ViewerExportFormats.ExcelFormat | CrystalDecisions.Shared.ViewerExportFormats.WordFormat | CrystalDecisions.Shared.ViewerExportFormats.XLSXFormat);
            this.CustomerRep.AllowedExportFormats = myFOpts;
        }
    }
}