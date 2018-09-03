/**
 *  Scroll To Top
 *
 */
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

/**
 *  Set active classes for element parents
 *
 */
function setActiveParent() {
    var classes = ".uk-navbar-dropdown-nav > li.uk-active, uk-nav-sub > li.uk-active";
    var active = document.querySelector(classes);
    if(active != null) {
        var parent = active.closest("li.uk-parent");
        parent.classList.add("uk-active");
    }
}
setActiveParent();


/**
 *  Form requierd elements
 *
 */
function markRequiredForm() {
    var formElements = document.querySelectorAll('input, textarea, select');
    formElements.forEach(e => {

        if(e.hasAttribute('required') == true) {

            // add class to the element
            e.classList.add("tm-required");

            // if element is requerd change it's outerHTML
            var newElement = "<div class='requierd-input uk-position-relative'>";
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