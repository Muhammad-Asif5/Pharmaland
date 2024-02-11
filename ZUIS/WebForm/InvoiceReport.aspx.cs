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
    public partial class InvoiceReport : System.Web.UI.Page
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
        //SqlConnection con = new SqlConnection(@"Data Source=Server\SQL;Initial Catalog=ZUIS;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
        SqlConnection con = new SqlConnection(GetConStr);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string CourseId = Request.QueryString["c_id"];
                //string CompID = Request.QueryString["comid"];
                //string SemID = Request.QueryString["semid"];
                //string SectionID = Request.QueryString["SectionID"];

                ChangeFunction(CourseId);
            }
            else
            {
                ReportDocument doc = (ReportDocument)Session["myCLO_Report"];
                Invoice.ReportSource = doc;
            }
        }
        public void ChangeFunction(string id)
        {
            ds = new ds_PO();

//            SELECT Customer.Customer_code, Customer.Cust_Name, Customer.Address, Customer.City, Sale_Invoice.Invoice_no, Sale_Invoice.Invoice_date, Item_Stock.Stock_no, Item_Stock.Brand_name, Item_Stock.Units_PerItem, 
//                  Sale_InvDET.Batch_NO, Sale_InvDET.Expiry_Date, Sale_InvDET.SQty, Sale_InvDET.SPrice_PerItem, Sale_InvDET.TSPrice_PerItem, Sales_order.CustPO_No, Sales_order.CustPO_Date
//FROM     Customer INNER JOIN
//                  Sale_Invoice ON Customer.Customer_code = Sale_Invoice.Customer_Code INNER JOIN
//                  Sale_InvDET ON Sale_Invoice.Invoice_no = Sale_InvDET.Invoice_no INNER JOIN
//                  Item_Stock ON Sale_InvDET.Stock_no = Item_Stock.Stock_no INNER JOIN
//                  Sales_order ON Sale_Invoice.SO_No = Sales_order.SO_No
//WHERE  (Sale_Invoice.Invoice_no = '20190925')


            SqlCommand cmd = new SqlCommand("SELECT Customer.Customer_code, Customer.Cust_Name, Customer.Address, Customer.City, Sale_Invoice.Invoice_no, Sale_Invoice.Invoice_date, Item_Stock.Stock_no, Item_Stock.Brand_name, Item_Stock.Units_PerItem, "
+ "                   Sale_InvDET.Batch_NO, Sale_InvDET.Expiry_Date, Sale_InvDET.SQty, Sale_InvDET.SPrice_PerItem, Sale_InvDET.TSPrice_PerItem, Sales_order.CustPO_No, Sales_order.CustPO_Date, Manufacture.M_Name, "
+ " Sales_order.Ship_toCustAddr, Sales_order.Ship_toCustCity "
+ " FROM     Customer INNER JOIN "
+ "                   Sale_Invoice ON Customer.Customer_code = Sale_Invoice.Customer_Code INNER JOIN " 
+ "                   Sale_InvDET ON Sale_Invoice.Invoice_no = Sale_InvDET.Invoice_no INNER JOIN "
+ "                   Item_Stock ON Sale_InvDET.Stock_no = Item_Stock.Stock_no INNER JOIN "
+ "                   Sales_order ON Sale_Invoice.SO_No = Sales_order.SO_No INNER JOIN "
+ "                   Manufacture ON Item_Stock.Manufacturer_Code = Manufacture.Manufacturer_Code "
+ " WHERE  (Sale_Invoice.Invoice_no = '"+id+"')", con); 

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds, "Invoice");

            ReportDocument rpDoc = new ReportDocument();
            //rpDoc.Load(Server.MapPath("~/Reports/CLO_Report.rpt"));
            rpDoc.Load(Server.MapPath("~/Reports/rptSalesInv.rpt"));
            rpDoc.SetDataSource(ds);
            Session["myCLO_Report"] = rpDoc;
            Invoice.ReportSource = rpDoc;
            Invoice.DataBind();
            Invoice.RefreshReport();

            this.Invoice.BestFitPage = true;
            this.Invoice.HasExportButton = true;
            this.Invoice.EnableDrillDown = true;
            this.Invoice.ShowAllPageIds = true;
            this.Invoice.Zoom(100);
            this.Invoice.HasPrintButton = true;
            this.Invoice.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;
            //ViewReport();
        }
        private void ViewReport()
        {
            this.Invoice.BestFitPage = true;
            this.Invoice.HasExportButton = true;
            this.Invoice.EnableDrillDown = true;
            this.Invoice.ShowAllPageIds = true;
            this.Invoice.Zoom(100);
            this.Invoice.HasPrintButton = true;
            this.Invoice.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;
            //this.Invoice.SeparatePages = false;

            this.Invoice.PrintMode = CrystalDecisions.Web.PrintMode.ActiveX;
            //this.Invoice.ShowAllPageIds = true;

            int myFOpts = (int)(CrystalDecisions.Shared.ViewerExportFormats.ExcelRecordFormat | CrystalDecisions.Shared.ViewerExportFormats.PdfFormat | CrystalDecisions.Shared.ViewerExportFormats.RptrFormat | CrystalDecisions.Shared.ViewerExportFormats.ExcelFormat | CrystalDecisions.Shared.ViewerExportFormats.WordFormat | CrystalDecisions.Shared.ViewerExportFormats.XLSXFormat);
            this.Invoice.AllowedExportFormats = myFOpts;
        }
    }
}