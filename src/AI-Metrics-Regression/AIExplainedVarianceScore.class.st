"
In statistics, explained variation measures the proportion to which a mathematical model accounts for the variation (dispersion) of a given data set. Often, variation is quantified as variance; then, the more specific term explained variance can be used.

The complementary part of the total variation is called unexplained or residual variation.

Source: Wikipedia

explained_variance_score = 1 - (actual - predicted) variance / actual variance
"
Class {
	#name : #AIExplainedVarianceScore,
	#superclass : #AIRegressionMetric,
	#category : #'AI-Metrics-Regression'
}

{ #category : #accessing }
AIExplainedVarianceScore class >> metricName [

	^ 'Explained Variance Score'
]

{ #category : #api }
AIExplainedVarianceScore >> computeForActual: actualValues predicted: predictedValues [

	| num dem |
	num := (actualValues - predictedValues) stdev squared.
	dem := actualValues stdev squared.
	^ 1 - (num / dem)
]
