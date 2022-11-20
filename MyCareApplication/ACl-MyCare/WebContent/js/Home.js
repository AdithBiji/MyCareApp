$(window).scroll(function() {
    var header = $(document).scrollTop();
    var headerHeight = $(".header").outerHeight();
    var firstSection = $(".main-container section:nth-of-type(1)").outerHeight();
    if (header > headerHeight) {
      $(".header").addClass("fixed");
    } else {
      $(".header").removeClass("fixed");
    }
    if (header > firstSection) {
      $(".header").addClass("in-view");
    } else {
      $(".header").removeClass("in-view");
    }
  });

  function parallax_height() {
    var scroll_top = $(this).scrollTop();
    var sample_section_top = $(".sample-section").offset().top;
    var header_height = $(".sample-header-section").outerHeight();
    $(".sample-section").css({ "margin-top": header_height });
    $(".sample-header").css({ height: header_height - scroll_top });
  }
  parallax_height();
  $(window).scroll(function() {
    parallax_height();
  });
  $(window).resize(function() {
    parallax_height();
  });


function parallax_height() {
  var scroll_top = $(this).scrollTop();
  var sample_section_top = $(".sample-section").offset().top;
  var header_height = $(".sample-header-section").outerHeight();
  $(".sample-section").css({ "margin-top": header_height });
  $(".sample-header").css({ height: header_height - scroll_top });
}
parallax_height();
$(window).scroll(function () {
  parallax_height();
});
$(window).resize(function () {
  parallax_height();
});
//# sourceURL=pen.js
   


// LOGIN

  		var check = function()
	{
	  if (document.getElementById('password').value == document.getElementById('confirm_password').value)
	  {
		document.getElementById('message').style.color = 'green';
		document.getElementById('message').innerHTML = 'passwords match';
	  } 
	  else
	  {
		document.getElementById('message').style.color = 'red';
		document.getElementById('message').innerHTML = 'passwords dont match';
	  }
	}

  function checkPh(evt)
	{
		var pn = (evt.which) ? evt.which : event.keyCode 
		if(pn < 48 || pn > 57)
		{
			return false;
		}
		else
		{
			return true;	
		}
		
	}
