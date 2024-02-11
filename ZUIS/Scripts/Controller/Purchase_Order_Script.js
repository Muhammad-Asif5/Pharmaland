
/////////////////////////////////////// Read Function ////////////////////////////////////////
var qty = 0;
function GetAllPODetails() {

    resetPODetails();
    var PO_No = $("#PO_No").val();
    $("#PONo").val(PO_No);
    FindPO(PO_No);
    if (PO_No != "") {
        $.ajax({
            type: "POST",
            url: "/Purchase/GetAllPurchaseInTable",
            data: {
                PO_No: PO_No
            },
            success: function (data) {

                if (data.r.length > 0) {

                    $("#PO_CreatedBy").val(data.r[0].PO_CreatedBy);
                    $("#PO_Dept_code").val(0);
                    $("#PG_ApprovedBy").val(data.r[0].PG_ApprovedBy);
                    $("#HOD_ApprovedBy").val(data.r[0].PO_CreatedBy);
                    $("#DIR_ApprovedBy").val(data.r[0].DIR_ApprovedBy);

                    $("#AmountBeforeMarg").val(data.GrossAmountBefMarg);
                    $("#Gross_Amount").val(data.gAmount);
                    $("#Tax_Percentage").val(data.r[0].Tax_Percentage);
                    $("#Disc_Percentage").val(data.r[0].Disc_Percentage);
                    $("#NET_Amount").val(data.r[0].NET_Amount);
                } else {
                    // resetPO();
                    $("#Gross_Amount").val("");
                    $("#Tax_Percentage").val("");
                    $("#Disc_Percentage").val("");
                    $("#NET_Amount").val("");
                }


                $("#myDatatable body").html("");
                var table = $("#myDatatable").DataTable({
                    data: data.r,

                    //rowId: 'staffId',
                    columns: [
                        { "data": "PO_No", "searchable": false, "orderable": false },
                        { "data": "Stock_no", "searchable": false, "orderable": false },
                        { "data": "Brand_name", "searchable": false, "orderable": false },
                        { "data": "Generic_name", "searchable": false, "orderable": false },
                        //{
                        //    "data": "PO_Date", "searchable": false, "orderable": false, "render": function (data) {
                        //       return ConvertDate(data);
                        //    }
                        //},
                        { "data": "POQty_PerItem", "searchable": false, "orderable": false },
                        { "data": "POPrice_PerItem", "searchable": false, "orderable": false },
                        { "data": "Currency", "searchable": false, "orderable": false },
                        { "data": "CurrExch_rate", "searchable": false, "orderable": false },
                        { "data": "POMargin_Percentage", "searchable": false, "orderable": false },
                        { "data": "POExtend_Price", "searchable": false, "orderable": false },
                        { "data": "Status", "searchable": false, "orderable": false }
                    ],
                    "order": [[0, "asc"]],
                    "fnCreatedRow": function (nRow, aData, iDataIndex) {

                        var r = aData.Stock_no + aData.PO_No;
                        $(nRow).attr('id', r);
                        $(nRow).attr('onclick', 'ClickTableRowToGetPOId(this.id)');
                    },
                    //"paging": false,
                    searching: false,                   // for disable search box
                    select: {
                        info: false
                    },
                    //buttons: [
                    //    {
                    //        extend: 'print',
                    //        className: 'btn btn-primary btn-sm'
                    //    },
                    //    {
                    //        extend: 'excel',
                    //        filename: 'Stock',
                    //        sheetName: 'Stock',
                    //        className: 'btn btn-primary btn-sm'
                    //    }
                    //],
                    //dom: 'lBfrtip',
                    language: {
                        search: "", // for hide label of search
                        searchPlaceholder: "Search Purchase", // place holder of search box
                    },
                    responsive: true,
                    //select: 'single',
                    select: true,                       // for Select Row
                    bDestroy: true,                     // this will disable table when new load data
                    "bLengthChange": false,           //  for Show more Entries
                    //scrollY: '20vh',
                    "sScrollX": "100%",
                    "sScrollXInner": "100%",
                    "bScrollCollapse": true,
                    "processing": true,
                    //"bPaginate": false,
                    "sPaginationType": "full_numbers",
                    "langauge": {
                        "myDatatable": "No data found, Please click on <b>Add New </b> Button"
                    },


                });
                $('input[type="search"]').addClass('form-control'); // <-- add this line

            },
            error: function (er) {
                alert(er);
            }
        });
    } else {

    }

}
function FindPO(id) {
    //alert(id);

    $.ajax({
        type: "POST",
        url: "/Purchase/ViewByParameter",
        data: {
            PO_No: id
        },
        success: function (data) {

            if (data.length > 0) {
                $("#Vendor_code").val(data[0].Vendor_code).trigger('chosen:updated');
                $("#Customer_Code").val(data[0].Customer_Code).trigger('chosen:updated');
                $("#Currency").val(data[0].Currency);
                $("#Delivery_status").val(data[0].Delivery_status);
                $("#Ship_toCustAddr").val(data[0].Ship_toCustAddr);

                var DeliveryDate = ConvertDate(data[0].Delivery_date);
                var PODate = ConvertDate(data[0].PO_Date);

                $("#Delivery_date").val(DeliveryDate);
                $("#PO_Date").val(PODate);
            } else {
                var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
                var date = new Date();
                var dat = date.getDate();
                var mon = monthNames[date.getMonth()];
                var year = date.getFullYear();
                var todayDate = dat + "/" + mon + "/" + year;
                $("#PO_Date").val(todayDate);


                date.setDate(date.getDate() + 15);
                var dat1 = date.getDate();
                var mon1 = monthNames[date.getMonth()];
                var year1 = date.getFullYear();
                var todayDate1 = dat1 + "/" + mon1 + "/" + year1;
                $("#Delivery_date").val(todayDate1);
                resetPO();
            }

        },
        error: function (er) {
            alert(er);
        }
    });
}
function GetAddressofCust(id) {
    //alert(id);
    $.ajax({
        type: "POST",
        url: "/Purchase/GetAddressofCust",
        data: {
            id: id
        },
        success: function (data) {

            $("#Ship_toCustAddr").val(data[0].Address);
        },
        error: function (result) {
            alert("Connection Error Please retry");
        }
    });
}
function ClickTableRowToGetPOId(id) {
    var Stockno = id.substring(0, 8);
    var PoNo = id.substring(8);

    $.ajax({
        type: "POST",
        url: "/Purchase/GetPODetailsById",
        data: {
            PoNo: PoNo,
            Stockno: Stockno
        },
        success: function (data) {

            $("#UpdatePODetailsBtn").show();
            $("#DeletePODetailsBtn").show();
            $("#SaveBtn").hide();
            // alert(data.Currency);
            $("#PONo").val(data[0].PO_No);
            $("#Stock_no").val(data[0].Stock_no).trigger('chosen:updated');
            $("#Stock_no").prop('disabled', true).trigger('chosen:updated').prop('disabled', false);

            qty = data[0].Units_PerItem;
            //alert(qty);
            $("#POQty_PerItem").val(data[0].POQty_PerItem);
            $("#POPrice_PerItem").val(data[0].POPrice_PerItem);
            $("#Currency1").val(data[0].Currency);
            $("#CurrExch_rate").val(data[0].CurrExch_rate);
            //$("#Currency1").val("EURO").prop("selected", true);
            $("#POMargin_Percentage").val(data[0].POMargin_Percentage);
            $("#POExtend_Price").val(data[0].POExtend_Price);
        },
        error: function (result) {
            alert("Connection Error Please retry");
        }
    });
}
function GetStockQtyPrice(value) {
    //alert(id);
    $.ajax({
        type: "POST",
        url: "/Purchase/GetQuantityOfStock",
        data: {
            id: value
        },
        success: function (data) {
            qty = 0;
            qty = data[0].Units_PerItem;
            $("#POPrice_PerItem").val(data[0].Current_Price);
            $("#POQty_PerItem").val(data[0].Units_PerItem);
            $("#POMargin_Percentage").val(data[0].Item_Desc);
        },
        error: function (result) {
            alert("Connection Error Please retry");
        }
    });
}

