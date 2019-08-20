/**
 * ProcessWire Repeater Matrix Inputfield Javascript
 *
 * Maintains a collection of fields that are repeated for any number of times.
 * 
 * Copyright 2017 by Ryan Cramer 
 *
 */

$(document).ready(function() {
	/*
	$(".InputfieldRepeater").each(function() {
		InputfieldRepeaterInit($(this));
	});
	$(document).on('reloaded', '.InputfieldRepeater', function() {
		InputfieldRepeaterInit($(this));
	});
	*/
	$(document).on('repeateradd', '.InputfieldRepeaterMatrix .InputfieldRepeaterMatrixAddLink', function(e, $addItem) {
		var $addLink = $(this);
		var $label = $addItem.children('label');
		var text = $label.text();
		var html = $label.html();
		var newText = $addLink.attr('data-label');
		var addType = $addLink.attr('data-type');
		html = html.replace(text, newText);
		$label.html(html);
	
		var $input = $addLink.closest('.InputfieldRepeaterMatrixAddItem').find('.InputfieldRepeaterMatrixAddItemsQty');
		var name = $input.attr('data-name') + '_type[]';
		var $input = $("<input />").attr('type', 'hidden').attr('name', name).val(addType);
		$addItem.append($input);
	});

}); 

