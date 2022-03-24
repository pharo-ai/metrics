"
An AIRecallScoreTest is a test class for testing the behavior of AIRecallScore
"
Class {
	#name : #AIRecallScoreTest,
	#superclass : #TestCase,
	#instVars : [
		'metric'
	],
	#category : #'AI-Metrics-Classification-Tests'
}

{ #category : #running }
AIRecallScoreTest >> setUp [

	super setUp.

	metric := AIRecallScore new
]

{ #category : #tests }
AIRecallScoreTest >> testComputeForActualPredicted [

	| trueValues predictedValues |
	trueValues := #( 0 1 0 0 1 1 ).
	predictedValues := #( 0 1 1 0 0 1 ).

	self
		assert: (metric computeForActual: trueValues predicted: predictedValues)
		closeTo: 0.6666666666666666
]

{ #category : #tests }
AIRecallScoreTest >> testComputeForActualPredictedII [

	| trueValues predictedValues |
	trueValues := #( 1 0 1 0 1 0 1 1 1 0 ).
	predictedValues := #( 1 1 0 1 1 0 1 1 1 0 ).

	self
		assert: (metric computeForActual: trueValues predicted: predictedValues) asFloat
		closeTo: 0.8333333333333334
]
