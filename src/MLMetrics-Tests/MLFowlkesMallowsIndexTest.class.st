"
A MLFowlkesMallowsIndexTest is a test class for testing the behavior of MLFowlkesMallowsIndex
"
Class {
	#name : #MLFowlkesMallowsIndexTest,
	#superclass : #MLMetricTest,
	#category : #'MLMetrics-Tests-ClusterMeasure-RandIndex'
}

{ #category : #running }
MLFowlkesMallowsIndexTest >> setUp [ 

	super setUp.
	partitionA := #(2 1 2 0).
	partitionB := #(2 1 2 2).
]

{ #category : #testing }
MLFowlkesMallowsIndexTest >> testComputeMetric [

	| instance |
	
	instance := MLFowlkesMallowsIndex new
		clusterA: partitionA;
		clusterB: partitionB.
	self assert: instance computeMetric equals: 0.577
]
