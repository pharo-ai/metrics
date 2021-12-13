Class {
	#name : #AIMeanSquaredErrorTest,
	#superclass : #TestCase,
	#instVars : [
		'metric'
	],
	#category : #'AI-Metrics-Regression-Tests'
}

{ #category : #running }
AIMeanSquaredErrorTest >> setUp [

	super setUp.

	metric := AIMeanSquaredError new
]

{ #category : #tests }
AIMeanSquaredErrorTest >> testComputeForActualPredicted [

	| yTrue yPredicted |
	yTrue := #( 3 -0.5 2 7 ).
	yPredicted := #( 2.5 0.0 2 8 ).
	self
		assert: (metric computeForActual: yTrue predicted: yPredicted)
		equals: 0.375
]
