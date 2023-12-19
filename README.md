[![Build status](https://github.com/pharo-ai/metrics/workflows/CI/badge.svg)](https://github.com/pharo-ai/metrics/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/pharo-ai/metrics/badge.svg?branch=master)](https://coveralls.io/github/pharo-ai/metrics?branch=master)
[![Pharo version](https://img.shields.io/badge/Pharo-9-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-10-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-11-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-12-%23aac9ff.svg)](https://pharo.org/download)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

# Description

This package is part of the Pharo AI project: It contains implementations, tests and documentation of different metrics for Machine Learning models. The evaluation metrics allows to assess how a trained Machine Learning model has performed.

For more information please refer to the wiki: https://github.com/pharo-ai/wiki/blob/master/wiki/DataExploration/Metrics.md

There is explained with more detail the available metrics and how to use them.

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

Types of metrics: 

- Clustering metrics
- Regression metrics
- Classification metrics

### Example: Mean Squared Error (`AIMeanSquaredError`)

```st
| yTrue yPredicted metric |
metric := AIMeanSquaredError new.
yTrue := #( 3 -0.5 2 7 ).
yPredicted := #( 2.5 0.0 2 8 ).
metric computeForActual: yTrue predicted: yPredicted "0.375"
```

### Example: Accuracy Score (`AIAccuracyScore`)

```st
| yTrue yPredicted metric |
metric := AIAccuracyScore new.
yTrue := #( 0 1 2 3 ).
yPredicted := #( 0 2 1 3 ).
metric computeForActual: yTrue predicted: yPredicted "0.5"
```
