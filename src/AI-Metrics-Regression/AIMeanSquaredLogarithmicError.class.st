"
The mean_squared_log_error function computes a risk metric corresponding to the expected value of the squared logarithmic (quadratic) error or loss.

Source: https://scikit-learn.org/stable/modules/model_evaluation.html

MSLE = (1/n) * Σ ln(1+ true) - ln(1 + predicted)
"
Class {
	#name : #AIMeanSquaredLogarithmicError,
	#superclass : #AIRegressionMetric,
	#category : #'AI-Metrics-Regression'
}

{ #category : #accessing }
AIMeanSquaredLogarithmicError class >> metricName [

	^ 'Mean SquaredLogarithmic Error'
]

{ #category : #api }
AIMeanSquaredLogarithmicError >> computeForActual: actualValues predicted: predictedValues [

	| sum |
	sum := 0.
	actualValues with: predictedValues do: [ :actual :predicted | 
		sum := sum + ((1 + actual) ln - (1 + predicted) ln) squared ].
	^ sum / actualValues size
]
