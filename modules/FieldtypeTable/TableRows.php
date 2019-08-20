<?php namespace ProcessWire;

/**
 * ProcessWire Table Fieldtype: Rows
 *
 * Part of the ProFields package
 * Please do not distribute. 
 * 
 * Copyright 2017 by Ryan Cramer
 *
 * https://processwire.com
 * 
 * @method string render(array $options = array())
 * @method TableRow new(array $data = array())
 *
 *
 */

class TableRows extends PaginatedArray {

	/**
	 * @var Field|null
	 * 
	 */
	protected $field = null;

	/**
	 * @var null|Page
	 * 
	 */
	protected $page = null;

	/**
	 * Construct
	 * 
	 * @param Page $page
	 * @param Field $field
	 * 
	 */
	public function __construct(Page $page, Field $field) {
		$this->page = $page; 
		$this->field = $field; 
		
	}

	/**
	 * Is item valid for this TableRows?
	 * 
	 * @param $item
	 * @return bool
	 * 
	 */
	public function isValidItem($item) {
		return $item instanceof TableRow;
	}

	/**
	 * Make a new/blank TableRow item
	 * 
	 * @return TableRow
	 * 
	 */
	public function makeBlankItem() {
		$row = new TableRow($this->field);
		$this->setupBlankRow($row);
		return $row; 
	}

	/**
	 * Create a new TableRow item and add to this TableRows
	 * 
	 * This is different from makeBlankItem() because it automatically adds the new item
	 * to this TableRows object, plus it lets you provide an array of data to populate to 
	 * the new TableRow. Note that you still have to $page->save(); before the data is 
	 * committed to the database. 
	 * 
	 * @param array $data Optional associative array of data to populate to the new row 
	 * @return TableRow New item (already added to this TableRows)
	 * 
	 */
	public function ___new(array $data = array()) {
		$row = new TableRow($this->field);
		$this->setupBlankRow($row, $data);
		$this->add($row);
		return $row;
	}

	/**
	 * Make a new TableRows object
	 * 
	 * @return TableRows
	 * 
	 */
	public function makeNew() {
		return new TableRows($this->page, $this->field); 
	}

	/**
	 * Get a 'labels' or 'columns' property (or other WireArray property)
	 * 
	 * @param $key
	 * @return array
	 * 
	 */
	public function __get($key) {
		if($key === 'labels') return $this->getLabels();
		if($key === 'columns') return $this->getColumns();
		if($key === 'count') return parent::__get('count');
		return parent::get($key); 
	}

	/**
	 * Return array of information about all columns
	 *
	 * @return array
	 *
	 */
	public function getColumns() {
		/** @var FieldtypeTable $type */
		$type = $this->field->type;
		return $type->getColumns($this->field); 
	}

	/**
	 * Return array of information about the column
	 *
	 * @param int|string Column number or name
	 * @return array
	 *
	 */
	public function getColumn($n) {
		/** @var FieldtypeTable $type */
		$type = $this->field->type;
		return $type->getColumn($this->field, $n); 
	}

	/**
	 * Return array of all column labels (indexed by column name)
	 *
	 * @return array
	 *
	 */
	public function getLabels() {
		$labels = array();
		$columns = $this->getColumns();
		$language = $this->wire('languages') ? $this->wire('user')->language : null;
		if($language && $language->isDefault()) $language = null;
		foreach($columns as $col) {
			$label = $language && !empty($col["label$language->id"]) ? $col["label$language->id"] : $col["label"];
			$labels[$col['name']] = $label;
		}
		return $labels;
	}

	/**
	 * Return the label for this column
	 *
	 * @param int|string Column number or name
	 * @return string
	 *
	 */
	public function getLabel($n) {
		$col = $this->getColumn($n);
		$language = $this->wire('languages') ? $this->wire('user')->language : null;
		$label = $language && !empty($col["label$language->id"]) ? $col["label$language->id"] : $col["label"];
		return $label;
	}