ViewByParameter(@Url.RequestContext.RouteData.Values["id"]);
function ViewByParameter(id) {
        
    if (id != undefined) {
        var PO_No = $("#PO_No").val(id).keyup();
    }

}
    
/////////////////////////////////////// Save Function ////////////////////////////////////////
function DeletePODetailsData() {

    var Stock_no = $("#Stock_no").val();
    var PONo = $("#PONo").val();
    var code = Stock_no + PONo;
    if (PONo != "" && Stock_no != "") {
        var r = confirm("Are you sure you want to delete this record ?");
        if (r) {
            $.ajax({
                type: "POST",
                url: "/Purchase/DeletePODetails",
                data: {
                    PONo: PONo,
                    Stock_no: Stock_no
                },
                success: function (data) {
                    if (data.success == true) {
                        $("#Gross_Amount").val(data.l[0]);
                        $("#AmountBeforeMarg").val(data.l[1]);
                        var NET_Amount = $("#NET_Amount").val("");
                        var Disc = $("#Disc_Percentage").val("");
                        var Tax = $("#Tax_Percentage").val("");

                        resetPODetails();
                        var table = $('#myDatatable').DataTable();
                        index = table.row('#' + code);
                        var temp = table.row(index[0]).data();
                        table.row(index[0]).remove().draw();

                        DeleteMessage(data.message);
                    }
                },
                error: function (er) {
                    alert(er);
                }
            });
        }

    } else {

    }
}
function SavePOData() {
    //alert("save");
    var Code = $("#Vendor_code").val();
    var PO_No = $("#PO_No").val();
    var Customer_Code = $("#Customer_Code").val();
    var Ship_toCustAddr = $("#Ship_toCustAddr").val();
    var Currency = $("#Currency").val();
    var Delivery_date = $("#Delivery_date").val();
    var Delivery_status = $("#Delivery_status").val();
    var PO_Date = $("#PO_Date").val();

    var str = $("#LoadData").serialize();
    if (Code != "") {
        $.ajax({
            type: "POST",
            url: "/Purchase/SavePO",
            data: str,
            success: function (data) {
                if (data.success == true) {
                    //var PO_No = $("#PO_No").val();
                    $("#PONo").val(PO_No);
                    var table = $("#myDatatable").DataTable();

                    ////var rowIndex = table.row.add(['1', '2', '3', '4', '5']).draw(false);
                    //var rowIndex = table.row.add([Code, Name, Generic_name, UNITS_PERITEM, PRICE, Manufacturer_Code]).draw(false);
                    //var row = $('#myDatatable').dataTable().fnGetNodes(rowIndex);
                    //$(row).attr('id', Code);
                    //$(row).attr('onclick', 'GetStockById(this.id)');

                    //var rowIndex = table.row.add({
                    //    "Stock_no": Code, "Brand_name": Name, "Generic_name": Generic_name, "Units_PerItem": Units_PerItem,
                    //    "Current_Price": Current_Price, "Manufacturer_Code": Manufacturer_Code
                    //}).draw(false);
                    //var row = $('#myDatatable').dataTable().fnGetNodes(rowIndex);
                    //$(row).attr('id', Code);
                    //$(row).attr('onclick', 'GetStockById(this.id)');
                    SaveMessage(data.message);
                    //resetPO();
                } else {
                    warrningMessage(data.message, "WARNING");
                        
                }

            },
            error: function (result) {
                //alert("Connection Error Please retry");
            }
        });
    } else {
        infoMessage("Some Fields left blank", "INFO");
          
    }


}
function SavePODetailsData() {
    //alert("save");
    var PONo = $("#PONo").val();
    var Stock_no = $("#Stock_no").val();

    $("#Stock_no").prop('disabled', true).trigger('chosen:updated').prop('disabled', false);

    var POQty_PerItem = $("#POQty_PerItem").val();
    var POPrice_PerItem = $("#POPrice_PerItem").val();
    var Currency = $("#Currency").val();
    var CurrExch_rate = $("#CurrExch_rate").val();
    var POMargin_Percentage = $("#POMargin_Percentage").val();
    var POExtend_Price = $("#POExtend_Price").val();

    var str = $("#LoadData1").serialize();
    if (Stock_no != "" && PONo != "" && POQty_PerItem != "" && POPrice_PerItem != "" && POMargin_Percentage != "") {
        $.ajax({
            type: "POST",
            url: "/Purchase/SavePOItemDetails",
            data: str,
            success: function (data) {
                if (data.success == true) {
                    $("#myDatatable body").html("");
                    var table = $("#myDatatable").DataTable();
                    $("#AmountBeforeMarg").val(data.l[3]);
                    $("#Gross_Amount").val(data.l[0]);
                    $("#Disc_Percentage").val(0);
                    $("#NET_Amount").val(data.l[0]);
                        
                    var rowIndex = table.row.add({
                        "PO_No": data.data[0].PO_No, "Stock_no": data.data[0].Stock_no, "Brand_name": data.data[0].Brand_name,
                        "Generic_name": data.data[0].Generic_name, "POQty_PerItem": data.data[0].POQty_PerItem,
                        "POPrice_PerItem": data.data[0].POPrice_PerItem, "Currency": data.data[0].Currency,
                        "CurrExch_rate": data.data[0].CurrExch_rate, "POMargin_Percentage": data.data[0].POMargin_Percentage,
                        "POExtend_Price": data.data[0].POExtend_Price, "Status": 'N'
                    }).draw(false);
                    var row = $('#myDatatable').dataTable().fnGetNodes(rowIndex);
                    //$(row).attr('id', Stock_no+PONo);
                    //$(row).attr('onclick', 'ClickTableRowToGetPOId(this.id)');
                    resetPODetails();
                    UpdateMessage(data.message);

                } else {
                        
                    warrningMessage(data.message, "WARNING");
                }

            },
            error: function (result) {
                //alert("Connection Error Please retry");
            }
        });
    } else {
        //alert(0);
        infoMessage("Please Enter PO No & Fill all fields", "INFO");
    }


}
function UpdatePODetailsData() {
    //alert("save");
    var PONo = $("#PONo").val();

    var Stock_no = $("#Stock_no").val();
    var POQty_PerItem = $("#POQty_PerItem").val();
    var POPrice_PerItem = $("#POPrice_PerItem").val();
    var Currency1 = $("#Currency1").val();
    var CurrExch_rate = $("#CurrExch_rate").val();
    var POMargin_Percentage = $("#POMargin_Percentage").val();
    var POExtend_Price = $("#POExtend_Price").val();

    var str = $("#LoadData1").serialize();
    if (Stock_no != "" && PONo != "") {
        $.ajax({
            type: "POST",
            url: "/Purchase/UpdatePODetailsData",
            data: str,
            success: function (data) {
                if (data.success == true) {
                    $("#myDatatable body").html("");
                    var table = $("#myDatatable").DataTable();

                    $("#Gross_Amount").val(data.l[0]);
                    $("#AmountBeforeMarg").val(data.l[1]);
                    $("#Disc_Percentage").val(data.l[2]);
                    $("#NET_Amount").val(data.l[3]);


                    index = table.row('#' + Stock_no + PONo); //1234126
                    var temp = table.row(index[0]).data();
                    //alert(CurrExch_rate);
                    temp.POQty_PerItem = POQty_PerItem;
                    temp.POPrice_PerItem = POPrice_PerItem;
                    temp.Currency = Currency1;
                    temp.CurrExch_rate = CurrExch_rate;
                    temp.POMargin_Percentage = POMargin_Percentage;
                    temp.POExtend_Price = POExtend_Price;
                    table.row(index[0]).data(temp).draw();
                    //$(row).attr('id', Stock_no + PONo);
                    //$(row).attr('onclick', 'ClickTableRowToGetPOId(this.id)');
                    resetPODetails();
                    UpdateMessage(data.message);
                        
                    //var Stock_no = $("#Stock_no").val("");
                    //var POPrice_PerItem = $("#POPrice_PerItem").val("");
                    //var POMargin_Percentage = $("#POMargin_Percentage").val("");
                    //var POQty_PerItem = $("#POQty_PerItem").val("");
                    //var POExtend_Price = $("#POExtend_Price").val("");
                    //var Item_Desc = $("#Item_Desc").val("");

                    //var Stock_no = $("#Stock_no").val("");
                    //var POQty_PerItem = $("#POQty_PerItem").val("");
                    //var POPrice_PerItem = $("#POPrice_PerItem").val("");
                    //var Currency = $("#Currency").val("");
                    //var CurrExch_rate = $("#CurrExch_rate").val("");
                    //var POMargin_Percentage = $("#POMargin_Percentage").val("");
                    //var POExtend_Price = $("#POExtend_Price").val("");
                } else {
                    warrningMessage(data.message, "WARNING");
                }

            },
            error: function (result) {
                //alert("Connection Error Please retry");
            }
        });
    } else {
        infoMessage("Please Enter PO No & Fill all fields", "INFO");
    }


}
function ApprovedPO() {
    var Vendor_code = $("#Vendor_code").val();
    var PO_No = $("#PO_No").val();
    if (Vendor_code != "" && PO_No != "") {
        $.ajax({
            type: "POST",
            url: "/Purchase/ApprovedPO",
            data: {
                PO_No: PO_No
            },
            success: function (data) {
                UpdateMessage(data.message);
            },
            error: function (er) {
                alert(er);
            }
        })

    } else {
        infoMessage("Some Fields left blank", "INFO");
    }
}

