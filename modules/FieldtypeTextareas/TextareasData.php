<?php namespace ProcessWire;

/**
 * ProcessWire Textareas Data
 *
 * Serves as the value for Textareas fields. 
 *
 * Part of the ProFields package.
 * Please do not distribute. 
 * 
 * Copyright (C) 2017 by Ryan Cramer 

 * https://processwire.com
 * 
 * @todo override getIterator() method to ignore fields no longer in Textareas definition
 *
 */

class TextareasData extends WireData {

	/**
	 * Field that this TextareasData applies to
	 *
	 * @var Field
	 *
	 */
	protected $field = null;

	/**
	 * Set the Field that this TextareasData applies to
	 *
	 * @param Field
	 *
	 */
	public function setField(Field $field) {
		$this->field = $field; 
	}

	/**
	 * Get the Field that this TextareasData applies to
	 *
	 * @return Field
	 *
	 */
	public function getField() {
		return $this->field; 
	}

	/**
	 * Get the label (text) for the given Textareas property or blank if not found
	 *
	 * @param string $name
	 * @param Language|null $language
	 * @return string
	 *
	 */
	public function label($name, $language = null) {
		if(!$this->field) return '';
		/** @var FieldtypeTextareas $type */
		$type = $this->field->type;
		return $type->getLabel($this->field, $name, $language); 
	}

	/**
	 * Get the description (text) for the given Textareas property or blank if not found
	 *
	 * @param string $name
	 * @param Language|null $language
	 * @return string
	 *
	 */
	public function description($name, $language = null) {
		if(!$this->field) return '';
		/** @var FieldtypeTextareas $type */
		$type = $this->field->type;
		return $type->getDescription($this->field, $name, $language); 
	}
	
	/**
	 * Get the notes (text) for the given Textareas property or blank if not found
	 *
	 * @param string $name
	 * @param Language|null $language
	 * @return string
	 *
	 */
	public function notes($name, $language = null) {
		if(!$this->field) return '';
		/** @var FieldtypeTextareas $type */
		$type = $this->field->type;
		return $type->getNotes($this->field, $name, $language);
	}

	/**
	 * Convert this TextareasData to a string
	 *
	 * @return string
	 *
	 */
	public function __toString() {
		$out = '';
		foreach($this as $key => $value) {
			$out .= "\n\n$key=$value";	
		}
		$out = trim($out); 
		return $out; 
	}

	/**
	 * Default rendering (to be used mostly for testing)
	 *
	 * @param string $headlineType Headline type (default = h2)
	 * @return string
	 *
	 */
	public function render($headlineType = 'h2') {
		$out = '';
		$headlineType = $this->wire('sanitizer')->entities($headlineType); 
		foreach($this as $key => $value) {
			if(empty($value)) continue; 
			if($headlineType) $out .= "<$headlineType>" . $this->label($key) . "</$headlineType>";
			if(is_array($value)) {
				$out .= "<ul>";
				foreach($value as $v) {
					$out .= "<li>" . $this->wire('sanitizer')->entities($v) . "</li>";	
				}
				$out .= "</ul>";
			} else if(is_object($value)) {
				if($value instanceof Page) {
					$label = $value->get('title|name'); 
					$value = $value->viewable() ? "<a href='$value->url'>$label</a>" : $label;
					$out .= "<p>$value</p>";
				} else if($value instanceof PageArray) {
					$out .= "<ul>";
					foreach($value as $v) {
						$label = $v->get('title|name');
						$out .= "<li>" . ($v->viewable() ? "<a href='$v->url'>$label</a>" : $label) . "</li>";
					}
					$out .= "</ul>";
				} else {
					$out .= "<p>$value</p>";
				}
			} else {
				if(strpos($value, '<') === false || !preg_match('{</[a-z]+[0-9]*>}i', $value)) {
					$out .= "<p>$value</p>"; // doesn't already have markup, so add some
				} else {
					$out .= "$value"; // already has markup
				}
			}
		}
		return $out; 
	}

	/**
	 * Sets the value for a given language
	 *
	 * @param int|string|Language $languageID
	 * @param string $property
	 * @param mixed $value
	 * @throws WireException when languages or language not active
	 * @return $this
	 *
	 */
	public function setLanguageValue($languageID, $property, $value) {
		$language = $this->getLanguage($languageID); 
		if($language->isDefault()) return parent::set($property, $value); 
		return parent::set($property . "___$language", $value); 
	}

	/**
	 * Given a language, returns the value in that language
	 *
	 * @param Language|int|string Language 
	 * @param string $property Property to retrieve
	 * @return mixed
	 *
	 */
	public function getLanguageValue($languageID, $property) {
		$language = $this->getLanguage($languageID); 
		if($language->isDefault()) return parent::get($property); 
		return parent::get($property . "___$language"); 
		
	}

	/**
	 * Convert a language argument to a language object
	 * 
	 * @param int $languageID
	 * @return Page|Language
	 * @throws WireException
	 *
	 */
	private function getLanguage($languageID) {
		$languages = $this->wire('languages');
		if(!$languages) throw new WireException('Languages not active'); 
		$language = is_object($languageID) ? $languageID : $languages->get((int) $languageID); 
		if(!$language) throw new WireException("Can't find language $languageID"); 
		return $language; 
	}

}
