## Linking

<<<~~~
%TOC%
<<<~~~

### Creating a link to a heading in your current page

Simply type the heading with the same capitalisation as the heading thus typing Further information creates a link to that section.

<pre>
Please do not !contact us, but instead please call the AA
</pre>

### Creating a link to a page within the website

#### Just type

Similarly, simply typing the page title is sufficient to create a link to it; thus typing !Autolinks will create a link to the Autolinks page.

<pre>
Please do not !contact us, but instead please call the AA
</pre>

#### Specify a link title

If you wish to specify link text that is different from the page title, you can use braces:

<pre>
 '{our wonderful directors|directors}'
</pre>

In this example the text shown on the page will be "our wonderful directors" but the link will be to the page with a title of "directors" (if there is one!).

#### Page does not yet exist

If you wish to create a link to a page that does not ~yet~ exist, but which you intend to create later, you can create an in-line reminder by surrounding its title with braces '{ }' thus: '{Honda Civic}' produces {Honda Civic}. Once the page has been created the link will automatically be converted to an ordinary link to that page.

### Creating an off-site link

#### By URL

Any `URL` that you enter will be converted into a link. If you wish to hide the link and leave just the site's name or other descriptive text (e.g. "Click Here") then these may be linked by entering the name of this descriptive text followed by an equals sign followed by the page address and surrounding all with a pair of matching braces - thus '{Google|http://www.google.co.uk}'.

### Autolinks

The Autolinks page is for the definition of text that you would like to be automatically converted into !links. For example you might wish the text "Firefox" to be converted into a link pointing to Firefox website.

Go to the Autolinks webpage and [Edit]. Using the Bullet List form, create a list of links:

<pre>
   * {Text to be Linked|url}
</pre>

e.g.
<pre>
   * {Firefox|http://www.mozilla.org/firefox/}
</pre>

This webpage is for the definition of text that you would like to be automatically converted into links. For example you might wish the text "used Honda Civic" to be converted into a link pointing to the used stocklist.

To use this webpage simply create a bullet list item in the format:

<pre>
   * {Text to be Linked|url}
</pre>

e.g.
<pre>
   * {Used Honda Civic|stock.pl?model=Honda%20Civic}
</pre>

<?> You are at liberty to break your autolinks into sections to make this page easier to read.

### Blocking Links

To block the auto linking behaviour you can precede the text that you do not wish to be linked with an exclamation mark:

<pre>
Please do not !contact me, as I am asleep.
</pre>

If there is text that would normally generate a link, but for which you never want a link created, then you can create a blocking link in the Autolinks page:

<pre>
   * {Example|}
</pre>

In this example typing the text 'example' will now *not* automatically link to the page called 'example'. This reverses the usual behaviour in that it will only link to that page if you explicitly request it by surrounding the text in braces e.g. '{example}'.

### Wikipedia Lookup

You can set a word to lookup on Wikipedia simply by surrounding it in backticks:

<pre>
`Phrase to be looked up`
</pre>

`Phrase to be looked up`