/////////////////////////////////////// Calculate Function ////////////////////////////////////////
function ChangeCurrency(value) {

    if (value == "PKRS") {
        $("#CurrExch_rate").val(1);

    }
    if (value == "EURO") {
        $("#CurrExch_rate").val(100);
    }
    if (value == "US $") {
        $("#CurrExch_rate").val(150);
    }
    $("#CurrExch_rate").keyup();
}
function CalculateQty() {

    var Qty_Pack = $("#Qty_Pack").val();
    if (Qty_Pack != "") {

        var r = Qty_Pack * qty;
        $("#POQty_PerItem").val(r);
    }

}
function CalculatePOExtend_Price() {
    //alert(0);
    //var Qty_Pack = $("#Qty_Pack").val();
    var POQty_PerItem = $("#POQty_PerItem").val(); //1
    var POPrice_PerItem = $("#POPrice_PerItem").val(); //191.46
    var POMargin_Percentage = $("#POMargin_Percentage").val(); // 10
    var CurrExch_rate = $("#CurrExch_rate").val(); // 1      // 171.31
    var Qty_Pack = $("#Qty_Pack").val(); // 1      // 171.31

    var Discount = 0;
    var NetAmount = 0;

    //if (POMargin_Percentage == "") {
    //    NetAmount = POQty_PerItem * POPrice_PerItem * CurrExch_rate;
    //} else {
    //    Discount = (POQty_PerItem * POPrice_PerItem * CurrExch_rate) * (POMargin_Percentage / 100);
    //    NetAmount = (POQty_PerItem * POPrice_PerItem * CurrExch_rate) - Discount;
    //}

    //if (POMargin_Percentage == "" && CurrExch_rate == "") {
    //    NetAmount = POQty_PerItem * POPrice_PerItem;
    //}
    //if (POMargin_Percentage == "" && CurrExch_rate != "") {
    //    NetAmount = POQty_PerItem * POPrice_PerItem * CurrExch_rate;
    //}
    //if (CurrExch_rate == "" && POMargin_Percentage != "") {
    //    Discount = (POQty_PerItem * POPrice_PerItem) * (POMargin_Percentage / 100);
    //    NetAmount = (POQty_PerItem * POPrice_PerItem) - Discount;
    //}
    if (CurrExch_rate != "" && POMargin_Percentage != "") {
        Discount = (Qty_Pack * POPrice_PerItem * CurrExch_rate) * (POMargin_Percentage / 100);
        NetAmount = (Qty_Pack * POPrice_PerItem * CurrExch_rate) - Discount;
    }
    //else {
    //    Discount = (POQty_PerItem * POPrice_PerItem ) * (POMargin_Percentage / 100);
    //        NetAmount = (POQty_PerItem * POPrice_PerItem) - Discount;
    //}

    var POExtend_Price = $("#POExtend_Price").val(NetAmount);



}

