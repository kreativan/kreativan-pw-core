MarkupSitemapXML
================

A module for ProcessWire that generates a sitemap.xml file for use with major search engines.

Generating sitemap
---------------------------------------

Visit "http://yoursite.com/sitemap.xml" to generate new sitemap. 
Note that you may need to manually delete existing sitemap because of the cache.

From version 1.2.6, sitemap is generated automatically when submitting module settings.
Alternatively you can use the "Generate sitemap" button to generate sitemap without reloading the page.
Both will bypass cache.

Exclude list
---------------------------------------

ProcessWire selector list to exclude items from the sitemap.
Accepts one item per line.

**Example**

```php
// exclude pages using "my-page" template:
template=my-page
// exclude pages having a field "age" with value greater than 50
age>50
// exclude pages where artist field's (of Page type) date_birth field is empty
artist.date_birth=""
// exclude pages having text "lorem ipsum" somewhere in the "body" field
body*="lorem ipsum"
```

See [https://processwire.com/api/selectors/](https://processwire.com/api/selectors/) for more info.

**Commenting out items**

Use "//" to disable parsing a line.

```php
// template=my-page
```
