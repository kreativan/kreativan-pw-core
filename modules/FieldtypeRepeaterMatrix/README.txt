ProcessWire ProFields: Repeater Matrix
======================================

This is a commercially licensed and supported module, please do not distribute.


ABOUT REPEATER MATRIX
---------------------

Repeater Matrix is a type of ProcessWire field that enables you to have a single 
field with multiple items (pages) of varying types. You define what fields 
accompany each item type. You can have any number of items of any type that you 
define. Repeater Matrix fields are very similar to regular ProcessWire repeater 
fields, except that in regular repeater fields, you can only have one type. 
Think of it as a more flexible version of regular repeater fields. 


REQUIREMENTS
------------

- ProcessWire 3.0.5 or newer (or version identified with download).

- ProcessWire's core FieldtypeRepeater module must be installed 
  (Modules > Core > Fieldtype > Repeater).


HOW TO INSTALL
--------------

1. Copy all the files in this directory to /site/modules/FieldtypeRepeaterMatrix/ 

2. In your admin, go to Modules > Check for new modules. 

3. Click the "Install" button next to FieldtypeRepeaterMatrix. 


HOW TO CREATE A REPEATER MATRIX FIELD
-------------------------------------

1. In the ProcessWire admin, go to Setup > Fields > Add New. 

2. Enter your desired field name, label, and choose "RepeaterMatrix" as the type.

3. After saving, click on the "Details" tab. You may add Matrix types from here.

4. After configuring your Repeater Matrix field, add it to one or more templates
   by clicking on the "Actions" tab and checking boxes next to templates.


GENERATING OUTPUT WITH REPEATER MATRIX
--------------------------------------

Items in Matrix fields are just pages like any other on your site. However, unlike 
regular Repeater fields, items can vary in type. Meaning, each item can have a 
different set of fields. So this means your output strategy needs to reflect that. 

Each page in a Matrix field contains a special "type" property that enables you to 
determine what type it is, adjusting your output as necessary. Below is an example 
of how you might output the contents of a Matrix field. 

This example assumes the Matrix field is named "test_matrix" and has two types 
named "content" and "quote". The "content" type contains fields "headline" and 
"summary", while the "quote" type contains fields "quote" and "cite". The following
code might be placed in the template file used by a page with a Matrix field. 

  <?php
  foreach($page->test_matrix as $item) {
    if($item->type == 'content') {
      echo "
        <h3>$item->headline</h3>
        <p>$item->summary</p>
      ";
    } else if($item->type == 'quote') {
      echo "
        <blockquote>
          <p>$item->quote</p>
          <cite>$item->cite</cite>
        </blockquote>
      ";
    }
  }


ISOLATING OUTPUT TO A SEPARATE VIEW FILE

Lets say that you wanted to isolate the above output to a separate file for 
easier re-use. You could cut and paste the entire block of code above and place 
it in this file:

  /site/templates/fields/test_matrix.php

Then anytime you wanted to output the contents of your test_matrix field, you 
could do so like this in any template file:

  <?php echo $page->render('test_matrix'); ?>

Note that in this test_matrix.php, there is a locally scoped $value variable 
available that contains the same thing as $page->test_matrix. You can use 
whichever variable you prefer. $value is just a standard variable provided 
to any field rendering file. 


ISOLATING ITEM OUTPUT TO SEPARATE VIEW FILES

Going further, lets say that you wanted each Matrix item type to have its own 
output file, rather than having a large conditional if() statement checking 
each type, like you see in the example above. What you would do is instead 
create these files:

Main/index output file: /site/templates/fields/test_matrix.php 

  <?php
  foreach($value as $item) {
    echo $item->render();
  }

Output file for type "content": /site/templates/fields/test_matrix/content.php

  <h3><?php echo $page->headline; ?></h3>
  <p><?php echo $page->summary; ?></p>

Output file for type "quote": /site/templates/fields/test_matrix/quote.php

  <blockquote>
    <p><?php echo $page->quote; ?></p>
    <cite><$php echo $page->cite; ?></cite>
  </blockquote>

Any time you want to output the contents of your matrix field, you would just 
use the $page->render method or property, i.e. 

  echo $page->render('test_matrix');

This alternate syntax can be used:

  echo $page->render->test_matrix; 

Or, for even shorter syntax, you can also access the rendered value of any 
field by accessing the field name from the $page with a leading and trailing 
underscore, like this:

  echo $page->_test_matrix_; 


MATRIX PAGES
------------

Matrix pages are just like any other page in ProcessWire, except they use 
the class RepeaterMatrixPage (an extension of RepeaterPage and Page). These 
Matrix pages come with a special method called matrix(), which enables you to 
retrieve information about the matrix type used by the page. Here are a few 
methods you might find useful for a Matrix $page:

  $page->matrix('label')
  Returns the text label used by this matrix type (in current user's language).

  $page->matrix('fields')
  Returns a WireArray of all Field objects used by this type. 

  $page->matrix('type')
  The name of the matrix type, same as $page->type. 

Repeater Matrix pages also have these methods (like regular RepeaterPage objects): 

  $page->getForPage()
  Returns the Page object that this Matrix field lives on.

  $page->getForField()
  Returns the Field object for this Matrix field. 


SUPPORT AND UPGRADES
--------------------

Please see the ProFields support board at http://processwire.com/talk/. If you
have purchased ProFields and don't have access to the support board, please
send a PM to Ryan in the forum or email ryan@processwire.com.


TERMS AND CONDITIONS
--------------------

You may not copy or distribute ProFields, except on site(s) you have registered it
for with Ryan Cramer Design, LLC. It is okay to make copies for use on staging
or development servers specific to the site you registered for.

This service/software includes 1-year of support through the ProcessWire ProFields
Support forum and/or email. Please notify us of your forum name so that we can
upgrade your access to the members-only ProFields Support forum.

In no event shall Ryan Cramer, Ryan Cramer Design, LLC or ProcessWire be liable for 
any special, indirect, consequential, exemplary, or incidental damages whatsoever, 
including, without limitation, damage for loss of business profits, business interruption,
loss of business information, loss of goodwill, or other pecuniary loss whether
based in contract, tort, negligence, strict liability, or otherwise, arising out of
the use or inability to use ProcessWire ProFields, even if Ryan Cramer Design, LLC /
ProcessWire has been advised of the possibility of such damages.

ProFields are provided "as-is" without warranty of any kind, either expressed or
implied, including, but not limited to, the implied warranties of merchantability and
fitness for a particular purpose. The entire risk as to the quality and performance
of the program is with you. Should the program prove defective, you assume the cost
of all necessary servicing, repair or correction. If within 7 days of purchase, you
may request a full refund. Should you run into any trouble with ProFields, please
email for support or visit the ProFields Support forum.

Thanks for using ProcessWire ProFields!


