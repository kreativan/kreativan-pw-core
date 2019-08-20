ProcessWire ProFields: Table Fieldtype & Inputfield
===================================================

This is a commercial module, please do not distribute. 


WHAT IT DOES
------------

This Fieldtype is the first of its kind in that it lets you literally define
your own Fieldtype. Think of it kind of like a lean and mean repeater field, 
with no extra overhead. You define the fields (and types) that you want use 
for one or more columns in a table. Behind the scenes, this Fieldtype creates 
a custom database table for storage. Each column in the database table translates
to an HTML table column of inputs present in your page editor. This is ideal
for things like rate tables, multi-column lists, inventories and more. 

Supported inputs include text, dates, times, selects, checkboxes, radios, emails,
URLs and more. Because these inputs translate directly to database columns, they are
distinct other Inputfields you may see in ProcessWire. In the admin page editor, 
the table of inputs is sortable and an unlimited number of rows may be added. 


USAGE EXAMPLE
-------------

Lets say that we're building a website for an architecture firm. Each of the 
projects in their portfolio needs a section that outlines what awards that project 
received.  We want to maintain the following pieces of information for each award: 

  - Award title
  - Award date
  - Category: Architecture, Interior Design, or Engineering
  - Award URL for more info (if available)

The Table Fieldtype/Inputfield enables us to create and manage this easily, all 
from just one field, with no need to create new templates or pages. Continue 
reading below to see how we go about implementing this. 


HOW TO INSTALL
--------------

1. Copy all the files in this directory to /site/modules/FieldtypeTable/ 

2. In your admin, go to Modules > Check for new modules. 

3. Click the "Install" button next to FieldtypeTable. 


HOW TO CREATE A TABLE FIELD
---------------------------

1. In your admin, go to Setup > Fields > Add New. 

2. Enter a field name (i.e. "awards")  and label, and select "Table" for the 
   "Type". Save.

3. Click to the "Details" tab. This is where you will define the columns that 
   will appear in your table. We will continue the usage example above and
   specify "4" for the Number of Columns field (to correspond with title, date,
   category and URL, as mentioned above). Save. 

4. Under "Column Definitions", click to open each column definition and specify
   the following: 

   Column 1 Name:	title
   Column 1 Label:	Award Title
   Column 1 Type:	Text
   Column 1 Width:	25 

   Column 2 Name:	date
   Column 2 Label:	Date Awarded
   Column 2 Type:	Date
   Column 2 Width:	25 
   
   Column 3 Name:	category
   Column 3 Label:	Category
   Column 3 Type:	Select
   Column 3 Width:	25 
   Column 3 Options:	Architecture, Interior Design, Engineering

   Column 4 Name:	url
   Column 4 Label:	Award URL
   Column 4 Type:	URL
   Column 4 Width: 	25

5. Save your field, and now go to edit the template you want to add this field
   on (Setup > Templates). In our usage example, we would edit the 
   "portfolio_project" template. Add the field you just created and Save. 

6. Now go and edit or create a page using that field to see the results. Likely
   the first thing you will want to do is click "Add Row" in your new field. 


HOW TO ACCESS YOUR FIELD FROM THE API
-------------------------------------

Your new Table field is represented on your page as a WireArray object. Each item
in the WireArray represents a row in the table. You can access the property of 
any row directly by field name. Depending on the type you selected for your column,
the resulting value will either be a string, integer, float or array. 

The value of multi-choice fields (like checkboxes) is always an array. The array 
will contain the values of selected items. The value of a single checkbox field 
will always be either 0 or 1, with 1 representing the checked state. 

The value of your Table field itself (i.e. $page->awards) is of a TableRows object. 
It is a WireArray and benefits from all the methods of a WireArray (see 
cheatsheet.processwire.com). It also adds these additional table-specific methods
you may find helpful (presenting them in our "awards" example context):

    // Return an array of information for every column. 
    $page->awards->getColumns(); 
    $page->awards->columns; // alternate syntax

    // Return an array of information for the given column number or name. 
    $page->awards->getColumn($n); 

    // Return an array of all column labels, indexed by column name. 
    $page->awards->getLabels();
    $page->awards->labels; // alternate syntax

    // Return a string containing the label for the given column number or name.
    $page->awards->getLabel($n); 

    // Return a rendered HTML table. 
    $page->awards->render(); 
    $page->awards->render($options); 
 
Continuing the usage example from above, we could output our list of awards 
like this: 

    foreach($page->awards as $award) {
      echo "<h3>$award->title</h3><ul>";
      if($award->date) echo "<li>Date Awarded: $award->date</li>";
      if($award->category) echo "<li>Category: $award->category</li>";
      if($award->url) echo "<li>Details: $award->url</li>";
    }

