library(keras)
#creating train, validation, and test directories
original_data_dir <- "D:\\Documents/Practicum2/Practicum2/NonsegmentedV2/Charlock"
#Create Data Directory
base_dir <- "D:\\Documents/Practicum2/Practicum2/data"
dir.create(base_dir)
#Create Train Directory
train_dir <- "D:/Documents/Practicum2/Practicum2/data/train"
dir.create(train_dir)
#Create Validation Directory
validation_dir <- "D:/Documents/Practicum2/Practicum2/data/valid"
dir.create(validation_dir)
#Create Test Directory
test_dir <- "D:/Documents/Practicum2/Practicum2/data/test"
dir.create(test_dir)
#create Individual training directories
train_blackgrass_dir <- file.path(train_dir, "BlackGrass")
dir.create(train_blackgrass_dir)
train_charlock_dir <- file.path(train_dir, "Charlock")
dir.create(train_charlock_dir)
train_cleavers_dir <- file.path(train_dir, "Cleavers")
dir.create(train_cleavers_dir)
train_commonchickweed_dir <- file.path(train_dir, "Common Chickweed")
dir.create(train_commonchickweed_dir)
train_commonwheat_dir <- file.path(train_dir, "Common Wheat")
dir.create(train_commonwheat_dir)
train_fathen_dir <- file.path(train_dir, "Fat Hen")
dir.create(train_fathen_dir)
train_loosesilkybent_dir <- file.path(train_dir, "Loose Silky-bent")
dir.create(train_loosesilkybent_dir)
train_maize_dir <- file.path(train_dir, "Maize")
dir.create(train_maize_dir)
train_scentlessmayweed_dir <- file.path(train_dir, "Sentless Mayweed")
dir.create(train_scentlessmayweed_dir)
train_shepherdspurse_dir <- file.path(train_dir, "Shepherds Purse")
dir.create(train_shepherdspurse_dir)
train_smallfloweredcranesbill_dir <- file.path(train_dir, "Small Flowered Cranesbill")
dir.create(train_smallfloweredcranesbill_dir)
train_sugarbeet_dir <- file.path(train_dir, "Sugar Beet")
dir.create(train_sugarbeet_dir)
#Create individual Validation directories
validation_blackgrass_dir <- file.path(validation_dir, "BlackGrass")
dir.create(validation_blackgrass_dir)
validation_charlock_dir <- file.path(validation_dir, "Charlock")
dir.create(validation_charlock_dir)
validation_cleavers_dir <- file.path(validation_dir, "Cleavers")
dir.create(validation_cleavers_dir)
validation_commonchickweed_dir <- file.path(validation_dir, "Common Chickweed")
dir.create(validation_commonchickweed_dir)
validation_commonwheat_dir <- file.path(validation_dir, "Common Wheat")
dir.create(validation_commonwheat_dir)
validation_fathen_dir <- file.path(validation_dir, "Fat Hen")
dir.create(validation_fathen_dir)
validation_loosesilkybent_dir <- file.path(validation_dir, "Loose Silky-bent")
dir.create(validation_loosesilkybent_dir)
validation_maize_dir <- file.path(validation_dir, "Maize")
dir.create(validation_maize_dir)
validation_scentlessmayweed_dir <- file.path(validation_dir, "Sentless Mayweed")
dir.create(validation_scentlessmayweed_dir)
validation_shepherdspurse_dir <- file.path(validation_dir, "Shepherds Purse")
dir.create(validation_shepherdspurse_dir)
validation_smallfloweredcranesbill_dir <- file.path(validation_dir, "Small Flowered Cranesbill")
dir.create(validation_smallfloweredcranesbill_dir)
validation_sugarbeet_dir <- file.path(validation_dir, "Sugar Beet")
dir.create(validation_sugarbeet_dir)
#create individual test directories
test_blackgrass_dir <- file.path(test_dir, "BlackGrass")
dir.create(test_blackgrass_dir)
test_charlock_dir <- file.path(test_dir, "Charlock")
dir.create(test_charlock_dir)
test_cleavers_dir <- file.path(test_dir, "Cleavers")
dir.create(test_cleavers_dir)
test_commonchickweed_dir <- file.path(test_dir, "Common Chickweed")
dir.create(test_commonchickweed_dir)
test_commonwheat_dir <- file.path(test_dir, "Common Wheat")
dir.create(test_commonwheat_dir)
test_fathen_dir <- file.path(test_dir, "Fat Hen")
dir.create(test_fathen_dir)
test_loosesilkybent_dir <- file.path(test_dir, "Loose Silky-bent")
dir.create(test_loosesilkybent_dir)
test_maize_dir <- file.path(test_dir, "Maize")
dir.create(test_maize_dir)
test_scentlessmayweed_dir <- file.path(test_dir, "Sentless Mayweed")
dir.create(test_scentlessmayweed_dir)
test_shepherdspurse_dir <- file.path(test_dir, "Shepherds Purse")
dir.create(test_shepherdspurse_dir)
test_smallfloweredcranesbill_dir <- file.path(test_dir, "Small Flowered Cranesbill")
dir.create(test_smallfloweredcranesbill_dir)
test_sugarbeet_dir <- file.path(test_dir, "Sugar Beet")
dir.create(test_sugarbeet_dir)
#Renumber file names within individual directories in windows for the next section to work properly
#Each of the 12 base file directories are set current in Rstudio for the numbering to work correctly
filez <- list.files(pattern = "*.png", full.names = T)
head(filez)
sapply(seq_along(filez), function(x){file.rename(filez[x], paste0(x,".png"))})
#Set Working Directory
setwd("~/Practicum2/Practicum2/NonsegmentedV2/Black-grass")
#Set Original directory
blackgrass_dir <- "D:\\Documents/Practicum2/Practicum2/NonsegmentedV2/Black-grass"
#Change file name in windows starting with 1, the rest of this should work
#Move 80% of images to Train directories
fnames <- paste0("", 1:247, ".png")
file.copy(file.path(blackgrass_dir, fnames),
          file.path(train_blackgrass_dir))
