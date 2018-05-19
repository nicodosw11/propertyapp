$(function() {
  $(document).on("click","#investments th a, #investments .pagination a", function() {
    $.getScript(this.href);
    return false;
  });
  $("#investments_search input").keyup(function() {
    $.get($("#investments_search").attr("action"), $("#investments_search").serialize(), null, "script");
    return false;
  });
});


