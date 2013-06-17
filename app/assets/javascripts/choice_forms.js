  
$(document).on('ajax:success', '.new_choice', function(event, data){
   var newChoice = $('.choice_template form');
   newChoice.attr('action', data.path);
   $(newChoice.find('label')[0]).text(data.choice.content);
   $(newChoice.find('label')[1]).text('Votes: 0');
   $('.choices').append(newChoice);
  });


  $(document).on('ajax:success', '.choice_vote', function(event, data){
    $(this).find('.vote_count').text('Votes: ' + data.votes); 
  }); 
