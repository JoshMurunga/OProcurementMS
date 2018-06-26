(function ($) {
    $(function () {

        $(".button-collapse").sideNav({
            closeOnClick: true
        });
        $(".button-collapse").click(function () {
            $('div[id^=sidenav-overlay]').remove();
        });
        
        $('select').material_select();
        $('.collapsible').collapsible();
        $('.parallax').parallax();
        $('.tooltipped').tooltip({delay: 50});

        var url = window.location;
        $('ul.nav a[href="' + url + '"]').parent().addClass('active');
        $('ul.nav a').filter(function () {
            return this.href == url;
        }).parent().addClass('active');

       

    }); // end of document ready
})(jQuery); // end of jQuery name space