## Graphs

<<<~~~
%TOC%
<<<~~~

## Graph Function

### Synopsis

<pre>
 %GRAPH|title=Example 1|data=Sun,Mon,Tue,Wed,Thu,Fri,Sat|data=40,50,60,70,50,30,20%
</pre>

%GRAPH|title=Example 1|data=Sun,Mon,Tue,Wed,Thu,Fri,Sat|data=40,50,60,70,50,30,20%

Additional options may be entered anywhere between the percentage signs simply by adding:

<pre>
 |option=value|
</pre>

Therefore to stipulate a height of 300 pixels and a width of 400 pixels, the function would be written as:

<pre>
 %GRAPH|title=Example 2|height=300|width=400|data=Sun,Mon,Tue,Wed,Thu,Fri,Sat|data=40,50,60,70,50,30,20%
</pre>

### Graph type

<pre>
 |type=...|
</pre>

Where ... may be:

   * *bars* (default) : A simple bar graph as above
   * *bars3d* : A three-dimensional bar graph
   * *lines* : A simple line graph
   * *lines3d* : A three-dimensional line graph
   * *area* : An line graph where the area below the line is coloured
   * *hbars* : A simple bar graph rotated 90-degrees
   * *points* : Similar to line graph but without the lines!
   * *pie* : A simple pie chart
   * *pie3d* : A three-dimensional pie chart

<?> The three-dimensional graphs look very attractive, but are not so easy to interpret.

*Example:*

<pre>
 %GRAPH|title=Example 3|type=bars3d|data=Sun,Mon,Tue,Wed,Thu,Fri,Sat|data=40,50,60,70,50,30,20%
</pre>

### Graph height and width

<pre>
 |height=...|width=...|
</pre>

By default the graph will be dimensioned as 400 width by 300 height, if you wish to change this you are free to add the above two options.

*Example:*

<pre>
 %GRAPH|title=Example 4|height=200|width=300|data=Sun,Mon,Tue,Wed,Thu,Fri,Sat|data=40,50,60,70,50,30,20%
</pre>

### Graph align

<pre>
 |align=...|
</pre>

If this option is left unset, then the graph will sit at the left-hand margin and there will be no text-wrapping around the graph. If you wish to have text-wrapping, or if you would like the graph to be right-aligned, then set the align option to either "left" or "right".

*Example:*

<pre>
 %GRAPH|title=Example 5|height=200|width=300|data=Sun,Mon,Tue,Wed,Thu,Fri,Sat|data=40,50,60,70,50,30,20%
</pre>

### Graph title

<pre>
 |title=...|
</pre>

The graph title is set with the above option, where ... is your graph title.

<!> Every graph *has* to have a title and this title MUST be unique on the website, as it is used as the graph image name.

*Example:*

<pre>
 %GRAPH|title=Example 6|data=Sun,Mon,Tue,Wed,Thu,Fri,Sat|data=40,50,60,70,50,30,20%
</pre>

### Graph axes labels

<pre>
 |x_label=...|y_label=...|
</pre>

Most graphs will require labels on each axis, so that the reader will understand to what the figures relate. You can set either or both of these options as required.

*Example:*

<pre>
 %GRAPH|x_label=Days of the week|y_label=Widgets sold|data=Sun,Mon,Tue,Wed,Thu,Fri,Sat|data=40,50,60,70,50,30,20%
</pre>

### Graph data

<pre>
 |data=...,...,...|data=...,...,...|
</pre>

All graphs need data. Each "data series" is encased in pipe '|' symbols and each datum must be separated by a comma. Every data series must have the same number of data. For pie charts only two data series are permitted, for all other graph types ~at least~ two data series are required.

The first data series is used on the X-axis scale, whilst all other data series are plotted on the graph.

*Example:*

<pre>
 %GRAPH|title=Example 7|data=Sun,Mon,Tue,Wed,Thu,Fri,Sat|data=40,50,60,70,50,30,20%
</pre>

### Graph CSV file

<pre>
 %GRAPH|title=Example 8|data=Sun,Mon,Tue,Wed,Thu,Fri,Sat|csv=...|
</pre>

It is possible to supplement the above Graph data by loading data from a CSV file. This CSV file MUST be located in the web root's parent directory, i.e. the directory above the web directory (/../). The file suffix ".csv" should be omitted.

*Example:*

<pre>
 %GRAPH|title=Example 9|data=Sun,Mon,Tue,Wed,Thu,Fri,Sat|csv=example%
</pre>

In this example the 'rethours' will be interpreted as the following file:
<pre>
 /../example.csv
</pre>

<?> The CSV file method gives the ability to auto-update the graphs, which would otherwise be impossible; however, you will need to contact the webmaster if you wish to take advantage of this method.

### Graph bar graph data overwrite option

<pre>
 |overwrite=1|
</pre>

When using a bar graph type, by default the data will sit next to each other on the graph. If you prefer it is possible to have the data sitting on top of each other. This is generally only useful if you have one data series with higher values than the next data series; however when used appropriately, this can help to simplify graphs. The 'overwrite' option can be set to 1 or 0, the latter being synonymous with leaving the option out altogether.

*Example:*

<pre>
 %GRAPH|title=Example 10|overwrite=1|data=Sun,Mon,Tue,Wed,Thu,Fri,Sat|data=140,150,160,170,150,130,120|data=40,50,60,70,50,30,20%
</pre>

