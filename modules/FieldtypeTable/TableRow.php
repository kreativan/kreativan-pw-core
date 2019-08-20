<?php namespace ProcessWire;

/**
 * ProcessWire Table Fieldtype: Row
 *
 * Part of the ProFields package
 * Please do not distribute. 
 * 
 * Copyright 2017 by Ryan Cramer
 *
 * https://processwire.com
 * 
 * @property int|null $id
 *
 */

class TableRow extends WireData {

	/**
	 * @var Field|null
	 * 
	 */
	protected $field = null;

	/**
	 * Construct a new TableRow
	 * 
	 * @param Field $field
	 * @param array $cols
	 * 
	 */
	public function __construct(Field $field, array $cols = array()) {

		$this->field = $field; 
		parent::__construct();

		// establish blank placeholder values
		for($n = 1; $n <= $field->get('numCols'); $n++) {
			$name = $field->{"col{$n}name"}; 	
			$this->set($name, '');  
		}

		// populate actual values, when available
		foreach($cols as $key => $value) {
			$this->set($key, $value); 
		}
	}

	/**
	 * Set a value to the TableRow
	 * 
	 * @param string $key
	 * @param mixed $value
	 * @return $this
	 * 
	 */
	public function set($key, $value) {
		if($key == 'data') $key = 'id';
		return parent::set($key, $value); 
	}
	
	/**
	 * Set a column value with automatic type conversion/checking
	 *
	 * @param string $name Column name
	 * @param mixed $value Column value
	 * @return $this
	 *
	 */
	public function setSafe($name, $value) {
		/** @var FieldtypeTable $type */
		$type = $this->field->type;
		$col = $type->getColumnByName($this->field, $name);
		if(!empty($col)) {
			$value = $type->_sanitizeValue($col, $value);
			$this->set($name, $value);
		}
		return $this;
	}

	// @todo: determine if this addition is still needed (it shouldn't be)
	public function get($key) {
		if($key == 'data') $key = 'id';
		return parent::get($key);
	}


}
