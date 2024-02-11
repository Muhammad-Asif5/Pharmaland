using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZUIS.Dataset;
using ZUIS.Models;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;

namespace ZUIS.WebForm
{
    public partial class SRReports : System.Web.UI.Page
    {
        Entities db = new Entities();
        ds_StockReceipt ds;
        
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
                string CourseId = Request.QueryString["c_id"];
                //string CompID = Request.QueryString["comid"];
                //string SemID = Request.QueryString["semid"];
                //string SectionID = Request.QueryString["SectionID"];

                ChangeFunction(CourseId);
            }
            else
            {
                ReportDocument doc = (ReportDocument)Session["myCLO_Report"];
                StockReceiptRpt.ReportSource = doc;
            }
        }

        private void Load_Data(string CourseID)
        {
            ds = new ds_StockReceipt();
            SqlCommand cmd = new SqlCommand("SELECT Stock_ReceiptDET.Stock_no, Item_Stock.Brand_name, Manufacture.M_Name, Stock_ReceiptDET.Batch_NO, Stock_ReceiptDET.Expiry_Date, Stock_ReceiptDET.Items_Received, Stock_ReceiptDET.PPrice_PerItem, "
+ " Stock_Receipt.Invoice_Date, Stock_Receipt.Total_Amount, Stock_ReceiptDET.Supp_Invno, Purchase_Order.PO_No, Purchase_Order.PO_Date, Purchase_Order.Ship_toCustAddr,  "
+ " Purchase_Order.Ship_toCustCity "
+ " FROM     Item_Stock INNER JOIN "
+ " Stock_ReceiptDET ON Item_Stock.Stock_no = Stock_ReceiptDET.Stock_no INNER JOIN "
+ " Stock_Receipt ON Stock_ReceiptDET.Supp_Invno = Stock_Receipt.Supp_Invno INNER JOIN "
+ " Manufacture ON Item_Stock.Manufacturer_Code = Manufacture.Manufacturer_Code INNER JOIN "
+ " Purchase_Order ON Stock_Receipt.PO_NO = Purchase_Order.PO_No "
+ " WHERE  (Stock_ReceiptDET.Supp_Invno = '" + CourseID + "')", con);

//            SqlCommand cmd = new SqlCommand("SELECT Item_Stock.Stock_no, Item_Stock.Brand_name, Item_Stock.Generic_name, Item_Stock.Units_PerItem, Item_Stock.Current_Price, Item_Stock.Manufacturer_Code, PO_ItemDetail.POQty_PerItem,  "
//+ " Stock_ReceiptDET.Items_Received, Stock_ReceiptDET.Expiry_Date, Stock_ReceiptDET.Batch_NO, Stock_ReceiptDET.Items_Available, Stock_ReceiptDET.Units_PerItem AS Expr1, Stock_ReceiptDET.PPrice_PerItem,  "
//+ " Stock_ReceiptDET.SPrice_PerItem, Stock_ReceiptDET.WPrice_PerItem, Stock_ReceiptDET.PPrice_Currency, Stock_ReceiptDET.Currency_Rate, Stock_ReceiptDET.Supp_Invno "
//+ " FROM     Item_Stock INNER JOIN "
//+ " PO_ItemDetail ON Item_Stock.Stock_no = PO_ItemDetail.Stock_no INNER JOIN "
//+ " Purchase_Order ON PO_ItemDetail.PO_No = Purchase_Order.PO_No INNER JOIN "
//+ " Stock_Receipt ON Purchase_Order.PO_No = Stock_Receipt.PO_NO INNER JOIN "
//+ " Stock_ReceiptDET ON Item_Stock.Stock_no = Stock_ReceiptDET.Stock_no AND Stock_Receipt.Supp_Invno = Stock_ReceiptDET.Supp_Invno "
//+ " WHERE  (Stock_ReceiptDET.Supp_Invno = '" + CourseID + "')", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds, "DataTable2");

        }

        public void ChangeFunction(string CourseId)
        {
            Load_Data(CourseId);

            ReportDocument rpDoc = new ReportDocument();
            //rpDoc.Load(Server.MapPath("~/Reports/CLO_Report.rpt"));
            rpDoc.Load(Server.MapPath("~/Reports/rptSalesInv.rpt"));
            rpDoc.SetDataSource(ds);
            Session["myCLO_Report"] = rpDoc;
            StockReceiptRpt.ReportSource = rpDoc;
            StockReceiptRpt.DataBind();
            StockReceiptRpt.RefreshReport();

            ViewReport();
        }

        private void ViewReport()
        {

            this.StockReceiptRpt.BestFitPage = true;
            this.StockReceiptRpt.HasExportButton = true;
            this.StockReceiptRpt.EnableDrillDown = true;
            this.StockReceiptRpt.ShowAllPageIds = true;
            this.StockReceiptRpt.Zoom(100);
            this.StockReceiptRpt.HasPrintButton = true;
            this.StockReceiptRpt.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;
            //this.StockReceiptRpt.SeparatePages = false;

            this.StockReceiptRpt.PrintMode = CrystalDecisions.Web.PrintMode.ActiveX;
            //this.StockReceiptRpt.ShowAllPageIds = true;

            int myFOpts = (int)(CrystalDecisions.Shared.ViewerExportFormats.ExcelRecordFormat | CrystalDecisions.Shared.ViewerExportFormats.PdfFormat | CrystalDecisions.Shared.ViewerExportFormats.RptrFormat | CrystalDecisions.Shared.ViewerExportFormats.ExcelFormat | CrystalDecisions.Shared.ViewerExportFormats.WordFormat | CrystalDecisions.Shared.ViewerExportFormats.XLSXFormat);
            this.StockReceiptRpt.AllowedExportFormats = myFOpts;
        }
    }
}