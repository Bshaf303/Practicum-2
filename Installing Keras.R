#Keras Installation for RStudio#############3
#Install Virtual Studio 2017
#Installed CUDA Toolkit First
#Installed cuDNN (3) .dll files into CudaToolkist folders per instructions
#Install Anaconda X64 has python 3.7
#Install devtools
#install Keras from Github -latest release
#run Keras installation
#Install Tensorflow GPU through Keras installer
install.packages("devtools")
library(devtools)
devtools::install_github("rstudio/keras")
library(keras)
install_keras(tensorflow = "gpu")
sessionInfo()

#just Keras
library(keras)
install_keras()
#Just Tensorflow
library(tensorflow)
install_tensorflow(version = "gpu")

################# Code used early to fix installation errors
.libPaths()
install.packages("yaml")
install.packages("Rcpp", dependencies = TRUE)
install.packages("RInside", dependencies = TRUE)
#python -m pip install --upgrade pip
a#ctivate r-tensorflow
#deactivate
library(reticulate)
conda_version()
reticulate::conda_version()
library(reticulate)
conda_remove("r-tensorflow")
library(reticulate)
conda_install("r-tensorflow", "html5lib")
reticulate::py_config()
