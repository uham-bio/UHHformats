$(function() {

    // Add nav class to ToC list for styling
    $('#toc ul').first().addClass('nav');

    // Custom scrollspy: highlight the ToC entry for the section currently in view.
    // Uses a scroll listener that finds the last section whose top has scrolled
    // past a trigger line (20% from viewport top). This reliably highlights the
    // first section at the very top and the last section at the very bottom.
    var tocLinks = $('#toc a');
    if (tocLinks.length > 0) {
        var sections = [];
        tocLinks.each(function() {
            var href = $(this).attr('href');
            if (href && href.charAt(0) === '#') {
                var section = document.getElementById(href.substring(1));
                if (section) sections.push(section);
            }
        });

        if (sections.length > 0) {
            var activateSection = function() {
                var scrollTop = $(window).scrollTop();
                var triggerLine = scrollTop + window.innerHeight * 0.2;
                var current = sections[0]; // default to first

                // Find the last section whose top is above the trigger line
                for (var i = 0; i < sections.length; i++) {
                    if ($(sections[i]).offset().top <= triggerLine) {
                        current = sections[i];
                    }
                }

                // If scrolled to bottom, activate last section
                if (scrollTop + window.innerHeight >= $(document).height() - 20) {
                    current = sections[sections.length - 1];
                }

                var id = current.id;
                $('#toc .active').removeClass('active');
                var link = $('#toc a[href="#' + id + '"]');
                link.parent().addClass('active');
                link.parents('li').addClass('active');
            };

            $(window).on('scroll', activateSection);
            // Run once on load
            activateSection();
        }
    }

    // ToC close button
    $("#toc .toc-close-btn").click(function() {
        $("#toc").slideUp();
    });

    // Fix for dots in level 1 and level 2 titles
    $('body .section.level1').each(function () {
      $(this).attr("id", $(this).attr("id").replace(/\./g, "-"));
    });
    $('body .section.level2').each(function () {
      $(this).attr("id", $(this).attr("id").replace(/\./g, "-"));
    });
    $('#toc ul li a').each(function () {
      $(this).attr("href", $(this).attr("href").replace(/\./g, "-"));
    });

    // Code menu dropdown toggle
    $('.code-menu-btn').on('click', function(e) {
        e.stopPropagation();
        $(this).parent('.code-menu').toggleClass('open');
    });

    // Close dropdown when clicking outside
    $(document).on('click', function() {
        $('.code-menu').removeClass('open');
    });

    // Prevent dropdown from closing when clicking inside it
    $('.code-menu-dropdown').on('click', function(e) {
        e.stopPropagation();
    });

});