Lets say that we want to use the same labels we specified with the field, rather
then typing them in manually: 

    $labels = $page->awards->labels; // retrieve all column labels
    foreach($page->awards as $award) {
      echo "<h3>$award->title</h3><ul>";
      if($award->date) echo "<li>$labels[date]: $award->date</li>";
      if($award->category) echo "<li>$labels[category]: $award->category</li>";
      if($award->url) echo "<li>$labels[url]: $award->url</li>";
    }

Now lets bring the context back to a table: 

   <table>
     <thead>
       <tr>
         <th>Title</th>
         <th>Date</th>
         <th>Category</th>
         <th>Details</th>
       </tr>
     </thead>
     <tbody>
       <?php 
       foreach($page->awards as $award) {
         echo "<tr>";
         echo "<td>$award->title</td>";
         echo "<td>$award->date</td>";
         echo "<td>$award->category</td>";
         echo "<td>$award->url</td>";
         echo "</tr>";
       }
       ?>
     </tbody>
   </table>

If we wanted to, we could build the above table more programmatically like this:

   <table>
     <thead>
       <tr>
         <?php foreach($page->awards->labels as $label) echo "<th>$label</th>"; ?>
       </tr>
     </thead>
     <tbody>
       <?php 
       foreach($page->awards as $award) {
         echo "<tr>";
         foreach($award as $name => $value) echo "<td>$value</td>";
         echo "</tr>";
       }
       ?>
     </tbody>
   </table>

But we can get even simpler than that. As a bonus, FieldtypeTable comes with it's 
own rendering capability, which will output a table similar to the above with 
just one line of code...

   echo $page->awards->render();

...however you will likely want to render your own tables for the most flexibility.
But if you want to use this built-in render method, you have a few $options you can
provide to the method, i.e. $page->awards->render($options). The $options is an array
that can contain any one or more of the following:

    tableClass (string)
    Class name for table (default=ft-table)

    columnClass (string) 
    Class name for each column, col name will be appended: (default=ft-table-col)

    useWidth (boolean)
    Indicates whether to use width attributes in columns (default=true)

     
HOW TO SET VALUES TO YOUR TABLE FIELD 
-------------------------------------

Modifying the first row: 

    $page->of(false); // turn off output formatting, if necessary
    $award = $page->awards->first();
    $award->title = "Most Sustainable Building";
    $award->date = "2014-05-01";
    $page->save('awards'); 

Adding a new row: 

    $page->of(false); // turn off output formatting, if necessary
    $award = $page->awards->makeBlankItem(); 
    $award->title = "Tallest Building";
    $award->date = "2014-05-01";
    $award->category = "Engineering";
    $award->url = "http://di.net/tallest/building/award/";
    $page->awards->add($award); 
    $page->save('awards'); 

Deleting the last row: 

    $page->of(false);
    $award = $page->awards->last();
    $page->awards->remove($award); 
    $page->save('awards'); 
    
Modifying a multi-language text column:

	// assumes the column "description" is a multi-language text column
	$page->of(false);
	$beer = $page->beers->first();
	$english = $languages->get('default');
	$spanish = $languages->get('es');
	$beer->description->setLanguageValue($english, 'Good Beer'); 
	$beer->description->setLanguageValue($spanish, 'Bueno Cerveza'); 
	$page->save('beers');

For more information about how to maninpulate WireArray objects, be sure to
see http://cheatsheet.processwire.com


TABLE FIELDS AND $pages->find()
-------------------------------

Because each column in your table also represents a column in a database table
you can search any field by specifying the field name and column name, like this:

    $engineeringAwards = $pages->find("awards.category=Engineering"); 
    
In the above example the "category" column is of type "text". If it were one of 
the "page" reference types, then you would instead use the id number of the page
(rather than "Engineering"). 


PAGINATION, SORTING AND FILTERING SUPPORT
-----------------------------------------

FieldtypeTable v0.1.4 added support for pagination, sorting, and filtering, 
providing the necessary foundation for supporting tables with any number of 
rows. Previously, the quantity of rows was limited by how many you could fit
in memory at once... the more rows you had, the more overhead. This is no
longer the case. This section will describe how to utilize pagination for 
large tables. 


Requirements
============

- You must be running ProcessWire core version 2.8.27 (or newer) or version 
  3.0.27 (or newer). 
  
- In your table field settings it is required that you select one or more 
  automatic sort columns before pagination and filtering will be enabled. 
  
