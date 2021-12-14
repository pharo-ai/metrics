"
An AIExplainedVarianceScoreTest is a test class for testing the behavior of AIExplainedVarianceScore
"
Class {
	#name : #AIExplainedVarianceScoreTest,
	#superclass : #TestCase,
	#instVars : [
		'metric'
	],
	#category : #'AI-Metrics-Regression-Tests'
}

{ #category : #initialization }
AIExplainedVarianceScoreTest >> setUp [

	super setUp.
	metric := AIExplainedVarianceScore new
]

{ #category : #tests }
AIExplainedVarianceScoreTest >> testComputeForActualPredicted [

	| yTrue yPredicted |
	yTrue := #( 3 -0.5 2 7 ).
	yPredicted := #( 2.5 0.0 2 8 ).
	self
		assert: (metric computeForActual: yTrue predicted: yPredicted)
		equals: 0.9571734475374732
]
