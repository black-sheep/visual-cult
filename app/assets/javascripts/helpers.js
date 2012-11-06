function openMenu(openMenu)
{
    menu = '#' + openMenu;
    $(menu).slideToggle(250);
}

function showLayer(numSlider, link)
{
    activeLink(link);

    layer = "#layer" + numSlider;
    dlayer = "#dlayer" + numSlider;

    $("#layera").hide();
    $("#layerb").hide();
    $("#layerc").hide();

    $("#dlayera").hide();
    $("#dlayerb").hide();
    $("#dlayerc").hide();

    $(layer).show();
    $(dlayer).show();
}

function activeLink(link)
{
    $('.selected').removeClass('selected').addClass('non-selected');
    $(link).attr('class', 'selected');
}

function readURL(input, div)
{
    if (input.files && input.files[0])
    {
        var reader = new FileReader();
        var curDiv = '#' + div;
        reader.onload = function (e)
        {
            $(curDiv).attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}