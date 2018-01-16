$(window).load(function(){
  if (!(page.controller() === 'registrations' || page.controller() === 'passwords')) { return; }
  document.getElementById("user_password").onkeyup = checkPasswordCompliance;
})


function checkPasswordCompliance() {
  // Read the password
  var val = document.getElementById("user_password").value;
  //check length
  var matches = val.length;
  if (matches>7) {
      document.getElementById("password_length").classList.add("password_compliant");
  }
  else {
      document.getElementById("password_length").classList.remove("password_compliant");
  }
  //check one smallcap letter
  var matches = val.match(/[a-z]/);
  if (matches != null) {
      document.getElementById("password_smallcapletter").classList.add("password_compliant");
  }
  else {
      document.getElementById("password_smallcapletter").classList.remove("password_compliant");
  }
  //check one cap letter
  var matches = val.match(/[A-Z]/);
  if (matches != null) {
      document.getElementById("password_capletter").classList.add("password_compliant");
  }
  else {
      document.getElementById("password_capletter").classList.remove("password_compliant");
  }
  //check one digit
  var matches = val.match(/[0-9]/);
  if (matches != null) {
      document.getElementById("password_digit").classList.add("password_compliant");
  }
  else {
      document.getElementById("password_digit").classList.remove("password_compliant");
  }
}
