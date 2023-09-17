// app/assets/javascripts/blogs.js

$(document).on('ajax:success', '.like-button', function(event, data) {
    var blogId = $(this).data('blog-id');
    var likeCountElement = $('#like-count-' + blogId);
  
    // Update the like count element with the new like count
    likeCountElement.text(data.likes);
  });

 // app/assets/javascripts/blogs.js

$(document).on('ajax:success', '.dislike-button', function(event, data) {
    var blogId = $(this).data('blog-id');
    var dislikeCountElement = $('#dislike-count-' + blogId);
  
    // Update the dislike count element with the new dislike count
    dislikeCountElement.text(data.dislikes);
  });
  