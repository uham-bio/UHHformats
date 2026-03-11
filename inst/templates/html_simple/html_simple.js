$(function() {

    // ScrollSpy also requires that we use a Bootstrap nav component.
    // If ToC should collapse uncomment the following:
    $('#toc ul').first().addClass('nav');

    $('body').scrollspy({target: '#toc'});

    $("#toc .btn-close").click(function() {
      $("#toc").slideUp();
    })

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

});
