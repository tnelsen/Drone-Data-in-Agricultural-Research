# Multispectral Data Extraction

This lesson builds on the content and setup done in [Multispectral Data Visualization](01-multispectral-data-visualization.md).

> ### Learning Objectives
>
> * Create a shapefile layer manually (for low through put)
> * Create a shapefile with R script (for high through put)
> * Use a shapefile layer to extract data from a raster image

## Create a shapefile layer (low throughput method)

A shapefile layer (in this case) will be a set of polygons that define the area of interest. 

1. Create a new shapefile layer
	+ To create a new shapefile layer navigate to "Layer" > "Create Layer" > "New Shapefile Layer..."
	+ Name and save the file
	+ Select "Polygone" for the geometry type
	+ Set the coordinate reference system (CRS) to match the CRS of the multispectral image
	+ Click "OK" to save the blank shapefile
	![](/img/create-shape-file.png)

> ### Check-in
>
> The coordinate reference system (CRS) of the image and the shapefile must match not only for accuracy but also to be able to perfom functions such as extracting data. To check the CRS of the raster layer right click on the raster layer "Solano_4l7l20_index_ndre" and navigate to "Properties...". In the `Image Properties` window under the "Information" tab look for CRS (it should be 3rd from the top). The EPSG number displayed is a unique number for each CRS. in the case of the "Solano_4l7l20_index_ndre" layer the CRS is EPSG:32610 - WGS 84 / UTM zone 10N - Projected". A UTM projection has a unit of meters. This is also shown in the layer information. 
>
> ![](/img/crs-check-in.png)

2. Edit the shapefile

	+ Toggle editing on by right clicking the shapefile layer then selecting the yellow pencil

	![](/img/toggle-editing.png)

	+ Add a feature by clicking "Add Polygon Feature" in the `Digitizing Toolbar` (<kbd>Ctrl</kbd> + <kbd>.</kbd>)

	![](/img/add-polygon-feature.png)

	> ### Check-in
	>
	> If the `Digitizing Toolbar` is not visible turn it on by navigating to "View" > "Toolbars" > "Digitizing Toolbar"

	+ Using the courser draw the outline of the area of interest. Each left cleck creates a node of a polygon and a right click closes the polygon.
	+ Set the ID of the polygon by entering an integer into the popup window when prompted. 
	+ Repeat for each area of interest.
	+ End the edit session by again clicking the "Toggle editing" button (yellow pencil)
	+ Save the edits when prompted.
	+ Add plot level metadata into the `Attribute Table`
		+ Toggle editing on for the shapefile that was just created.
		+ Open the `Attribute Table` by  right clicking the shapefile layer and choosin "Open Attribute Table"
		+  XXXXX to create a new field. (<kbd>Ctrl</kbd> + <kbd>W</kbd>)
		+ Name the field appropriatly and populate with metadata
			+ Pay attention to the "Type" and "Length" fields as they determine what kind of variabile will be in that column and the length limits for that variable. 

3. Zonal statistics
Zonal statics is like using the shapefile just created as a cookie cutter for the image. It 'cuts' the area below the shapefile and then summarizes it with different functions (mean, median, max, etc).

	+ Open the `Zonal Statustics` tool under `Raster Analysis` or by typing it into the search bar of the `Processing Toolbox`

	> ### Check-in
	>
	> If the `Processing Toolbox` is not visible turn it on by navigating to "View" > "Panels" > "Processing Toolbox"

	+ Double click "Zonal Statistics" to open the `Zonal Statistics` tool. 
	+ Choose the shapefile layer that was just created. 
	+ Set the pre-fix to the band you are extracting (in order to keep track of your data)
	+ Check whichever boxes of statistics you want to calculate. 
	+ Click `Run` to run the algorithm.
	+ Close the `Zonal Statistics` tool. 
	+ Look at the values that were just extracted by clicking on the shapefile layer and navigating to "Open Attribute Table"
	+ The attribute table should contain values for each of the polygns created and each statistic that was checked in the `Zonal Statistics` tool. 

4. Export the extracted data as a .csv file
	+ Right click the shapefile use to extract the data in the `Zonal Statistics` tool
	+ Navigate to "Export" > "Save Feature As…"
	+ Change the Format to "Comma Separate Value [CSV]"
	+ Name and save the file in a folder on your computer
	+ All other defaults are fine to leave
	+ Press`OK` when everything is set to output and save the CSV




## Create a shapefile layer (high throughput method)