#Move 10% of Black Grass to Validation set
fnames <- paste0("", 247:277, ".png")
file.copy(file.path(blackgrass_dir, fnames),
          file.path(validation_blackgrass_dir))
#Move 10% of Black Grass to Test Set
fnames <- paste0("", 278:309, ".png")
file.copy(file.path(blackgrass_dir, fnames),
          file.path(test_blackgrass_dir))
#Set Working Directory
setwd("~/Practicum2/Practicum2/NonsegmentedV2/Charlock")
#Set Charlock original directory 
charlock_dir <- "D:\\Documents/Practicum2/Practicum2/NonsegmentedV2/Charlock"
#Move 80% of Charlock images to Train directories
fnames <- paste0("", 1:362, ".png")
file.copy(file.path(charlock_dir, fnames),
          file.path(train_charlock_dir))
#Move 10% of Charlock to Validation set
fnames <- paste0("", 363:408, ".png")
file.copy(file.path(charlock_dir, fnames),
          file.path(validation_charlock_dir))
#Move 10% of Charlock to Test Set
fnames <- paste0("", 409:452, ".png")
file.copy(file.path(charlock_dir, fnames),
          file.path(test_charlock_dir))
#Set Working Directory
setwd("~/Practicum2/Practicum2/NonsegmentedV2/Cleavers")
#Set Cleavers original directory
cleavers_dir <- "D:\\Documents/Practicum2/Practicum2/NonsegmentedV2/Cleavers"
#Move 80% of images to training directory
fnames <- paste0("", 1:268, ".png")
file.copy(file.path(cleavers_dir, fnames),
          file.path(train_cleavers_dir))
#Move 10% of images to validataion Directory
fnames <- paste0("", 269:302, ".png")
file.copy(file.path(cleavers_dir, fnames),
          file.path(validation_cleavers_dir))
#Move 10% of images to test directory
fnames <- paste0("", 303:335, ".png")
file.copy(file.path(cleavers_dir, fnames),
          file.path(test_cleavers_dir))
#Set Working Directory
setwd("~/Practicum2/Practicum2/NonsegmentedV2/Common Chickweed")
#Set Common Chickweed original directory
commonchickweed_dir <- "D:\\Documents/Practicum2/Practicum2/NonsegmentedV2/Common Chickweed"
#Move 80% of images to training directory
fnames <- paste0("", 1:570, ".png")
file.copy(file.path(commonchickweed_dir, fnames),
          file.path(train_commonchickweed_dir))
#Move 10% of images to validataion Directory
fnames <- paste0("", 571:642, ".png")
file.copy(file.path(commonchickweed_dir, fnames),
          file.path(validation_commonchickweed_dir))
#Move 10% of images to test directory
fnames <- paste0("", 643:713, ".png")
file.copy(file.path(commonchickweed_dir, fnames),
          file.path(test_commonchickweed_dir))
#Set Working directory
setwd("~/Practicum2/Practicum2/NonsegmentedV2/Common wheat")
#Set Common wheat Original directory
commonwheat_dir <- "D:\\Documents/Practicum2/Practicum2/NonsegmentedV2/Common wheat"
#Move 80% of images to training directory
fnames <- paste0("", 1:202, ".png")
file.copy(file.path(commonwheat_dir, fnames),
          file.path(train_commonwheat_dir))
