Class {
	#name : #AIMeanSquaredLogarithmicErrorTest,
	#superclass : #TestCase,
	#instVars : [
		'metric'
	],
	#category : #'AI-Metrics-Regression-Tests'
}

{ #category : #running }
AIMeanSquaredLogarithmicErrorTest >> setUp [

	super setUp.

	metric := AIMeanSquaredLogarithmicError new
]

{ #category : #tests }
AIMeanSquaredLogarithmicErrorTest >> testComputeForActualPredicted [

	| yTrue yPredicted |
	yTrue := #( 3 5 2.5 7 ).
	yPredicted := #( 2.5 5 4 8 ).
	self
		assert: (metric computeForActual: yTrue predicted: yPredicted)
		equals: 0.03973012298459379
]
