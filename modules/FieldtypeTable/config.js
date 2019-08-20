/**
 * Inline JS configuration for FieldtypeTable::getConfigInputfields
 *
 */

function FieldtypeTableProcessField() { 
	var defs = $("#table_column_definitions"); 
	defs.children('.InputfieldContent').children('.Inputfields').sortable({
		axis: 'y',
		handle: '> label.InputfieldHeader',
		stop: function(ui, event) { 
			var n = 0; 
			$(this).children().each(function() {
				n++;
				$(this).find('.table_column_sort_value').val(n); 
			}); 
		}
	});
	defs.find('.table_column_definition > .InputfieldHeader').css('cursor', 'move'); 
	/*
	defs.find('.no_options').closest('.Inputfield').hide();
	defs.find('select').change(function() {
		var option = $(this).find(":selected"); 
		var textarea = $(this).parents('.table_column_definition').find('.table_column_options').parents('.InputfieldTextarea'); 
		if(option.text().indexOf('*') > 0) {
			textarea.slideDown('fast');
		} else { 
			textarea.slideUp('fast');
		}
	}).change();
	*/
	$("#table_definition_js").hide();
}

FieldtypeTableProcessField();
