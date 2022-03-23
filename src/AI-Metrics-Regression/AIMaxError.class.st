"
The max_error function computes the maximum residual error , a metric that captures the worst case error between the predicted value and the true value.
In a perfectly fitted single output regression model, max_error would be 0 on the training set and though this would be highly unlikely in the real world,
this metric shows the extent of error that the model had when it was fitted.

Source: https://scikit-learn.org/stable/modules/model_evaluation.html""

maxError = max(| true - predicted |)
"
Class {
	#name : #AIMaxError,
	#superclass : #AIRegressionMetric,
	#category : #'AI-Metrics-Regression'
}

{ #category : #accessing }
AIMaxError class >> metricName [

	^ 'Max Error'
]

{ #category : #api }
AIMaxError >> computeForActual: actualValues predicted: predictedValues [

	| maxError |
	maxError := (actualValues first - predictedValues first) abs.
	actualValues with: predictedValues do: [ :actual :predicted | 
		| difference |
		difference := (actual - predicted) abs.
		maxError := maxError max: difference ].
	^ maxError
]
