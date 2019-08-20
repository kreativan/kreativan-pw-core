/**
 * ProcessWire Table Inputfield
 *
 * Field that lets you define a database table of custom inputs. 
 *
 * Part of the ProFields package
 * Please do not distribute. 
 * 
 * Copyright 2017 by Ryan Cramer
 *
 * https://processwire.com
 * 
 *
 */

function InputfieldTable() {

	/**
	 * Debug mode
	 * @type {boolean}
	 * 
	 */
	var debug = true; 

	/**
	 * Timer used by setTimeout during search/filters
	 * 
	 */
	var searchTimer = null;

	/**
	 * Log message to console
	 * 
	 * @param x
	 * 
	 */
	function consoleLog(x) {
		if(debug) console.log(x);
	}

	/**
	 * Given an Inputfield, return the table.InputfieldTable
	 *
	 * @param $inputfield
	 *
	 */
	function getTable($inputfield) {
		if(!$inputfield.hasClass('Inputfield') || !$inputfield.hasClass('InputfieldTable')) {
			$inputfield = getInputfield($inputfield);
		}
		return $inputfield.find('table.InputfieldTable:not(.InputfieldTableSearch)');
	}

	/**
	 * Get all table.InputfieldTable elements in the document
	 *
	 * @returns {*|jQuery|HTMLElement}
	 *
	 */
	function getAllTables() {
		return $("table.InputfieldTable:not(.InputfieldTableSearch)");
	}

	/**
	 * Given a $table (or any element within an Inputfield) return the corresponding .Inputfield
	 *
	 * @param $table
	 *
	 */
	function getInputfield($table) {
		if($table.is('.Inputfield.InputfieldTable')) return $table;
		return $table.closest('.Inputfield.InputfieldTable');
	}

	/**
	 * Given an Inputfield (or any item within) return the field name
	 * 
	 * @param $inputfield
	 * @returns string
	 * 
	 */
	function getFieldName($inputfield) {
		if(!$inputfield.hasClass('Inputfield')) $inputfield = $inputfield.closest('.Inputfield.InputfieldTable'); 
		return $inputfield.attr('id').replace('wrap_Inputfield_', '');
	}

	/**
	 * Get all visible rows for the given table
	 *
	 * @param $table May be table, or any item within the Inputfield
	 *
	 */
	function getRows($table) {
		if(!$table.is('table') || $table.hasClass('InputfieldTableSearch')) {
			$table = getTable($table);
		}
		return $table.children('tbody').children('tr:not(.InputfieldTableRowTemplate)');
	}

	/**
	 * Make the given table drag/drop sortable
	 * 
	 * @param $table
	 * 
	 */
	function initSortable($table) {
		
		if(!$table.is("tbody")) $table = $table.children("tbody");
		
		$table.sortable({
			axis: 'y',
			handle: '.InputfieldTableRowSortHandle',
			stop: function(event, ui) {
				var n = 0;
				$(this).find(".InputfieldTableRowSort").each(function() {
					n++;
					if(n == 1) return; // skip template row
					$(this).val(n - 1);
				});
				updateRowNumbers($table);
				var $inputfield = getInputfield($table);
				$inputfield.addClass('InputfieldStateChanged');
			}
		});
		
		// if there is only a template row, then don't show the table at all (to hide the header)
		var numRows = $table.find('tr').length;
		if(numRows == 1) $table.parent('table').hide();
	}

	/**
	 * Update the number assigned to each row (for multi-table, non-paginated layouts only)
	 * 
	 * @param $table
	 * 
	 */
	function updateRowNumbers($table) {
		var n = 0;
		$table.find("td > .rowNum").each(function() {
			if(!$(this).is(":visible")) return;
			$(this).text(++n);
		});
	}

	/**
	 * Update attribute for given item to reflect the given rowNum
	 * 
	 * @param $item
	 * @param attrName
	 * @param rowNum
	 * 
	 */
	function updateAttribute($item, attrName, rowNum) {
		var attrVal = $item.attr(attrName);
		if(typeof attrVal == "undefined" || attrVal.length == 0) return;
		attrVal = attrVal.replace(/_0_/, '_' + rowNum + '_');
		$item.attr(attrName, attrVal);
	}

	/**
	 * Init PageAutocomplete for given item
	 * 
	 * @param $item
	 * @param cnt
	 * 
	function initAutocomplete($item, cnt) {
		$item.removeClass('InputfieldPageAutocompleteTemplate').addClass('InputfieldPageAutocomplete');
		var $input = $item.find("input[type=text]");
		// updates attributes unique to autocomplete fields
		updateAttribute($input, 'data-parent-input', cnt);
		var $ol = $item.find("ol");
		if($ol.length) {
			updateAttribute($ol, 'data-id', cnt);
			updateAttribute($ol, 'data-name', cnt);
		}
		$item.trigger('reloaded', ['InputfieldTable']);
	}
	 */

	/**
	 * Initialize a table row
	 * 
	 * This initializes any asmSelects, language tabs, etc. 
	 * 
	 * @param $row
	 * 
	 */
	function initRow($row) {

		// asmSelect
		$row.find("select.InputfieldTable_asmSelect, select.InputfieldTable_pageAsmSelect").each(function() {
			//if($(this).parents('.asmContainer').length > 0) return;
			$(this).asmSelect(config.InputfieldTable_asmSelect);
		});

		// language tabs
		var $langTabs = $row.find(".InputfieldTable_langTabs");
		if($langTabs.length) {
			var options = {};
			if(typeof config.LanguageTabs != "undefined") options.active = config.LanguageTabs.activeTab;
			$langTabs.each(function() {
				// note we populate a fake ui-tabs class in InputfieldTable.module in order to make
				// PW's LanguageTabs avoid attempting to initialize it, since we initialize our own
				if($(this).hasClass('ui-tabs')) $(this).removeClass('ui-tabs').tabs(options);
				$(this).closest('td').addClass('InputfieldTable_hasLangTabs');
			});
		}
	}

	/**
	 * Handler for the "Add Row" click event
	 * 
	 * @returns {boolean}
	 * 
	 */
	function addRowClick() {

		var $table = getTable($(this)); // $(this).closest('.Inputfield').find('table.InputfieldTable:not(.InputfieldTableSearch)');
		var $tbody = $table.children('tbody');
		var numRows = $tbody.children('tr').length;
		var $rowTemplate = $tbody.children('.InputfieldTableRowTemplate');
		var $row = $rowTemplate.clone(true);

		$row.find("input.hasDatepicker").removeClass('hasDatepicker').removeAttr('id').datepicker('destroy');
		$row.removeClass('InputfieldTableRowTemplate');

		$row.find("*").each(function() {
			var $item = $(this);
			if($item.is(":input")) {
				updateAttribute($item, 'name', numRows);
				if($item.is('.InputfieldTableRowSort')) $item.val(numRows);

			} else if($item.is("a")) {
				// update language tabs links
				var href = $item.attr('href');
				if(href.indexOf('#') === 0) {
					updateAttribute($item, 'href', numRows);
				}
			}
			updateAttribute($item, 'id', numRows);
		});

		$tbody.append($row);
		$table.show();
		$row.show();

		initRow($row);
		updateRowNumbers($table);

		// specific to InputfieldPageAutocomplete
		$row.find(".InputfieldPageAutocompleteTemplate").each(function() {
			$(this).removeClass('InputfieldPageAutocompleteTemplate').addClass('InputfieldPageAutocomplete');
			var $input = $(this).find("input[type=text]");
			// updates attributes unique to autocomplete fields
			updateAttribute($input, 'data-parent-input', numRows);
			var $ol = $(this).find("ol");
			if($ol.length) {
				updateAttribute($ol, 'data-id', numRows);
				updateAttribute($ol, 'data-name', numRows);
			}
			$(this).trigger('reloaded', ['InputfieldTable']);
		});

		return false;
	}

	/**
	 * Event handler for delete row click
	 * 
	 */
	function deleteRowClick() {
		
		var $row = $(this).closest('tr');
		var $input = $(this).siblings('.InputfieldTableRowDelete');

		if($row.hasClass('InputfieldTableRowDeleted')) {
			// undelete
			$row.removeClass('InputfieldTableRowDeleted');
			$row.css('opacity', 1.0);
			$input.val(0);
			$row.closest('.Inputfield.InputfieldTable').find('.InputfieldTableDeleteAll').hide()
				.find('input').val('').removeAttr('checked');

		} else {
			// delete
			$row.addClass('InputfieldTableRowDeleted');
			$row.css('opacity', 0.3);
			$input.val(1);
		}
	}

	/**
	 * Event handler for delete row double-click
	 * 
	 */
	function deleteRowDblClick() {
		
		var $inputfield = getInputfield($(this));
		
		if(!ProcessWire.config['InputfieldTable_' + getFieldName($inputfield)].useBigDelete) return false;	
		
		var message = ProcessWire.config.InputfieldTable.applyToAll;
		
		if(confirm(message)) {
			var $items = $inputfield.find('.InputfieldTableRowDeleteLink:visible');
			$items.click();
			setTimeout(function() {
				var numMarked = $inputfield.find('.InputfieldTableRowDeleted').length;
				var $deleteAll = $inputfield.find('.InputfieldTableDeleteAll');
				consoleLog($inputfield);
				var numPopulated = 0;
				$inputfield.find('.InputfieldTableSearch').find(':input').each(function() {
					if($(this).val().length > 0) numPopulated++;
				});
				if(numMarked == $items.length && numPopulated == 0) { 
					$deleteAll.show().find('input').val('DELETE-ALL').removeAttr('checked');
				} else {
					$deleteAll.hide().find('input').val('').removeAttr('checked');
				}
			}, 250);
		}
	}

	/**
	 * Change event handler for :input's
	 * 
	 * @param e
	 *
	function inputChange(e) {
		$(this).closest('tr').addClass('InputfieldTableRowChanged');
	}
	 */

	/**
	 * Event handler for clicking a pagination link
	 * 
	 * @returns {boolean}
	 * 
	 */
	function pagerNavClick() {

		var $a = $(this);
		var $inputfield = getInputfield($a); // $a.closest('.Inputfield');
		var href = '';

		if($a.hasClass('InputfieldTableHeaderSortable')) {
			href = $a.attr('data-href');
		} else {
			href = $a.attr('href');
		}

		reloadContent($inputfield, href);

		return false;
	}
	
	/**
	 * Reload the .InputfieldTablePagerNav content from ajax request
	 * 
	 * @param $inputfield
	 * @param href
	 * 
	 */
	function reloadContent($inputfield, href) {
		
		if($inputfield.hasClass('InputfieldStateChanged')) {
			var message = ProcessWire.config.InputfieldTable.areYouSure;
			if(!confirm(message)) {
				return false;
			}
			$inputfield.removeClass('InputfieldStateChanged');
		}

		var $spinner = $("<i style='margin-left:0.5em;' class='fa fa-fw fa-spin fa-spinner ui-priority-secondary'></i>");
		var $pager = $inputfield.find('.MarkupPagerNav');
		var $content = $inputfield.find('.InputfieldTablePagerNavContent');

		if($pager.length && false) {
			$pager.append($spinner);
		} else {
			$inputfield.find('.InputfieldTablePagerNote').prepend($spinner);
		}
		
		consoleLog('ajax load start: ' + decodeURIComponent(href));

		$.get(href, function(data) {
			consoleLog('loaded data'); 
			$content.replaceWith($(data).find('.InputfieldTablePagerNavContent'));
			$inputfield.effect('highlight', 1000);
			$inputfield.removeClass('InputfieldStateChanged');
			var $table = $inputfield.find('table.InputfieldTable:not(.InputfieldTableSearch)');
			$table.children('tbody').children('tr:not(.InputfieldTableRowTemplate)').each(function() {
				initRow($(this));
			});
			consoleLog('initRows completed');
			$inputfield.trigger('reloaded', ['InputfieldTable']);
			consoleLog('trigger reloaded');
			$inputfield.find('.InputfieldPageAutocomplete').trigger('reloaded', ['InputfieldTable']);
			consoleLog('trigger reloaded autocomplete');
			$spinner.remove();
			console.log('ajax load done');
		});
	}

	/**
	 * Event handler for the "Reset Filters" action
	 * 
	 * Resets all find filters to be blank.
	 * 
	 * @returns {boolean}
	 * 
	 */
	function resetFilters() {
		
		var $a = $(this);
		var $inputfield = getInputfield($a);
		var $table = $a.closest('.InputfieldTableSearch');
		var href = $table.attr('data-search') + '&reset=1';
		
		$table.find(':input').each(function() {
			var $input = $(this);
			var type = $input.attr('type');
			if($input.is('select')) {
				$input.val('');
				$input.find('option[selected=selected]').removeAttr('selected');
			} else if(type == 'checkbox' || type == 'radio') {
				$input.removeAttr('checked');
			} else {
				$input.removeAttr('value');
			}
		});
		
		reloadContent($inputfield, href);
		
		return false;
	}

	/**
	 * Given search filter columns, build a selector string reflecting that search
	 * 
	 * @param $cols
	 * @returns {string}
	 * 
	 */
	function buildSelector($cols) {
		
		var operators = ['=', '>=', '<=', '!=', '%=', '<', '>', '^=', '$=', '*=', '~=', '!%='];
		var selector = '';
		
		$cols.each(function() {
			
			var $inputs = $(this).find(':input');
			
			$inputs.each(function() {

				var $input = $(this);
				var val = $.trim($input.val());

				if(!val.length) return;

				// allow quotes to indicate "blank", but don't allow double quotes otherwise
				if(val != '""' && val.indexOf('"') > -1) return;

				var type = $input.is('select') ? 'select' : $input.attr('type');
				var op = '';
				var quoteVal = val.indexOf(',') > -1 || (val.indexOf("'") > -1 && val != "''");
				var name = $input.attr('name');
				var isArray = false;

				if(!name) return;
				name = name.replace('__find-', '');

				if(name.indexOf('[') > -1) {
					name = name.substring(0, name.length - 2);
					isArray = true;
				}

				if(isArray && val.indexOf(',') > -1) {
					if(val.indexOf(',') === 0) val = val.substring(1);
					val = val.split(',').join('|');
				}

				if(val.indexOf('=') > -1 || val.indexOf('<') === 0 || val.indexOf('>') === 0) {
					for(var n = 0; n < operators.length; n++) {
						if(val.indexOf(operators[n]) === 0) {
							op = operators[n];
							val = val.substring(op.length);
							consoleLog('name=' + name + ', op=' + op + ', val=' + val);
							break;
						}
					}
				}

				if(type == 'checkbox' || type == 'radio') {
					if(!$input.is(":checked")) return;
				} else if(type == 'number') {
					quoteVal = false;
				} else if(type == 'select') {
					// ok, fallback
				} else if(type == 'date' || type == 'datetime' || $input.attr('data-dateformat')) {
					// ok, fallback
				} else {
					if(!op.length) op = '%=';
				}

				// this is fallback
				if(!op.length) op = '=';

				if(quoteVal && val != '""' && val != "''") val = '"' + val + '"';
				var s = name + op + val + ',';
				if(selector.indexOf(s) == -1) selector += s;
			});
		});
		
		if(selector.length) selector = selector.substring(0, selector.length - 1);
		
		consoleLog('buildSelector: ' + selector);
		
		return selector;
	}

	/**
	 * Execute a search/filter of results
	 * 
	 * Search only executes once every 500ms, so this function may be called several times before 
	 * it is actually executed. 
	 * 
	 */
	function executeSearch() {

		var $input = $(this);
		var $inputfield = getInputfield($input);
		var isChanged = $inputfield.hasClass('InputfieldStateChanged');

		if(searchTimer) clearTimeout(searchTimer);

		searchTimer = setTimeout(function() {
			var $table = $input.closest('.InputfieldTableSearch');
			var $cols = $table.find('td');
			var selector = buildSelector($cols);
			var fieldName = getFieldName($inputfield);
			var find = '&' + fieldName + '_table_find=';
			var href = $table.attr('data-search');
			var pos = href.indexOf(find);
			if(pos > -1) href = href.substring(0, pos); // strip off "&find=" because we'll be adding a new one back
			consoleLog(selector);
			consoleLog(href + find + selector);
			href += find + encodeURIComponent(selector);
			if(!isChanged && $inputfield.hasClass('InputfieldStateChanged')) $inputfield.removeClass('InputfieldStateChanged');
			reloadContent($inputfield, href);
		}, 500);
	}

	/**
	 * Event heandler for the "Find" link click
	 * 
	 * @returns {boolean}
	 * 
	 */
	function searchToggleClick() {

		var $toggle = $(this);
		var $icon = $toggle.find('i.fa');
		var $inputfield = getInputfield($toggle);
		var $filters = $inputfield.find('.InputfieldTableSearch');

		if($filters.hasClass('toggling')) return false;

		// $icon.toggleClass($icon.attr('data-toggle-class'));

		if($filters.hasClass('InputfieldTableSearchActive')) {
			$filters.hide().removeClass('InputfieldTableSearchActive');
		} else {
			$filters.addClass('toggling').fadeIn('fast', function() {
				$filters.addClass('InputfieldTableSearchActive').removeClass('toggling');
			});
		}

		return false;
	}

	/**
	 * Initialize Find/Search/Filters feature
	 * 
	 * @param $table
	 * 
	 */
	function initSearch($table) {
		
		var $inputfield = getInputfield($table); 
		var $searchTable = $inputfield.find('.InputfieldTableSearch');
		
		// make inputs in search/filters toggle ajax search request
		$searchTable.find(':input').each(function() {
			
			var $input = $(this);
			var type = $input.attr('type');
			
			if(type == 'radio' || type == 'checkbox') {
				$input.change(executeSearch);
				
			} else if($input.is('input') || $input.is('textarea')) {
				if($input.hasClass('ui-autocomplete-input')) {
					$input.change(executeSearch);
				} else {
					$input.keyup(executeSearch);
				}
				
			} else if($input.is('select')) {
				$input.change(executeSearch);
			}
		});

		// move the search/filters toggle to the header
		var $toggle = $inputfield.find('.InputfieldTableSearchToggle');
		if($toggle.length) {
			$inputfield.children('.InputfieldHeader').append($toggle);
		}
	}

	/**
	 * Initialize a table.InputfieldTable
	 * 
	 * @param $table
	 * 
	 */
	function initTable($table) {
		initSortable($table);
		var $rows = getRows($table);
		$rows.each(function() {
			initRow($(this));
		});
		initSearch($table);
	}

	/**
	 * Initialize InputfieldTable: to be called at document.ready()
	 * 
	 */
	function init() {
	
		// initialize events
		$(document).on('click', 'a.InputfieldTableAddRow', addRowClick);
		$(document).on('click', '.InputfieldTableRowDeleteLink', deleteRowClick);
		$(document).on('dblclick', '.InputfieldTableRowDeleteLink', deleteRowDblClick);
		$(document).on('click', '.InputfieldTablePagerNav a', pagerNavClick);
		$(document).on('click', '.InputfieldTableHeaderSortable', pagerNavClick);
		$(document).on('click', '.InputfieldTableResetFilters', resetFilters);
		$(document).on('click', '.InputfieldTableSearchToggle', searchToggleClick);
		//$(document).on('change', '.InputfieldTable:not(.InputfieldTableSearch)', inputChange);

		// initialize tables
		var $tables = getAllTables();
		$tables.each(function() {
			var $table = $(this);
			initTable($table);
		});

		// handle Inputfield reloaded conditions
		$(document).on('reloaded', '.Inputfield.InputfieldTable', function(event, from) {
			var $inputfield = $(this);
			// skip over locally generated reloaded events
			if(typeof from != "undefined" && from == 'InputfieldTable') {
				return;
			}
			initTable(getTable($inputfield));
			// notify autocompletes of the reloaded condition
			$inputfield.find('.InputfieldPageAutocomplete').trigger('reloaded', [ 'InputfieldTable' ]);
		});
	}
	
	init();
}

$(document).ready(function() {
	InputfieldTable();
});
