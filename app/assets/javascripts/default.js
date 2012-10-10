!function(w, $, undefined){
$(function(){
	/* some style fints */
	$("html").addClass("js");

	function checkAttr(el, attr) {
		var test = document.createElement(el);
		$.support[attr] = false;
		if(attr in test) {
			$.support[attr] = true;
		}
	}
	checkAttr("input", "placeholder");

	if(!$.support.placeholder) {
		var active = document.activeElement;
		$(':text').focus(function () {
			var $t = $(this);
			if ($t.attr('placeholder') != '' && $t.val() == $t.attr('placeholder')) {
				$t.val('').removeClass('hasPlaceholder');
			}
		}).blur(function () {
			if ($t.attr('placeholder') != '' && ($t.val() == '' || $t.val() == $t.attr('placeholder'))) {
				$t.val($t.attr('placeholder')).addClass('hasPlaceholder');
			}
		});
		$(':text').blur();
		$(active).focus();
		$('form').submit(function () {
			$(this).find('.hasPlaceholder').each(function() {
				$(this).val('');
			});
		});
	}

	$("ul.nav li").bind("mouseenter", function(){
		$(this).addClass("hovered");
	}).bind("mouseleave", function(){
		$(this).removeClass("hovered");
	});

	$(".gallery").each(function(){
		var $t = $(this);
		$t.imagesLoaded(function(){
			$t.masonry({
				// options
				singleMode: false,
				itemSelector: 'li',
				resizeable: true,
				isAnimated: !Modernizr.csstransitions,
				animationOptions: function(){
					duration: 700
				}
			});
		});
	});
});
}(window, jQuery);

// Open/Close PopUp

function expandit(id) {
    obj = document.getElementById(id);
    if (obj.style.display == "none") obj.style.display = "";
    else obj.style.display = "none";
}

function subscribe(id) {
    obj = document.getElementById(id);
    pic = document.getElementById("dropdown");
    if(obj.style.display == "none") {
        obj.style.display = "";
        pic.className = "ico-down";
    }
    else {
        obj.style.display = "none";
        pic.className = "ico-up";
    }
}

$(document).ready(function(){

    var params = {
    			changedEl: ".lineForm select",
    			visRows: 5,
    			scrollArrows: false
    		}

    		cuSel(params);

    $('#slider4').tinycarousel({ controls: false, pager: true, animation: false });

});

/* ----- ChangeIMG Script------ */
function changeImg1 (id) {
    document.getElementById(id).src = "i/_tmp/pic1-big.jpg";
}
function changeImg2 (id) {
    document.getElementById(id).src = "i/_tmp/pic2-big.jpg";
}
function changeImg3 (id) {
    document.getElementById(id).src = "i/_tmp/pic3-big.jpg";
}