function calDown() {
    //var Gross_Amount = $("#Gross_Amount").val();
    //var Tax_Percentage = $("#Tax_Percentage").val();
    //var Disc_Percentage = $("#Disc_Percentage").val();

    //var NETAmount = 0
    //var DisAmount = 0
    //var TaxPer = 0

    //DisAmount = Gross_Amount * (Tax_Percentage / 100);
    //TaxPer = Gross_Amount - DisAmount;

    //DisAmount = TaxPer * (Disc_Percentage / 100);
    //NETAmount = TaxPer - DisAmount;
    //var NET_Amount = $("#NET_Amount").val(NETAmount);
    var Gross_Amount = $("#Gross_Amount").val();
    var Tax_Percentage = $("#Tax_Percentage").val();
    var Disc_Percentage = $("#Disc_Percentage").val();

    var NETAmount = 0
    var DisAmount = 0
    var TaxPer = 0

    if (Tax_Percentage == 0 && Disc_Percentage == 0) {
        $("#NET_Amount").val(Gross_Amount);
    } else {

        DisAmount = Gross_Amount * (Tax_Percentage / 100);
        TaxPer = Gross_Amount - DisAmount;

        DisAmount = TaxPer * (Disc_Percentage / 100);
        NETAmount = TaxPer - DisAmount;
        var NET_Amount = $("#NET_Amount").val(NETAmount);
    }

}
function CalculateBottomDisc() {
    var NET_Amount = $("#NET_Amount").val();
    var Disc = $("#Disc_Percentage").val();
    var Tax = $("#Tax_Percentage").val();
    var PO_No = $("#PO_No").val();

    if (Disc != "" || Tax != "" && PO_No != "") {
        $.ajax({
            type: "POST",
            url: "/Purchase/CalculateBottomDisc",
            data: {
                Disc: Disc,
                Tax: Tax,
                NET: NET_Amount,
                PONO: PO_No
            },
            success: function (data) {
                toastr.success(data.message, "UPDATED",
                        options = {
                            "closeButton": true,
                            "debug": false,
                            "progressBar": true,
                            "preventDuplicates": true,
                            "positionClass": "toast-top-center",
                            "onclick": null,
                            "showDuration": "400",
                            "hideDuration": "1000",
                            "timeOut": "7000",
                            "extendedTimeOut": "1000",
                            "showEasing": "swing",
                            "hideEasing": "linear",
                            "showMethod": "fadeIn",
                            "hideMethod": "fadeOut"
                        });
            },
            error: function (result) {
                alert("Connection Error Please retry");
            }
        });
    }

}

