<?php
/**
 *  SiteSettings Module
 *
 *  @author Ivan Milincic <kreativan@outlook.com>
 *  @copyright 2018 Kreativan
 *
 *
*/

class SiteSettings extends Process {

	/**
	 * This is an optional initialization function called before any execute functions.
	 *
	 * If you don't need to do any initialization common to every execution of this module,
	 * you can simply remove this init() method.
	 *
	 */
	public function init() {
		parent::init(); // always remember to call the parent init

	}

	/**
     * This function is executed when a page with your Process assigned is accessed.
     *
     * This can be seen as your main or index function. You'll probably want to replace
     * everything in this function.
     *
     */
    public function ___execute() {

       $system_url = wire("config")->urls->admin  . "page/edit/?id=" . wire("pages")->get("template=system")->id;
       return wire("session")->redirect($system_url);

    }

}
