$(document).on('click', '.like-action', function(event) {
  event.preventDefault();
  const blogId = $(this).data('blog_id');
  const action = $(this).data('action');

  $.ajax({
    url: `/blogs/${blogId}/${action}`,
    type: 'POST', // or 'DELETE' for unliking
    dataType: 'json',
    success: function(data) {
      if (data.status === 'success') {
        // Update the like count on the current page
        $('#like-count').text(data.likes_count + ' Likes');
      } else {
        alert(data.message);
      }
    },
    error: function() {
      alert('Something went wrong.');
    }
  });
});
