# Program Name: Adstock Transformationwith Maximum Period Decay
# Written By  : Gabriel Mohanna
# Date Created: July 11, 2014
# Narrative   : An adstock transformation with Maximum Period Decay
#
# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Code is Poetry >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

# Define Adstock Rate
adstock_rate <- 0.50
max_memory   <- 2

# Create Data
advertising <- c(117.913, 120.112, 125.828, 115.354, 177.090, 141.647, 137.892,   0.000,   0.000,   0.000,   0.000, 
                   0.000,   0.000,   0.000,   0.000,   0.000,   0.000, 158.511, 109.385,  91.084,  79.253, 102.706, 
                  78.494, 135.114, 114.549,  87.337, 107.829, 125.020,  82.956,  60.813,  83.149,   0.000,   0.000, 
                   0.000,   0.000,   0.000,   0.000, 129.515, 105.486, 111.494, 107.099,   0.000,   0.000,   0.000, 
                   0.000,   0.000,   0.000,   0.000,   0.000,   0.000,   0.000,   0.000)

# Calculate Advertising Adstock
learn_rates <- rep(adstock_rate, max_memory+1) ^ c(0:max_memory)
adstocked_advertising <- filter(c(rep(0, max_memory), advertising), learn_rates, method="convolution")
adstocked_advertising <- adstocked_advertising[!is.na(adstocked_advertising)]

# Graph Data
plot(seq(1,length(advertising)), advertising, type="h", 
     xlab="Time (Usually in Weeks)", ylab="Advertising", 
     ylim=c(0, max(c(advertising, adstocked_advertising))), 
     frame.plot=FALSE)
lines(adstocked_advertising)
