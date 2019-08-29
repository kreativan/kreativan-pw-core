// Set active classes for element parents
function setActiveParent() {
    var classes = ".uk-navbar-dropdown-nav > li.uk-active, .uk-nav-sub > li.uk-active";
    var active = document.querySelectorAll(classes);
    if (active != null) {
        active.forEach(e => {
            var parent = e.closest("li.uk-parent");
            parent.classList.add("uk-active");
			parent.classList.add("uk-open");
            // console.log(parent);
        });
    }
}
setActiveParent();


// Scroll To Top
function scrollToTop() {
    window.addEventListener("scroll", function() {
        if(window.scrollY > 300) {
            document.querySelector(".uk-totop").classList.add('uk-active', "uk-animation-slide-bottom");
        } else {
            document.querySelector(".uk-totop").classList.remove('uk-active');
        }
    });
}
scrollToTop();


// Form requierd elements
function markRequiredForm() {
    let formElements = document.querySelectorAll('input:not([type=checkbox]):not(.no-req), textarea:not(.no-req), select:not(.no-req)');
    formElements.forEach(e => {

        if(e.hasAttribute('required') == true) {

            // add class to the element
            e.classList.add("tm-required");

            // if element is requerd change it's outerHTML
            let newElement = "<div class='requierd-input uk-position-relative'>";
            newElement += "<span style='color:red;position:absolute;top:0px;right:5px;'>*</span>";
            newElement += e.outerHTML;
            newElement += "</div>";
            // asign new outerHTML to the element
            e.outerHTML = newElement;

        }
    });
}
markRequiredForm();


/**
 *  Add uk-toggle attribute to all elemets with .tm-toggle class
 *  Using this to invoke modals and offcanvas via uk-toggle attr
 *
 */
function ukToggleAttr() {
    var tmToggleElements = document.querySelectorAll(".tm-toggle");
    if(tmToggleElements.length > 0) {
        tmToggleElements.forEach(function(e) {
            e.setAttribute("uk-toggle", "");
        });
    }
}
ukToggleAttr();


/**
 *  Validate Form
 *  @var formID    string, form css id
 *
 *  @example validateForm("#my-form");
 *  @return object
 *  @example validateForm("#my-form").status;
 *  @return bool
 *
 */
function validateForm(formID) {

    var errors = "";

    var selector = `${formID} input:not(.uk-hidden), ${formID} textarea, ${formID} select, ${formID} radio, ${formID} checkbox`;
    var fields = document.querySelectorAll(selector);
    //console.log(fields);

    fields.forEach(e => {

        if(e.checkValidity() === false) {
            //console.log(e);
            let name = e.getAttribute("name");
            errors += (errors == "") ? name  : "," + name;
        }

    });

    var validate = (errors != "") ? false : true;
    var response = {
        "status": validate,
        "errors": errors
    }

    //console.log(response)

    return response;

}


/**
 *  Display modal confirm (UIkit)
 *  It's just gonna prompt you "are you sure" and redirect to the href url
 *  @example <a href="#" onclick="modalConfirm('Are you Sure?', 'My custom text here')">Example</a>
 *  @param {string} q
 *  @param {string} txt
 *
 */
function modalConfirm(q, txt) {

    event.preventDefault();
    var e = event.target;
    let href = e.getAttribute('href');
    let question = (q != null) ? q : "Are you sure?";
    let heading = `<div class="tm-modal-confirm-title uk-h2 uk-text-center uk-margin-remove">${question}</div>`;
    let text = txt != null ? `<div class="tm-modal-confirm-text uk-text-center uk-margin-small-top">${txt}</div>` : "";

    UIkit.modal.confirm(heading+text).then(function () {
            window.location.replace(href);
        }, function () {
        // console.log('Rejected.')
    });

}