Often in a research setting there are many uniform experimental units that are being measured. This example show how to create and extract data from a uniform set of experimental plots - in this case of wheat and triticale - with an R script in QGIS. 

1. Create a new shapefile layer
	+ Check the projection of your raster file, if it is not in latitude and longitude (EPSG: 4326) then reproject it so that it is in latitude and longitude. 
	+ Make sure the raster layer is highlighted and then navigate to “Raster” > “Projections” > “Warp (Reproject)”
	+ Change the “Target CRS” to EPSG:4326 – WGS 84 (See Figure 10)
	c.	Click “Run” to reproject the image
d.	Close the processing window when it is done running

2.	Create a shapefile to set the origin points of your trial. This is used to calculate the angle the field is at the distance the plots are from each other.
a.	Create a new layer by choosing: “Layer” > “Create New Layer” > “New Shapefile Layer…”
b.	Name and save the file to a folder on your computer
c.	Choose “Point” as the geometry
d.	Make sure the CRS is ESPG: 4326 – WGS 84
e.	Click “OK” to create the blank shapefile
3.	Set the origin points.
a.	Toggle editing on the shapefile just created. 
b.	Choose the “Add Point Feature” tool (see Figure 11)

c.	Add 3 points as follows: plot 101 (the bottom left corner of your trial) should have id = 1, the bottom right corner should have id = 2, the top left corner should have id = 3
i.	Do not include fill rows or data you do not want to extract
d.	Toggle editing off to save
4.	Check that the “Processing R” plugin is installed
a.	Navigate to: “Plugins” > “Manage and Install Plugins…”
b.	Finds “Processing R Provider” by scrolling or searching
c.	Click the plugin and press “Install plugin” if the plugin is not already installed
5.	The first time you do this, save the “smallPlotTrial.rsx” file in your corresponding directory:
C:\Users\UserName\AppData\Roaming\QGIS\QGIS3\profiles\default\python\plugins\processing_r\builtin_scripts
6.	Make sure you have the geosphere, rgdal, raster, and rgeos packages installed in R.
a.	Open R Studio
b.	Type the following into the console: install.packages(“geosphere”)
c.	Press Enter
d.	Type the following into the console: install.packages(“raster”)
e.	Press Enter
f.	Type the following into the console: install.packages(“rgdal”)
g.	Press Enter
h.	Type the following into the console: install.packages(“rgeos”)
i.	Press Enter
7.	Restart QGIS to load new script and plugin
8.	In the Processing Toolbox search “small_plot_trial_extraction_0.0.2” and double click it (see Figure 12)

9.	Set the Origin to the origin point shapefile
10.	Set the correct number of rows and ranges (the default for both is 10) 
A row is defined as where the planter drives down while a range is perpendicular to the row.
11.	Set the width and length of the plots in feet
12.	The default is for rectangular plots but if you want circular plots unchceck the checkbox next to rectangular
13.	Click “Run” 
14.	Close the window when the algorithm is finished processing.
15.	Save the shapefile by right clicking the Output layer that was created then “Export” > “Save Feature As…” (See Figure 13)
16.	Fill out the file name and folder location. Check to make sure the CRS is correct. 

Adjust the Shapefile
In some cases the shapefile will need to be adjusted to make sure that it is accurately within all the plots. 
1.	Toggle editing on for the shapefile.
2.	Make sure the shapefile is highlighted. 
3.	Select all (or the subset that you wish to adjust) by choosing the “Select Features by area of single click” (see Figure 14) and drawing a rectangle around the features you want to adjust.
4.	Make sure the “Advanced Digitizing Toolbar” is visable.
a.	If it is not navigate to “View” > “Toolbars”  and check “Advanced Digitizing Toolbar”
5.	Move or rotate using the appropriate tools (see Figure 9 and 10).
6.	Toggle editing off to save. 
Zonal Statistics
You can use the Zonal Statistics method under Part I but this method allows you to add multiple bands to one shapefile. 
1.	Add the all the multispectral bands for a single date into QGIS. 
2.	Navigate to and open the Zonal Statistics window. 
3.	Choose “Run as Batch Process..” in bottom left corner
4.	Select the layers that are the bands you want to extract (see Figure 17).
5.	Fill out the batch process form (see Figure 18).
6.	Click “Run” when you are ready to extract the data
7.	Close the window when the algorithm is finished processing. 
8.	The extraction polygons you created will now have all the extracted data.










