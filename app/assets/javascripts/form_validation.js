var EVENTS = 'focusout keyup change';
var EMAIL_PATTERN =/^([^\.@]+)(\.([^@]+))?@([^@]+)\.([^@]+)$/;
// var EMAIL_PATTERN =/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i;
var PASSWORD_PATTERN = /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)/;

function checkIsFilled(input, add_class) {
  var filled = false;
  if ($(input).attr('type') == "checkbox") {
    filled = $(input).is(':checked');
  } else if ($(input).is(':focus')) {
    filled = true;
  } else {
    filled = $(input).val().length > 0;
  }

  if (add_class) {
    addClass(input, filled);
  }

  return filled;
}

function checkEmail(input) {
  var email = $(input).val();
  addClass(input, email.match(EMAIL_PATTERN));
}

function checkPassword(input) {
  var password = $(input).val();
  addClass(input, password.match(PASSWORD_PATTERN));
}

function checkPasswordConfirmation(input) {
  var password = $('#user_password').val();
  var password_confirmation = $(input).val();
  addClass(input, password_confirmation === password);
}

function addClass(input, remove) {
  var form_group = $(input).parents('.form-group');
  if (remove) {
    form_group.removeClass('has-error');
    if ($(input).val().length > 0) {
      form_group.addClass('has-success');
    }
  } else {
    form_group.addClass('has-error').removeClass('has-success');
  }

  activateButton();
}

function activateButton() {
  var button = $('button[type=submit]');
  if ($('.form-group.has-error').length === 0) {
    var enable = true;
    $('form input, form textarea').each(function(i, item) {
      if (!checkIsFilled(item, false)) {
        enable = false;
        return;
      }
    });
    if (enable) {
      button.removeAttr('disabled').html(I18n['Submit']);
      return;
    }
  }
  button.attr('disabled', 'disabled').html(I18n['please-fill-all-fields']);
}

function onReady() {
  $('form input, form textarea').on(EVENTS, function(e) {
    if (e.target.id != 'user_email' &&
        e.target.id != 'user_password') {
      checkIsFilled(e.target, true);
    }
  });

  $('#user_email').on(EVENTS, function(e) {
    checkEmail(e.target);
  });

  $('#user_password').on(EVENTS, function(e) {
    checkPassword(e.target);
  });

  $('#user_password_confirmation').on(EVENTS, function(e) {
    checkPasswordConfirmation(e.target);
  });
}

// $(document).ready(onReady);
$(document).ready(function() {
// document.addEventListneer('DOMContentLoaded', function() {
  // console.log(page.controller());
  if (!(page.controller() === 'registrations' && page.action() === 'new')) { return; }
  return onReady();
});
