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
AIRegressionMetricsTest >> testMaxErrorActualExpected [

	| yTrue yPredicted |
	yTrue := #( 3 2 7 1 ).
	yPredicted := #( 9 2 7 1 ).
	self
		assert: (regressionMetrics maxErrorActual: yTrue expected: yPredicted)
		equals: 6
]

{ #category : #tests }
AIRegressionMetricsTest >> testMeanAbsoluteErrorActualExpected [

	| yTrue yPredicted |
	yTrue := #( 3 -0.5 2 7 ).
	yPredicted := #( 2.5 0.0 2 8 ).
	self
		assert: (regressionMetrics meanAbsoluteErrorActual: yTrue expected: yPredicted)
		equals: 0.5
]

{ #category : #tests }
AIRegressionMetricsTest >> testMeanSquaredErrorActualExpected [

	| yTrue yPredicted |
	yTrue := #( 3 -0.5 2 7 ).
	yPredicted := #( 2.5 0.0 2 8 ).
	self
		assert: (regressionMetrics meanSquaredErrorActual: yTrue expected: yPredicted)
		equals: 0.375
]

{ #category : #tests }
AIRegressionMetricsTest >> testR2CoefficientActualExpected [

	| yTrue yPredicted |
	yTrue := #( 3 -0.5 2 7 ).
	yPredicted := #( 2.5 0.0 2 8 ).
	self
		assert: (regressionMetrics r2CoefficientActual: yTrue expected: yPredicted)
		equals: 0.9486081370449679
]
