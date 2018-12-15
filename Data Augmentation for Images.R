############## Image data augmentation
#a manual process change parameters every few batches
library(keras)
datagen <- image_data_generator(
  rescale = 1/255,
  featurewise_center=TRUE,
  featurewise_std_normalization=TRUE,
  zca_whitening = TRUE,
  ##zca_epsilon = 1, #1e-1,
  #channel_shift_range = 1,
  #brightness_range = 5,
  rotation_range = 50, 
  vertical_flip = TRUE,
  width_shift_range = 0.2,
  height_shift_range = 0.2,
  shear_range = 0.02,
  zoom_range = 0.2,
  #horizontal_flip = TRUE,
  fill_mode = "nearest"
)
#This makes batches of 10 augmented images from the above parameters and saves as .png in the repective folder
augmentation_generator <- flow_images_from_data(
  img_array,
  generator = datagen,
  batch_size = 10,
  shuffle = TRUE,
  save_to_dir = "D:/Documents/Practicum2/Practicum2/data/train/<directory name>", #add the seedling directory for each one
  save_prefix = "aug",
  save_format = "png"
)
#These are the directory names, need to code this better
classes <- c("BlackGrass", "Charlock", "Cleavers", "Common Chickweed",
             "Common Wheat", "Fat Hen", "Loose Silky-bent","Maize",
             "Sentless Mayweed", "Shepherds Purse", "Small Flowered Cranesbill", 
             "Sugar Beet")
######################Show some of the randomly augmented pictures, ,It remixes existing information
train_augment <- "D:/Documents/Practicum2/Practicum2/data/train/Maize"
fnames <-list.files(train_dir, full.names = TRUE)
img_path <- fnames[[3]] #selecting one image to demonstrate augmentation on
#read and rescale image
img <- image_load(img_path, target_size = c(150, 150))
#Convert to array shape (1, 150,150,3)
img_array <- image_to_array(img)
img_array <- array_reshape(img_array, c(1,150,150,3))
#Generates batches of random transformed image
augmentation_generator <- flow_images_from_data(
  img_array,
  generator = datagen, 
  batch_size = 1 #stops loop at one
)
#plot the Images that where augmented
op <- par(mfrow = c(2,2), pty = "s", mar = c(1,0,1,0)) #2X2 plot grid
for (i in 1:4) {
  batch <- generator_next(augmentation_generator) #random selects
  plot(as.raster(batch[1,,,]))
}
par(op)