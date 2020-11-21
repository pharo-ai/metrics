"
A MLClusteringMetricTest is a test class for testing the behavior of MLClusteringMetric
"
Class {
	#name : #MLClusteringMetricTest,
	#superclass : #TestCase,
	#category : #'MLMetrics-Tests-ClusterMeasure-Core'
}

{ #category : #tests }
MLClusteringMetricTest >> testAvailableMetricNames [

	| metrics |
	
	metrics := MLClusteringMetric availableMetricNames.
	self deny: metrics isEmpty.
	self assert: (metrics allSatisfy: #notEmpty).
	self assert: (metrics flattened allSatisfy: [ : metric | metric isKindOf: String ])
]
