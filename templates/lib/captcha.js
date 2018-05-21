/**
 *  Custom Number Captcha
 *
 */
function numbCaptcha() {

    var captchaField = document.getElementById("numb-captcha-q");
    var captchaAnswer = document.getElementById("numb-captcha-answer").value;

    captchaField.addEventListener('keyup', function(e) {

        var submitButton = document.getElementById("button-submit");

        if(this.value === captchaAnswer) {
            submitButton.removeAttribute("disabled");
        } else {
            submitButton.setAttribute("disabled", "");
        }

    });
}

// run numbCaptcha when dom content is loaded
document.addEventListener('DOMContentLoaded', numbCaptcha, false);

/**
 *  Enable-Disable button based on recaptcha callback
 *
 */
function recaptchaCallback() {
    var submitButton = document.getElementById("button-submit");
    submitButton.removeAttribute("disabled");
};

function recaptchaExpired() {
    var submitButton = document.getElementById("button-submit");
    submitButton.setAttribute("disabled", "disabled");
};
