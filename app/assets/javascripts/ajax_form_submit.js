// Place this code in a JavaScript file that's loaded in your layout or view
$(document).on('submit', '[data-remote="true"]', function(event) {
  event.preventDefault();
  var $form = $(this);
  var formData = $form.serialize();

  $.ajax({
    type: $form.attr('method'),
    url: $form.attr('action'),
    data: formData,
    dataType: 'json', // Expect JSON response
    success: function(response) {
      if (response.status === 'added') {
        // Handle success message or UI update for item added
      } else if (response.status === 'updated') {
        // Handle success message or UI update for item updated
      } else if (response.status === 'removed') {
        // Handle success message or UI update for item removed
      }
    }
  });
});