#Move 10% of images to validataion Directory
fnames <- paste0("", 203:228, ".png")
file.copy(file.path(commonwheat_dir, fnames),
          file.path(validation_commonwheat_dir))
#Move 10% of images to test directory
fnames <- paste0("", 229:253, ".png")
file.copy(file.path(commonwheat_dir, fnames),
          file.path(test_commonwheat_dir))
#Set Working directory
setwd("~/Practicum2/Practicum2/NonsegmentedV2/Fat Hen")
#Set Original directory
fathen_dir <- "D:\\Documents/Practicum2/Practicum2/NonsegmentedV2/Fat Hen"
#Move 80% of images to training directory
fnames <- paste0("", 1:424, ".png")
file.copy(file.path(fathen_dir, fnames),
          file.path(train_fathen_dir))
#Move 10% of images to validataion Directory
fnames <- paste0("", 425:479, ".png")
file.copy(file.path(fathen_dir, fnames),
          file.path(validation_fathen_dir))
#Move 10% of images to test directory
fnames <- paste0("", 480:538, ".png")
file.copy(file.path(fathen_dir, fnames),
          file.path(test_fathen_dir))
#Set Working Directory
setwd("~/Practicum2/Practicum2/NonsegmentedV2/Loose Silky-bent")
##Set Original directory
loosesilkybent_dir <- "D:\\Documents/Practicum2/Practicum2/NonsegmentedV2/Loose Silky-bent"
#Move 80% of images to training directory
fnames <- paste0("", 1:610, ".png")
file.copy(file.path(loosesilkybent_dir, fnames),
          file.path(train_loosesilkybent_dir))
#Move 10% of images to validataion Directory
fnames <- paste0("", 611:686, ".png")
file.copy(file.path(loosesilkybent_dir, fnames),
          file.path(validation_loosesilkybent_dir))
#Move 10% of images to test directory
fnames <- paste0("", 687:762, ".png")
file.copy(file.path(loosesilkybent_dir, fnames),
          file.path(test_loosesilkybent_dir))
#Set Working directory
setwd("~/Practicum2/Practicum2/NonsegmentedV2/Maize")
#set Original Directory
maize_dir <- "D:\\Documents/Practicum2/Practicum2/NonsegmentedV2/Maize"
#Move 80% of images to training directory
fnames <- paste0("", 1:206, ".png")
file.copy(file.path(maize_dir, fnames),
          file.path(train_maize_dir))
#Move 10% of images to validataion Directory
fnames <- paste0("", 207:232, ".png")
file.copy(file.path(maize_dir, fnames),
          file.path(validation_maize_dir))
#Move 10% of images to test directory
fnames <- paste0("", 233:257, ".png")
file.copy(file.path(maize_dir, fnames),
          file.path(test_maize_dir))
#Set Working Directory
setwd("~/Practicum2/Practicum2/NonsegmentedV2/Scentless Mayweed")
#Set Original Directory
scentlessmayweed_dir <- "D:\\Documents/Practicum2/Practicum2/NonsegmentedV2/Scentless Mayweed"
#Move 80% of images to training directory
fnames <- paste0("", 1:486, ".png")
file.copy(file.path(scentlessmayweed_dir, fnames),
          file.path(train_scentlessmayweed_dir))
#Move 10% of images to validataion Directory
fnames <- paste0("", 487:547, ".png")
file.copy(file.path(scentlessmayweed_dir, fnames),
          file.path(validation_scentlessmayweed_dir))
#Move 10% of images to test directory
fnames <- paste0("", 548:607, ".png")
file.copy(file.path(scentlessmayweed_dir, fnames),
          file.path(test_scentlessmayweed_dir))
#set Working Directory
setwd("~/Practicum2/Practicum2/NonsegmentedV2/Shepherds Purse")
#Set Original Directory
shepherdspurse_dir <- "D:\\Documents/Practicum2/Practicum2/NonsegmentedV2/Shepherds Purse"
#Move 80% of images to training directory
fnames <- paste0("", 1:219, ".png")
file.copy(file.path(shepherdspurse_dir, fnames),
          file.path(train_shepherdspurse_dir))
#Move 10% of images to validataion Directory
fnames <- paste0("", 220:247, ".png")
file.copy(file.path(shepherdspurse_dir, fnames),
          file.path(validation_shepherdspurse_dir))
#Move 10% of images to test directory
fnames <- paste0("", 248:274, ".png")
file.copy(file.path(shepherdspurse_dir, fnames),
          file.path(test_shepherdspurse_dir))
#Set Working directory
setwd("~/Practicum2/Practicum2/NonsegmentedV2/Smallflowered Cranesbill")
#Set Original Directory
smallfloweredcranesbill_dir <- "D:\\Documents/Practicum2/Practicum2/NonsegmentedV2/Smallflowered Cranesbill"
#Move 80% of images to training directory
fnames <- paste0("", 1:461, ".png")
file.copy(file.path(smallfloweredcranesbill_dir, fnames),
          file.path(train_smallfloweredcranesbill_dir))
