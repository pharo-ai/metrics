# MLMetrics

This package is part of the Pharo AI project: It contains implementations, tests and documentation of Machine Learning metrics for Pharo.

[![Build Status](https://travis-ci.com/pharo-ai/MLMetrics.svg?branch=master)](https://travis-ci.com/pharo-ai/MLMetrics)
[![Coverage Status](https://coveralls.io/repos/github//pharo-ai/MLMetrics/badge.svg?branch=master)](https://coveralls.io/github//pharo-ai/MLMetrics?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)]()
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)
<!-- [![Build status](https://ci.appveyor.com/api/projects/status/1wdnjvmlxfbml8qo?svg=true)](https://ci.appveyor.com/project/olekscode/dataframe)  -->


## Loading

```
Metacello new
   baseline: 'MLMetrics';
   repository: 'github://pharo-ai/MLMetrics';
   load.
```

## If you want to depend on it

```
spec 
   baseline: 'MLMetrics' 
   with: [ spec repository: 'github://pharo-ai/MLMetrics/src' ].
```
