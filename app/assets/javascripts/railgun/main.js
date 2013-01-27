$("document").ready(function(){
	$(".resource_listing").on("ajax:success", ".resource-delete", function(event, data){
		$(".resource_listing tr[role='"+data.id+"']").fadeTo(400, 0)
		$(".resource_listing tr[role='"+data.id+"'] td").slideUp(400, function(){
			$(this).remove();
		})
	});
})