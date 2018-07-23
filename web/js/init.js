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
        $('select').material_select();
        $('.collapsible').collapsible();
        $('.parallax').parallax();

        var url = window.location;
        $('ul.nav a[href="' + url + '"]').parent().addClass('active');
        $('ul.nav a').filter(function () {
            return this.href == url;
        }).parent().addClass('active');



    }); // end of document ready
})(jQuery); // end of jQuery name space