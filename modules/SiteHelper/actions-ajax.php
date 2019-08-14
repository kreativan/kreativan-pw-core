<?php
/**
 *  Ajax Actions
 *
 *  @author Ivan Milincic <kreativan@outlook.com>
 *  @copyright 2018 Kreativan
 *
 *
*/


$ajax_action = $this->input->post->ajax_action;

if($ajax_action) {


    $id = $this->sanitizer->selectorValue($this->input->post->id);
    $p = $this->pages->get($id);


    /**
     *  Publish
     * 
     */

    if($ajax_action && $ajax_action == "publish") {
        
        if($p->isUnpublished()) {

            $p->of(false);
            $p->removeStatus('unpublished');
            $p->save();
            $p->of(true);

        } else {

            $p->of(false);
            $p->status('unpublished');
            $p->save();
            $p->of(true);

        }

        exit();

    }


    /**
     *  Hide
     * 
     */

    if($ajax_action && $ajax_action == "hide") {

        if($p->isHidden()) {

            $p->of(false);
            $p->removeStatus('unpublished');
            $p->save();
            $p->of(true);

        } else {

            $p->of(false);
            $p->status('unpublished');
            $p->save();
            $p->of(true);

        }

        exit();

    }


    /**
     *  Trash
     * 
     */

    if($ajax_action && $ajax_action == "trash") {

        $p->trash();
        exit();

    }


    /**
     *  Restore
     * 
     */

    if($ajax_action && $ajax_action == "restore") {

        $this->pages->restore($p);

        exit();


    }



    /**
     *  Delete
     * 
     */

    if($ajax_action && $ajax_action == "delete") {

        $this->pages->delete($p);

        exit();

    }
    


}