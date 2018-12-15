######Running the Models with a balanced training set by duplicating images (increased Training set to 7315 images belonging to 12 classes )
######through data augmentation
#Simple CNN with balanced training set AND increased pixel size of images 299 X299
library(keras)
#Set Directories
train_dir <- "D:/Documents/Practicum2/Practicum2/data/train"
validation_dir <- "D:/Documents/Practicum2/Practicum2/data/valid"
test_dir <- "D:/Documents/Practicum2/Practicum2/data/test"
model <- keras_model_sequential() %>%
  layer_conv_2d(filters = 32, kernel_size = c(3,3), activation = "relu",
                input_shape = c(299, 299, 3)) %>%
  layer_max_pooling_2d(pool_size = c(2,2)) %>%
  layer_conv_2d(filters = 64, kernel_size = c(3,3), activation = "relu") %>%
  layer_max_pooling_2d(pool_size = c(2,2)) %>%
  layer_conv_2d(filters = 128, kernel_size = c(3,3), activation = "relu") %>%
  layer_max_pooling_2d(pool_size = c(2,2)) %>%
  layer_conv_2d(filters = 128, kernel_size = c(3,3), activation = "relu") %>%
  layer_max_pooling_2d(pool_size = c(2,2)) %>%
  layer_flatten() %>%
  layer_dense(units = 512, activation = "relu") %>%
  layer_dense(units = 12, activation = "softmax") 
summary(model)

model %>% compile(
  loss = "categorical_crossentropy", 
  optimizer = optimizer_rmsprop(lr = 1e-4), 
  metrics = c("accuracy")
)
#Data PreProcessing
#Rescale all images (between 0 and 1)
train_datagen <- image_data_generator(rescale = 1/255)
validation_datagen <- image_data_generator(rescale = 1/255)
#training images
train_generator <- flow_images_from_directory(
  train_dir, #target directory
  train_datagen, #training data generator
  target_size = c(299,299), #resize all images to 15x299 pixels
  batch_size = 20,
  class_mode = "categorical" #multiclass
)
#validation images
validation_generator <- flow_images_from_directory(
  validation_dir,
  validation_datagen,
  target_size = c(299,299),
  batch_size = 20, 
  class_mode = "categorical" 
)
#Show output of train generator, batches of 299X299 RGB shape (20, 299, 299, 3) 20 samples
batch <- generator_next(train_generator)
str(batch)
#Fit model to data using the batch generator 
#See Graph that plots
history <- model %>% fit_generator(
  train_generator,
  steps_per_epoch = 100,
  epochs = 30,
  validation_data = validation_generator,
  validation_steps = 50
)
plot(history)
##ADD DROPOUT LAYER and IMAGE AUGMENTATION
#Data Augmentation - reduce overfitting 
##create new model that includes Dropout
model<- keras_model_sequential() %>%
  layer_conv_2d(filters = 32, kernel_size = c(3,3), activation = "relu",
                input_shape = c(299,299,3)) %>%
  layer_max_pooling_2d(pool_size = c(2,2)) %>%
  layer_conv_2d(filters = 64, kernel_size = c(3,3), activation = "relu") %>%
  layer_max_pooling_2d(pool_size = c(2,2)) %>%
  layer_conv_2d(filters = 128, kernel_size = c(3,3), activation = "relu") %>%
  layer_max_pooling_2d(pool_size = c(2,2)) %>%
  layer_flatten() %>%
  layer_dropout(rate = 0.5) %>%
  layer_dense(units = 512, activation = "relu") %>%
  layer_dense(units = 12, activation = "softmax")
summary(model)
model %>% compile(
  loss = "categorical_crossentropy",
  optimizer = optimizer_rmsprop(lr = 1e-4),
  metrics = c("accuracy")
)
#Training the network using data augmentation generators
datagen <- image_data_generator(
  rescale = 1/255,
  rotation_range = 40, 
  width_shift_range = 0.2,
  height_shift_range = 0.2,
  shear_range = 0.2,
  zoom_range = 0.2,
  horizontal_flip = TRUE
)
test_datagen <- image_data_generator(rescale = 1/255)
#care not to augment the validation images
train_generator <- flow_images_from_directory(
  train_dir, #target directory
  datagen, #data generator
  target_size = c(299,299), #resize all images 299X299
  batch_size = 32,
  class_mode = "categorical" #used with binary_crossentropy loss, binary labels
)
#validation generator
validation_generator <- flow_images_from_directory(
  validation_dir, #target directory
  test_datagen,
  target_size = c(299,299), #image size
  batch_size = 32, 
  class_mode = "categorical"
)
#model
history <- model %>% fit_generator(
  train_generator,
  steps_per_epoch = 100,
  epochs = 30, 
  validation_data = validation_generator,
  validation_steps = 50
)
plot(history)
#######VGG16 with 299X299 image size and balanced training 
conv_base <- application_vgg16(
  weights = "imagenet",
  include_top = FALSE,
  input_shape = c(299,299,3)
)
#Architecture of VGG16
conv_base
#Extracting Features Using Pretrained Convolutional Base
datagen <- image_data_generator(rescale = 1/255)
batch_size <- 20
#ADD Classifier ontop of convolutional base
model <- keras_model_sequential() %>%
  conv_base %>%
  layer_flatten() %>%
  layer_dense(units = 256, activation = "relu") %>%
  layer_dense(units = 12, activation = "softmax")
