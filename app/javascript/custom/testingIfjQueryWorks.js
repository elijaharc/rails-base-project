
// Testing if jQuery works
    jQuery(window).on('load', function () {
    $('.preloader').fadeOut();
    });

    window.onload = function() {
        if (window.$) {  
            // jQuery is loaded  
            alert("Yeah!");
        } else {
            // jQuery is not loaded
            alert("Doesn't Work");
        }
    }