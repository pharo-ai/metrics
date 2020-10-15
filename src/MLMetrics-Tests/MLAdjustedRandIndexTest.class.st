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
MLAdjustedRandIndexTest >> testClusterAClusterB [

	| ari |
	
	partitionA := #(1 2 3 3 2 1 1 3 3 1 2 2).
	partitionB := #(3 2 3 2 2 1 1 2 3 1 3 1).
	ari := (MLAdjustedRandIndex 
			clusterA: partitionA
			clusterB: partitionB).
	self assert: (ari truncateTo: 0.0001) equals: 0.0833
]

{ #category : #test }
MLAdjustedRandIndexTest >> testComputeMetric [

	| ari |
	
	partitionA := #(1 2 3 3 2 1 1 3 3 1 2 2).
	partitionB := #(3 2 3 2 2 1 1 2 3 1 3 1).
	ari := (MLAdjustedRandIndex new
			clusterA: partitionA;
			clusterB: partitionB).
	self assert: (ari computeMetric truncateTo: 0.0001) equals: 0.0833.
	
	partitionA := #(0 1 0 1).
	partitionB := #(0 0 1 1).
	ari := (MLAdjustedRandIndex new
			clusterA: partitionA;
			clusterB: partitionB).
	self assert: (ari computeMetric truncateTo: 0.0001) equals: 0.4999 negated.
]
