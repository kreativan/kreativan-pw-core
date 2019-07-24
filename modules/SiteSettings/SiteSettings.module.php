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

		// run hidePages
        $this->addHookAfter('ProcessPageList::execute', $this, 'hidePages');

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

	/**
     *  Include Admin File
     *  Custom Admin UI
     *  @param string $file_name
     *	@param string $page_name used to indentify subpages: URL =  $page->url . $page_name
     *  @example return $this->files->render("MY_ADMIN_FILE.php", "page_name");
     *
     */
    private function includeAdminFile($file_name, $page_name = "") {

        // define variables you want to pass to the included file
        $vars = [
            "this_module" => $this,
			"page_name" => $page_name,
            "module_edit_URL" => $this->urls->admin . "module/edit?name=" . $this->className() . "&collapse_info=1",
        ];

        $template_file = $this->config->paths->siteModules . $this->className() . "/" . $file_name;
        return $this->files->render($template_file, $vars);

    }

	/**
     *  Intercept page tree json and remove page from it
     *  We will remove page by its template
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
            if($json) {
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

	/**
	 * Called only when your module is installed
	 *
	 * If you don't need anything here, you can simply remove this method.
	 *
	 */
	public function ___install() {
		parent::___install(); // always remember to call parent method
	}

	/**
	 * Called only when your module is uninstalled
	 *
	 * This should return the site to the same state it was in before the module was installed.
	 *
	 * If you don't need anything here, you can simply remove this method.
	 *
	 */
	public function ___uninstall() {
		parent::___uninstall(); // always remember to call parent method
	}

}
