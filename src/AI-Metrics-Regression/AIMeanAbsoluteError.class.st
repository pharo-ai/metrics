"
The mean_absolute_error function computes mean absolute error, a risk metric corresponding to the expected value of the absolute error loss or -norm loss.

Source: https://scikit-learn.org/stable/modules/model_evaluation.html""
	
(1/n) * Σ (true - predicted) absoluteValue
"
Class {
	#name : #AIMeanAbsoluteError,
	#superclass : #AIRegressionMetric,
	#category : #'AI-Metrics-Regression'
}

{ #category : #api }
AIMeanAbsoluteError >> computeForActual: actualValues predicted: predictedValues [

	| sum |
	sum := 0.
	actualValues
		with: predictedValues
		do: [ :actual :predicted | sum := sum + (actual - predicted) abs ].
	^ sum / actualValues size
]
