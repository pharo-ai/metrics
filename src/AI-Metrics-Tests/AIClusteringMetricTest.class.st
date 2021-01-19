"
A MLClusteringMetricTest is a test class for testing the behavior of MLClusteringMetric
"
Class {
	#name : #AIClusteringMetricTest,
	#superclass : #TestCase,
	#category : #'AI-Metrics-Tests-ClusterMeasure-Core'
}

{ #category : #tests }
AIClusteringMetricTest >> testAvailableMetricNames [

	| metrics |
	metrics := AIClusteringMetric availableMetricNames.
	self deny: metrics isEmpty.
	self assert: (metrics allSatisfy: [:each | each notEmpty]).
	self assert: (metrics flattened allSatisfy: [ :metric | metric isKindOf: String ])
]
