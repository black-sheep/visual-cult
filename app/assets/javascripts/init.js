$(document).ready(function(){

		$("*[rel='tooltip']").tooltip();
		$("a[rel=popover]").popover({ placement: "left" });
        $('.tabs a:last').tab('show');


 });

//==== SHOW/HIDE FILTER ==========================================//
        $('.js-show-filter').click(function(){;
            $('.superfilter').fadeToggle('fast');
        });

    //==== SEARCH SAMPLE =============================================//
        $('.js-search-sample em').click(function(){;
            $('.filter > div ins input').val($(this).text());
        });

    //==== ONTOP button ==============================================//
        $(window).scroll(function() {
                    if ($(this).scrollTop() != 0) {
                        $('.ontop').fadeIn();
                    } else {
                        $('.ontop').fadeOut();
                    }
                });
            $('.ontop').click(function() {
                $('body,html').animate( {
                    scrollTop : 0
                }, 300);
        });