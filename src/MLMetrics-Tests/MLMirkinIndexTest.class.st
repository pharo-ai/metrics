"
A MLMirkinIndexTest is a test class for testing the behavior of MLMirkinIndex
"
Class {
	#name : #MLMirkinIndexTest,
	#superclass : #MLMetricTest,
	#category : #'MLMetrics-Tests-ClusterMeasure-RandIndex'
}

{ #category : #running }
MLMirkinIndexTest >> setUp [ 

	super setUp.
	partitionA := #(0 1 2 5 6 8 9).
	partitionB := #(0 2 3 4 5 7 9).
]

{ #category : #testing }
MLMirkinIndexTest >> testComputeMetric [

	self assert: false
]
