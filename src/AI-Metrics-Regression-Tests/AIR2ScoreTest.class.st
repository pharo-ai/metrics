Class {
	#name : #AIR2ScoreTest,
	#superclass : #TestCase,
	#instVars : [
		'metric'
	],
	#category : #'AI-Metrics-Regression-Tests'
}

{ #category : #running }
AIR2ScoreTest >> setUp [

	super setUp.

	metric := AIR2Score new
]

{ #category : #tests }
AIR2ScoreTest >> testComputeForActualPredicted [

	| yTrue yPredicted |
	yTrue := #( 3 -0.5 2 7 ).
	yPredicted := #( 2.5 0.0 2 8 ).
	self
		assert: (metric computeForActual: yTrue predicted: yPredicted)
		equals: 0.9486081370449679
]
