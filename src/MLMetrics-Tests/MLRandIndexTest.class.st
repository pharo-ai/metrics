Class {
	#name : #MLRandIndexTest,
	#superclass : #MLMetricTest,
	#category : #'MLMetrics-Tests'
}

{ #category : #running }
MLRandIndexTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	super setUp.
	partitionA := #( 0 1 1 1 0 0 ).
	partitionB := #( 1 1 1 0 0 0).

]

{ #category : #test }
MLRandIndexTest >> testBuildMatrix [

	| actual expected |

	actual := MLRandIndex new buildMatrix: partitionA.
	expected :=  #(#(0 1 1 1 0 0 ) #(1 0 0 0 1 1 ) #(1 0 0 0 1 1 ) #(1 0 0 0 1 1 ) #(0 1 1 1 0 0 ) #(0 1 1 1 0 0 ) ).
	self assert: actual equals: expected.

	actual := MLRandIndex new buildMatrix: partitionB.	
	expected := #(#(0 0 0 1 1 1 ) #(0 0 0 1 1 1 ) #(0 0 0 1 1 1 ) #(1 1 1 0 0 0 ) #(1 1 1 0 0 0 ) #(1 1 1 0 0 0 ) ).
	self assert: actual equals: expected.
	

]

{ #category : #test }
MLRandIndexTest >> testScoreWith [

	| score |
	
	score := (MLRandIndex score: partitionA with: partitionB).
	self 
		assert: (score truncateTo: 0.01)
		equals: 0.46.
]
