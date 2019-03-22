##smallPlotTrial=name
##Origin=vector
##Rows=number 10
##Ranges=number 10
##Output= output vector

library(geosphere)
library(raster)
rows <- Rows - 1
ranges <- Ranges - 1
SW_corner <- Origin[Origin$id == 1,]
SE_corner <- Origin[Origin$id == 2,]
NW_corner <- Origin[Origin$id == 3,]
WE_bearing <- finalBearing(SW_corner, SE_corner)
NS_bearing <- finalBearing(SW_corner, NW_corner)

field_width <- distm(SW_corner, SE_corner, fun = distHaversine)
field_length <- distm(SW_corner, NW_corner, fun = distHaversine)
plot_width <- field_width / rows
plot_length <- field_length / ranges

point_matrix <- matrix(SW_corner@coords, nrow = 1, ncol = 2)

for (i in 1:rows){
	new_point <- destPoint(point_matrix[nrow(point_matrix),],
												 b = WE_bearing, d = plot_width)
	point_matrix <- rbind(point_matrix, new_point)
}

plot_centers <- point_matrix

for (i in 1:ranges){
	new_point <- geosphere::destPoint(plot_centers[nrow(plot_centers)-rows,],
																		b = NS_bearing, d = plot_length)
	plot_centers <- base::rbind(plot_centers, new_point)
	
	for (i in 1:rows){
		new_point <- geosphere::destPoint(plot_centers[nrow(plot_centers),],
																			b = WE_bearing, d = plot_width)
		plot_centers <- base::rbind(plot_centers, new_point)
	}
}

plot_centers_sp <- SpatialPoints(plot_centers)
plot_centers_df <- as.data.frame(plot_centers)
plot_num_grid <- expand.grid(1:(ranges+1), 1:(rows+1))
plot_num_grid_ordered <- plot_num_grid[order(plot_num_grid$Var1, plot_num_grid$Var2),]

plot_ids <- c()
for(i in 1:nrow(plot_num_grid_ordered)){
	if(nchar(plot_num_grid_ordered$Var2[i]) == 1){
		newid <- paste(plot_num_grid_ordered$Var1[i], plot_num_grid_ordered$Var2[i], sep = "0")
		plot_ids <- rbind(plot_ids, newid)
	} else {
		newid <- paste0(plot_num_grid_ordered$Var1[i], plot_num_grid_ordered$Var2[i], collapse = "")
		plot_ids <- rbind(plot_ids, newid)
	}
}

plot_centers_df$plot_number <- as.integer(plot_ids[,1])
plot_centers_spdf <- SpatialPointsDataFrame(coords = plot_centers_sp, 
																						data = plot_centers_df)

crs(plot_centers_spdf) <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84")

pts <- plot_centers_spdf
# A) Construct buffers as points at given distance and bearing ---------------
l <- plot_length*0.6
w <- plot_width*0.6
h <- sqrt(((l^2) + (w^2)))

rad2deg <- function(rad) {
	return((180 * rad) / pi)
}

angle <- 90 - rad2deg(asin(l/h))

dg <- c(NS_bearing - angle, NS_bearing + angle,NS_bearing + 180 - angle, NS_bearing + 180 + angle) 

# Construct equidistant points defining circle shapes (the "buffer points")
buff.XY <- geosphere::destPoint(p = pts, 
																b = rep(dg, each = length(pts)), 
																d = h/2)

# B) Make SpatialPolygons -------------------------------------------------

# Group (split) "buffer points" by id
buff.XY <- as.data.frame(buff.XY)
id  <- rep(1:dim(pts)[1], times = length(dg))
lst <- split(buff.XY, id)

# Make SpatialPolygons out of the list of coordinates
poly   <- lapply(lst, sp::Polygon, hole = FALSE)
polys  <- lapply(list(poly), sp::Polygons, ID = NA)
spolys <- sp::SpatialPolygons(Srl = polys, 
															proj4string = CRS("+proj=longlat +ellps=WGS84 +datum=WGS84"))
# Disaggregate (split in unique polygons)
spolys <- sp::disaggregate(spolys)

# add plot numbers

plot_ids <- as.data.frame(as.integer(plot_ids[,1]))
names(plot_ids) <- c("plot_number")
plots_spdf <- SpatialPolygonsDataFrame(spolys, plot_ids)
crs(plots_spdf) <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84")

Output <- plots_spdf
