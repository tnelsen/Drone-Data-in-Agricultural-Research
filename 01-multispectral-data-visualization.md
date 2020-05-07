# Multispectral Data Visualization

> ### Learning Objectives
>
> *Start a new project in QGIS
> *Add a raster layer from a file
> *Color a raster by its values
> *Know best practices for image disply and communication
> *Export a styled raster image

## Setting up the Project

1. Open QGIS
2. Under the "Project" tab select "New" to create a new project (<kbd>Ctrl</kbd> + <kbd>N</kbd>)
3. Under the "Project" tab select "Save As..." (<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>S</kbd>) to save the project. It is a good idea to regularly save projects while working on them (<kbd>Ctrl</kbd> + <kbd>S</kbd>).

## Adding raster layers

A raster is data stored as individual pixels and displayed as an image. Most of the data from drone borne multispectral cameras, satillites, and more are stored as rasters. Images can have many extentions. The ones used in this example are .tif files. 

1. Add a raster layer by navigating to the `Data Source Manager | Raster` by going to "Layer" > "Add Layer" > "Add Raster Layer..." (<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>R</kbd>).
2. Make sure the `Source type` radio button is selected to be `File`.
3. Click the `...` to navigate to the raster image "Solano_4l7l20_index_ndre.tif" and open it. 
4. Choose `Add` to add the image to the project.
5. Close the `Data Source Manager` after the image has sucessfully been added to the project. 

> ### Check-in
>
> At this point the "Solano_4l7l20_index_ndre" image should appear on the in both the `Layers Panel` and in the project window. The image will be greyscale by default. 

## Coloring rasters by values

1.	Right click the clipped image layer and choose "Properties"
2.	In the "Style" tab (should open by default), under "Render type" choose "Singleband pseudocolor"
13.	Set the Min and Max to cover the extent of values that you would like to see in an end product legend. These values should be close to the values that the system recognizes are max and min.
0.2- max for test image
14.	The "RdYlGn" coloring scheme is often used to show plant health
15.	Make sure the Mode is "Continuous"
16.	Can change how it looks 
Try brightness -10, saturation -10, contrast 15 (doesn't really make a difference)
17.	Have the option to check "Clip out of range values"
18.	Apply to get a preview of your image
19.	Press ok when done and your image should look like:

> ### Image Display Best Practices 
>
> Colors should be colorblind friendly. Don't include areas that are not of interest. Know what you are trying to show and maximize that in the image. Include a lengend. 

## Exporting styled images

.	Project > Import/Export > Export Map to Image
.	Set parameters
.	Press Save to select the folder you want to save under

## Making a map 
