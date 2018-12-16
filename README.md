# Practicum-2
Seedling Multi-class Image Classification Problem

This project is a multi-class image classification problem using convolutional neural networks in Rstudio with the Keras library.
The dataset can be found at Aarhus University Computer Vision and Biosystems Signal Processing Group
Computer Vision and Biosystems Signal Processing Group :https://vision.eng.au.dk/ and uses the V2 nonsegmented dataset (1.7GB).

Above are six major code sections used for this project.
1. Installing Keras.R shows the steps taken to load all the dependencies in RStudio.
2. Setup Directories and Segment Images.R shows the directory creation to place the train, validation, and test splits.
3. Image Distribution Plot.R is for the barplots used in exploring the data.
4. Simple Covnet.R shows various intitial models that were run to create a baseline. These used 150X150px images and 
  unbalanced training data.
5. Data Augmentation for Images.R is the method used to supplement the unbalanced image sets to bring them up to 610 images 
  per training class. 
6. Covnet Models Adjusted.R uses the balanced training data and a larger image 299x299px. At the end you will find the 
  final prediction and evaluation of the model.
  
The Simple Covent uses a made from scratch model first and end with the VGG16 architecture.
The Covnet Models Adjusted simply follows the same model structure as comparision and ends with the VGG16 imagenet model. 
  
