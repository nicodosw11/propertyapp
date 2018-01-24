$(document).ready(function() {
  $('.chosen-select').chosen({
    allow_single_deselect: true,
    no_results_text: 'No results matched',
    width: '100%'
  });
  $(".chosen-select-users").chosen().change(
    function(){
      var user = $('option:selected',this);
      var user_url = user.attr('data-url');
      $.getScript(user_url)
    }
  );
});

