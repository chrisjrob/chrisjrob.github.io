---++ 20/11/2008: GTK Style in KDE

GTK applications in KDE always look horrible.  In Kubuntu this is taken care of for you, but in Debian it is only a quick install away:

%RAW%
<pre>
$ sudo aptitude install gtk-qt-engine
</pre>
%RAW%

There are other ways of achieving this, e.g. qtcurve, but for me this seems perfectly satisfactory.  Having installed, you visit your control panel and you will find a new option under "Appearance & Themes" called "GTK Styles and Fonts" change this to use your KDE style for your GTK applications, and restart KDE.
