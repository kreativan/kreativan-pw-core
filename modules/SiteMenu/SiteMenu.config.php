<?php
/**
 * Configure the Hello World module
 *
 * This type of configuration method requires ProcessWire 2.5.5 or newer.
 * For backwards compatibility with older versions of PW, you'll want to
 * instead want to look into the getModuleConfigInputfields() method, which
 * is specified with the .module file. So we are assuming you only need to
 * support PW 2.5.5 or newer here.
 *
 * For more about configuration methods, see here:
 * http://processwire.com/blog/posts/new-module-configuration-options/
 *
 *
 */

class SiteMenuConfig extends ModuleConfig {

	public function getInputfields() {
        $inputfields = parent::getInputfields();

		$wrapper = new InputfieldWrapper();

		/**
		 * 	Options
		 *
		 */
		$options = $this->wire('modules')->get("InputfieldFieldset");
		$options->label = __("Options");
		//$options->collapsed = 1;
		$options->icon = "fa-cog";
		$wrapper->add($options);


			// show_home
			$f = $this->wire('modules')->get("InputfieldRadios");
			$f->attr('name', 'show_home');
			$f->label = 'Show Home on Main Menu';
			$f->options = array('1' => $this->_('Yes'),'2' => $this->_('No'),);
			$f->required = true;
			$f->defaultValue = 1;
			$f->optionColumns = 1;
			$f->columnWidth = "100%";
            $options->add($f);

			// mobile_menu_style
			$f = $this->wire('modules')->get("InputfieldRadios");
			$f->attr('name', 'mobile_menu_style');
			$f->label = 'Mobile Menu Style';
			$f->options = array('1' => $this->_('Drop'),'2' => $this->_('Offcanvas'),);
			$f->required = true;
			$f->defaultValue = 1;
			$f->optionColumns = 1;
			$f->columnWidth = "100%";
            $options->add($f);

		// render fieldset
        $inputfields->add($options);



		// render fields
		return $inputfields;


	}

}
