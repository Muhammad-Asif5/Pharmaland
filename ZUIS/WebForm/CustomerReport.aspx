<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerReport.aspx.cs" Inherits="ZUIS.WebForm.CustomerReport" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <CR:CrystalReportViewer ID="CustomerRep" runat="server" AutoDataBind="true" />
    </form>
</body>
</html>
