## Forms

<<<~~~
%TOC%
<<<~~~

### Synopsis

<pre>
 %FORM%
 Title:                  [Mr|Mrs|Ms|Miss|Dr|Other] [                ] If other, please specify
 Your name:              [                                          ]
 Email address*:         [                                                        ]
 Confirm email address*: [                                                        ]
 Contact telephone:      [                          ]
 Subject*:               [                                          ]
 Email to:               [someone]
 Message:                [                                                   .....]
 When would you like us to contact you: [--/--/--]
 How would you like us to contact you: [<> Telephone <> Email]
 Would you like a free sherbet lemon:  [x]
 Would you like a cold shower:         [ ]
 %FORM%
</pre>

<?> The text preceding the colon, we will refer to as the "field name" and square brackets items as "form elements", and any text after the final square bracket as "help text".

### Form requirements

   * Please note that the form must be preceded and followed with %FORM% on a line by itself.
   * Each line of the form ("form-line") must contain in the following order:
      * a field description, e.g. Title
      * a colon
      * an opening square bracket '[' followed by either:
         * a space (for a checkbox which is not ticked by default)
         * a single character (for a checkbox which is ticked by default)
         * multiple spaces (for a text box of length equal to number of spaces used)
         * multiple words separated by a pipe '|' symbol (for a drop-down box)
         * a single word or phrase (for a hidden field)
         * sequence of:
            * greater-than '<'
            * less-than '>'
            * word or phrase
            * repeat for multiple options (for a radio button group)
         * 
      * a closing square bracket ']'
   * Any text placed after the closing square bracket will be automatically compressed into a pop-up help icon.
   * Ideally there should not be any non-form-lines, blank or otherwise, in between the form-lines; although it will work, it will result in multiple invisible tables being used, increasing page download time, and resulting in your form elements not lining up neatly.

### Email requirements

In addition to the form requirements, if you wish the results to be emailed to you, then the following lines are required:

<pre>
 Email address*:         [                                                        ]
 Confirm email address*: [                                                        ]
 Email to:               [someone]
</pre>

<?> If your form contains a field name starting with the word Confirm, then this will be validated against a field name of the same name but with the word Confirm.

In general the 'Email to' will be pre-completed, as in this example. This will then be emailed to 'someone@yourdomain.com'. Email may also be a drop-down box or indeed a text box, although the latter is not recommended.

As an alternative to the 'Email to', you may also have two fields of names of Branch (or Dealership) and Department:

<pre>
 Branch*:                [|New York|London|Paris]
 Department*:            [|Sales|Service|Parts]
</pre>

<?> Note the use of a pipe symbol immediately after the pipe symbol. This will insert a blank entry at the beginning of the drop-down box.

The system will concatenate the first three digits of the Branch and the whole of the Department name to create an email to field. For example London Sales would become 'lonsales@yourdomain.com'. Clearly you would need to ensure that your email system will cope with emails formatted in this manner, e.g. by creating mail-groups.

You may also like to create a Subject field name, which will then be used on the resulting email; otherwise the name of the page will be used.

<pre>
 Subject*:               [                                          ]
</pre>

### Form Results

As we have already stated, complying with the Email requirements will result in the form contents being emailed. In addition to this, the contents of the form are saved to a `CSV` file of the same name as the page name. You are unable to access this file as it is held in a secure area; if you would like it sent to you, please contact our webmaster.

You may, however, use the data, by linking a graph to it. See help on the Graph function.

### Breaking a large form into sections

Having stated above that each form-line should be on immediately successive lines, it is advisable to break up large forms into sections and you are permitted to add Headings between each section and indeed any text. Please note, however, that the form elements will not line up between sections.

### Mandatory fields

Within a form there are usually certain fields that you wish to make mandatory, i.e. to force the user to complete them. To achieve this, you simply an an asterisk '*' immediately after the field name and before the colon.

### Date boxes

If you would like a date field, then enter as follows:

<pre>
 My date: [--/--/----]
</pre>

This will make the box the right size and activate the integral date-picker to immediate right of the box.

### Ticked checkboxes

If you wish a checkbox to be ticked by default, then simply insert a word character (not a space) in between the square brackets:

<pre>
 My checkbox: [x] ticked checkbox
 My checkbox: [ ] unticked checkbox
</pre>
