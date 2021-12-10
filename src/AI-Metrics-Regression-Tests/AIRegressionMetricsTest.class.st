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
AIRegressionMetricsTest >> testCoefficientOfDeterminationActualExpected [

	| yTrue yPredicted |
	yTrue := #( 3 -0.5 2 7 ).
	yPredicted := #( 2.5 0.0 2 8 ).
	self
		assert: (regressionMetrics coefficientOfDeterminationActual: yTrue expected: yPredicted)
		equals: 0.9486081370449679
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
AIRegressionMetricsTest >> testMultidimensionalMeanAbsoluteErrorActualExpected [

	| yTrue yPredicted |
	yTrue := #( #(0.5 1) #(-1 1) #(7 -6) ).
	yPredicted := #( #(0 2) #(-1 2) #(8 -5) ).
	self
		assert: (regressionMetrics multidimensionalMeanAbsoluteErrorActual: yTrue expected: yPredicted)
		equals: 0.75
]

{ #category : #tests }
AIRegressionMetricsTest >> testMultidimensionalMeanSquaredErrorActualExpected [

	| yTrue yPredicted |
	yTrue := #( #(0.5 1) #(-1 1) #(7 -6) ).
	yPredicted := #( #(0 2) #(-1 2) #(8 -5) ).
	self
		assert: (regressionMetrics multidimensionalMeanSquaredErrorActual: yTrue expected: yPredicted)
		equals: 0.7083333333333334
]
