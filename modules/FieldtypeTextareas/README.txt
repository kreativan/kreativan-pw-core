ProcessWire ProFields: Textareas Fieldtype and Inputfield
=========================================================

This is a commercially supported module, please do not distribute. 


WHAT IT DOES
------------

This fieldtype lets you combine multiple named fields into a single text field. 
This can help to reduce the quantity of fields necessary in your ProcessWire
installation, especially when you have several fields that all have the same 
requrements. For instance, if you needed 10 textarea fields that each represented
some different data, but all had the same input requirements, then you could 
convert all of those to 1 Textareas field. 

As of version 5, this Fieldtype now supports inputs well beyond text inputs and 
includes single and multi-choice inputs, Page inputs, dates, checkbox toggles, and 
more. It will attempt to use any Inputfield modules in the system except for those 
that are known not compatible.

Note that regardless of what type of input this field is holding, it is always
stored as text in the database. As a result, the values are only searchable 
from the API as text. This is the primary compromise with using Textareas. 


USAGE EXAMPLE
-------------

Please read this usage example completely, as the example continues to be used
throughout this document. 

Lets say we're building a website for a realtor, and we're going to have a directory 
of homes for sale on this web site. We will need several 'notes' fields that each 
represent different information about the property, but all have similar input 
requirements:

  - Realtor's notes about the property
  - About the company that built the property
  - About the neighborhood that the property is in 
  - About the utilities, water, sewer, etc. 
  - Descriptions for the bedrooms in the home. 

We were planning to set these all up as seperate Textarea fields using a rich text 
editor like CKEditor. But now that we've got the Textareas Fieldtype, we have
another option: we can combine them all into one, while still being able to 
input them separately in your admin, and output them separately on the front-end
of the site. 


HOW TO INSTALL
--------------

1. Copy all the files in this directory to /site/modules/FieldtypeTextareas/ 

2. In your admin, go to Modules > Check for new modules. 

3. Click the "Install" button next to FieldtypeTextareas. 


HOW TO CREATE A TEXTAREAS FIELD
-------------------------------

1. In your admin, go to Setup > Fields > Add New. 

2. Enter a field name and label, and select "Textareas" for the "Type". Save.

3. On the "Details" tab, choose an "Inputfield Type". This will be the type used
   by each of your textareas. If we were to continue our usage example above,
   we would choose one of the rich text editor fields like TinyMCE or CKEditor.

4. Also on the "Details" tab, see "Textarea Definitions". Enter a name=label for
   each of your fields you want represented here. As an example, we would define
   the fields in our usage example above in this manner: 

   property = About the property
   builder = About the company that built the property
   neighborhood = About the neighborhood that the property is in 
   utilities = About the utilities such as water, sewer, etc. 
   bedrooms = Descriptions for the bedrooms in the home. 

5. Save. Then click to the "Input" tab. Depending on what input type you selected
   on the "Details" tab, you may have additional configuration options available 
   to you on this "Input" tab. Make any changes necessary and Save again. 

6. Add your new field you created to one or more templates and start editing
   pages using your new Textareas field! 


HOW TO ACCESS YOUR FIELD FROM THE API
-------------------------------------

Your new Textareas field is represented on your page as an object where you can 
reference any of the individual components from that object directly by name. 

For example, lets say that you named your Textareas field "notes". Continuing
the usage example from above, we could access any of the individual pieces of
data on that field from our $page like this:

    echo "<h2>About the Property</h2>";
    echo $page->notes->property;

    echo "<h2>About the Builder</h2>";
    echo $page->notes->builder; 

    echo "<h2>About the Neighborhood</h2>";
    echo $page->notes->neighborhood; 

...and so on. Note that we included some H2 headlines in our output there. One
thing you can do is to pull in the labels that were defined with the field. If
you wanted to do that, you could output the above like this:

    echo "<h2>" . $page->notes->label('property') . "</h2>";
    echo $page->notes->property; 

