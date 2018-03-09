(function($) {
    'use strict';

    $.widget("ui.base", {

        _init: function() {
            this.init();
        },

        init: function() {
            var me = this,
                element = me.element;

            //fancybox
            $(".lightbox").fancybox({
                'openEffect': "fade",
                'autoSize': true,
                'autoScale': false,
                'margin': 50,
                'autoCenter': false,
                'autoResize': false,
                'fitToView': false,
                'tpl': {
                        error    : '<p class="fancybox-error"></p>'
                },
                'helpers': {
                    'overlay': {
                        'css': {
                            'background': 'rgba(112, 27, 57, 0.75)'
                        },
                        locked: false
                    },
                    media: {},
                    'title': {
                        type: 'inside'
                    }
                },
                afterShow: function() {

                    var el = $(this.element),
                        fbInner = $(".fancybox-inner");

                    fbInner.css({
                        'overflow':'hidden',
                        'width':'100%',
                        'padding':'0px'
                    });

                    if (el.hasClass('default-video-player')) {
                        var url = el.data('video-url'),
                            height = el.data('video-height'),
                            width = el.data('video-width'),
                            videoHTML = '<video width="' + width +'" height="' + height + '" controls>' +
                              '<source src="' + url + '">' +
                              '</video>';

                        $('.fancybox-inner').hide();
                        $(".fancybox-inner").html(videoHTML);
                        $('.fancybox-inner').show();
                        $.fancybox.update();
                    }
                }
            });

            $(document).on('click', $.proxy(me._documentClick, me));
            $(document).on('touchend', $.proxy(me._documentClick, me));
            $(document).on('keyup', $.proxy(me._documentKeyUp, me));

        },

        _documentClick: function(event) {

            var me = this;

            if (!$(event.target).closest('form[role="search"]').length) {

                var searchWidgets = $(':ui-search_suggestions'),
                    isOpen = false;

                $.each(searchWidgets, function(i, widget) {

                    var inst = $(widget).data('ui-search_suggestions');
                    if (inst && inst.isVisible()) {
                        isOpen = true;
                    }
                });

                if (isOpen) {
                    $(document).trigger('search:close');
                }
            }

        },

        _documentKeyUp: function(event) {

            if (event.keyCode == 27) {
                $(document).trigger('search:close');
                $(document).trigger('menu:close');
            }
        }


    });
})(jQuery);
