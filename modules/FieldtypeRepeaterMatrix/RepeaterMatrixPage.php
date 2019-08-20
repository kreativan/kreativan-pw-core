<?php namespace ProcessWire;

/**
 * Class RepeaterMatrixPage 
 * 
 * ProcessWire ProFields Repeater Matrix Page, a Page class used by Repeater Matrix items.
 *
 * THIS IS PART OF A COMMERCIAL MODULE: DO NOT DISTRIBUTE.
 * This file should NOT be uploaded to GitHub or available for download on any public site.
 *
 * Copyright 2017 by Ryan Cramer
 * ryan@processwire.com
 *
 * PWPFRMP
 *
 */

class RepeaterMatrixPage extends RepeaterPage {

	/**
	 * Cached matrix type name
	 * 
	 * @var string
	 * 
	 */
	protected $matrixTypeName = '';

	/**
	 * Cached matrix type number
	 * 
	 * @var null|int
	 * 
	 */
	protected $matrixTypeN = null;

	/**
	 * @param string $key
	 * @return mixed
	 * 
	 */
	public function get($key) {
		if($key == 'type') return $this->matrix('name');
		return parent::get($key);
	}
	
	/**
	 * Get a Field object in context or NULL if not valid for this page
	 * 
	 * Only returns a Field if it's valid for this repeater type. Note this is different
	 * from Page::getField() which is affected by the output formatting state. 
	 * 
	 * @param string|int|Field $field
	 * @return Field|null
	 * @throws WireException if given invalid argument
	 *
	 */
	public function getField($field) {

		/*
		$process = $this->wire('process');
		
		if($process instanceof WirePageEditor && !$this->wire('config')->ajax) {
			// if repeater page is being edited directly in /processwire/repeaters/ ...
			// then don't block white fields are allowed
			$p = $process->getPage();
			$id = $p ? $p->id : (int) $this->wire('input')->get('id');
			if($id === $this->id) return parent::getField($field);
		}
		*/
		
		if($field == 'repeater_matrix_type') return $this->wire('fields')->get($field);
		$template = $this->template;
		if(!$template) return null;
		$value = $template->fieldgroup->getFieldContext($field, $this->matrix('context'));
		if(!$value) $value = $template->fieldgroup->getField($field);
		$fieldIDs = $this->matrix('fieldIDs');
		if($value && $value->name != 'repeater_matrix_type' && !in_array($value->id, $fieldIDs)) $value = null;
		return $value;
	}

	/**
	 * Get a FieldsArray of fields used by this page
	 * 
	 * This is different from $page->fieldgroup in that it only returns Fields valid for
	 * this Repeater Matrix type. It also excludes the repeater_matrix_type field. Note
	 * this behavior is different from Page::getFields(), which is affected by the 
	 * output formatting state.
	 * 
	 * @return FieldsArray
	 * 
	 */
	public function getFields() {
		$context = $this->matrix('context');
		$fieldIDs = $this->matrix('fieldIDs');
		$value = new FieldsArray();
		foreach($fieldIDs as $fieldID) {
			$field = $this->template->fieldgroup->getFieldContext($fieldID, $context);
			if(!$field) $field = $this->template->fieldgroup->getField($fieldID);
			if($field && $field->name == 'repeater_matrix_type') $field = null;
			if($field) $value->add($field);
		}
		return $value; 
	}

	/**
	 * Returns whether or not $field is valid for this Page
	 *
	 * Note that this only indicates validity, not whether the field is populated.
	 *
	 * @param int|string|Field $field
	 * @return bool
	 *
	 */
	public function hasField($field) {
		$f = $this->getField($field);
		return $f ? true : false;
	}

