---++ 18/12/2008: Command line XML validator

I have always used the on-line validator at:

http://www.w3schools.com/XML/xml_validator.asp

But have always found it unreliable and I've never got it to validate against an XML schema file.  Thanks to Google I came across the following command (part of libxml2-utils):

%RAW%
<pre>
$ xmllint --noout --schema schema.xsd file.xml
</pre>
%RAW%

I find it amazing that all this time I had the perfect command pre-installed on my Linux desktop and I never knew.
