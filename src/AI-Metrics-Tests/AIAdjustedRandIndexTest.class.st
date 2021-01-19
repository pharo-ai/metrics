"
A MLAdjustedRandIndexTest is a test class for testing the behavior of MLAdjustedRandIndex
"
Class {
	#name : #AIAdjustedRandIndexTest,
	#superclass : #AIMetricTest,
	#category : #'AI-Metrics-Tests-ClusterMeasure-RandIndex'
}

{ #category : #running }
AIAdjustedRandIndexTest >> setUp [ 

	super setUp.
	partitionA := #(1 2 3 3 2 1 1 3 3 1 2 2).
	partitionB := #(3 2 3 2 2 1 1 2 3 1 3 1).
]

{ #category : #testing }
AIAdjustedRandIndexTest >> testClusterAClusterBComputesIndex [

	| index |
	
	index := (AIAdjustedRandIndex 
			clusterA: #(1 2 3 3 2 1 1 3 3 1 2 2)
			clusterB: #(3 2 3 2 2 1 1 2 3 1 3 1)).
	self assert: index equals: 0.083
]

{ #category : #testing }
AIAdjustedRandIndexTest >> testComputeMetric [

	| instance |
	instance := AIAdjustedRandIndex new clusterA: partitionA; clusterB: partitionB.
	
	self assert: instance computeMetric equals: 0.083.
	
	instance clusterA: #(0 1 0 1); clusterB: #(0 0 1 1).
	self assert: instance computeMetric equals: 0.5 negated.
	
	instance clusterA: #(0 0 0 0); clusterB: #(0 0 0 0).
	self assert: instance computeMetric equals: 1.0.
		
	instance clusterA: #(0 0 0 0); clusterB: #(0 1 2 3).
	self assert: instance computeMetric equals: 0
]
