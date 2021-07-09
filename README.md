# Metrics

This package is part of the Pharo AI project: It contains implementations, tests and documentation of Machine Learning metrics for Pharo. 
These are evaluation metrics to assess how a trained Machine Learning model has performed.

![Build status](https://github.com/pharo-ai/metrics/workflows/CI/badge.svg)
[![Coverage Status](https://coveralls.io/repos/github/pharo-ai/metrics/badge.svg?branch=master)](https://coveralls.io/github/pharo-ai/metrics?branch=master)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-9.0-%23aac9ff.svg)](https://pharo.org/download)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

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

 
