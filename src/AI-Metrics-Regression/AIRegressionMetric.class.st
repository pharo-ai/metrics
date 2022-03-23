"
I am the abstract class that allows to evalute the performance of a regression model (linear, logistic regression, etc).
My subclasses provide several differen metrics for testing a regression model.
"
Class {
	#name : #AIRegressionMetric,
	#superclass : #Object,
	#category : #'AI-Metrics-Regression'
}

{ #category : #accessing }
AIRegressionMetric class >> metricName [

	^ self subclassResponsibility
]

{ #category : #api }
AIRegressionMetric >> computeForActual: actualValues predicted: predictedValues [

	^ self subclassResponsibility
]
