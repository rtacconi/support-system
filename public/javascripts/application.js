$(document).ready(function() {
  $.ajaxSetup ({
    cache: false  
  });
  $('#issue_status').change(function() {
    var status = this.value;
    $.ajax({
       type: "POST",
       url: '/admin/issues/1/change_status',
       data: {issue_status: status},
       success: function(){
         alert( "Status changed" );
       }
     });
  });
});