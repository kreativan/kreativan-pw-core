$(document).ready(function () {

    // add button
    var generateSitemapBtn = $('<button type="button" id="generateSitemap" class="ui-button ui-button-text" style="margin-left: 10px;"><i class="fa fa-refresh"></i> <span>Generate sitemap</span></button>');

    $('#Inputfield_submit_save_module').after(generateSitemapBtn);

    if (config && config.MarkupSitemapXML_generateSitemap) {
        generateSitemap(generateSitemapBtn, false);
    }

    $('#generateSitemap').click(function () {
        generateSitemap(generateSitemapBtn);
        return false;
    });

    // notify user to save settings if modified
    $('#ModuleEditForm').bind('input change', function () {
        changeStatus(generateSitemapBtn, 'needsave');
    });

});

function generateSitemap(obj, showProcess) {

    // disable process spinner if request comes from module submit
    if (showProcess !== false) {
        changeStatus(obj, 'processing');
    }

    // ajax call with "nocache=1" parameter
    $.ajax('/sitemap.xml?nocache=1', {
        success: function (xhr, ajaxOptions, thrownError) {
            changeStatus(obj, 'on');
        },
        error: function (xhr, ajaxOptions, thrownError) {
            changeStatus(obj, 'error');
        }
    });
}


function setButtonText(obj, msg) {
    if (obj) {
        obj.find('span').text(msg);
    }
}

function changeStatus(obj, status) {

    if (!obj) {
        return false;
    }

    var icon = obj.find('i.fa'),
        defaultClassIcon = 'fa fa-refresh',
        infoClass = 'fa fa-info-circle',
        errorClassIcon = 'fa fa-warning',
        spinClass = 'fa fa-spin fa-spinner',
        disabledClass = 'ui-state-disabled';
        errorClass = 'ui-state-error';

    // reset button and icon classes
    obj.removeClass(disabledClass);
    icon.removeAttr('class').addClass(defaultClassIcon);

    if (status === 'on') {
        setButtonText(obj, 'Generate sitemap');
        obj.removeAttr('disabled');

    } else if (status === 'processing') {
        setButtonText(obj, 'Generating sitemap...');
        obj.attr('disabled', true);
        obj.addClass(disabledClass);

        icon.addClass(spinClass);

    } else if (status === 'needsave') {
        setButtonText(obj, 'Submit settings to generate sitemap');
        obj.attr('disabled', true);
        obj.addClass(disabledClass);

        icon.addClass(infoClass);

    } else if (status === 'error') {
        setButtonText(obj, 'An error occurred during sitemap generation');
        obj.removeAttr('disabled');
        obj.addClass(errorClass);
        obj.removeClass('ui-state-default');

        obj.parent().addClass('ui-widget-content');
        icon.addClass(errorClassIcon);
    }
}
