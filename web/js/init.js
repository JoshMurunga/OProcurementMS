(function ($) {
    $(function () {

        $(".button-collapse").sideNav({
            closeOnClick: true
        });
        $(".button-collapse").click(function () {
            $('div[id^=sidenav-overlay]').remove();
        });

        $('.datepicker').pickadate({
            selectMonths: true, // Creates a dropdown to control month
            selectYears: 15, // Creates a dropdown of 15 years to control year,
            today: 'Today',
            clear: 'Clear',
            close: 'Ok',
            closeOnSelect: false, // Close upon selecting a date,
            container: undefined,
            format: 'yyyy-mm-dd'// ex. 'body' will append picker to body
        });

        $('.modal').modal({dismissible: false});
        $('#modal6').modal({
            ready: function (modal, trigger) {
                modal.find('input[name="firstname"]').val(trigger.data('firstname'));
                modal.find('input[name="lastname"]').val(trigger.data('lastname'));
                modal.find('input[name="email"]').val(trigger.data('email'));
                modal.find('input[name="username"]').val(trigger.data('username'));
                modal.find('input[name="department"]').val(trigger.data('department'));
                modal.find('input[name="contact"]').val(trigger.data('contact'));
                modal.find('input[name="userid"]').val(trigger.data('userid'));
            }
        });
        $('#modal7').modal({
            ready: function (modal, trigger) {
                modal.find('input[name="tenderid"]').val(trigger.data('tenderid'));
                modal.find('input[name="title"]').val(trigger.data('title'));
                modal.find('input[name="opendate"]').val(trigger.data('opendate'));
                modal.find('input[name="closingdate"]').val(trigger.data('closingdate'));
                modal.find('textarea[name="description"]').val(trigger.data('description'));
            }
        });
        $('#modal8').modal({
            ready: function (modal, trigger) {
                modal.find('input[name="item"]').val(trigger.data('item'));
                modal.find('input[name="units"]').val(trigger.data('units'));
                modal.find('input[name="unitprice"]').val(trigger.data('unitprice'));
                modal.find('input[name="quantity"]').val(trigger.data('quantity'));
                modal.find('input[name="totalprice"]').val(trigger.data('totalprice'));
                modal.find('input[name="requisitionid"]').val(trigger.data('requisitionid'));
            }
        });
        $('select').material_select();
        $('.collapsible').collapsible();
        $('.parallax').parallax();
        $('.tooltipped').tooltip();

        var url = window.location;
        $('ul.nav a').filter(function () {
            return this.href == url;
        }).parent().addClass('active');

        $('#sucu_select').on('change', function () {
            $('#sucu').val($('#sucu_select').val());
        });

        if ($('#module_supplier').hasClass('active')) {
            $('#dash_module_header').addClass('active');
            $('#dash_module_body').css('display', 'block');
        }

        if ($('#module_approved').hasClass('active')) {
            $('#dash_module_header').addClass('active');
            $('#dash_module_body').css('display', 'block');
        }

        if ($('#module_employee').hasClass('active')) {
            $('#dash_module_header').addClass('active');
            $('#dash_module_body').css('display', 'block');
        }

        if ($('#module_closed').hasClass('active')) {
            $('#dash_module_header').addClass('active');
            $('#dash_module_body').css('display', 'block');
        }

        if ($('#tender_manage').hasClass('active')) {
            $('#tender_manage_header').addClass('active');
            $('#tender_manage_body').css('display', 'block');
        }

        if ($('#tender_bids').hasClass('active')) {
            $('#tender_bids_header').addClass('active');
            $('#tender_bids_body').css('display', 'block');
        }

        if ($('#published_bids').hasClass('active')) {
            $('#tender_bids_header').addClass('active');
            $('#tender_bids_body').css('display', 'block');
        }

        if ($('#tender_awards').hasClass('active')) {
            $('#tender_bids_header').addClass('active');
            $('#tender_bids_body').css('display', 'block');
        }

        if ($('#add_evaluation').hasClass('active')) {
            $('#add_evaluation_header').addClass('active');
            $('#add_evaluation_body').css('display', 'block');
        }

        if ($('#user_manage').hasClass('active')) {
            $('#user_manage_header').addClass('active');
            $('#user_manage_body').css('display', 'block');
        }

        if ($('#department_requisition').hasClass('active')) {
            $('#department_requisition_header').addClass('active');
            $('#department_requisition_body').css('display', 'block');
        }

        if ($('#approved_requisition').hasClass('active')) {
            $('#department_requisition_header').addClass('active');
            $('#department_requisition_body').css('display', 'block');
        }

        if ($('#declined_requisition').hasClass('active')) {
            $('#department_requisition_header').addClass('active');
            $('#department_requisition_body').css('display', 'block');
        }

        if ($('#module_notification').hasClass('active')) {
            $('#module_notification_header').addClass('active');
            $('#module_notification_body').css('display', 'block');
        }

        if ($('#module_accept').hasClass('active')) {
            $('#module_notification_header').addClass('active');
            $('#module_notification_body').css('display', 'block');
        }

        if ($('#module_decline').hasClass('active')) {
            $('#module_notification_header').addClass('active');
            $('#module_notification_body').css('display', 'block');
        }

        
    }); // end of document ready
})(jQuery); // end of jQuery name space