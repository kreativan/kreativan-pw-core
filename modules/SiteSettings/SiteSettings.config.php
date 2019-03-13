<?php
/**
 *  SiteSettings Config
 *
 *  @author Ivan Milincic <lokomotivan@gmail.com>
 *  @copyright 2018 Ivan Milincic
 *
 *
*/

class SiteSettingsConfig extends ModuleConfig {

	public function getInputfields() {
		$inputfields = parent::getInputfields();

			// create templates options array
			$templatesArr = array();
			foreach($this->templates as $tmp) {
				$templatesArr["$tmp"] = $tmp->name;
			}

			$wrapper = new InputfieldWrapper();

		//----------------------------------------------------------------------
		//  Options
		//----------------------------------------------------------------------
			$module_options = $this->wire('modules')->get("InputfieldFieldset");
			$module_options->label = __("Module Options");
			//$module_options->collapsed = 1;
			$module_options->icon = "fa-cog";
			$wrapper->add($module_options);

			// hide_admin
			$f = $this->wire('modules')->get("InputfieldRadios");
			$f->attr('name', 'hide_admin');
			$f->label = 'Hide admin page from page tree';
			$f->options = array(
				'1' => "Yes",
				'2' => "No"
			);
			$f->required = true;
			$f->defaultValue = "2";
			$f->optionColumns = "1";
			$f->columnWidth = "100%";
			$module_options->add($f);

			// sys_pages
			$f = $this->wire('modules')->get("InputfieldAsmSelect");
			$f->attr('name', 'sys_pages');
			$f->label = 'System Pages';
			$f->options = $templatesArr;
			$f->notes = __("System pages will be hidden, can be only visible on custom module layouts. Will be hidden from page tree everywhere in admin.");
			$module_options->add($f);

			// render fieldset
            $inputfields->add($module_options);



		// render fields
		return $inputfields;

	}

}
