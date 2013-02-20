jQuery ->
	$('#question_tag_list').autocomplete
		source: $('#question_tag_list').data('autocomplete-source')