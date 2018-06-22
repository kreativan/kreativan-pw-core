<?php
/**
 *  SiteSettings Module
 *
 *  @author Ivan Milincic <lokomotivan@gmail.com>
 *  @copyright 2017 Ivan Milincic
 *
 *
*/


class SiteSettings extends Process {

    const MODULE_NAME = 'SiteSettings';

    public static function getModuleInfo() {
		return array(
				'title' => 'Site Settings',
				'summary' => 'Main website module. Creates site settings admin page, custom functions and options etc...',
				'version' => '0.1',
				'author' => 'Ivan Milincic',
				'icon' => 'cog',
                'autoload' => true,
                'singular' => true,
				'href' => 'http://modules.processwire.com/',
                'page' => array(
					'name' => "settings",
					'parent' => "setup",
					'title' => "Site Settings",
					'sort' => "0",
				),
				'singular' => true, // need for Redirect
            	'autoload' => true, // need for Redirect
				'permission' => 'page-view',
			);
	}

    public function init() {
        parent::init(); // always remember to call the parent init

        if(strpos($_SERVER['REQUEST_URI'], $this->wire('config')->urls->admin) === 0) {

            // add custom js file to admin area
            $this->config->scripts->append($this->config->urls->siteModules . self::MODULE_NAME ."/assets/admin.js");

            /**
             *  Pass vars to JavaScript
             *  @example var kreativan = ProcessWire.config.kreativan;
             *  @example console.log(kreativan)
             *
            */
            $this->config->js('kreativan', [
                'homeURL' => $this->config->urls->root,
            ]);

        }

        // run hidePages
        $this->addHookAfter('ProcessPageList::execute', $this, 'hidePages');

    }

    /**
     *  Main module page
     *
     */
    public function ___execute() {
        $system_url = wire("config")->urls->admin  . "page/edit/?id=" . wire("pages")->get("template=system")->id;
        return wire("session")->redirect($system_url);
    }

    /**
     * Install the module
     */
    public function ___install() {
        parent::___install();

    }

    /**
     * Uninstall the module
     */
    public function ___uninstall() {
        parent::___uninstall();

    }

    /**
    *  Intercept page tree json and remove page from it
    *  We will remove page by its template
    *  @var pagetemplate template of the current page in a loop
    *  @var sysPagesArr Array of tamplates we wish to remove
    *
    */
    public function hidePages(HookEvent $event){

        // get system pages
        $sysPagesArr = $this->sys_pages;

        // aditional pages to hide by ID
        $customArr = [];
        if($this->hide_admin == "1") {
           array_push($customArr, "2");
        }

        if($this->config->ajax) {

            // manipulate the json returned and remove any pages found from array
            $json = json_decode($event->return, true);
            foreach($json['children'] as $key => $child){
                $c = $this->pages->get($child['id']);
                $pagetemplate = $c->template;
                if(in_array($pagetemplate, $sysPagesArr) || in_array($c, $customArr)) {
                    unset($json['children'][$key]);
                }
            }
            $json['children'] = array_values($json['children']);
            $event->return = json_encode($json);

        }

    }

}
