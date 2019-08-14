<?php
/**
 *  Admin Actions
 *
 *  @author Ivan Milincic <kreativan@outlook.com>
 *  @copyright 2018 Kreativan
 *  
 *  @var action
 *  @var id
 *
*/


$action  = $this->input->get->admin_action;


if($action) {


    $id = $this->sanitizer->selectorValue($this->input->get->id);
    $p = $this->pages->get($id);


    // Publish / Unpublish

    if($action == "publish") {

        if($p->isUnpublished()) {

            $p->of(false);
            $p->removeStatus('unpublished');
            $p->save();
            $p->of(true);

            $this->session->set("admin_status", "message");
            $this->session->set("admin_alert", "{$p->title} has been unpublished");

        } else {

            $p->of(false);
            $p->status('unpublished');
            $p->save();
            $p->of(true);

            $this->session->set("admin_status", "message");
            $this->session->set("admin_alert", "{$p->title} has been published");
        }

        $this->session->redirect("./");

    }


    // Trash

    if($action == "trash") {

        $p->trash();
		
        $this->session->set("admin_status", "warning");
        $this->session->set("admin_alert", "{$p->title} has been trashed");
		
        $this->session->redirect("./");

    }

    // Restore

    if($action == "restore") {

        $this->pages->restore($p);
        $this->session->redirect("./");

    }


}
