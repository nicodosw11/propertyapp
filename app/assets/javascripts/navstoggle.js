// <script type="text/javascript">
//   $(document).ready(function() {
//   // navigation click actions
//   $('.scroll-link').on('click', function(event){
//     event.preventDefault();
//      $(this).blur(); // allow to realese the focus from the clicked element, the unfocus is prevented by the event.preventDefault() ; otherwise stay in white color untill user click somewhere else
//     var sectionID = $(this).attr("data-id");

//                 //$(".active").removeClass("active");
//                 //$(this).parent().toggleClass("active");
//     scrollToID('#' + sectionID, 750);
//   });
//   // scroll to top action
//   $('.scroll-top').on('click', function(event) {
//     event.preventDefault();
//     $('html, body').animate({scrollTop:0}, 'slow');
//   });
//   // mobile nav toggle
//   $('#nav-toggle').on('click', function (event) {
//     event.preventDefault();
//     $('#main-nav').toggleClass("open");
//   });
// });
// // scroll function
// function scrollToID(id, speed){
//   var offSet = 50;
//   var targetOffset = $(id).offset().top - offSet;
//   //var mainNav = $('#main-nav');
//   $('html,body').animate({scrollTop:targetOffset}, speed);

//   }
//     if (typeof console === "undefined") {
//       console = {
//           log: function() { }
//       };
//   }

// </script>
