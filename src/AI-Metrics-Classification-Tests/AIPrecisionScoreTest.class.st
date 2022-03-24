"
An AIPrecisionScoreTest is a test class for testing the behavior of AIPrecisionScore
"
Class {
	#name : #AIPrecisionScoreTest,
	#superclass : #TestCase,
	#instVars : [
		'metric'
	],
	#category : #'AI-Metrics-Classification-Tests'
}

{ #category : #running }
AIPrecisionScoreTest >> setUp [

	super setUp.

	metric := AIPrecisionScore new
]

{ #category : #tests }
AIPrecisionScoreTest >> testComputeForActualPredicted [

	| trueValues predictedValues |
	trueValues := #( 0 1 0 0 1 1 ).
	predictedValues := #( 0 1 1 0 0 1 ).

	self
		assert: (metric computeForActual: trueValues predicted: predictedValues)
		closeTo: 0.6666666666666666
]

{ #category : #tests }
AIPrecisionScoreTest >> testComputeForActualPredictedII [

	| trueValues predictedValues |
	trueValues := #( 1 0 1 0 1 0 1 1 1 0 ).
	predictedValues := #( 1 1 0 1 1 0 1 1 1 0 ).

	self
		assert: (metric computeForActual: trueValues predicted: predictedValues) asFloat
		closeTo: 0.7142857142857143
]
