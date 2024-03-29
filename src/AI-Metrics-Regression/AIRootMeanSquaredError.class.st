"
I am the same as `AIMeanSquareError` only that after the calculation I return the square root.
"
Class {
	#name : #AIRootMeanSquaredError,
	#superclass : #AIRegressionMetric,
	#category : #'AI-Metrics-Regression'
}

{ #category : #accessing }
AIRootMeanSquaredError class >> metricName [

	^ 'Root Mean Squared Error'
]

{ #category : #api }
AIRootMeanSquaredError >> computeForActual: actualValues predicted: predictedValues [

	| meanSquaredError |
	meanSquaredError := AIMeanSquaredError new
		computeForActual: actualValues
		predicted: predictedValues.

	^ meanSquaredError sqrt
]