#Move 10% of images to validataion Directory
fnames <- paste0("", 462:520, ".png")
file.copy(file.path(smallfloweredcranesbill_dir, fnames),
          file.path(validation_smallfloweredcranesbill_dir))
#Move 10% of images to test directory
fnames <- paste0("", 521:576, ".png")
file.copy(file.path(smallfloweredcranesbill_dir, fnames),
          file.path(test_smallfloweredcranesbill_dir))
#Set Working Directory
setwd("~/Practicum2/Practicum2/NonsegmentedV2/Sugar beet")
#Set Original Directory
sugarbeet_dir <- "D:\\Documents/Practicum2/Practicum2/NonsegmentedV2/Sugar beet"
#Move 80% of images to training directory
fnames <- paste0("", 1:370, ".png")
file.copy(file.path(sugarbeet_dir, fnames),
          file.path(train_sugarbeet_dir))
#Move 10% of images to validataion Directory
fnames <- paste0("", 371:417, ".png")
file.copy(file.path(sugarbeet_dir, fnames),
          file.path(validation_sugarbeet_dir))
#Move 10% of images to test directory
fnames <- paste0("", 418:463, ".png")
file.copy(file.path(sugarbeet_dir, fnames),
          file.path(test_sugarbeet_dir))
##Check Image count in the directories
cat("number in dir:", length(list.files(train_dir)), "\n")
cat("number in dir:", length(list.files(train_blackgrass_dir)), "\n")
cat("number in dir:", length(list.files(train_charlock_dir)), "\n")
cat("number in dir:", length(list.files(train_cleavers_dir)), "\n")
cat("number in dir:", length(list.files(train_commonchickweed_dir)), "\n")
cat("number in dir:", length(list.files(train_commonwheat_dir)), "\n")
cat("number in dir:", length(list.files(train_fathen_dir)), "\n")
cat("number in dir:", length(list.files(train_loosesilkybent_dir)), "\n")
cat("number in dir:", length(list.files(train_maize_dir)), "\n")
cat("number in dir:", length(list.files(train_scentlessmayweed_dir)), "\n")
cat("number in dir:", length(list.files(train_shepherdspurse_dir)), "\n")
cat("number in dir:", length(list.files(train_smallfloweredcranesbill_dir)), "\n")
cat("number in dir:", length(list.files(train_sugarbeet_dir)), "\n")
#Check Validataion Directory
cat("number in dir:", length(list.files(validation_dir)), "\n")
cat("number in dir:", length(list.files(validation_blackgrass_dir)), "\n")
cat("number in dir:", length(list.files(validation_charlock_dir)), "\n")
cat("number in dir:", length(list.files(validation_cleavers_dir)), "\n")
cat("number in dir:", length(list.files(validation_commonchickweed_dir)), "\n")
cat("number in dir:", length(list.files(validation_commonwheat_dir)), "\n")
cat("number in dir:", length(list.files(validation_fathen_dir)), "\n")
cat("number in dir:", length(list.files(validation_loosesilkybent_dir)), "\n")
cat("number in dir:", length(list.files(validation_maize_dir)), "\n")
cat("number in dir:", length(list.files(validation_scentlessmayweed_dir)), "\n")
cat("number in dir:", length(list.files(validation_shepherdspurse_dir)), "\n")
cat("number in dir:", length(list.files(validation_smallfloweredcranesbill_dir)), "\n")
cat("number in dir:", length(list.files(validation_sugarbeet_dir)), "\n")
#Check Test Directory
cat("number in dir:", length(list.files(test_dir)), "\n")
cat("number in dir:", length(list.files(test_blackgrass_dir)), "\n")
cat("number in dir:", length(list.files(test_charlock_dir)), "\n")
cat("number in dir:", length(list.files(test_cleavers_dir)), "\n")
cat("number in dir:", length(list.files(test_commonchickweed_dir)), "\n")
cat("number in dir:", length(list.files(test_commonwheat_dir)), "\n")
cat("number in dir:", length(list.files(test_fathen_dir)), "\n")
cat("number in dir:", length(list.files(test_loosesilkybent_dir)), "\n")
cat("number in dir:", length(list.files(test_maize_dir)), "\n")
cat("number in dir:", length(list.files(test_scentlessmayweed_dir)), "\n")
cat("number in dir:", length(list.files(test_shepherdspurse_dir)), "\n")
cat("number in dir:", length(list.files(test_smallfloweredcranesbill_dir)), "\n")
cat("number in dir:", length(list.files(test_sugarbeet_dir)), "\n")