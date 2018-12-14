# Get Names of Directory and count of files in each

trainnames <- list.files("D:/Documents/Practicum2/Practicum2/data/train")
testnames <- list.files("D:/Documents/Practicum2/Practicum2/data/test")
validnames <- list.files("D:/Documents/Practicum2/Practicum2/data/valid")
####THIS PLOTS the barplot of the distribution of seedlings note Imbalance classes
#This shows the training directory
names <- list()
for (i in 1:length(trainnames)){
  names[[i]] <- list.files(file.path("D:/Documents/Practicum2/Practicum2/data/train",trainnames[i]))
}
#Get file paths
pv_base <- vector() #placeholder
path <- NULL #placeholder
y <- NULL #placeholder
for (i in 1:length(trainnames)){
  for (j in 1:length(names[[i]])){
    path <- file.path("D:/Documents/Practicum2/Practicum2/data/train",
                      trainnames[i],names[[i]][j]) # Write file path
    pv_base <- append(pv_base,path)
    y <- append(y,trainnames[i]) # Get label
  }
}
#Load Library
library(ggplot2)
ydf <- as.data.frame(table(y)) #Put into a dataframe for ggplot
#make a bar chart
bars <- ggplot(ydf, aes(y,Freq, fill=y)) +
  geom_bar(stat = "identity") +
  labs(x="Types of Seedlings", y="Count") +
  theme(legend.position = "none")
bars +coord_flip() + #horizontal orientation
  ggtitle("Images in Directory")
#
##This shows the validation directory
names <- list()
for (i in 1:length(validnames)){
  names[[i]] <- list.files(file.path("D:/Documents/Practicum2/Practicum2/data/valid",validnames[i]))
}
#Get file paths
pv_base <- vector() #placeholder
path <- NULL #placeholder
y <- NULL #placeholder
for (i in 1:length(validnames)){
  for (j in 1:length(names[[i]])){
    path <- file.path("D:/Documents/Practicum2/Practicum2/data/train",
                      validnames[i],names[[i]][j]) # Write file path
    pv_base <- append(pv_base,path)
    y <- append(y,validnames[i]) # Get label
  }
}
#
ydf <- as.data.frame(table(y)) #Put into a dataframe for ggplot
#make a bar chart
bars <- ggplot(ydf, aes(y,Freq, fill=y)) +
  geom_bar(stat = "identity") +
  labs(x="Types of Seedlings", y="Count") +
  theme(legend.position = "none")
bars +coord_flip() + #horizontal orientation
  ggtitle("Images in Directory")
#
##This shows the test directory
names <- list()
for (i in 1:length(testnames)){
  names[[i]] <- list.files(file.path("D:/Documents/Practicum2/Practicum2/data/test",testnames[i]))
}
#Get file paths
pv_base <- vector() #placeholder
path <- NULL #placeholder
y <- NULL #placeholder
for (i in 1:length(testnames)){
  for (j in 1:length(names[[i]])){
    path <- file.path("D:/Documents/Practicum2/Practicum2/data/train",
                      testnames[i],names[[i]][j]) # Write file path
    pv_base <- append(pv_base,path)
    y <- append(y,testnames[i]) # Get label
  }
}
#
ydf <- as.data.frame(table(y)) #Put into a dataframe for ggplot
#make a bar chart
bars <- ggplot(ydf, aes(y,Freq, fill=y)) +
  geom_bar(stat = "identity") +
  labs(x="Types of Seedlings", y="Count") +
  theme(legend.position = "none")
bars +coord_flip() + #horizontal orientation
  ggtitle("Images in Directory")