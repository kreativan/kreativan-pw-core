<?php
/**
 *  SiteMenu
 *
 *  @author Ivan Milincic <kreativan@outlook.com>
 *  @copyright 2019 kraetivan.net
 *  @link http://www.kraetivan.net
 *
*/

class SiteMenu extends Process {


    public function init() {
        parent::init(); // always remember to call the parent init
    }

    /**
     *  Execute
     *  Module Page
     *  @method includeAdminFile()
     *
     */
    public function ___execute() {

        // set a new headline, replacing the one used by our page
        // this is optional as PW will auto-generate a headline
        $this->headline('Menu Manager');

        // add a breadcrumb that returns to our main page
        // this is optional as PW will auto-generate breadcrumbs
        $this->breadcrumb('./', 'Menu Manager');

        // include admin file
        return $this->modules->get("SiteHelper")->includeAdminFile($this, "admin.php", "main");

    }

    /**
     *  Create New
     *  @method includeAdminFile()
     *
     */
    public function ___executeNew() {

        // set a new headline, replacing the one used by our page
        // this is optional as PW will auto-generate a headline
        $this->headline('New Menu item');

        // add a breadcrumb that returns to our main page
        // this is optional as PW will auto-generate breadcrumbs
        $this->breadcrumb('./../', 'Menu Manager');
        $this->breadcrumb('./', 'New Menu Item');

        // include admin file
        return $this->modules->get("SiteHelper")->includeAdminFile($this, "admin.php", "new");

    }

    /**
     *  Trash Page
     */
    public function ___executeTrash() {

        // set a new headline, replacing the one used by our page
        // this is optional as PW will auto-generate a headline
        $this->headline('Menu Manager');

        // add a breadcrumb that returns to our main page
        // this is optional as PW will auto-generate breadcrumbs
        $this->breadcrumb('./', 'Menu Manager');
        $this->breadcrumb('./../', 'Trash');

        // include admin file
        return $this->modules->get("SiteHelper")->includeAdminFile($this, "admin.php", "trash");

    }

    /**
     *  This is custom page edit for this module
     *  Edit URL @example admin/MODULE_URL/edit/id?=PAGE_ID
     *
     */
    public function executeEdit() {
        return $this->modules->get("SiteHelper")->adminPageEdit();
    }

}
