
$(document).on('ajax:success', '.new_choice', function(event, data){
   var newChoice = $('.choices-listing-template').find(':first-child')[0];
   newChoice = $(newChoice);
   newChoice.find('form').attr('action', data.path);
   newChoice.find('form h1 label').text(data.choice.content);
   $('.choices-listing').append(newChoice);
});


// $(document).on('ajax:success', '.choice_vote', function(event, data){
//   $(this).parent().parent().parent().find('.vote_count').text(data.votes); 
// }); 

// $(document).on('ajax:success', '.new_comment', function(event, data){
//  console.log(data);
//  var newComment = $($('h3.comment')[0]);
//  newComment.text(data.content);
//  $('h3.comment:last-child')after(newComment);
// });

// $(document).on('click','.new_comment_button', function(event){
// 	event.preventDefault;
// 	$('.comment_form').removeClass('hidden');
// 	$(this).detach();
// });
