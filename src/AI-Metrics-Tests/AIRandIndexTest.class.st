Class {
	#name : #AIRandIndexTest,
	#superclass : #AIMetricTest,
	#category : #'AI-Metrics-Tests-ClusterMeasure-RandIndex'
}

{ #category : #running }
AIRandIndexTest >> setUp [

	super setUp.
	partitionA := #( 0 1 1 1 0 0 ).
	partitionB := #( 1 1 1 0 0 0).

]

{ #category : #testing }
AIRandIndexTest >> testBuildMatrix [

	| actual expected |

	actual := AIRandIndex new buildMatrix: partitionA.
	expected :=  #(#(0 1 1 1 0 0 ) #(1 0 0 0 1 1 ) #(1 0 0 0 1 1 ) #(1 0 0 0 1 1 ) #(0 1 1 1 0 0 ) #(0 1 1 1 0 0 ) ) asPMVector.
	self assert: actual equals: expected.

	actual := AIRandIndex new buildMatrix: partitionB.	
	expected := #(#(0 0 0 1 1 1 ) #(0 0 0 1 1 1 ) #(0 0 0 1 1 1 ) #(1 1 1 0 0 0 ) #(1 1 1 0 0 0 ) #(1 1 1 0 0 0 ) ) asPMVector.
	self assert: actual equals: expected.
	

]

{ #category : #testing }
AIRandIndexTest >> testClusterA [

	| instance |
	instance := AIRandIndex new clusterA: partitionA.
	self assert: instance clusterA equals: #( 0 1 1 1 0 0 ).
	instance clusterA: Array empty.
	self assert: instance clusterA equals: Array empty.

]

{ #category : #testing }
AIRandIndexTest >> testClusterAClusterB [

	| score |
	score := (AIRandIndex clusterA: partitionA clusterB: partitionB).
	self 
		assert: (score truncateTo: 0.01)
		equals: 0.46.
]

{ #category : #testing }
AIRandIndexTest >> testClusterB [

	| instance |
	instance := AIRandIndex new clusterB: partitionB.
	self assert: instance clusterB equals: #( 1 1 1 0 0 0).
	instance clusterB: Array empty.
	self assert: instance clusterB equals: Array empty.

]

{ #category : #testing }
AIRandIndexTest >> testComputeMetric [

	| instance |
	
	instance := (AIRandIndex new clusterA: partitionA; clusterB: partitionB).
	self 
		assert: instance computeMetric
		equals: 0.467.
		
	instance clusterA: #(0 0 0 0); clusterB: #(0 0 0 0).
	self 
		assert: instance computeMetric
		equals: 1.0.
		
	instance clusterA: #(0 0 0 0); clusterB: #(0 1 2 3).
	self 
		assert: instance computeMetric
		equals: 0
]

{ #category : #testing }
AIRandIndexTest >> testDefaultNumberOfWishedDecimal [

	self assert: (AIRandIndex new defaultNumberOfWishedDecimal isKindOf: Number)
]

{ #category : #testing }
AIRandIndexTest >> testNumberOfWishedDecimal [

	| instance |
	
	instance := AIRandIndex new.
	self assert: (instance numberOfWishedDecimal isKindOf: Number).
	instance numberOfWishedDecimal: 5.
	self assert: instance numberOfWishedDecimal equals: 5.
	
]
