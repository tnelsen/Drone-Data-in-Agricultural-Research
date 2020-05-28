# Multispectral Data Extraction

This lesson builds on the content and setup done in [Multispectral Data Visualization](01-multispectral-data-visualization.md).

> ### Learning Objectives
>
> * Create a shapefile layer manually (for low through put)
> * Create a shapefile with R script (for high through put)
> * Use a shapefile layer to extract data from a raster image

## Create a shapefile layer (low throughput method)

A shapefile layer (in this case) will be a set of polygons that define the area of interest. 

1. To create a new shapefile layer navigate to "Layer" > "Create Layer" > "New Shapefile Layer..."
	+ Name and save the file
	+ Select "Polygone" for the geometry type
	+ Set the coordinate reference system (CRS) to match the CRS of the multispectral image
	+ Click "OK" to save the blank shapefile
	![](/img/create-shape-file.png)

> ### Check-in
>
> The coordinate reference system (CRS) of the image and the shapefile must match not only for accuracy but also to be able to perfom functions such as extracting data. To check the CRS of the raster layer right click on the raster layer "Solano_4l7l20_index_ndre" and navigate to "Properties...". In the `Image Properties` window under the "Information" tab look for CRS (it should be 3rd from the top). The EPSG number displayed is a unique number for each CRS. in the case of the "Solano_4l7l20_index_ndre" layer the CRS is EPSG:32610 - WGS 84 / UTM zone 10N - Projected". A UTM projection has a unit of meters. This is also shown in the layer information. 
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