/////////////////////////////////////// Other Function ////////////////////////////////////////
function ChangeDateInPO(id) {

    var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    var date = new Date(id);
    date.setDate(date.getDate() + 15);
    var dat = date.getDate();
    var mon = monthNames[date.getMonth()];
    var year = date.getFullYear();
    var todayDate = dat + "/" + mon + "/" + year;
    $("#Delivery_date").val(todayDate);
}

$(document).ready(function () {
    $("#PO_Date").datepicker({
        shownAnim: 'drop',
        calendarWeeks: true,
        numberOfMonth: 1,
        //minDate: minDate,
        dateFormat: 'dd/M/yy',
        changeMonth: true,
        changeYear: true
    });
    var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    var date = new Date();
    var dat = date.getDate();
    var mon = monthNames[date.getMonth()];
    var year = date.getFullYear();
    var todayDate = dat + "/" + mon + "/" + year;
    $("#PO_Date").val(todayDate);


    date.setDate(date.getDate() + 15);
    var dat1 = date.getDate();
    var mon1 = monthNames[date.getMonth()];
    var year1 = date.getFullYear();
    var todayDate1 = dat1 + "/" + mon1 + "/" + year1;
    $("#Delivery_date").val(todayDate1);




    $("#Delivery_date").datepicker({
        shownAnim: 'drop',
        calendarWeeks: true,
        numberOfMonth: 1,
        //minDate: minDate,
        dateFormat: 'dd/M/yy',
        changeMonth: true,
        changeYear: true
    });

    $("#UpdatePODetailsBtn").hide();
    $("#DeletePODetailsBtn").hide();
    $('.chosen-select').chosen({ width: "100%" });

    document.getElementById('circle').style.display = 'none'; //Not Visible

});
function ConvertDate(value) {

    if (value == null) {
        return "";
    }
    else {
        var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
        ];
        var pattern = /Date\(([^)]+)\)/;
        var results = pattern.exec(value);
        var dt = new Date(parseFloat(results[1]));
        var completedate = dt.getDate() + "-" + monthNames[dt.getMonth()] + "-" + dt.getFullYear();
        //"/" + dt.getFullYear().toString().substr(2,2));
        return completedate;
    }
}
function ToJavaScriptDate(value) {

    if (value == null) {
        return "";
    }
    else {
        //var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
        var monthNames = '';

        var pattern = /Date\(([^)]+)\)/;
        var results = pattern.exec(value);
        var dt = '';
        var completedate = '';

        if (results != null) {
            monthNames = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"];
            dt = new Date(parseFloat(results[1]));
            var year = dt.getFullYear();
            var mont = monthNames[dt.getMonth()];
            var day = dt.getDate().toString();
            if (day.length == "1") {
                day = "0" + day;
            } else {
                day = dt.getDate();
            }
            return completedate = year + "-" + mont + "-" + day;
            //return completedate = dt.getFullYear() + "-" + monthNames[dt.getMonth()] + "-" + dt.getDate();
        }
        else {
            monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
            dt = new Date(value);
            var year = dt.getFullYear();
            var mont = monthNames[dt.getMonth()];
            var day = dt.getDate();
            //return completedate = +dt.getDate(); +"-" + monthNames[dt.getMonth()] + "-" + dt.getFullYear();
            return completedate = day + "-" + mont + "-" + year;
        }
    }
}
function resetPO() {
    //$('#LoadData')[0].reset();
    $(".chosen-select").trigger('chosen:updated');
    var Vendor_code = $("#Vendor_code").val('');
    $("#Vendor_code").prop('disabled', false).trigger('chosen:updated').prop('disabled', false);
    var Customer_Code = $("#Customer_Code").val('');
    $("#Customer_Code").prop('disabled', false).trigger('chosen:updated').prop('disabled', false);
    //var PO_No = $("#PO_No").val("");
    var Ship_toCustAddr = $("#Ship_toCustAddr").val("");
    var Currency = $("#Currency").val("PKRS");
    //var Delivery_date = $("#Delivery_date").val("");
    var Delivery_status = $("#Delivery_status").val("N");
    //var PO_Date = $("#PO_Date").val("");
}
function resetPODetails() {
    //var PONo = $("#PONo").val();
    //$("#LoadData1")[0].reset();
    $("#UpdatePODetailsBtn").hide();
    $("#DeletePODetailsBtn").hide();
    $("#SaveBtn").show();
    //$(".chosen-select").trigger('chosen:updated');
    $("#Qty_Pack").val("");
    var Stock_no = $("#Stock_no").val('');
    $("#Stock_no").prop('disabled', false).trigger('chosen:updated').prop('disabled', false);
    var POQty_PerItem = $("#POQty_PerItem").val("");
    var POPrice_PerItem = $("#POPrice_PerItem").val("");
    var Currency1 = $("#Currency1").val("PKRS");
    var CurrExch_rate = $("#CurrExch_rate").val("1");
    var POMargin_Percentage = $("#POMargin_Percentage").val(0);
    var POExtend_Price = $("#POExtend_Price").val("");
}