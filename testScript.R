# Quick test from: https://www.datacamp.com/community/tutorials/keras-r-deep-learning
#### Load environment ####
library(keras)

# Read iris dataset
iris <- read.csv(
  url("http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"),
  header = FALSE)

#### Data preparation ####
# Determine sample size
ind <- sample(2, nrow(iris), replace = TRUE, prob = c(0.67, 0.33))

# Change labels to numbers
iris[,5] <- as.numeric(iris[,5]) - 1

# Turn `iris` into a matrix
iris <- as.matrix(iris)

# Set iris `dimnames` to `NULL`
dimnames(iris) <- NULL

# Split the `iris` data
iris.training <- iris[ind == 1, 1:4]
iris.test <- iris[ind == 2, 1:4]

# Split the class attribute
iris.trainingtarget <- iris[ind == 1, 5]
iris.testtarget <- iris[ind == 2, 5]

# One hot encode training target values
iris.trainLabels <- to_categorical(iris.trainingtarget)

# One hot encode test target values
iris.testLabels <- to_categorical(iris.testtarget)

#### Create model ####
# Initialize a sequential model
model <- keras_model_sequential()

# Add layers to the model
model %>%
  layer_dense(units = 8, activation = 'relu', input_shape = c(4)) %>%
  layer_dense(units = 3, activation = 'softmax')

# Compile the model
model %>% compile(
  loss = 'categorical_crossentropy',
  optimizer = 'adam',
  metrics = 'accuracy'
)

#### Fit model ####
# Fit the model
# Store the fitting history in `history`
history <- model %>% fit(
  iris.training,
  iris.trainLabels,
  epochs = 200,
  batch_size = 5,
  validation_split = 0.2
)

#### Outputs ####
save_model_hdf5(model, 'test_model.h5')
