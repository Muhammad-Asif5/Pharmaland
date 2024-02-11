using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;

namespace ZUIS
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            // create an object of ScriptBundle and 
            // specify bundle name (as virtual path) as constructor parameter 
            ScriptBundle StyleBundle = new ScriptBundle("~/bundles/Styles");
            
            //use Include() method to add all the script files with their paths 
//            <script src=""></script>
//<script src=""></script>


            StyleBundle.Include(
                                "~/Content/bootstrap/css/bootstrap.min.css",
                                "~/Content/DataTables/css/jquery.dataTables.min.css",
                                "~/Content/DataTables/css/dataTables.bootstrap.min.css",
                                "~/Content/DataTables/css/responsive.bootstrap.min.css",
                                "~/David/css/plugins/chosen/bootstrap-chosen.css",
                                "~/David/css/plugins/summernote/summernote-bs4.css",
                                "~/David/css/plugins/toastr/toastr.min.css",
                                "~/David/css/plugins/sweetalert/sweetalert.css",
                                "~/David/css/animate.css",
                                "~/Content/spiner.css",
                                "~/Content/spiner1.css"
                              );
            bundles.Add(StyleBundle);

            ScriptBundle scriptBndle = new ScriptBundle("~/bundles/Scripts");
            scriptBndle.Include(
                
                "~/Scripts/DataTables/jquery.dataTables.min.js",
                "~/Scripts/DataTables/dataTables.buttons.min.js",
                "~/Scripts/DataTables/buttons.bootstrap.min.js",
                "~/Scripts/DataTables/buttons.flash.min.js",
                "~/Scripts/DataTables/jszip.min.js",
                "~/Scripts/DataTables/pdfmake.min.js",
                "~/Scripts/DataTables/vfs_fonts.js",
                "~/Scripts/DataTables/buttons.html5.min.js",
                "~/Scripts/DataTables/buttons.print.min.js",
                "~/Scripts/DataTables/dataTables.select.min.js",
                "~/Scripts/DataTables/dataTables.responsive.min.js",
                "~/Scripts/DataTables/responsive.bootstrap.min.js",
                "~/David/js/plugins/chosen/chosen.jquery.js",
                "~/David/js/plugins/toastr/toastr.min.js",
                "~/David/js/plugins/sweetalert/sweetalert.min.js",
                "~/Content/bootstrap/js/jquery-3.3.1.min.js",
                "~/Content/bootstrap/js/bootstrap.min.js"
                );

            //Add the bundle into BundleCollection
            
            bundles.Add(scriptBndle);

            BundleTable.EnableOptimizations = true;
        }
    }
}