Note that in addition to the label() method, thre is also a description()
method that can be used in the same way. The only difference is that it 
returns the description (when used) rather than the label. We won't use it in
our examples here since usage is identical to label(), but just wanted to 
let you know it was there. 

Lets say that you just wanted to output all of the data present in your
Textareas field together. Your Textareas field can be iterated like an array:

    foreach($page->notes as $name => $value) {
        $label = $page->notes->label($name); 
        echo "<h2>$label</h2>" . $value; 
    }

You can also get the same result as the above by using the built-in render
method (useful for testing and other quick usages):

    echo $page->notes->render(); // outputs with labels as h2 headlines
    echo $page->notes->render('h3'); // optionally specify headline type


ADDITIONAL NOTES FOR VERSION 5+
-------------------------------
As of version 5, it is now possible for the value of each element in the
Textareas field to be types other than just strings. Technically they are 
still stored as strings, but may be converted to other types at runtime.

It using a multi-selection field like checkboxes, select multiple or 
AsmSelect, each element in the Textareas field will be an array of strings
containing the selected values. 

If using a Page field, each element in the Textareas field will either be 
a Page object or a PageArray object, depending on what you've configured
in the field settings. 


HOW TO SET VALUES TO YOUR TEXTAREAS FIELD 
-----------------------------------------

You can set values to your Textareas field directly, in the same manner in
which you access it:

    $page->of(false); // turn of output formatting, if it isn't already. 
    $page->notes->builder = "<p>AAA Build Co. made this house in 1978...</p>";
    $page->save('notes'); 

Note that this always assumes the default language. If using multi-language
see the section on multi-language below. 


TEXTAREAS FIELDS AND $pages->find()
-----------------------------------

All the individual fields within your single Textareas field are bundled into
one searchable field. When you perform a search, it will search all of them
together. Continuing the usage example above, lets say that your field is named
"notes" and that you want to search for the text "AAA Build". You must search
the entire "notes" field:

    $items = $pages->find("notes%=AAA Build"); 


MULTI-LANGUAGE SUPPORT
======================

When configuring your Textareas field, you'll see an option to enable multi-
language support. When enabled, there will be separate inputs for each of 
your Textareas properties, per language. The value output on the front-end
of the site will reflect the language that it is viewed in. In cases where 
a value is populated for the default language but not for another language,
you can choose to have the default language value inherited to the other
language value. 


GETTING MULTI-LANGUAGE VALUES
-----------------------------

When it comes to outputting multi-language values on the front-end of your
site, you do not have to do anything. The correct language value will 
output automatically, so long as the $page's output formatting is ON (as it
always is by default on the front-end):

    echo $page->notes->builder; // outputs in current user language

    $user->language = $languages->get('es'); 
    echo $page->notes->builder; // outputs in Spanish 

Likewise, your usage of the label() and description() methods...

    echo $page->notes->label('builder');
    echo $page->notes->description('builder'); 

...will also reflect the correct language (if you've defined values for
label and/or description in the language). 

If you want to retrieve a language value independently from the current
user language, do this:

    $spanish = $languages->get('es'); 
    $value = $page->notes->getLanguageValue($spanish, 'builder'); 


SETTING MULTI-LANGUAGE VALUES
-----------------------------

When it comes to setting values in a multi-language environment, Textareas
requires that you use the setLanguageValue() method. If you attempt to
set a value without it, it will only set the default language value. The
following example demonstrates how to use it:

    $page->of(false); // turn off output formatting, if applicable
    $en = $languages->get('default'); 
    $es = $languages->get('es'); 

    // Syntax: $page->field->setLanguageValue($language, $property, $value)

    $page->notes->setLanguageValue($en, 'neighborhood', 'The Neighborhood'); 
    $page->notes->setLanguageValue($es, 'neighborhood', 'El Barrio'); 
    $page->save(); 


SUPPORT AND UPGRADES
====================

Please see the ProFields support board at https://processwire.com/talk/. If you
have purchased ProFields and don't have access to the support board, please 
send a PM to Ryan in the forum or email ryan@processwire.com. 




