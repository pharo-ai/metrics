Class {
	#name : #MLMetricTest,
	#superclass : #TestCase,
	#instVars : [
		'partitionA',
		'partitionB'
	],
	#category : #'MLMetrics-Tests-ClusterMeasure-RandIndex'
}

{ #category : #testing }
MLMetricTest >> testComputeMetric [
	^ self subclassResponsibility
]
