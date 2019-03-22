# load data into R
drone_data <- read.csv("C:/Users/LundyAdmin/Desktop/Davis_variety_Trials.csv")
yield_data <- read.csv("C:/Users/LundyAdmin/Documents/yield_data.csv")
#foreign::read.dbf()

# make sure descriptions match
yield_data$descrip <- NA
yield_data$descrip[yield_data$water_stress == FALSE & yield_data$nitrogen_stress == FALSE] <- "HWHN"
yield_data$descrip[yield_data$water_stress == TRUE & yield_data$nitrogen_stress == FALSE] <- "LW"
yield_data$descrip[yield_data$water_stress == FALSE & yield_data$nitrogen_stress == TRUE] <- "LN"

# merge datasets
merged <- merge(drone_data, yield_data, by.x = c("plt_nmb", "descrip"), by.y = c("plot", "descrip"))
dim(merged)

# plot
library(ggplot2)
merged$`Management Zone` <- merged$descrip
ggplot(merged, aes(x = gndvi_mean, y = protein_yield, col = `Management Zone`)) + 
	geom_point() + 
	labs(x = "GNDVI Mean", y = "Protein Yield (lb/ac)", title = "Reflectance 4/10/18") + 
	theme_minimal() 


# make values relative to thier managemnt zone
gndvi95 <- with(merged, 
								 tapply(gndvi_mean, descrip, stats::quantile, 
								 			 probs = (0.95), na.rm = TRUE))

gndvi95df <- as.data.frame(gndvi95)
gndvi95df$descrip <- row.names(gndvi95df)
row.names(gndvi95df) <- c()
gndvi95df$gndvi95 <- as.vector(gndvi95df$gndvi95)

merged <- merge(merged, gndvi95df, by = "descrip", all = TRUE)
merged$relative_gndvi <- merged$gndvi_mean / merged$gndvi95

# plot relative GNDVI
ggplot(merged, aes(x = relative_gndvi, y = protein_yield, col = `Management Zone`)) + 
	geom_point() + 
	labs(x = "Relative GNDVI", y = "Protein Yield (lb/ac)", title = "Reflectance 4/10/18") + 
	theme_minimal() 
