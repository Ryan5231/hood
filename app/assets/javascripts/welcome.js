$(document).on('click', '#log-in a', function(e){
  e.preventDefault();
    $('#sign-up-form').addClass('hidden')
    $('#log-in-form').toggleClass('hidden');
    console.log('sjlfjsal;')
});


$(document).on('click', '#sign-up1 a', function(e){
  e.preventDefault();
    $('#log-in-form').addClass('hidden');
    $('#sign-up-form').toggleClass('hidden');
    console.log('sjlfjsal;')
});