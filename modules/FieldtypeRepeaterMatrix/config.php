<?php namespace ProcessWire;

/**
 * Class FieldtypeRepeaterMatrixConfigHelper
 *
 * ProcessWire ProFields Repeater Matrix config helper.
 * Provides methods for configuring a Repeater Matrix field.
 *
 * THIS IS PART OF A COMMERCIAL MODULE: DO NOT DISTRIBUTE.
 * This file should NOT be uploaded to GitHub or available for download on any public site.
 *
 * Copyright 2016 by Ryan Cramer
 * ryan@processwire.com
 *
 * PWPFRMPA
 *
 */

class FieldtypeRepeaterMatrixConfigHelper extends Wire {

	/**
	 * @var Field
	 * 
	 */
	protected $field;

	/**
	 * @var Template
	 * 
	 */
	protected $template;

	/**
	 * All optional render files for summary field
	 * 
	 * @var array
	 * 
	 */
	protected $renderFiles = array();

	/**
	 * Construct
	 * 
	 * @param Field $field
	 * @param Template $template
	 * 
	 */
	public function __construct(Field $field, Template $template) {
		$this->field = $field;
		$this->template = $template; 
	}
	
	/**
	 * Get prefix for given repeater matrix item index (for matrix configuration screen)
	 *
	 * @param int|string $n
	 * @return string
	 *
	 */
	public function getMatrixItemPrefix($n) {
		return "matrix{$n}_";
	}

	/**
	 * Populate given $inputfields with fields to configure repeater matrix field
	 * 
	 * Helper for FieldtypeRepeaterMatrix::___getConfigInputfields()
	 * 
	 * @param InputfieldWrapper $inputfields
	 * @return InputfieldWrapper
	 * 
	 */
	public function getConfigInputfields(InputfieldWrapper $inputfields) {
		
		$fieldset = $this->wire('modules')->get('InputfieldFieldset');
		$fieldset->label = $this->_('Repeater matrix types');
		$fieldset->description = $this->_('Define one or more types that will be available in your repeater matrix.');
		$fieldset->attr('id', 'RepeaterMatrixItems');
		$inputfields->prepend($fieldset);

		// setup order of types
		$order = array();
		$maxN = 0;
		for($n = 0; $n <= $this->field->type->getMaxMatrixTypes($this->field); $n++) {
			$prefix = $this->getMatrixItemPrefix($n);
			$name = $this->field->get($prefix . "name");
			if(!$name) continue;
			$sort = (int) $this->field->get($prefix . "sort");
			while(isset($order[$sort])) $sort++;
			$this->field->set($prefix . "sort", $sort);
			$order[$sort] = $n;
			if($n > $maxN) $maxN = $n;
		}
		
		// add existing items in order
		ksort($order);
		foreach($order as $sort => $n) {
			$fieldset->add($this->getConfigInputfieldsMatrixItem($n));
		}
		
		// add new item template
		$newItem = $this->getConfigInputfieldsMatrixItem('N');
		$newItem->addClass('MatrixItemTemplate');
		$fieldset->add($newItem);

		// add needed css and js
		$url = $this->wire('config')->urls->FieldtypeRepeaterMatrix; 
		$this->wire('config')->styles->add($url . 'config.css');
		$this->wire('config')->scripts->add($url . 'config.js');
		$this->wire('config')->js('RepeaterMatrix', array(
			'maxN' => $maxN
		));

		// add type link
		$addLabel = $this->_('Add new matrix type');
		$fieldset->appendMarkup = "<p><a id='MatrixItemAdd' href='#'><i class='fa fa-plus-circle'></i> $addLabel</a></p>";

		$f = $this->wire('modules')->get('InputfieldMarkup');
		$f->label = $this->_('Optional render files for this repeater matrix');
		$file = $this->wire('config')->urls->fieldTemplates . $this->field->name . '.php';
		$f->description = $this->_('The main/index file receives a $value variable containing an array of all repeater matrix items in this page field.') .
			' ' . $this->_('The item file(s) receive a $page variable holding the repeater matrix item.');
		$f->notes = $this->_('See the Repeater Matrix documentation for more details.'); 
		$f->icon = 'file-code-o';
		$f->collapsed = Inputfield::collapsedYes;
		$f->value = 
			"<table class='AdminDataTable AdminDataList'><thead><tr>" . 
			"<th>" . $this->_x('File', 'th') . "</th>" .
			"<th>" . $this->_x('Details', 'th') . "</th>" .
			"</thead><tbody>";
	
		$f->value .= "<tr><td>$file</td><td>" . $this->_('Iterates and outputs all matrix items') . "</td></tr>";
		foreach($this->renderFiles as $name => $file) {
			$f->value .= "<tr><td>$file</td><td>" . sprintf($this->_('Generates output for "%s" matrix items'), $name) . "</td></tr>";
		}
		$f->value .= "</tbody></table>";
		$inputfields->add($f);
		/*	
			"<h3>" . $this->_('Example') . "</h3>" . 
			"<p><b>" . $this->_('Main matrix index file:') . "</b><br /><pre class='MatrixCode'>" . 
			$this->wire('sanitizer')->entities(
				"<?php" . 
				"\nforeach(\$value as \$item) {" . 
				"\n  echo \$item->render();" . 
				"\n}"
			) .
			"</pre></p><p><b>" . $this->_('Item file(s):') . "</b> <span class='detail'>" . 
			$this->_('(assuming $title and $body are fields in the matrix item type)') . 
			"</span><br /><pre class='MatrixCode'>" . 
			$this->wire('sanitizer')->entities(
				"<div class='bodycopy'>" . 
				"\n  <h3><?=\$page->title?></h3>" . 
				"\n  <?=\$page->body?>" . 
				"\n</div>"
			) . 
			"</pre></p>";
		
		//$f->appendMarkup .= ' ' . $this->_('Usage: `echo $page->render("%s");`');
		*/

		return $inputfields; 
	}
	