	/**
	 * Get a property from the matrix type used by this page
	 * 
	 * Note: if requesting 'label' in a multi-language environment, it will always be localized
	 * to the user's language.
	 * 
	 * @param string $property Specify one of: 
	 *  n, type, name, label, sort, head, fields, prefix, context, fields, fieldIDs, or label[languageID]
	 * @return int|null|string|array
	 * 
	 */
	public function matrix($property) {
	
		if($property == 'type') $property = 'name';
		if($property == 'name' && $this->matrixTypeName) return $this->matrixTypeName;
		if($property == 'n' || $property == 'type' && $this->matrixTypeN) return $this->matrixTypeN;
		
		$field = $this->getForField();	
		$n = (int) $this->get('repeater_matrix_type');
		$prefix = "matrix{$n}_";
		$value = null;
		$languages = null;
		$language = null;
	
		if(strpos($property, 'label') === 0) {
			$languages = $this->wire('languages');
			$language = $languages ? $this->wire('user')->language : null;
		}
		
		switch($property) {
			case 'n':
			case 'id':
				$value = $n;
				$this->matrixTypeN = $value;
				break;
			case 'prefix':
				$value = $prefix;
				break;
			case 'context':
				$value = rtrim($prefix, '_');
				break;
			case 'name':
			case 'sort':
			case 'head':
				$value = $field->get($prefix . $property);
				if($property == 'name') $this->matrixTypeName = $value;
				break;
			case 'label':
				if($language && !$language->isDefault()) {
					$value = $field->get($prefix . "label$language->id");
				}
				if(!$value) $value = $field->get($prefix . 'label');
				if(!$value) $value = $field->get($prefix . 'name');
				break;
			case 'fieldIDs':
				$value = $field->get($prefix . 'fields');	
				if(!is_array($value)) $value = array();
				break;
			case 'fields':
				$value = $this->getFields();
				break;
		}
		
		if(is_null($value) && $languages && strpos($property, 'label') === 0 && strlen($property) > 5) {
			// label in specified language requested
			list($x, $languageID) = explode('label', "x$property");
			if($x) {} // ignore
			$languageID = (int) $languageID;
			if($languageID) {
				$language = $languages->get($languageID);
				if($language->id) {
					if($language->isDefault()) $languageID = '';
					$value = $field->get($prefix . "label$languageID");
				}
			}
		}
		
		return $value;	
	}

	/**
	 * Set repeater matrix type by name or number
	 * 
	 * @param string|int $name Repeater matrix type name, or number
	 * @return $this
	 * @throws WireException If given an unrecognized matrix type name or number
	 * 
	 */
	public function setMatrixType($name) {
		$existingValue = (int) $this->get('repeater_matrix_type');
		if(ctype_digit("$name") && $name === $existingValue) return $this;
		$field = $this->getForField();
		/** @var FieldtypeRepeaterMatrix $fieldtype */
		$fieldtype = $field->type;
		$matrixTypes = $fieldtype->getMatrixTypes($field);
		$matrixTypeN = false;
		if(ctype_digit($name)) {
			$n = (int) $name; 
			if(in_array($n, $matrixTypes)) $matrixTypeN = $n;	
		} else if(isset($matrixTypes[$name])) {
			$matrixTypeN = $matrixTypes[$name];	
		}
		if($matrixTypeN === false) {
			throw new WireException("Unknown matrix type: $name"); 
		} else {
			$this->set('repeater_matrix_type', $matrixTypeN); 
		}
		return $this;	
	}

	/**
	 * Generate a text summary for this matrix item
	 *
	 * @return string
	 *
	 */
	public function summarize() {
		$out = '';
		foreach($this->matrix('fields') as $field) {
			//$value = $this->getFormatted($field->name);
			$value = $this->get($field->name);
			if(is_object($value)) {
				if($value instanceof LanguagesValueInterface) {
					$value = (string) $value;
				}
			}
			if(is_string($value)) {
				$value = $this->wire('sanitizer')->text($value);
				$length = strlen($value);
				if($length) $out = $value;
			}
			if(strlen($out)) break;
		}
		return $out;
	}

	/**
	 * Render the matrix item
	 * 
	 * @param string $fieldName Optionally render just a field
	 * @param string $file Optional render file, if providing a field name too
	 * @return string
	 *
	 */
	public function render($fieldName = '', $file = '') {
		if($fieldName) return $this->renderField($fieldName, $file);
		$name = $this->matrix('name');	
		$field = $this->getForField();
		$file = $this->wire('config')->paths->fieldTemplates . "$field->name/$name.php";
		if(is_file($file)) {
			$tpl = new TemplateFile($file);
			$this->wire($tpl);
			$tpl->set('page', $this);
			$out = $tpl->render();
		} else {
			$file = str_replace($this->wire('config')->paths->root, '/', $file);
			$out = '<p>' . $this->_('Render file does not exist') . ' - ' . $file . '</p>';
		}
		return $out;
	}
	
}