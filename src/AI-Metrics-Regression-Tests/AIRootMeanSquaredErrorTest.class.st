Class {
	#name : #AIRootMeanSquaredErrorTest,
	#superclass : #TestCase,
	#instVars : [
		'metric'
	],
	#category : #'AI-Metrics-Regression-Tests'
}

{ #category : #running }
AIRootMeanSquaredErrorTest >> setUp [

	super setUp.
	metric := AIRootMeanSquaredError new
]

{ #category : #tests }
AIRootMeanSquaredErrorTest >> testComputeForActualPredicted [

	| yTrue yPredicted |
	yTrue := #( 6 7 2.43 8 ).
	yPredicted := #( 5 7 3.09 7 ).
	self
		assert: (metric computeForActual: yTrue predicted: yPredicted)
		equals: 0.780320446995976
]
