
function SaveMessage(message) {
    toastr.success(message, "SAVED",
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
}
function UpdateMessage(message) {
    toastr.success(message, "UPDATED",
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
}
function warrningMessage(message, wa) {
    toastr.warning(message, wa,
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
}
function infoMessage(message, wa) {
    toastr.info(message, wa,
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
     }
 );
}

function DeleteMessage(message) {
    toastr.error(message, "DELETED",
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
        }
    );
}

function DeleteMessageCus(message,d) {
    toastr.error(message, d,
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
        }
    );
}
