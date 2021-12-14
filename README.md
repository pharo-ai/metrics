# Metrics

This package is part of the Pharo AI project: It contains implementations, tests and documentation of different metrics for Machine Learning models. These are evaluation metrics to assess how a trained Machine Learning model has performed.

![Build status](https://github.com/pharo-ai/metrics/workflows/CI/badge.svg)
[![Coverage Status](https://coveralls.io/repos/github/pharo-ai/metrics/badge.svg?branch=master)](https://coveralls.io/github/pharo-ai/metrics?branch=master)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

## Loading

```smalltalk
EpMonitor disableDuring: [ 
   Metacello new
      baseline: 'AIMetrics';
      repository: 'github://pharo-ai/metrics';
      load ]
```

## If you want to depend on it

```smalltalk
spec 
   baseline: 'AIMetrics' 
   with: [ spec repository: 'github://pharo-ai/metrics' ].
```

## Usage

 