	/**
	 * Get a single configurable matrix item in a Fieldset
	 *
	 * @param int $n Index of matrix item
	 * @return InputfieldFieldset
	 *
	 */
	protected function getConfigInputfieldsMatrixItem($n) {
		
		$field = $this->field;
		$template = $this->template;

		static $processTemplate = null;
		if(is_null($processTemplate)) {
			$processTemplate = $this->wire('modules')->getModule('ProcessTemplate', array('noInit' => true));
		}

		$prefix = $this->getMatrixItemPrefix($n);
		$contextNamespace = rtrim($prefix, '_');
		$matrixName = $field->get($prefix . "name");
		$matrixLabel = $field->get($prefix . "label");
		$matrixSort = $field->get($prefix . "sort");

		$fieldset = $this->wire('modules')->get('InputfieldFieldset');
		$fieldset->addClass('MatrixItem');
		if($matrixName) {
			$contextLabel = $matrixLabel ? $matrixLabel : $matrixName;
			$renderFile = $this->wire('config')->urls->fieldTemplates . "$field->name/$matrixName.php";
			$this->renderFiles[$matrixName] = $renderFile;
			$fieldset->appendMarkup = "<p class='detail'><i class='fa fa-fw fa-file-code-o'></i>" . 
				sprintf($this->_('Optional render file for this matrix type: %s (receives $page as matrix item)'), "<b>$renderFile</b>") . 
				"</p>";
			//$fieldset->label = sprintf('#%d (id=%d): ', ($matrixSort + 1), $n);
		} else {
			$contextLabel = $this->_('New Matrix Type');
			//$fieldset->label = $contextLabel;
		}
		$fieldset->icon = 'arrows';
		$fieldset->collapsed = Inputfield::collapsedYes;
		$fieldset->attr('id', $prefix . "item");

		$f = $this->modules->get('InputfieldHidden');
		$f->attr('id+name', $prefix . "sort");
		$f->addClass('MatrixItemSort');
		$f->attr('value', $matrixSort);
		$fieldset->add($f);

		$f = $this->modules->get('InputfieldHidden');
		$f->attr('id+name', "_" . $prefix . "delete");
		$f->addClass('MatrixItemDelete');
		$f->attr('value', '');
		$fieldset->add($f);

		$f = $this->modules->get('InputfieldName');
		$f->attr('id+name', $prefix . "name");
		$f->label = $this->_('Name');
		$f->attr('value', $matrixName);
		$f->columnWidth = 50;
		$f->notes = $f->description;
		$f->description = '';
		$f->required = false;
		if($matrixName) {
			$f->required = true;
			$f->attr('required', 'required');
		}
		$fieldset->add($f);
		$nameField = $f;

		$f = $this->modules->get('InputfieldText');
		$f->attr('id+name', $prefix . "label");
		$f->label = $this->_('Label');
		$f->attr('value', $matrixLabel);
		$notes = $this->_('The label used to identify this type to the person editing this field.');
		if($this->wire('languages')) {
			$f->useLanguages = true;
			$nameField->columnWidth = 100;
			$nameField->description = $nameField->notes;
			$nameField->notes = '';
			$f->description = $notes;
			foreach($this->wire('languages') as $language) {
				if($language->isDefault()) continue;
				$f->set("value$language", $field->get($prefix . "label$language"));
			}
		} else {
			$f->columnWidth = 50;
			$f->notes = $notes;
		}
		if(strlen($f->value)) {
			$fieldset->label = $f->value;
		} else if($matrixName) {
			$fieldset->label = $matrixName;
		} else {
			$fieldset->label = $contextLabel;
		}
		$fieldset->add($f);

		$editLink = $this->wire('config')->urls->admin .
			"setup/field/edit" .
			"?id={value}" .
			"&fieldgroup_id={$template->fieldgroup->id}" .
			"&context_namespace=" . $contextNamespace .
			"&context_label=" . urlencode($contextLabel) .
			"&modal=1" .
			"&process_template=1";

		/** @var InputfieldAsmSelect $select */

		$select = $this->modules->get('InputfieldAsmSelect');
		$select->label = $this->_x('Fields', 'field-label');
		$select->description = $this->_('Select the fields that are shown in this matrix type. You may also drag and drop fields to the desired order.');
		$select->description .= ' ' . $this->_('Once a field has been saved in your matrix type, you may also click its label to apply additional customizations to the field.');
		$select->icon = 'cube';
		$select->attr('id+name', $prefix . "fields");
		$select->attr('title', $this->_('Add Field'));
		$select->setAsmSelectOption('sortable', true);
		$select->setAsmSelectOption('editLink', $editLink);
		// $select->setAsmSelectOption('editLinkOnlySelected', false); // makes ProcessField throw error when field isn't in fieldgroup
		$select->setAsmSelectOption('hideDeleted', false);

		$value = $field->get($prefix . "fields");
		if(!is_array($value)) $value = array();

		foreach($this->wire('fields') as $f) {
			if($f->name == $this->field->name) continue;
			if(($f->flags & Field::flagPermanent) && !$this->wire('config')->advanced) continue;
			$name = $f->name;
			if($f->flags & Field::flagSystem) $name .= "*";
			if(in_array($f->id, $value)) {
				$_f = $template->fieldgroup->getFieldContext($f, $contextNamespace);
				if($_f) $f = $_f;
			}
			$attrs = $processTemplate->getAsmListAttrs($f);
			$select->addOption($f->id, $name, $attrs);
		}

		$select->attr('value', $value);
		$fieldset->add($select);
		
		$input = $this->wire('modules')->get('InputfieldText');
		$input->attr('name', $prefix . "head");
		$value = $field->get($prefix . "head");
		if(!$value) $value = "{matrix_label} [• {matrix_summary}]";
		$input->attr('value', $value);
		$input->label = $this->_('Item headers');
		$input->description = $this->_('Enter the format used for item headers in the page editor. Surround page fields in {brackets}.'); 
		$input->description .= ' ' . $this->_('You may also enter {matrix_label} to show the label defined above, and/or {matrix_summary} to auto-summarize the item content. Text surrounded in [square brackets] will be de-emphasized.'); // Description for matrix item headers
		$input->collapsed = Inputfield::collapsedYes;
		$fieldset->add($input);

		return $fieldset;
	}

