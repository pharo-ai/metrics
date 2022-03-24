"
An AIF1ScoreTest is a test class for testing the behavior of AIF1Score
"
Class {
	#name : #AIF1ScoreTest,
	#superclass : #TestCase,
	#instVars : [
		'metric'
	],
	#category : #'AI-Metrics-Classification-Tests'
}

{ #category : #running }
AIF1ScoreTest >> setUp [

	super setUp.

	metric := AIF1Score new
]

{ #category : #tests }
AIF1ScoreTest >> testComputeForActualPredicted [

	| trueValues predictedValues |
	trueValues := #( 0 1 0 0 1 0 ).
	predictedValues := #( 0 0 1 0 1 1 ).

	self
		assert: (metric computeForActual: trueValues predicted: predictedValues)
		closeTo: 0.4
]

{ #category : #tests }
AIF1ScoreTest >> testComputeForActualPredictedII [

	| trueValues predictedValues |
	trueValues := #( 1 1 1 0 1 0 1 1 0 0 ).
	predictedValues := #( 1 1 0 1 0 0 0 1 1 0 ).

	self
		assert: (metric computeForActual: trueValues predicted: predictedValues) asFloat
		closeTo: 0.5454545454545454
]
