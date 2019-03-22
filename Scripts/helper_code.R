#only run of do not have the pacman package
install.packages("pacman")
# install and load all required packages for smallplots3
pacman::p_load(geosphere, raster, rgdal, rgeos, maptools) 
#load smallplots3 (edit with correct filepath)
source("C:/Users/LundyAdmin/Box Sync/Grain Cropping Systems Lab/Drones/Training/Drone-Data-in-Agricultural-Research/Scripts/smallplots3.R")

# small plots3 definition ------------------------------------------------------
#' smallplots3
#' 
#' Creation of a shapefile from a set of 3 origin points
#' @param baseimg the filepath to the raster image that is beign used as a base
#' @param origin the filepath to the origin shapefile
#' @param Rows the number of rows in the trial
#' @param Ranges the number of ranges in the trials
#' @param outdir the filepath to the outputfolder
#' 

# run smallplots3
smallplots3(baseimg = "C:/Users/LundyAdmin/Box Sync/Grain Cropping Systems Lab/Drones/Training/Drone-Data-in-Agricultural-Research/Example Data/Small Plot Extraction/Davis_4l10l18/Davis_4l10l18_index_nir.tif",
						origin = "C:/Users/LundyAdmin/Desktop/LowWater.shp", 
            Rows = 20, Ranges = 10, outdir = "C:/Users/LundyAdmin/Documents")

smallplots3(baseimg = "C:/Users/LundyAdmin/Box Sync/Grain Cropping Systems Lab/Drones/Training/Drone-Data-in-Agricultural-Research/Example Data/Small Plot Extraction/Davis_4l10l18/Davis_4l10l18_index_nir.tif",
						origin = "C:/Users/LundyAdmin/Desktop/LowN.shp", 
						Rows = 20, Ranges = 10, outdir = "C:/Users/LundyAdmin/Desktop")

smallplots3(baseimg = "C:/Users/LundyAdmin/Box Sync/Grain Cropping Systems Lab/Drones/Training/Drone-Data-in-Agricultural-Research/Example Data/Small Plot Extraction/Davis_4l10l18/Davis_4l10l18_index_nir.tif",
						origin = "C:/Users/LundyAdmin/Desktop/HWHN", 
						Rows = 20, Ranges = 10, outdir = "C:/Users/LundyAdmin/Desktop")
