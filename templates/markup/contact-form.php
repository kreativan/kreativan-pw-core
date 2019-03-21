<?php
/**
 *  Contact Form
 *
 *  @author Ivan Milincic <lokomotivan@gmail.com>
 *  @copyright 2017 Ivan Milincic
 *
 *  @var custom_admin_email  -- override admin email
 *  @var custom_form_message  --  Override form success message
 *
*/

// load captcha.js
loadJS($config->urls->templates . "lib/captcha.js");

// admin email
$admin_email = !empty($custom_admin_email) ? $custom_admin_email : $system->site_info->email;
// form submit message
$form_message = !empty($custom_form_message) ? $custom_form_message : $lng___form_message;

// Process Form
if($input->post->submit && $session->CSRF->hasValidToken()) {

    // fields
    $name          = $sanitizer->text($input->post->name);
    $email         = $sanitizer->email($input->post->email);
    $subject       = $sanitizer->text($input->post->subject);
    $message       = $sanitizer->textarea($input->post->message);

    // captcha
    $q          = $sanitizer->text($input->post->numb_captcha);
    $answer     = $sanitizer->text($input->post->answer);

    // email
    $email_to       = $admin_email;
    $email_subject  = !empty($subject) ? $subject : $name;
    $email_from     = $email;
    $email_body     = "<p>$message</p>";

    // send email
    mail("$email_to", "$email_subject", "$email_body", "From: $email_from\nContent-Type: text/html");

    // set sesion vars
    $session->set("alert", "$form_message");
    $session->set("status", "primary");
	
	// Reset token
    $session->CSRF->resetToken();

    // redirect
    $session->redirect($page->url);

}

// Form Submit Alert
echo renderAlert();

?>

<form id="contact-form" action="./" method="POST">

    <?php echo $session->CSRF->renderInput(); ?>

    <div class="uk-child-width-expand@m uk-margin" uk-grid>
        <div>
            <input class="uk-input" type="text" name="name" placeholder="<?= $lng___name ?>" required />
        </div>
        <div>
            <input class="uk-input" type="email" name="email" placeholder="<?= $lng___email ?>" required />
        </div>
    </div>

    <div class="uk-margin">
        <input class="uk-input" type="text" name="subject" placeholder="<?= $lng___subject ?>" />
    </div>

    <div class="uk-margin">
        <textarea class="uk-textarea" name="message" placeholder="<?= $lng___message ?>" rows="5" required></textarea>
    </div>

    <!-- captcha -->
    <div class="uk-margin-top uk-grid-small" uk-grid>

        <div class="uk-width-auto@s">
            <?php
                $numb_1 = rand(1, 5);
                $numb_2 = rand(1, 5);
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
            <button id="button-submit" class="uk-button uk-button-primary" name="submit" value="submit" form="contact-form" disabled>
                <?= $lng___contact_us ?>
            </button>
        </div>

    </div>

</form>