	/**
	 * Render a basic table containing the data from this TableRows
	 *
	 * @param array $options 
	 *	tableClass: class name for table (default=ft-table)
	 *	columnClass: class name for each column, col name will be appended: (default=ft-table-col)
	 *	useWidth: boolean indicating whether to use width attributes in columns (default=true)
	 * 	cols: array of column names to render, or omit to render all. 
	 * @return string
	 *
	 */
	public function ___render($options = array()) {
		if(!$this->count()) return '';

		$defaults = array(
			'tableClass' => 'ft-table',
			'columnClass' => 'ft-table-col',
			'useWidth' => true, 
			'columns' => array(), 
			'thead' => '', 
			);

		$of = $this->page->of();
		$this->page->of(true); // ensure output formatting is on
		$rows = $this->page->get($this->field->name); // make sure we have a formatted value
		$columns = $rows->getColumns();
		$user = $this->wire('user');
		$languages = $this->wire('languages');
		
		$totalWidth = 0;
		foreach($columns as $colKey => $col) $totalWidth += $col['width'];
		if($totalWidth > 100) $defaults['useWidth'] = false;
		
		$options = array_merge($defaults, $options); 
		$sanitizer = $this->wire('sanitizer'); 

		$out = "<table class='$options[tableClass]'>";
		$attrs = array();

		if($options['thead']) {
			$out .= $options['thead'] . '<tbody>';
		} else {
			$out .= "<thead><tr>";
			foreach($columns as $colKey => $col) {
				if(empty($col['type'])) {
					unset($columns[$colKey]);
					continue;
				}
				$name = $col['name'];
				if(count($options['columns']) && !in_array($name, $options['columns'])) continue;
				$attr = '';
				if($options['columnClass']) $attr .= " class='$options[columnClass] $options[columnClass]-$name'";
				if($options['useWidth']) $attr .= $col['width'] ? " width='$col[width]%'" : '';
				$attrs[$name] = $attr;
				$label = '';
				if($languages && $user->language && !$user->language->isDefault()) {
					if(isset($col["label$user->language"])) $label = $col["label$user->language"];
				}
				if(!strlen($label)) $label = $col['label'];
				if(!$label) $label = $name;
				$out .= "<th$attr>" . $sanitizer->entities($label) . "</th>";
			}
			$out .= "</tr></thead><tbody>";
		}

		foreach($rows as $row) {
			$out .= "<tr>";
			foreach($columns as $col) {
				if(empty($col['type'])) continue;
				$name = $col['name'];
				if(count($options['columns']) && !in_array($name, $options['columns'])) continue;
				$attr = isset($attrs[$name]) ? $attrs[$name] : '';
				$value = $row->$name; 
				
				if(!empty($col['options'])) {
					// convert options to show label rather than value, when applicable
					foreach($col['options'] as $option) {
						if(strpos($option, '=') === false) continue; // no separate value=label
						list($optionVal, $optionLabel) = explode('=', $option, 2);
						if(is_array($value) && in_array($optionVal, $value)) {
							$valueKey = array_search($optionVal, $value);	
							if($valueKey !== false) $value[$valueKey] = $optionLabel;
						} else if($optionVal == $value) {
							$value = $optionLabel;
						}
					}
				}
				
				if(is_array($value)) {
					foreach($value as $k => $v) {
						$value[$k] = $this->wire('sanitizer')->entities1($v);
					}
					$value = implode('<br />', $value);
				} else if($value instanceof Page) {
					$labelField = empty($col['settings']['labelField']) ? 'title|name' : $col['settings']['labelField'];
					$_value = $value;
					$of = $value->of();	
					if(!$of) $value->of(true);
					$value = $value->get($labelField);
					if(!$of) $_value->of(false);
				} else if($value instanceof PageArray) {
					$labelField = empty($col['settings']['labelField']) ? 'title|name' : $col['settings']['labelField'];
					$_value = array();
					foreach($value as $v) {
						$of = $v->of();
						if(!$of) $v->of(true);
						$_value[] = $v->get($labelField);
						if(!$of) $v->of(false);
					}
					$value = implode('<br />', $_value);
					unset($_value);
				} else {
					// $value = "<pre>" . print_r($col, true) . "</pre>";
					$value = $this->wire('sanitizer')->entities1($value);
				}
				$out .= "<td$attr>$value</td>";
			}
			$out .= "</tr>";
		}

		$out .= "</tbody></table>";

		$this->page->of($of); // restore
		return $out; 
	}

