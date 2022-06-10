# meg analysis algorithm 

# algo1 MATLAB

load data using fieldtrip toolbox by function ft_preprocessing 
select meg channels (name starts with AG*)
divided 300s data into 10s epoch/trial 
label for each category (0-Control, 1-MCI, 2-Dementia)
saved into structure s with object data and label into mat files

# algo2 python

## data loading 
load data using scipy.io.mat
resampling at 250 Hz for both site A and site B
arranging data in format (n_trails, n_channels, n_samples)
## filtering in Delta, Theta, Alpha continuous band (0.2-13 Hz)
5th order butterworh bandpass filter
save filtered and unfiltered data for train and test 
plot spectrum 

## splitting 

dividing data into train and validation 

## Feature extraction , selection 
Covariance matrix with 'lwf' estimator 
Electrode selection for varying values (nelec = 20,22,24,26....40)
Vectorization using upper traingular Covariance matrix

## MLP and SVM classifier
fitting train data and labels and predicting train, validation and test labels 
calculating accuracy with confusion matrix

# Optimization
based on training and validation accuracy score selecting best prediction 

# Results 
We found best predictions for our model with 96% training accuracy and 91% validation accuracy for MLP classifier for nelec = 28

