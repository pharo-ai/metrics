Class {
	#name : #MLRandIndexTest,
	#superclass : #MLMetricTest,
	#category : #'MLMetrics-Tests-ClusterMeasure-RandIndex'
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
MLRandIndexTest >> testClusterAClusterB [

	| score |
	
	score := (MLRandIndex clusterA: partitionA clusterB: partitionB).
	self 
		assert: (score truncateTo: 0.01)
		equals: 0.46.
]

{ #category : #test }
MLRandIndexTest >> testComputeMetric [

	| score |
	
	score := (MLRandIndex new clusterA: partitionA; clusterB: partitionB).
	self 
		assert: (score computeMetric truncateTo: 0.01)
		equals: 0.46.
]
