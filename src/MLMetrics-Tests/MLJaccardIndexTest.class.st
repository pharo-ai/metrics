"
A MLJaccardIndexTest is a test class for testing the behavior of MLJaccardIndex
"
Class {
	#name : #MLJaccardIndexTest,
	#superclass : #MLMetricTest,
	#category : #'MLMetrics-Tests-ClusterMeasure-RandIndex'
}

{ #category : #testing }
MLJaccardIndexTest >> testComputeMetric [

	| instance |
	
	instance := MLJaccardIndex new 
		clusterA: #(0 1 2 5 6 8 9);
		clusterB: #(0 2 3 4 5 7 9).
	self assert: instance computeMetric equals: 0.4.
	
	instance 
		clusterA: #(0 1 2 5 6 8 9);
		clusterB: #(0 1 2 5 6 8 9).
	self assert: instance computeMetric equals: 1.0.

	instance clusterA: #(0 0 0 0); clusterB: #(0 0 0 0).
	self assert: instance computeMetric equals: 1.0.
		
	instance clusterA: #(0 0 0 0); clusterB: #(0 1 2 3).
	self assert: instance computeMetric equals: 0.25
]
