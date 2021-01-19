"
A MLFowlkesMallowsIndexTest is a test class for testing the behavior of MLFowlkesMallowsIndex
"
Class {
	#name : #AIFowlkesMallowsIndexTest,
	#superclass : #AIMetricTest,
	#category : #'AI-Metrics-Tests-ClusterMeasure-RandIndex'
}

{ #category : #running }
AIFowlkesMallowsIndexTest >> setUp [ 

	super setUp.
	partitionA := #(2 1 2 0).
	partitionB := #(2 1 2 2).
]

{ #category : #testing }
AIFowlkesMallowsIndexTest >> testComputeMetric [

	| instance |
	
	instance := AIFowlkesMallowsIndex new
		clusterA: partitionA;
		clusterB: partitionB.
	self assert: instance computeMetric equals: 0.577
]
