# Metrics for Machine Learning models

This package is part of the Pharo AI project: It contains implementations, tests and documentation of different metrics for Machine Learning models. The evaluation metrics allows to assess how a trained Machine Learning model has performed.

[![Build status](https://github.com/pharo-ai/metrics/workflows/CI/badge.svg)](https://github.com/pharo-ai/metrics/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/pharo-ai/metrics/badge.svg?branch=master)](https://coveralls.io/github/pharo-ai/metrics?branch=master)
![License](https://img.shields.io/badge/license-MIT-blue.svg)
[![Pharo version](https://img.shields.io/badge/Pharo-10-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-9.0-%23aac9ff.svg)](https://pharo.org/download)

## Table of Contents  
- [How to install it](#how-to-install-it)  
- [How to depend on it](#how-to-depend-on-it)
- [Clustering metrics](#clustering-metrics)
- [Regression metrics](#regression-metrics)
- [Classification metrics](#classification-metrics)


## How to install it

```smalltalk
EpMonitor disableDuring: [ 
   Metacello new
      baseline: 'AIMetrics';
      repository: 'github://pharo-ai/metrics';
      load ]
```

## How to depend on it

```smalltalk
spec 
   baseline: 'AIMetrics' 
   with: [ spec repository: 'github://pharo-ai/metrics' ].
```

## Clustering metrics

- Jaccard Index (`AIJaccardIndex`)
- Rand Index (`AIRandIndex`)
- Silhouette Index (`AISilhouetteIndex`)
- Adjusted Rand Index (`AIAdjustedRandIndex`)
- Fowlkes Mallows Index (`AIFowlkesMallowsIndex`)
- Mirkin Index (`AIMirkinIndex`)
- Weighted Jaccard Index (`AIWeightedJaccardIndex`)


## Regression metrics

This package also contains regression metrics for testing the performance of linear models like: Logistic and Linear regression.
Part of this explanation of the metrics were extracted from [scikit-learn documentation](https://scikit-learn.org/stable/modules/model_evaluation.html)

### Mean Squared Error (`AIMeanSquaredError`)

The mean_squared_error function computes mean square error, a risk metric corresponding to the expected value of the squared (quadratic) error or loss.

```st
| yTrue yPredicted metric |
metric := AIMeanSquaredError new.
yTrue := #( 3 -0.5 2 7 ).
yPredicted := #( 2.5 0.0 2 8 ).
metric computeForActual: yTrue predicted: yPredicted "0.375"
```

### Mean Absolute Error (`AIMeanAbsoluteError`)

The mean absolute error function computes mean absolute error, a risk metric corresponding to the expected value of the absolute error loss or -norm loss.

```st
| yTrue yPredicted metric |
metric := AIMeanAbsoluteError new.
yTrue := #( 3 -0.5 2 7 ).
yPredicted := #( 2.5 0.0 2 8 ).
metric computeForActual: yTrue predicted: yPredicted "0.5"
```

### Mean Squared Logarithmic Error (`AIMeanSquaredLogarithmicError`)

The mean squared log error function computes a risk metric corresponding to the expected value of the squared logarithmic (quadratic) error or loss.

```st
| yTrue yPredicted metric |
metric := AIMeanSquaredLogarithmicError new.
yTrue := #( 3 5 2.5 7 ).
yPredicted := #( 2.5 5 4 8 ).
metric computeForActual: yTrue predicted: yPredicted "0.03973012298459379"
```

### R2 Score (`AIR2Score`)

The r2 score is the coefficient of determination, usually denoted as R².

It represents the proportion of variance (of y) that has been explained by the independent variables in the model.
It provides an indication of goodness of fit and therefore a measure of how well unseen samples are likely to be predicted by the model, through the proportion of explained variance.

As such variance is dataset dependent, R² may not be meaningfully comparable across different datasets.
Best possible score is 1.0 and it can be negative (because the model can be arbitrarily worse).
A constant model that always predicts the expected value of y, disregarding the input features, would get a R² score of 0.0.

```st
| yTrue yPredicted metric |
metric := AIR2Score new.
yTrue := #( 3 -0.5 2 7 ).
yPredicted := #( 2.5 0.0 2 8 ).
metric computeForActual: yTrue predicted: yPredicted "0.9486081370449679"
```

### Root Mean Squared Error (`AIRootMeanSquaredError`)

This metric is only the square root of the Mean Absolute Error.

```st
| yTrue yPredicted metric |
metric := AIRootMeanSquaredError.
yTrue := #( 6 7 2.43 8 ).
yPredicted := #( 5 7 3.09 7 ).
metric computeForActual: yTrue predicted: yPredicted "0.780320446995976"
```

### Max Error (`AIMaxError`)

The max error function computes the maximum residual error , a metric that captures the worst case error between the predicted value and the true value.
In a perfectly fitted single output regression model, max_error would be 0 on the training set and though this would be highly unlikely in the real world,
this metric shows the extent of error that the model had when it was fitted.

```st
| yTrue yPredicted metric |
metric := AIRootMeanSquaredError.
yTrue := #( 3 2 7 1 ).
yPredicted := #( 9 2 7 1 ).
metric computeForActual: yTrue predicted: yPredicted "6"
```

### Explained Variance Score (`AIExplainedVarianceScore`)

In statistics, explained variation measures the proportion to which a mathematical model accounts for the variation (dispersion) of a given data set. Often, variation is quantified as variance; then, the more specific term explained variance can be used.

The complementary part of the total variation is called unexplained or residual variation.

```st
| yTrue yPredicted metric |
metric := AIRootMeanSquaredError.
yTrue := #( 3 -0.5 2 7 ).
yPredicted := #( 2.5 0.0 2 8 ).
metric computeForActual: yTrue predicted: yPredicted "0.9571734475374732"
```

## Classification metrics

### Accuracy Score (`AIAccuracyScore`)

The accuracy score function computes the accuracy, returning a fraction. The accuracy is defined as the sum of the correct predictions divided by the total number of predictions.

```st
| yTrue yPredicted metric |
metric := AIAccuracyScore new.
yTrue := #( 0 1 2 3 ).
yPredicted := #( 0 2 1 3 ).
metric computeForActual: yTrue predicted: yPredicted "0.5"
```
