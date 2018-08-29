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
        $('select').material_select();
        $('.collapsible').collapsible();
        $('.parallax').parallax();

        var url = window.location;
        $('ul.nav a').filter(function () {
            return this.href == url;
        }).parent().addClass('active');

        $('#sucu_select').on('change', function () {
            $('#sucu').val($('#sucu_select').val());
        });
        
        if($('#module_supplier').hasClass('active')){
            $('#dash_module_header').addClass('active');
            $('#dash_module_body').css('display', 'block');
        }
        
        if($('#tender_manage').hasClass('active')){
            $('#tender_manage_header').addClass('active');
            $('#tender_manage_body').css('display', 'block');
        }
        
        if($('#tender_bids').hasClass('active')){
            $('#tender_bids_header').addClass('active');
            $('#tender_bids_body').css('display', 'block');
        }
        
        if($('#add_evaluation').hasClass('active')){
            $('#add_evaluation_header').addClass('active');
            $('#add_evaluation_body').css('display', 'block');
        }
        
        if($('#user_manage').hasClass('active')){
            $('#user_manage_header').addClass('active');
            $('#user_manage_body').css('display', 'block');
        }
        
        if($('#department_requisition').hasClass('active')){
            $('#department_requisition_header').addClass('active');
            $('#department_requisition_body').css('display', 'block');
        }

    }); // end of document ready
})(jQuery); // end of jQuery name space