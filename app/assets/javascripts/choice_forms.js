
  
  $('.new_choice').on('ajax:success', function(event, data){

    console.log("You tried to add a choice");
  });


  $(document).on('ajax:success', '.choice_vote', function(event, data){
    $(this).find('.vote_count').text('Votes: ' + data.votes); 
  }); 
