
window.initializeCodeFolding = function(show) {

  // handlers for show-all and hide all
  $("#rmd-show-all-code").click(function() {
    $('div.r-code-collapse').each(function() {
      $(this).addClass('show');
      $(this).prev().find('.code-folding-btn span').text('Hide');
    });
  });
  $("#rmd-hide-all-code").click(function() {
    $('div.r-code-collapse').each(function() {
      $(this).removeClass('show');
      $(this).prev().find('.code-folding-btn span').text('Code');
    });
  });

  // index for unique code element ids
  var currentIndex = 1;

  // select all R code blocks
  var rCodeBlocks = $('pre.r, pre.python, pre.bash, pre.sql, pre.cpp, pre.stan, pre.julia');
  rCodeBlocks.each(function() {

    // create a collapsable div to wrap the code in
    var div = $('<div class="r-code-collapse"></div>');
    if (show || $(this)[0].classList.contains('fold-show'))
      div.addClass('show');
    var id = 'rcode-643E0F36' + currentIndex++;
    div.attr('id', id);
    $(this).before(div);
    $(this).detach().appendTo(div);

    // add a show code button right above
    var showCodeText = $('<span>' + (show ? 'Hide' : 'Code') + '</span>');
    var showCodeButton = $('<button type="button" class="code-folding-btn"></button>');
    showCodeButton.append(showCodeText);

    div.before(showCodeButton);

    // toggle on click
    showCodeButton.on('click', function() {
      var target = $('#' + id);
      if (target.hasClass('show')) {
        target.removeClass('show');
        showCodeText.text('Code');
      } else {
        target.addClass('show');
        showCodeText.text('Hide');
      }
    });
  });

}
