"
A MLAdjustedRandIndexTest is a test class for testing the behavior of MLAdjustedRandIndex
"
Class {
	#name : #MLAdjustedRandIndexTest,
	#superclass : #MLMetricTest,
	#category : #'MLMetrics-Tests-ClusterMeasure-RandIndex'
}

{ #category : #running }
MLAdjustedRandIndexTest >> setUp [ 

	super setUp.
	partitionA := #(1 2 3 3 2 1 1 3 3 1 2 2).
	partitionB := #(3 2 3 2 2 1 1 2 3 1 3 1).
]

{ #category : #test }
MLAdjustedRandIndexTest >> testBuildContingencyMatrixAnd [

	| ctab expected |

	expected := PMMatrix rows: #((3 1 0) (0 2 2) (1 1 2)).
	ctab := MLAdjustedRandIndex new buildContingencyMatrix: partitionA and: partitionB.
	self assert: ctab equals: expected.
]

{ #category : #test }
MLAdjustedRandIndexTest >> testScoreWith [

	| ari partitionA partitionB |
	
	partitionA := #(1 2 3 3 2 1 1 3 3 1 2 2).
	partitionB := #(3 2 3 2 2 1 1 2 3 1 3 1).
	ari := (MLAdjustedRandIndex 
			score: partitionA
			with: partitionB).
	self assert: (ari truncateTo: 0.0001) equals: 0.0833
]
