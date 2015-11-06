## Formatting

<<<---
%TOC%
<<<---

### Text Formatting

#### Bold

To display your text in bold, simply surround your text in asterisks '*' thus '*your text*' will display as *your text*.

#### Italics

To display your text in italics simply surround your text in tildes '~' thus '~your text~' will display as ~your text~.

<?> The 'tilde' is normally found on your keyboard just to the left of your [Return] or [Enter] key as [Shift] [#].

#### Useful tips

In the previous section you will have noticed the special formatting of the Tip box. To produce this your simply insert a paragraph which starts with &lt;?&gt; then, after a single space, enter your tip text.

<pre>
&lt;?&gt; Your tip text
</pre>

<?> Your tip text

#### Highlight Text

To highlight your text simply insert a paragraph which starts with &lt;!&gt; then, after a single space, enter your tip text.

<pre>
&lt;!&gt; Your highlighted text
</pre>

<!> Your highlighted text

#### Centred text

If you wish to centre a paragraph, simply indent it with three spaces at the beginning of the paragraph (or single line on its own). Thus entering:

<pre>
   Your centred text
</pre>

   Your centred text

#### Quotations

If you wish to include a quotation in your text, simply start the line with a single space followed by a quotation mark, followed by your text, followed by another quotation mark, followed by any explanatory text (e.g. the origin of the quotation).

<pre>
 "I think that God in creating Man somewhat overestimated his ability." - Oscar Wilde
</pre>

 "I think that God in creating Man somewhat overestimated his ability." - Oscar Wilde

If you wish the text to be centred then precede the paragraph with three spaces (see Centred Text above).

   "I think that God in creating Man somewhat overestimated his ability." - Oscar Wilde

#### Fixed font (or Monospace)

If you wish to use a fixed font (for example) to make text line up into columns then you put '&lt;pre&gt;' on a line by itself before your text and '&lt;/pre&gt;' on a line by itself after your text.

This is particularly useful for presenting Autoline-generated emails and cannot be bothered to create a Table, e.g.

&lt;pre&gt;
Company      ->90  ->180  ->360  ->540  ->720 ->1080 1080->  Total
 
Ottershaw    6506    865    550    640     21      0      0   5752
Weybridge   14637   2374   2724   1894     68      0      0  21699
 Grand tot  21144   1509  19040   7902   5384   5515    426  60923
&lt;/pre&gt;

... will produce...

<pre>
Company      ->90  ->180  ->360  ->540  ->720 ->1080 1080->  Total
 
Ottershaw    6506    865    550    640     21      0      0   5752
Weybridge   14637   2374   2724   1894     68      0      0  21699
 Grand tot  21144   1509  19040   7902   5384   5515    426  60923
</pre>

#### Buttons

'[Button]' creates [Button]

### Star Ratings

Many magazines use star ratings to assess a product's performance. You can display these on your website simply by 

<pre>
Test rating =xxxoo=
</pre>

to produce:

Test rating =xxxoo=

### Horizontal rule

At least three underscores on a line '___' will produce:
___

### Box Command

#### Borderless box

If you would like to include text into a box, you should encase the text with "<<<" for a left-justified box and '>>>' for a right-justified box.

<pre>
 >>>
 This is a box
 on the right
 >>>
</pre>

<pre>
 <<<
 This is a box
 on the left
 <<<
</pre>

#### Box with border

If you would like a border around the box, then add a "---" to the above commands

<pre>
 <<<---
 This is a box with a border
 on the left
 <<<---
</pre>

If you wish to set the width of the box, then simply use more than the three "---" which will then set the exact width. E.g.

<pre>
 <<<--------------------------------
 This is a box with a fixed width
 and border on the left
 <<<--------------------------------
</pre>

### Comments

If you wish to add a comment to your page, that will be invisible to your website's visitors, then you have two options:

#### In-line comment

You can place a comment in the middle of a paragraph, by encasing your comment in hashes:

<pre>
A little known fact is that Shakespeare was also an astronaut #please check this sounds crazy# and went to the moon as part of several space missions, as part of a team hand-picked by Julius Caesar.
</pre>

#### Main comment

You can also create a comment on a paragraph by itself, simply preceding the paragraph with a hash (there is no need to place a hash at the end of the paragraph).

<pre>
# 14/07/2007 <cjr> The above paragraph is clearly nonsense and only a lunatic would believe that.
</pre>

It's a good idea to precede all your comments with a date and your initials, so that other people editing your website will know to whom to report progress and how old the comment is.

#### Finding your comments

You can easily search for your comments, by entering a hash into your website search; however a [!Comments] button has also been added to your editing toolbar.
