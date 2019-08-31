/**
 *  Custom Number Captcha
 *
 */
function numbCaptcha() {

    var captchaField = document.getElementById("numb-captcha-q");
    var captchaAnswer = document.getElementById("numb-captcha-answer").value;

    captchaField.addEventListener('keyup', function(e) {

        var submitButton = document.querySelector(".captcha-button");

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
    var submitButton = document.querySelector(".captcha-button");
    submitButton.removeAttribute("disabled");
};

function recaptchaExpired() {
    var submitButton = document.querySelector(".captcha-button");
    submitButton.setAttribute("disabled", "disabled");
};
