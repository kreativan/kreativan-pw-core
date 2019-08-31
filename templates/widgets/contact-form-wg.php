<?php namespace ProcessWire;
/**
 *  Contact Form Widget
 *  @var Page $widget
*/

// load captcha.js
loadJS($config->urls->templates . "lib/captcha.js");

// admin email
$admin_email = !empty($widget->email) ? $widget->email : setting("site_email");

// form submit message
$form_message = !empty($widget->text) ? $widget->text : lng("form_message");

// Action / Redirect URL
$action_url = !empty($widget->link) ? $widget->link : $page->url;

// Process Form
if($input->post->submit && $session->CSRF->hasValidToken()) {

    // fields
    $name = $sanitizer->text($input->post->name);
    $email = $sanitizer->email($input->post->user_email);
    $message = $sanitizer->textarea($input->post->message);
    $message = nl2br($message);

	// honeypot
	$honeypot = $input->post->email;

    // captcha
    $q          = $sanitizer->text($input->post->numb_captcha);
    $answer     = $sanitizer->text($input->post->answer);

	if(empty($honeypot) && $q == $answer) {

		// email vars
		$email_to       = $admin_email;
		$email_subject  = "Message from $name - " . setting("site_name");
		$email_from     = $email;
		$email_body     = "<p>$message</p>";

		// send email
		mail("$email_to", "$email_subject", "$email_body", "From: $email_from\nContent-Type: text/html");

		// set sesion vars
		$session->set("alert", "$form_message");
		$session->set("status", "primary");

	}

	// Reset token
	$session->CSRF->resetToken();

	// redirect
	$session->redirect($action_url);

}

// Form Submit Alert
if($session->get("alert")) {
    echo renderAlert($session->get("status"), $session->get("alert"));
    $session->remove("status");
    $session->remove("alert");
}

?>

<form class="contact-form" action="<?= $action_url ?>" method="POST">

    <?php echo $session->CSRF->renderInput(); ?>
	<input class="uk-hidden" type="email" name="email" />

    <div>
        <input class="uk-input" type="text" name="name" placeholder="<?= lng("name") ?>" required />
    </div>

    <div class="uk-margin">
        <input class="uk-input" type="email" name="user_email" placeholder="<?= lng("email") ?>" required />
    </div>

    <div class="uk-margin">
        <textarea class="uk-textarea" name="message" placeholder="<?= lng("message") ?>" rows="5" required></textarea>
    </div>

    <!-- captcha -->
    <div class="uk-margin-top uk-grid-small" uk-grid>

        <div class="uk-width-auto@s">
            <?php
                $numb_1 = rand(1, 10);
                $numb_2 = rand(1, 10);
                $numb_q = "$numb_1 + $numb_2 =";
                $answer = $numb_1 + $numb_2;
            ?>
            <div class="uk-grid-collapse" uk-grid>
                <div class="uk-width-auto uk-flex uk-flex-middle">
                    <label class="uk-h3"><?= $numb_q ?></label>
                </div>
                <div class="uk-width-auto">
                    <input id="numb-captcha-answer" class="uk-hidden" type="text" name="answer" value="<?= $answer ?>" required />
                    <input id="numb-captcha-q" class="uk-input uk-form-width-xsmall uk-margin-small-left uk-text-center" type="text" name="numb_captcha" placeholder="?" required />
                </div>
            </div>
        </div>

        <div class="uk-width-expand@s">
            <input class="uk-hidden" name="contact_form" value="1" />
            <input class="uk-button uk-button-primary captcha-button" type="submit" name="submit" value="<?= lng("contact_us") ?>" disabled />
        </div>

    </div>

</form>
