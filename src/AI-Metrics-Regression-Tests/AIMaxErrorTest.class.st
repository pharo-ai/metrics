Class {
	#name : #AIMaxErrorTest,
	#superclass : #TestCase,
	#instVars : [
		'metric'
	],
	#category : #'AI-Metrics-Regression-Tests'
}

{ #category : #running }
AIMaxErrorTest >> setUp [

	super setUp.

	metric := AIMaxError new
]

{ #category : #tests }
AIMaxErrorTest >> testComputeForActualPredicted [

	| yTrue yPredicted |
	yTrue := #( 3 2 7 1 ).
	yPredicted := #( 9 2 7 1 ).
	self
		assert: (metric computeForActual: yTrue predicted: yPredicted)
		equals: 6
]
