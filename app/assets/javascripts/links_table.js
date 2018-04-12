// Toggle tables on button click
$(document).on('turbolinks:load', function() {
  $('.link-button').click(function(){
    var $this = $(this);
    $this.toggleClass('.clicked-button');
    if($this.hasClass('.clicked-button')){
      $this.text('Back to tags');         
    } else {
      $this.text('Edit links');
    }
    $('.tagcloud05').toggle();
    $('.links-form').toggle();
  });
});