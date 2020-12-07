# MLMetrics

This package is part of the Pharo AI project: It contains implementations, tests and documentation of Machine Learning metrics for Pharo.

![https://github.com/pharo-ai/MLMetrics/workflows/test/badge.svg](https://github.com/pharo-ai/MLMetrics/workflows/test/badge.svg)

[![Build Status](https://travis-ci.com/pharo-ai/MLMetrics.svg?branch=main)](https://travis-ci.com/pharo-ai/MLMetrics)
[![Coverage Status](https://coveralls.io/repos/github//pharo-ai/MLMetrics/badge.svg?branch=main)](https://coveralls.io/github/pharo-ai/MLMetrics?branch=main)
![License](https://img.shields.io/badge/license-MIT-blue.svg)]
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)


## Loading

```
Metacello new
   baseline: 'MLMetrics';
   repository: 'github://pharo-ai/MLMetrics:main/src';
   load.
```

## If you want to depend on it

```
spec 
   baseline: 'MLMetrics' 
   with: [ spec repository: 'github://pharo-ai/MLMetrics:main/src' ].
```
