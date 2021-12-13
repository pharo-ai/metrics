"
An AIRegressionMetricsTest is a test class for testing the behavior of AIRegressionMetrics
"
Class {
	#name : #AIRegressionMetricsTest,
	#superclass : #TestCase,
	#instVars : [
		'regressionMetrics'
	],
	#category : #'AI-Metrics-Regression-Tests'
}

{ #category : #running }
AIRegressionMetricsTest >> setUp [

	super setUp.
	regressionMetrics := AIRegressionMetrics
]

{ #category : #tests }
AIRegressionMetricsTest >> testMaxErrorActualPredicted [

	| yTrue yPredicted |
	yTrue := #( 3 2 7 1 ).
	yPredicted := #( 9 2 7 1 ).
	self
		assert: (regressionMetrics maxErrorActual: yTrue predicted: yPredicted)
		equals: 6
]

{ #category : #tests }
AIRegressionMetricsTest >> testMeanAbsoluteErrorActualPredicted [

	| yTrue yPredicted |
	yTrue := #( 3 -0.5 2 7 ).
	yPredicted := #( 2.5 0.0 2 8 ).
	self
		assert: (regressionMetrics meanAbsoluteErrorActual: yTrue predicted: yPredicted)
		equals: 0.5
]

{ #category : #tests }
AIRegressionMetricsTest >> testMeanSquaredErrorActualPredicted [

	| yTrue yPredicted |
	yTrue := #( 3 -0.5 2 7 ).
	yPredicted := #( 2.5 0.0 2 8 ).
	self
		assert: (regressionMetrics meanSquaredErrorActual: yTrue predicted: yPredicted)
		equals: 0.375
]

{ #category : #tests }
AIRegressionMetricsTest >> testMeanSquaredLogarithmicErrorActualPredicted [

	| yTrue yPredicted |
	yTrue := #( 3 5 2.5 7 ).
	yPredicted := #( 2.5 5 4 8 ).
	self
		assert: (regressionMetrics meanSquaredLogarithmicErrorActual: yTrue predicted: yPredicted)
		equals: 0.03973012298459379
]

{ #category : #tests }
AIRegressionMetricsTest >> testR2CoefficientActualPredicted [

	| yTrue yPredicted |
	yTrue := #( 3 -0.5 2 7 ).
	yPredicted := #( 2.5 0.0 2 8 ).
	self
		assert: (regressionMetrics r2CoefficientActual: yTrue predicted: yPredicted)
		equals: 0.9486081370449679
]

{ #category : #tests }
AIRegressionMetricsTest >> testRootMeanSquaredErrorActualPredicted [

	| yTrue yPredicted |
	yTrue := #( 6 7 2.43 8 ).
	yPredicted := #( 5 7 3.09 7 ).
	self
		assert: (regressionMetrics rootMeanSquaredErrorActual: yTrue predicted: yPredicted)
		equals: 0.780320446995976
]
