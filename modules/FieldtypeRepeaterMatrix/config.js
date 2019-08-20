/**
 * ProcessWire ProFields Repeater Matrix config helper (JS)
 *
 * THIS IS PART OF A COMMERCIAL MODULE: DO NOT DISTRIBUTE.
 * This file should NOT be uploaded to GitHub or available for download on any public site.
 *
 * Copyright 2016 by Ryan Cramer
 * ryan@processwire.com
 *
 */

function FieldtypeRepeaterMatrixInitSortable() {
	var items = jQuery("#RepeaterMatrixItems");
	items.children('.InputfieldContent').children('.Inputfields:not(.MatrixItemTemplate)').sortable({
		axis: 'y',
		handle: '> label.InputfieldHeader',
		stop: function(ui, event) {
			var n = 0;
			jQuery(this).children().each(function() {
				jQuery(this).find('.MatrixItemSort').val(n);
				n++;
			});
		}
	});
	items.find('.MatrixItem > .InputfieldHeader .fa-arrows').css('cursor', 'move');
}

jQuery(document).ready(function($) {
	
	var matrixItemTemplate = $('.MatrixItemTemplate');
	var matrixItemTemplateHTML = matrixItemTemplate[0].outerHTML;
	var maxN = ProcessWire.config.RepeaterMatrix.maxN;
	matrixItemTemplate.hide();
	
	$('#MatrixItemAdd').click(function() {
		
		var maxSort = 0;
		$('.MatrixItem:not(.MatrixItemTemplate)').each(function() {
			var sort = parseInt($(this).find('.MatrixItemSort').val());
			if(sort > maxSort) maxSort = sort;
		});
		
		var newItemHTML = matrixItemTemplateHTML;
		maxN++;
		newItemHTML = newItemHTML.replace(/matrixN_/g, 'matrix' + maxN + '_');
		newItemHTML = newItemHTML.replace('{N}', maxN);
		var newItem = $(newItemHTML);
		newItem.hide();
		newItem.removeClass('InputfieldStateCollapsed collapsed1 MatrixItemTemplate');
		newItem.wrap('<div></div>');
		matrixItemTemplate.before(newItem.parent());
		InputfieldsInit(newItem.parent());
		newItem.unwrap();
		var asmConfig = ProcessWire.config.matrixN_fields;
		asmConfig.editLink = asmConfig.editLink.replace(/matrixN/g, 'matrix' + maxN);
		ProcessWire.config['matrix' + maxN + '_fields'] = asmConfig;
		
		newItem.slideDown('fast', function() {
			newItem.find('.MatrixItemSort').val(maxSort + 1);
			newItem.find('.Inputfield').trigger('reloaded', [ 'FieldtypeRepeaterMatrixAddType' ]);
			FieldtypeRepeaterMatrixInitSortable();
		});
		
		return false;
	});
	
	$('.MatrixItem').each(function() {
		var $item = $(this);
		var $header = $item.children('.InputfieldHeader');	
		var $icon = $("<i class='MatrixItemDeleteAction fa fa-trash'></i>").css({
			float: 'right',	
			position: 'relative',
			top: '5px',
			right: '5px'
		});
		$header.append($icon);
	});
	
	$(document).on('click', '.MatrixItemDeleteAction', function() {
		var $item = $(this).closest('.MatrixItem');
		var $delete = $item.find('.MatrixItemDelete');
		if($delete.val() == '1') {
			$item.removeClass('MatrixItemDeletePending');
			$delete.val('');
		} else {
			$item.addClass('MatrixItemDeletePending');
			$delete.val('1');
		}
		return false;
	});
	
	$("#wrap_repeaterFields").hide();
	
	FieldtypeRepeaterMatrixInitSortable();
});