%GRAPH|title=Example 10|overwrite=1|data=Sun,Mon,Tue,Wed,Thu,Fri,Sat|data=140,150,160,170,150,130,120|data=40,50,60,70,50,30,20%

### Graph grid

<pre>
 |long_ticks=1|
</pre>

If you wish to have a grid on your graph, then simply set the option "long_ticks" to 1. You may also set it to 0, but this is synonymous with leaving the option out altogether.

*Example:*

<pre>
 %GRAPH|title=Example 11|long_ticks=1|data=Sun,Mon,Tue,Wed,Thu,Fri,Sat|data=140,150,160,170,150,130,120%
</pre>

%GRAPH|title=Example 11|long_ticks=1|data=Sun,Mon,Tue,Wed,Thu,Fri,Sat|data=140,150,160,170,150,130,120%

### Graph 3d bar depth

<pre>
 |bar_depth=10|
</pre>

When using three-dimensional bars, it is sometimes nice to adjust the level of depth in the bars, and this may be achieved by increasing or decreasing the above option from the default of 10.

<?> A visually good value for this is approximately width_of_chart / number_of_bars

*Example:*

<pre>
 %GRAPH|type=bars3d|title=Example 12|bar_depth=40|data=Sun,Mon,Tue,Wed,Thu,Fri,Sat|data=140,150,160,170,150,130,120%
</pre>

%GRAPH|type=bars3d|title=Example 12|bar_depth=40|data=Sun,Mon,Tue,Wed,Thu,Fri,Sat|data=140,150,160,170,150,130,120%

### Pie chart label

<pre>
 |label=...|
</pre>

Where ... is the label to place below the pie chart. Generally you would use this to explain the units contained in the pie chart.

*Example:*

<?> Unless you are using "pie3d" you will probably want to specify matching height and width, otherwise the pie chart will be an oval rather than a circle.

<pre>
 %GRAPH|type=pie3d|label=Units sold|show_values=1|title=Example 13|data=Sun,Mon,Tue,Wed,Thu,Fri,Sat|data=140,50,160,170,150,130,120%
</pre>

%GRAPH|type=pie3d|label=Units sold|show_values=1|title=Example 13|data=Sun,Mon,Tue,Wed,Thu,Fri,Sat|data=140,50,160,170,150,130,120%

### Graph box axis

<pre>
 |box_axis=0|
</pre>

By default box_axis is set to 1, and thereby the graph is shown as a box, rather than as two axes. Setting box_axis=0 reverses this effect.

*Example:*

<pre>
 %GRAPH|type=bars|title=Example 14|box_axis=0|data=Sun,Mon,Tue,Wed,Thu,Fri,Sat|data=140,150,160,170,150,130,120%
</pre>

%GRAPH|type=bars|title=Example 14|box_axis=0|data=Sun,Mon,Tue,Wed,Thu,Fri,Sat|data=140,150,160,170,150,130,120%

### Graph zero axis

<pre>
 |zero_axis=1|
</pre>

By default zero_axis is set to 0, so that the zero axis is not shown unless it also corresponds with the beginning of the graph. I.e. if graph starts at zero, then effectively zero has an axis, but if graph starts at -10, for example, then zero will have no such axis. If, in this example, you would like additional axes drawn for zero, then set zero_axis=1.

*Example:*

<pre>
 %GRAPH|type=bars|title=Example 15|zero_axis=1|data=Sun,Mon,Tue,Wed,Thu,Fri,Sat|data=40,-30,20,70,50,-30,20%
</pre>

%GRAPH|type=bars|title=Example 15|zero_axis=1|data=Sun,Mon,Tue,Wed,Thu,Fri,Sat|data=40,-30,20,70,50,-30,20%

### Graph data cumulation

<pre>
 |cumulate=1|
</pre>

This only has an effect on line graphs and area graphs, and is really only of use on the latter. This combines the data sets together.

*Example:*

<pre>
 %GRAPH|type=area|title=Example 16|cumulate=1|data=Sun,Mon,Tue,Wed,Thu,Fri,Sat|data=5,10,15,20,25,30,35|data=10,5,10,5,10,5,10%
</pre>

%GRAPH|type=area|title=Example 16|cumulate=1|data=Sun,Mon,Tue,Wed,Thu,Fri,Sat|data=5,10,15,20,25,30,35|data=10,5,10,5,10,5,10%

### Graph show values

<pre>
 |show_values=1|
</pre>

This adds the values to each point on the graph. Set show_values=1 to activate.

*Example:*

<pre>
 %GRAPH|type=lines|title=Example 17|show_values=1|data=Sun,Mon,Tue,Wed,Thu,Fri,Sat|data=5,10,15,20,25,30,35%
</pre>

%GRAPH|type=lines|title=Example 17|show_values=1|data=Sun,Mon,Tue,Wed,Thu,Fri,Sat|data=5,10,15,20,25,30,35%

### Graph show totals only

<pre>
 |totals=1|
</pre>

This totals the data and presents only the totals for each data set. Set totals=1 to activate.

*Example:*

<pre>
 %GRAPH|type=lines|title=Example 17|data=Sun,Mon,Tue,Wed,Thu,Fri,Sat|totals=1|csv=home_survey%
</pre>

This function works particularly well when pointing the function at a form's results CSV file (see Forms). This function involves some trial and error to obtain the best results and dedicated help on this {survey} function is required; in the meantime please contact our webmaster for guidance.