- Pagination applies to the front-end as well, so any page templates that
  you have outputting your Table field values should have pagination 
  enabled via Setup > Templates > [your-template] > URLs > Pagination. 


Enabling sorting, pagination and filtering
==========================================

1. If applying to an existing Table field with data already in it, we 
   recommend that you backup your database first for safety. 

2. In your table field settings (Setup > Fields > [your-field]) on the 
   "Details" tab and click the "Sorting and Pagination" fieldset. 
   
3. Select one (or more) fields for automatic sorting.   

4. Enter a value for "Pagination limit", such as 10, 20 or how many 
   ever items you want rendered per pagination. 
   
5. Save, and your field should now be using sorting and pagination. 

If you have enough rows present, you may observe the behavior 
immediately in the page editor. To use filtering click the "Find"
link that appears in the header of your Table field. It will open
up a new table with inputs for each row that you can populate to
find/filter what rows are displayed. 


How to use sorting, pagination and filtering in the page editor
===============================================================

Sorting, pagination and filtering are all performed with ajax 
requests. If you have made any changes to the current result set
you first need to save the page before moving on to another 
result set. When this is the case, the Table field will produce
an alert notifying you of this. 

To use sorting, simply click any column heading, and the results
will sort by that column. To switch to a descending sort, click
it again. 

Pagination is also fairly self explantory. If there are multiple
paginations possible, just click the page number that appears in
the list of possible pages at the top of the field. 

It's when we get to filtering/finding that we have a few more 
things available than what may first be apparent. First off, to
open the form for finding/filtering, click the "Find" link that
appears at the top right of the Table Inputfield. The Find form
will appear, which includes an input for each column in the form.

Matching text filters
---------------------
For text-based fields, the default find method is "contains", 
or the "%=" operator in ProcessWire terminology. This tends to be
the most handy, but there may be situations where you want a 
different type of match to be performed. For instance, perhaps
you want to locate exact matches (=), matches that start the 
same (^=), end the same ($=), or perhaps contain multiple words 
in any order (~=). All of these types of queries are possible
simply by prepending your text with the operator that appears 
in parenthesis above, i.e. "^=" for "starts the same", etc. 

For example, if I wanted to match values that started with the
word "Hanna" then I could enter "^=Hanna" rather than just "Hanna".
In that case, it would match values "Hanna" and "Hannah" but not
"Johanna". If I literally wanted to match ONLY "Hanna" then I 
could use the exact match equals operator "=Hanna". 

To reverse any of the text matching operators, prepend a "!" to
the beginning of it. For instance "!=Hanna" would find all values
that aren't exactly "Hanna", and "!%=" would find all values that
do not have a partial match for that term.

Matching numbers and dates 
--------------------------
When you enter a number (or date) in the find/filters, the default
search operator is "=" (exact match). You can also use less than (<),
less than or equal (<=), greater than (>), greater than or equal 
(>=), or not equal (!=). 

Matching page references
------------------------
When possible, the filter form will show you a select box where you
can choose which page you want to show. In cases where the quantity
of pages is too large to show, it will instead use an autocomplete
text entry box. Currently no option is available to find all items
that do not match a particular page. 


How to use sorting, pagination and filtering on the front-end
=============================================================

The settings that you chose for sorting and pagination apply not
just to the admin page editor, but also to the front-end of your 
site. When you access your Table field, the rows will already be
sorted by the settings you chose when configuring the field. In 
addition, there will be no more than the number of rows that you
specified as your pagination limit. If you want to specify 
different criteria for your field value, access it as a method
rather than as a property, i.e. $page->field(); rather than 
$page->field; Pass the method a selector string specifying your 
filters. Here are some examples below: 

  // Returns pre-sorted pagination of subscribers corresponding
  // to the current $input->pageNum pagination value (default).
  $rows = $page->subscribers;
   
  // Same as above, except we are specifying a different sort
  // and a different pagination limit (items per page).
  $rows = $page->subscribers("sort=first_name, limit=25"); 
    
  // Specify that we only want the first 10 rows, regardless
  // of what the current $input->pageNum value is. 
  $rows = $page->subscribers("start=0, limit=10"); 
    
  // Load only rows where 'first_name' contains "Hanna" and 
  // the 'age' (int) column is greater than or equal to 6. 
  $rows = $page->subscribers("first_name%=Hanna, age>=6"); 
  

SUPPORT AND UPGRADES
--------------------

Please see the ProFields support board at https://processwire.com/talk/. If you
have purchased ProFields and don't have access to the support board, please 
send a PM to Ryan in the forum or email ryan@processwire.com. 




