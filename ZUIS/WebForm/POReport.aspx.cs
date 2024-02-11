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
using System.Configuration;

namespace ZUIS.WebForm
{
    public partial class POReport : System.Web.UI.Page
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
                string CourseId = Request.QueryString["c_id"];

                ChangeFunction(CourseId);
            }
            else
            {
                ReportDocument doc = (ReportDocument)Session["PO"];
                PurchaseOrder.ReportSource = doc;
            }
        }
        public void ChangeFunction(string id)
        {
            ds = new ds_PO();
            SqlCommand cmd = new SqlCommand("SELECT Item_Stock.Brand_name, Item_Stock.Generic_name, Item_Stock.Units_PerItem, Item_Stock.Current_Price, "
            + " PO_ItemDetail.PO_No ,PO_ItemDetail.Stock_no,PO_ItemDetail.POPrice_PerItem,PO_ItemDetail.CurrExch_rate,"
            + " PO_ItemDetail.POQty_PerItem,PO_ItemDetail.Qty_Pack,PO_ItemDetail.POMargin_Percentage,PO_ItemDetail.POExtend_Price, PO_ItemDetail.Currency as C, Vendor.*, Purchase_Order.* "
            + " , Customer.Cust_Name "
            + " FROM  Item_Stock INNER JOIN "
            + " PO_ItemDetail ON Item_Stock.Stock_no = PO_ItemDetail.Stock_no INNER JOIN "
            + " Purchase_Order ON PO_ItemDetail.PO_No = Purchase_Order.PO_No INNER JOIN "
            + " Vendor ON Purchase_Order.Vendor_code = Vendor.vendor_code INNER JOIN "
            + " Customer ON Purchase_Order.Customer_Code = Customer.Customer_code "
            + " WHERE  (PO_ItemDetail.PO_No = '" + id + "')", con);
//            SqlCommand cmd = new SqlCommand("SELECT Item_Stock.Brand_name, Item_Stock.Generic_name, Item_Stock.Units_PerItem, Item_Stock.Current_Price, PO_ItemDetail.PO_No, PO_ItemDetail.Stock_no, PO_ItemDetail.POPrice_PerItem,  "
//    + " O_ItemDetail.CurrExch_rate, PO_ItemDetail.POQty_PerItem, PO_ItemDetail.Qty_Pack, PO_ItemDetail.POMargin_Percentage, PO_ItemDetail.POExtend_Price, PO_ItemDetail.Currency AS C, Vendor.vendor_code,  "
//+ " Vendor.vendor_Title, Vendor.Name, Vendor.Contact_Person, Vendor.Address, Vendor.City, Vendor.Region, Vendor.Country_code, Vendor.Postal_Code, Vendor.Tel_No, Vendor.Fax_No, Vendor.Email,  "
//+ " Vendor.Alt_Address, Vendor.Alt_City, Vendor.Alt_Country, Vendor.Lang_Code, Vendor.Record_date, Vendor.User_id, Purchase_Order.PO_No AS Expr1, Purchase_Order.PO_Title, Purchase_Order.PO_Date,  "
//+ " Purchase_Order.Delivery_date, Purchase_Order.Delivery_status, Purchase_Order.Currency, Purchase_Order.Gross_Amount, Purchase_Order.Tax_Percentage, Purchase_Order.Disc_Percentage,  "
//+ " Purchase_Order.NET_Amount, Purchase_Order.Customer_Code, Purchase_Order.Ship_toCustAddr, Purchase_Order.Ship_toCustCity, Purchase_Order.Ship_Via, Purchase_Order.Vendor_code AS Expr2,  "
//+ " Purchase_Order.PO_CreatedBy, Purchase_Order.PO_Dept_code, Purchase_Order.PG_ApprovedBy, Purchase_Order.HOD_ApprovedBy, Purchase_Order.DIR_ApprovedBy, Purchase_Order.Comments,  "
//+ " Customer.Cust_Name, Customer.City_code, Customer.Address AS Expr3, Customer.City AS Expr4, Customer.Contact_Person AS Expr5, Customer.Tel_No AS Expr6, Customer.Email AS Expr7, Customer.Mobile_No "
//+ " FROM     Item_Stock INNER JOIN "
//+ " PO_ItemDetail ON Item_Stock.Stock_no = PO_ItemDetail.Stock_no INNER JOIN "
//+ " Purchase_Order ON PO_ItemDetail.PO_No = Purchase_Order.PO_No INNER JOIN "
//+ " Vendor ON Purchase_Order.Vendor_code = Vendor.vendor_code INNER JOIN "
//+ " Customer ON Purchase_Order.Customer_Code = Customer.Customer_code "
//+ " WHERE  (PO_ItemDetail.PO_No = '"+id+"')",con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds, "DataTable1");

            ReportDocument po = new ReportDocument();
            po.Load(Server.MapPath("~/Reports/rptPurchaseOrder.rpt"));
            po.SetDataSource(ds);
            Session["PO"] = po;
            PurchaseOrder.ReportSource = po;
            PurchaseOrder.DataBind();
            PurchaseOrder.RefreshReport();

            //this.PurchaseOrder.BestFitPage = true;
            //this.PurchaseOrder.HasExportButton = true;
            //this.PurchaseOrder.EnableDrillDown = true;
            //this.PurchaseOrder.ShowAllPageIds = true;
            //this.PurchaseOrder.Zoom(100);
            //this.PurchaseOrder.HasPrintButton = true;
            //this.PurchaseOrder.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;
            ViewReport();
        }
        private void ViewReport()
        {
            this.PurchaseOrder.BestFitPage = true;
            this.PurchaseOrder.HasExportButton = true;
            this.PurchaseOrder.EnableDrillDown = true;
            this.PurchaseOrder.ShowAllPageIds = true;
            this.PurchaseOrder.Zoom(100);
            this.PurchaseOrder.HasPrintButton = true;
            this.PurchaseOrder.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;
            //this.PurchaseOrder.SeparatePages = false;

            this.PurchaseOrder.PrintMode = CrystalDecisions.Web.PrintMode.ActiveX;
            //this.PurchaseOrder.ShowAllPageIds = true;

            int myFOpts = (int)(CrystalDecisions.Shared.ViewerExportFormats.ExcelRecordFormat | CrystalDecisions.Shared.ViewerExportFormats.PdfFormat | CrystalDecisions.Shared.ViewerExportFormats.RptrFormat | CrystalDecisions.Shared.ViewerExportFormats.ExcelFormat | CrystalDecisions.Shared.ViewerExportFormats.WordFormat | CrystalDecisions.Shared.ViewerExportFormats.XLSXFormat);
            this.PurchaseOrder.AllowedExportFormats = myFOpts;
        }
    }
}