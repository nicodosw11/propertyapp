$(document).ready(function(){
  $("#get-infos").submit(function(){
    event.preventDefault();
    var email = $("#email-input").val();
    var url = 'https://person.clearbit.com/v1/people/email/' + email;
    var api = $('#email-input').data('api');
    var bearer = 'Bearer' + ' ' +  api
    $.ajax({
      type: "GET",
      url: url,
      beforeSend: function(xhr) {
        xhr.setRequestHeader("Authorization", bearer)
      },
      success: function(data) {
        // console.log(data);
        $("#avatar").attr("src", data.avatar);
        $("#email").text(data.email);
        $("#bio").text(data.bio);
        $("#company").text(data.employment.name);
        $("#title").text(data.employment.title);
        $("#fullname").text(data.name.fullName);
        $(".card").removeClass("hidden");

        var input = {
          'image_url': data.avatar,
          'full_name': data.name.fullName
        }
        // console.log(input);
        $.ajax({
          url: $('#email-input').data('path'),
          type: 'PUT',
          data: input,
          success: function(data) {
            // console.log(data);
            if(data.user.avatar_url) {
              $("#message").text("Avatar saved!");
            } else {
              $('#message').text("A problem occurred");
            }
          }
        });
      },
      error: function(jqXHR) {
        // console.log(jqXHR);
        $(".card").addClass("hidden");
        var message = JSON.parse(jqXHR.responseText).error.message;
        $(".card-error").text(message).removeClass("hidden");
      }

    });
  });
});
