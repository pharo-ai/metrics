"
An AIAccuracyScoreTest is a test class for testing the behavior of AIAccuracyScore
"
Class {
	#name : #AIAccuracyScoreTest,
	#superclass : #TestCase,
	#instVars : [
		'metric'
	],
	#category : #'AI-Metrics-Classification-Tests'
}

{ #category : #running }
AIAccuracyScoreTest >> setUp [

	super setUp.
	metric := AIAccuracyScore new
]

{ #category : #tests }
AIAccuracyScoreTest >> testComputeForActualPredicted [

	| yPred yTrue |
	yPred := #( 0 2 1 3 ).
	yTrue := #( 0 1 2 3 ).
	self
		assert: (metric computeForActual: yTrue predicted: yPred)
		equals: 0.5
]