model
#Freeze the network
cat("This is the number of trainable weights before freezing", 
    "the conv base: ", length(model$trainable_weights), "\n") #30
freeze_weights(conv_base)
cat("This is the number of trainable weights after freezing", 
    "the conv base:", length(model$trainable_weights), "\n") #4
train_datagen = image_data_generator(
  rescale = 1/255,
  rotation_range = 40, 
  width_shift_range = 0.2,
  height_shift_range = 0.2,
  shear_range = 0.2,
  zoom_range = 0.2,
  horizontal_flip = TRUE,
  fill_mode = "nearest"
)
test_datagen <- 
  image_data_generator(rescale = 1/255)

train_generator <- flow_images_from_directory(
  train_dir,
  train_datagen,
  target_size = c(299, 299),
  batch_size = 20,
  class_mode = "categorical"
)
validation_generator <- flow_images_from_directory(
  validation_dir,
  test_datagen,
  target_size = c(299, 299),
  batch_size = 20, 
  class_mode = "categorical"
)
model %>% compile(
  loss = "categorical_crossentropy",
  optimizer = optimizer_rmsprop(lr = 2e-5),
  metrics = c("accuracy")
)
history <- model %>% fit_generator(
  train_generator, 
  steps_per_epoch = 100,
  epochs = 30,
  validation_data = validation_generator,
  validation_steps = 50
)
plot(history)
model %>% save_model_hdf5("Seedlings_12-14_VGG16_freeze.h5)")
#FineTuning previous model had 54% accuracy
unfreeze_weights(conv_base, from = "block3_conv1")
model %>% compile(
  loss = "categorical_crossentropy",
  optimizer = optimizer_rmsprop(lr = 2e-5),
  metrics = c("accuracy")
)
#This Runs an Hour
history <- model %>% fit_generator(
  train_generator,
  steps_per_epoch = 100,
  epochs = 100,
  validation_data = validation_generator,
  validation_steps = 50
)
plot(history)
save_model_hdf5(model, "Seedlings_12-14_VGG16_unfreeze.h5")
#Toload model later
#model <- load_model_hdf5("VGG16_Seedlings.h5")
test_generator <- flow_images_from_directory(
  test_dir,
  test_datagen,
  target_size = c(299,299),
  batch_size = 20,
  shuffle = FALSE,
  class_mode = "categorical"
)
model %>% evaluate_generator(test_generator, steps = 28) #loss_acc=0.41, acc=0.92
pred <- predict_generator(model, test_generator, steps = 28) #20X28=560 total in testset
#prepare for confusion matrix
pred <- round(pred,4) #0 to 1 probability round to 4 places
#returns the number of the column with the max value
y_pred <- as.factor(max.col(pred)) #takes the max value per row and returns the column number, convert to factor for matrix
##TEST LABELS MATRIX
filesT <- list.files("D:/Documents/Practicum2/Practicum2/data/test", recursive = TRUE)
test.label <- rep(c(0), times = length(filesT))
test.array <- array(NA, dim = c(length(filesT), 64, 64, 3))
for (i in 1:length(filesT)) {
  temp <- image_load(paste0("D:/Documents/Practicum2/Practicum2/data/test","/",filesT[i]), 
                     target_size = c(64, 64), 
                     grayscale = FALSE)
  temp.array <- image_to_array(temp, data_format = "channels_last")
  test.array[i,,,] <- temp.array
  test.label[i] <- sub("/(.+)","" ,filesT[i])
}
test.array <- test.array/255
label <- to_categorical(as.numeric(as.factor(test.label))-1)
t_label <- as.factor(max.col(label)) #Matrix 560X1
table(y_pred, t_label) #basic matrix table
library(caret)
confusionMatrix(y_pred, t_label) #produce the model evaluation metrics
################################# ROC AUC ###################################
#load library
library(pROC)
#multiclass ROC, Uses the numeric predicted probabilities 
y_pred_ <- as.vector(y_pred, mode = "numeric") #Convert matrix to numeric vector for roc
t_label_ <- as.vector(t_label, mode = "numeric") #Convert matrix to numeric vector for roc
roc_multi <- multiclass.roc(t_label_, y_pred_, percent = TRUE) #multiclass AUC in Percent
#mean AUC from all pairwise class comparisons
roc_multi$auc #Multi-class area under the curve: 94.92%
#Previous Mean AUC = 93.12%
#roc_multi$levels
#roc_multi$rocs this holds each curve
rs <- roc_multi[['rocs']]
plot.roc(rs[[1]]) #ROC single summary plot
plot(plot.roc(rs[[1]]))
plot.roc(rs[[1]]) #ROC single summary plot first then the multiline plot on top
#This plots the 12 class ROC stored in the $roc
sapply(2:length(rs),function(i) lines.roc(rs[[i]],col=i)) 
