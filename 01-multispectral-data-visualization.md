# Multispectral Data Visualization

> ### Learning Objectives
>
> * Start a new project in QGIS
> * Add a raster layer from a file
> * Color a raster by its values
> * Know best practices for image disply and communication
> * Export a styled raster image

## Setting up the Project

1. Open QGIS
2. Under the "Project" tab select "New" to create a new project (<kbd>Ctrl</kbd> + <kbd>N</kbd>)
3. Under the "Project" tab select "Save As..." (<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>S</kbd>) to save the project. It is a good idea to regularly save projects while working on them (<kbd>Ctrl</kbd> + <kbd>S</kbd>).

## Adding raster layers

A raster is data stored as individual pixels and displayed as an image. Most of the data from drone borne multispectral cameras, satellites, and other image acquisition technologies are stored as rasters. Images can have many extentions. The ones used in this example are .tif files. 

1. Add a raster layer by navigating to the `Data Source Manager | Raster` by going to "Layer" > "Add Layer" > "Add Raster Layer..." (<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>R</kbd>).
2. Make sure the `Source type` radio button is selected to be `File`.
3. Click the `...` to navigate to the raster image "Solano_4l7l20_index_ndre.tif" in the downloaded "Drone-Data-in_Agricultural-Research-data" folder and open it. 
4. Choose `Add` to add the image to the project.
5. Close the `Data Source Manager` after the image has sucessfully been added to the project. 

> ### Check-in
>
> At this point the "Solano_4l7l20_index_ndre" image should appear on the in both the `Layers Panel` and in the project window. The image will be greyscale by default. See below.
>
> ![](/img/check-in-1.png)

## Coloring rasters by values

1.	Right click the "Solano 4l17l20_index_ndre" layer ing the `Layers` panel and choose "Properties.
![](/img/coloring-rasters-1.png)
2.	In the "Symbology" tab (should open by default), under "Render type" choose "Singleband pseudocolor"
![](/img/coloring-rasters-2.png)
3.	Set the Min and Max to cover the extent of values that you would like to see in an end product legend. These values should be close to the values that the system recognizes are max and min.
4. Set the `Interpolation` drop-down to "Linear"
5. The "RdYlGn" Color ramp is often used to show plant health since it is an easy assumption that red equates to unhealthy plants and green represents healthy plants.
6.	Make sure the `Mode` is "Continuous" raster images data is continuous - there are no groups or factors.
7.	Press `Apply` to get a preview of your image.
8.	Press `OK` when you are done. 


> ### Check-in
>
> At this point the raster should be colored (as below). Looking at this raster, what things should we improve on before finalizing it?
>
> ![](/img/check-in-2.png)

### Image Display Best Practices 

1. Colors should be colorblind friendly. 
	+ To preview a Project as would be seen by a person with colorblindness go to "View" > "Preview Mode"
	+ Here you can "Simulate Colorblindess" of multiple types as well as greyscale photocopies. 
	+ In general, choose colors that are high contrast for the features you wish to highlight. 

	![](/img/display-bp-1.png)

2. Don’t include areas that are not of interest such as roads or other fields in the color scheme. This ofter causes there to be less contrast in colors in the area of interest and can be distracting to a viewer. Know what you are trying to show and maximize that in the image.
	+ One way to remove areas of interest is to clip to the area of interest.
		+ Clip to an area of interest by navigating to the `Clip Raster by Extent` tool though "Raster" > "Extraction" > "Clip Raster by Extent..." (you can also navigate to the `Clip Raster by Extent` tool through the `Processing Toolbox`)
		+ Choose a "Clipping extent" by clicking `...` and choosing "Select Extent on Canvas"
		![](/img/clipping-by-extent-1.png)
		+ This allow you to select an area of interest manually. 
		![](/img/clipping-by-extent-2.png)
		+ Once this is done, you have the option to save the "Clipped extent" as well as the option to "Open the output file after running algorithm." For this example, just make sure the Open the output file after running algorithm" box is checkd.
		+ Click `Run`
		+ Close the `Clp Raster by Extent` tool after the algorithm has finished. 
		+ There should now be another layer in the Layers panels called "Clipped (extent)" and that layer should show up as a greyscale image in the project.
		![](/img/clipping-by-extent-3.png)
		+ Try coloring this layer just as the main layer was colored in the layer properties. 
	+ Another way is to change the range of values and/or"Clip out of range values" in the layer properties.
		+ Open the "Solano_4l7l20_index_ndre" layer properties.
		+ Change the `Min` and `Max` to only include values in the area of interest. (`Min` = 0.3, `Max` = 0.7 for this image)
		+ Press `Apply` to preview. 
		+ To remove the areas out of the chosen range, scroll and check "Clip out of range values"
		+ Press `OK`

> ### Check-in
>
> At this point the raster should be colored (as below). Looking at this raster, what things should we improve on before finalizing it?
>
> ![](/img/check-in-3.png)

3.  Make the project into a map in order to include a lengend 


## Exporting and saving outside for use outside of QGIS

1. To export the styled image
	+ Navigate to "Project" > "Import/Export" > "Export Map to Image"
	+ Set parameters such as dpi depending on your end use (print vs screen)
	+ If you are not planning on using the geographic information from the styled image un-check `Append georeference information`
	+ Press Save to select the folder you want to save under or press `Copy to Clipboard` to simply copy the image. 

2. To export a map with a legend. 
	+ Navigate to "Project" > "New Print Layout..."  (<kbd>Ctrl</kbd> + <kbd>P</kbd>)
	+ Enter the title of the print layout in the popup window
	+ To add a map navigate to "Add Item" > "Add Map" 
	
	![](/img/map-1.png)
	
	+ Draw a box to contain the map
	
	![](/img/map-2.png)
	
	+ To make sure the main canvas map is centered by right clicking the layer on the main canvas and chooseing "Zoom to Layer". Then in the print compose under item properties presss "Set Map Extent to Match Main Canvas Extent"
	
	![](/img/map-3.png)
	
	+ Add additional items such as a scale ar, north arrow, legend, and/or title under the "Add Item" drop down.
	
	![](/img/map-4.png)
	
	+ When finished with the map, under "Layout" the map can be exported as wither an image "Export as Image..." or a PDF "Export as PDF..."
	
	![](/img/map-5.png)
	
	+ For another, more indepth tutorial on map making see: [https://docs.qgis.org/3.10/en/docs/training_manual/forestry/results_map.html](https://docs.qgis.org/3.10/en/docs/training_manual/forestry/results_map.html)


