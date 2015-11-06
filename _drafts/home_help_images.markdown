## Images

<<<~~~
%TOC%
<<<~~~

## Managing Images with Photo Manager

Photo Manager has been created to help you to upload photos to your website and to enable you to manage your existing photos. To run photo manager, simply click on Photo Manager on your Edit Bar (you need to be in Edit Mode to see the Edit bar).

You will then have the option to:

   * Upload a photo
   * View existing photos

### Upload a photo

The Upload a Photo function takes you through the process of uploading a photo step-by-step.

   # Upload, resize and apply style
   # Rename
   # Display link

#### Upload, resize and apply style

# Instructions required

#### Rename

# Renaming instructions required

#### Display link

Once complete, the Photo Manager will display an edit box with a pre-configured link to your photo, ready for adding to your web-page.

<pre>
{image_none|test.jpg}
</pre>

To copy it into your Clipboard, simply block the text with your mouse, right-click on the text and take option to Copy. Alternatively hold the Ctrl key down on your keyboard and press button 'C' on your keyboard.

To paste the link into your webpage, navigate to your webpage and take option to Edit Page. Scroll down to the desired location, right-click and take option to Paste.

### View existing photos

# View existing photos - instructions required

### Linking an image to a webpage or external website

First paste an image link into your webpage, using either the Upload a photo option or by Viewing existing photos. Then edit the link, by adding a pipe symbol before the closing bracket and entering the direction URL, as follows:

<pre>
 '{image_right|example.jpg|http://www.example.co.uk/}'
</pre>

### Film Strip or Gallery Function

If you would like to have some of your images displayed horizontally, then simply list the images in a bullet list, surrounding the bullet list with %FILMSTRIP% or %GALLERY% tags:

<pre>
 %FILMSTRIP%
    * {image_none|example_image1.jpg}
    * {image_none|example_image2.jpg}
    * {image_none|example_image3.jpg}
    * {image_none|example_image4.jpg}
 %FILMSTRIP%
</pre>

<?> The functions %FILMSTRIP% and %GALLERY% are one and the same and may be used interchangeably.

#### Filmstrip style

If you include too many images to fit on the page, then a horizontal scrollbar will be added automatically.

#### Gallery style

<pre>
 %GALLERY%
    * {image_none|example_image1.jpg}
    * {image_none|example_image2.jpg}
    * {image_none|example_image3.jpg}
 %GALLERY%

 %GALLERY%
    * {image_none|example_image4.jpg}
    * {image_none|example_image5.jpg}
    * {image_none|example_image6.jpg}
 %GALLERY%
</pre>

If the width of the film strip is less than the width of the user's screen, then the film strip will automatically be centred and the horizontal scrollbar removed. You can have several galleries on the same page, one after the other, which will have the outward appearance of being a grid of photos.

#### Captions

If you would like to give each image a caption, then you can add a description either above:

<pre>
    * Example image&lt;br&gt; {image_none|example_image1.jpg}
</pre>

Or below:

<pre>
    * {image_none|example_image1.jpg} &lt;br&gt;Example image
</pre>

Note the requirement to separate the title and the image with a &lt;br&gt; tag. This is an undocumented feature which splits a single line into two.