	/**
	 * Clone this field value
	 *
	 * Ensure that the individual items are cloned and that they have no ID property.
	 * 
	 */
	public function __clone() {
		// skip clone behavior when output formatting is off
		if(!$this->page->of() && !$this->data('preventSaving')) return;
		
		foreach($this->data as $key => $item) {
			/** @var TableRow $copy */
			$copy = clone $item;
			$copy->id = null;
			$this->data[$key] = $copy;
		}
	}

	/**
	 * String value of TableRows object is the rendered output
	 * 
	 * @return string
	 * 
	 */
	public function __toString() {
		if($this->page && $this->page->of()) {
			return (string) $this->render();
		} else {
			return (string) parent::__toString();
		}
	}

	/**
	 * Import CSV file
	 * 
	 * Given CSV file must have the first line as the header containing column names that
	 * map exactly to the column names in this FieldtypeTable field. 
	 * 
	 * @param string $csvFile
	 * @param array $options 
	 * @return int Number of rows imported
	 * @throws WireException
	 * 
	 */
	public function importCSV($csvFile, array $options = array()) {
		
		if(!$this->page || !$this->field) return 0;
		
		$defaults = array(
			'delimiter' => ',',
			'enclosure' => '"', 
			'escape' => "\\", 
			'start' => 0, // row to start from
			'limit' => 0, // max rows to import
		);
		
		/** @var FieldtypeTable $fieldtype */
		$fieldtype = $this->field->type;
		$options = array_merge($defaults, $options);
		$fp = fopen($csvFile, "r");
		if(!$fp) return 0;
		$total = 0;
		$limitCnt = 0;
		$cnt = 0;
		$paginationLimit = $this->field->get('paginationLimit');
		
		if($paginationLimit) {
			$rows = new TableRows($this->page, $this->field);
		} else {
			$rows = $this;
		}

		set_time_limit(3600 * 12);
		$header = fgetcsv($fp, 0, $options['delimiter'], $options['enclosure'], $options['escape']); // header line
		
		while(($data = fgetcsv($fp, 0, $options['delimiter'], $options['enclosure'], $options['escape'])) !== false) {
			if($options['limit'] && $limitCnt++ >= $options['limit']) break;
			$total++;
			if($options['start'] && $total < $options['start']) continue;
			$a = array();
			foreach($header as $key => $name) {
				$a[$name] = $data[$key];	
			}
			$item = $this->new($a);
			$rows->add($item);
			if($paginationLimit && ++$cnt >= $paginationLimit) {
				$fieldtype->savePageFieldRows($this->page, $this->field, $rows);
				$rows = new TableRows($this->page, $this->field);
				$cnt = 0;
			}
		}
		
		fclose($fp);

		if($paginationLimit) {
			if($cnt) $fieldtype->savePageFieldRows($this->page, $this->field, $rows);
		} else {
			$this->page->set($this->field->name, $rows);
			$this->page->save($this->field->name);
		}
		
		return $total;
	}
	
	/**
	 * Prepare a blank TableRow item with correct value types
	 *
	 * @param TableRow $row
	 * @param array $data Optional associative array of data to populate
	 * @return bool
	 *
	 */
	protected function setupBlankRow(TableRow $row, array $data = array()) {
		if(!$this->page || !$this->field) return false;

		/** @var FieldtypeTable $type */
		$type = $this->field->type;

		foreach($type->getColumns($this->field) as $col) {

			$name = $col['name'];
			$value = null;

			switch($col['valid']) {
				case 'PageArray':
					$value = new PageArray();
					break;
				case 'Page':
					$value = new NullPage();
					break;
				case 'array':
					$value = array();
					break;
				case 'textLanguage':
				case 'textareaLanguage':
				case 'LanguagesPageFieldValue':
					/** @var LanguagesPageFieldValue $value */
					$value = $type->newLanguagesPageFieldValue($this->page, $this->field);
					break;
			}

			if($value !== null) $row->set($name, $value);
		}

		if(count($data)) {
			foreach($data as $name => $value) {
				$row->setSafe($name, $value);
			}
		}

		return true;
	}


}