	/**
	 * Save matrix type config
	 * 
	 * Helper for FieldtypeRepeaterMatrix::___saveConfigInputfields()
	 * 
	 */
	public function saveConfigInputfields() {

		$field = $this->field;
		$input = $this->wire('input');
		$fieldIDs = array($this->wire('fields')->get('repeater_matrix_type')->id);
		$properties = array(
			// POST name => property name
			'name' => 'name', 
			'label' => 'label', 
			'fields' => 'fields',
			'sort' => 'sort', 
			'head' => 'head',
		);

		if($this->wire('languages')) foreach($this->wire('languages') as $language) {
			if(!$language->isDefault()) $properties["label__$language"] = "label$language";
		}

		// ensure that template item is not saved in the field
		$values = $this->field->getArray();
		foreach($properties as $postName => $propertyName) {
			$postName = "matrixN_$postName";
			$propertyName = "matrixN_$propertyName";
			$input->post->offsetUnset($postName);
			if(isset($values[$propertyName])) $this->field->remove($propertyName);
		}
	
		// save the repeater matrix types
		foreach(array_keys($_POST) as $key) {
			
			if(strpos($key, 'matrix') !== 0) continue; 
			if(!strpos($key, '_name')) continue;
			if(!preg_match('/^matrix(\d+)_name$/', $key, $matches)) continue;
			$n = (int) $matches[1];

			$prefix = $this->getMatrixItemPrefix($n);
			$delete = $input->post('_' . $prefix . 'delete');
			$name = $input->post($prefix . 'name');

			if($delete || !$name) {
				// delete the item or remove properties not in use
				foreach($properties as $property) {
					$value = $field->get($prefix . $property);
					if(!is_null($value)) $field->remove($prefix . $property);
				}
				if($delete) $this->message($this->_('Deleted matrix type') . " - $name");
				continue;
			}

			foreach($properties as $postName => $propertyName) {
				if($propertyName == 'fields' || $propertyName == 'sort') continue;
				$value = $input->post->text($prefix . $postName);
				$field->set($prefix . $propertyName, $value);
			}

			$value = $input->post($prefix . 'fields');
			if(is_array($value)) {
				foreach($value as $fieldID) {
					$fieldID = (int) $fieldID;
					$fieldIDs[$fieldID] = $fieldID;
				}
			}
			
			$sort = (int) $input->post($prefix . 'sort');
			$field->set($prefix . 'sort', $sort);
		}

		// populate for FieldtypeRepeater to pick up
		$input->post->repeaterFields = array_values($fieldIDs);
	}
}

