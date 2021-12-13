"
The mean_squared_error function computes mean square error, a risk metric corresponding to the expected value of the squared (quadratic) error or loss.

Source: https://scikit-learn.org/stable/modules/model_evaluation.html
	
(1/n) * Σ (true - predicted) ^ 2
"
Class {
	#name : #AIMeanSquaredError,
	#superclass : #AIRegressionMetric,
	#category : #'AI-Metrics-Regression'
}

{ #category : #api }
AIMeanSquaredError >> computeForActual: actualValues predicted: predictedValues [

	| sum |
	sum := 0.
	actualValues
		with: predictedValues
		do: [ :actual :predicted | 
		sum := sum + (actual - predicted) squared ].
	^ sum / actualValues size
]
