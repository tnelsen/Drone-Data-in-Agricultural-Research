# Drone Data in Agricultural Research

This is an example and starting point for multispectral image analysis designed for beginners. The lessons can be taught in approximately 2 hours. They start with importing and visualizing drone based multispectral data in QGIS and move through how to extract data values for areas of interest in both a manual, low throughput method and a more automated, high throughput method in conjunction with R scripts.

These methods were first developed for analyzing drone based multispectral images for the Grain Cropping Systems Lab at UC Davis and thus are geared towards use in agronomic crops in a research setting. The methods can be used with different image capture (such as satellite) as well as in different research or production settings. 

These methods have been presented at Maptime Davis (Analyzing Drone Data October 2018) , UC Davis Plant Sciences Drone Data in Ag Research workshop (March 2019) and will be a part of UC ANR's DroneCamp 2020 (Multispectral Data Visualization and Extraction with QGIS).

## Requirements

* To install QGIS go to: <a href = "https://qgis.org/en/site/forusers/download.html">https://qgis.org/en/site/forusers/download.html</a>. For more detailed instructions about how to install QGIS go to: <a href = "https://qgis.org/en/site/forusers/alldownloads.html">https://qgis.org/en/site/forusers/alldownloads.html</a>. These lessons currently use the long-term (most stable) release of QGIS, QGIS 3.16.8 (Hannover). 
* QGIS is available on Windows, macOS, Linux and Android. Please note that these lessons were developed and tested on Windows. The software appearance and behavior may differ based on operating systems.
* To use R with QGIS, the R software and the packages needed to run the scripts need to be downloaded outside of QGIS. 
* To install R go to <a href = "https://cran.r-project.org/mirrors.html">https://cran.r-project.org/mirrors.html</a>. For ore detailed instruction about hot to install R, a good resource is: <a href="https://owi.usgs.gov/R/training-curriculum/installr/">https://owi.usgs.gov/R/training-curriculum/installr/</a> The high throughput method and scripts were tested on R 4.1.0 "Camp Pontanezen". 

## Topics

1. [Setting up](01-setting-up.md)
2. [Multispectral Data Visualization](02-multispectral-data-visualization.md)
3. [Multispectral Data Extraction (Low throughput)](03-multispectral-data-extraction.md)
4. [Multispectral Data Extraction (High throughput)](04-high-throughput-data-extraction.md)

## Questions

If you have any questions or feedback, please open an issue or contact Taylor Nelsen (mailto:tsnelsen@ucdavis.edu)

## Citation

Please cite as

> Nelsen, Taylor, Drone-Data-in-Agricultural-Research, 2021, GitHub repository, https://github.com/tnelsen/Drone-Data-in-Agricultural-Research
