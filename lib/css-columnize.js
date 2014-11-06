(function () {
    function callback() {
        (function ($) {
            var h = $(window).height() + 'px',
                w = '18em',
                g = '2em',
                r = '1px solid #eee',
                most = 0,
                content = $('body');
            if ($('#content').length == 1) {
                content = $('#content');
            } else {/* find div with most p tags */
                $('div > p').parent().each(function (i, elm) {
                    var $elm = $(elm);
                    var l = $elm.find('p').length;
                    if (l > most) {
                        content = $elm;
                        most = l
                    }
                });
            }
            content.hide();
            content.css({'-webkit-column-width': w,
                '-webkit-column-gap': g,
                '-webkit-column-rule': r,
                '-moz-column-width': w, '-webkit-column-gap': g,
                '-webkit-column-rule': r,
                'column-width': w,
                'column-gap': g,
                'column-rule': r,
                'height': h,
                'overflow-y': 'hidden'});
            content.fadeIn();
            $('body').append($('<style />').text('img{max-width:100% !important;height:auto !important}'));
        })(jQuery);
    }

    if (!jQuery) {
        var s = document.createElement("script");
        s.src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js";
        if (s.addEventListener) {
            s.addEventListener("load", callback, false)
        } else if (s.readyState) {
            s.onreadystatechange = callback
        }
        document.body.appendChild(s);
    } else {
        callback();
    }
})();