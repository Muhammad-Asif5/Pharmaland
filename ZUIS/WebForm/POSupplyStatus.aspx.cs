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
    public partial class POSupplyStatus : System.Web.UI.Page
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
                string SupInv = Request.QueryString["SupInv"];

                ChangeFunction(CourseId, SupInv);
            }
            else
            {
                ReportDocument doc = (ReportDocument)Session["PO_SupplyStatus"];
                ReceiveStock.ReportSource = doc;
            }
        }
        public void ChangeFunction(string id, string SupInv)
        {
            ds = new ds_PO();
            SqlCommand cmd = new SqlCommand("SELECT Stock_Receipt.Supp_Invno,Stock_Receipt.Received_date, Stock_Receipt.AltSupp_Invno,Stock_Receipt.Status, Stock_Receipt.Invoice_Date, Item_Stock.Brand_name, Stock_ReceiptDET.Batch_NO,Stock_ReceiptDET.PPrice_PerUnit, Stock_ReceiptDET.Expiry_Date, PO_ItemDetail.Qty_Pack, PO_ItemDetail.POPrice_PerItem, "
            + " PO_ItemDetail.POMargin_Percentage, PO_ItemDetail.POExtend_Price, Purchase_Order.PO_No, Vendor.Name, Customer.Cust_Name, Stock_ReceiptDET.Items_Received,Stock_ReceiptDET.Tot_PPriceItem "
            + " FROM     Item_Stock INNER JOIN "
            + " Stock_ReceiptDET ON Item_Stock.Stock_no = Stock_ReceiptDET.Stock_no INNER JOIN "
            + " PO_ItemDetail ON Item_Stock.Stock_no = PO_ItemDetail.Stock_no INNER JOIN " 
            + " Stock_Receipt ON Stock_ReceiptDET.Supp_Invno = Stock_Receipt.Supp_Invno INNER JOIN "
            + " Purchase_Order ON PO_ItemDetail.PO_No = Purchase_Order.PO_No AND Stock_Receipt.PO_NO = Purchase_Order.PO_No INNER JOIN "
            + " Customer ON Purchase_Order.Customer_Code = Customer.Customer_code INNER JOIN "
            + " Vendor ON Stock_Receipt.vendor_code = Vendor.vendor_code AND Purchase_Order.Vendor_code = Vendor.vendor_code "
            + " WHERE  (Stock_Receipt.Branch_No = '" + id + "') and (Stock_Receipt.Supp_Invno = '" + SupInv + "') ", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
           
            //ds.Tables["POSupply"].Columns[17].DefaultValue = "aaaaaaaaaaa";
            da.Fill(ds, "POSupply");
            string ss = ds.Tables["POSupply"].Rows[0][17].ToString();
                for (int i = 0; i < ds.Tables["POSupply"].Rows.Count; i++)
                {
                    if (ss == "Y")
                    {
                        ds.Tables["POSupply"].Rows[i][17] = "Complete"; 
                    }
                    else
                    {
                        ds.Tables["POSupply"].Rows[i][17] = "Not Complete"; 
                    }
                }
            ReportDocument rpDoc = new ReportDocument();
            rpDoc.Load(Server.MapPath("~/Reports/rptPOSupply.rpt"));
            rpDoc.SetDataSource(ds);
            Session["PO_SupplyStatus"] = rpDoc;
            ReceiveStock.ReportSource = rpDoc;
            ReceiveStock.DataBind();
            ReceiveStock.RefreshReport();

            ViewReport();
        }
        private void ViewReport()
        {
            this.ReceiveStock.BestFitPage = true;
            this.ReceiveStock.HasExportButton = true;
            this.ReceiveStock.EnableDrillDown = true;
            this.ReceiveStock.ShowAllPageIds = true;
            this.ReceiveStock.Zoom(100);
            this.ReceiveStock.HasPrintButton = true;
            this.ReceiveStock.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;
            //this.PurchaseOrder.SeparatePages = false;

            this.ReceiveStock.PrintMode = CrystalDecisions.Web.PrintMode.ActiveX;
            //this.PurchaseOrder.ShowAllPageIds = true;

            int myFOpts = (int)(CrystalDecisions.Shared.ViewerExportFormats.ExcelRecordFormat | CrystalDecisions.Shared.ViewerExportFormats.PdfFormat | CrystalDecisions.Shared.ViewerExportFormats.RptrFormat | CrystalDecisions.Shared.ViewerExportFormats.ExcelFormat | CrystalDecisions.Shared.ViewerExportFormats.WordFormat | CrystalDecisions.Shared.ViewerExportFormats.XLSXFormat);
            this.ReceiveStock.AllowedExportFormats = myFOpts;
        }
    }
}