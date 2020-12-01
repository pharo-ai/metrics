"
A MLMirkinIndexTest is a test class for testing the behavior of MLMirkinIndex
"
Class {
	#name : #MLMirkinIndexTest,
	#superclass : #MLMetricTest,
	#category : #'MLMetrics-Tests-ClusterMeasure-RandIndex'
}

{ #category : #testing }
MLMirkinIndexTest >> testComputeMetric [

	| instance |
	
	instance := MLMirkinIndex new 
		clusterA: #(0 1 2 5 6 8 9);
		clusterB: #(0 2 3 4 5 7 9).
	self assert: instance computeMetric equals: 0.0.
	
	instance 
		clusterA: #(0 1 2 5 6 8 9);
		clusterB: #(0 1 2 5 6 8 9).
	self assert: instance computeMetric equals: 0.0.

	instance clusterA: #(0 0 0 0); clusterB: #(0 0 0 0).
	self assert: instance computeMetric equals: 0.0.
		
	instance clusterA: #(0 0 0 0); clusterB: #(0 1 2 3).
	self assert: instance computeMetric equals: 12.
	
	instance clusterA: #(0 0 0 1 1); clusterB: #(0 0 1 1 1).
	self assert: instance computeMetric equals: 8
]
