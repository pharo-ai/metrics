# Metrics

This package is part of the Pharo AI project: It contains implementations, tests and documentation of Machine Learning metrics for Pharo.

![https://github.com/pharo-ai/metrics/workflows/test/badge.svg](https://github.com/pharo-ai/MLMetrics/workflows/test/badge.svg)
[![Coverage Status](https://coveralls.io/repos/github//pharo-ai/metrics/badge.svg?branch=main)](https://coveralls.io/github/pharo-ai/MLMetrics?branch=main)
![License](https://img.shields.io/badge/license-MIT-blue.svg)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)

## Loading

```smalltalk
Metacello new
   baseline: 'AIMetrics';
   repository: 'github://pharo-ai/metrics/src';
   load.
```

## If you want to depend on it

```smalltalk
spec 
   baseline: 'AIMetrics' 
   with: [ spec repository: 'github://pharo-ai/metrics/src' ].
```

## Usage

This library contains two major types of metrics used in Machine Learning:

  - Evaluation metrics assess how a trained model has performed.
  - Distance metrics, used to asses relationships between dataset elements.

### Evaluation metrics


### Distance metrics



 
