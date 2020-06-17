# Multispectral Data Extraction (low throughput)

This lesson builds on the content and setup done in [Multispectral Data Visualization](01-multispectral-data-visualization.md).

> ### Learning Objectives
>
> * Create a shapefile layer manually 
> * Edit the features and data of a shapefile layer
> * Use a shapefile layer to extract data from a raster image

## Create a shapefile layer (low throughput method)

A shapefile layer (in this case) will be a set of polygons that define the area of interest. 

1. Create a new shapefile layer
	+ To create a new shapefile layer navigate to `Layer` >> `Create Layer` >> `New Shapefile Layer...`
	+ Name and save the file
	+ Select `Polygon` for the geometry type
	+ Set the coordinate reference system (CRS) to match the CRS of the multispectral image
	+ Click `OK` to save the blank shapefile
	![](/img/create-shape-file.png)

> ### Check-in
>
> The coordinate reference system (CRS) of the image and the shapefile must match not only for accuracy but also to be able to perform functions such as extracting data. To check the CRS of the raster layer right click on the raster layer *Solano_2l20l20_index_ndre* and navigate to `Properties...`. In the `Image Properties` window under the `Information` tab look for CRS (it should be 3rd from the top). The EPSG number displayed is a unique number for each CRS. in the case of the *Solano_2l20l20_index_ndre* layer the CRS is EPSG:32610 - WGS 84 / UTM zone 10N - Projected". A UTM projection has a unit of meters. This is also shown in the layer information. 
>
> ![](/img/crs-check-in.png)

2. Create features in the shapefile
	+ Toggle editing on by right clicking the shapefile layer then selecting the yellow pencil
	![](/img/toggle-editing.png)
	+ Add a feature by clicking "Add Polygon Feature" in the `Digitizing Toolbar` (<kbd>Ctrl</kbd> + <kbd>.</kbd>)
	![](/img/add-polygon-feature.png)
		+ Using the courser draw the outline of the area of interest. Each left click creates a node of a polygon and a right click closes the polygon.
	+ Set the ID of the polygon by entering an integer into the pop-up window when prompted. 
	+ Repeat for each area of interest.
	+ End the edit session by again clicking the `Toggle editing` button (yellow pencil)
	+ Save the edits when prompted.

> ### Check-in
>
> If the `Digitizing Toolbar` is not visible turn it on by navigating to `View` >> `Toolbars` >> `Digitizing Toolbar`

> ### Check-in
>
> The areas of interest in this example are the areas of the field where a higher amount of N fertilizer were added in order to determine if the field would response to an in-season fertilization (see image below). 
> ![](/img/shapefile_creation-check-in.png)


3. Edit the shapefile

4. Add metadata to the shapefile

	+ Add plot level metadata into the `Attribute Table`
		+ Toggle editing on for the shapefile that was just created.
		+ Open the `Attribute Table` by  right clicking the shapefile layer and choosing `Open Attribute Table`
		![](img/open-attribute-table.png)
		+ Click the yellow `New Field` button to create a new field. (<kbd>Ctrl</kbd> + <kbd>W</kbd>)
		![](img/new-field.png)
		+ Name the field appropriately and populate with metadata
			+ Pay attention to the `Type` and `Length` fields as they determine what kind of variable will be in that column and the length limits for that variable. 
			![](img/field-creation.png)
		+ When all the metadata is populated, toggle editing off by clicking the yellow pencil and saving the changes when prompted
		![](img/save-attributes.png)

> ### Check-in
>
> If the `Processing Toolbox` is not visible turn it on by navigating to `View` >> `Panels` >> `Processing Toolbox`

5. Zonal statistics
Zonal statics is like using the shapefile just created as a cookie cutter for the image. It 'cuts' the area below the shapefile and then summarizes it with different functions (mean, median, max, etc).
	+ Open the `Zonal Statistics` tool under `Raster Analysis` or by typing it into the search bar of the `Processing Toolbox`
	+ Double click `Zonal Statistics` to open the `Zonal Statistics` tool. 
	+ Set the Raster layer to the image of the field
	+ Choose the shapefile layer that was just created under `Vector layer containing zones`
	+ Set the prefix to the band you are extracting (in order to keep track of your data) under `Output column prefix`
	+ Click `...` and check whichever boxes of statistics you want to calculate. 
	+ Click `Run` to run the algorithm.
	![](img/zonal-statistics-tool.png)
	+ Close the `Zonal Statistics` tool. 
	+ Look at the values that were just extracted by clicking on the shapefile layer and navigating to `Open Attribute Table`
	![](img/zonal-statistic-data.png)
	+ The attribute table should contain values for each of the polygons created and each statistic that was checked in the `Zonal Statistics` tool. 

6. Export the extracted data as a .csv file
	+ Right click the shapefile use to extract the data in the `Zonal Statistics` tool
	+ Navigate to `Export` >> `Save Feature As…`
	![](img/to-export.png)
	+ Change the Format to `Comma Separate Value [CSV]`
	+ Name and save the file in a folder on your computer
	+ All other defaults are fine to leave
	+ Press `OK` when everything is set to output and save the CSV
	![](img/to-csv.png)

Now geographic data can be treated like any other data in a spreadsheet. Models can be made. ANOVAs can be run. There are many more things that can be done with both the data values as well as the images. 

Now you are ready to move on to [Multispectral Data Extraction (High throughput)](03-high-throughput-data-extraction.md)!