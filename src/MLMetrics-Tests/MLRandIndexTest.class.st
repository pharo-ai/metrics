Class {
	#name : #MLRandIndexTest,
	#superclass : #MLMetricTest,
	#category : #'MLMetrics-Tests-ClusterMeasure-RandIndex'
}

{ #category : #running }
MLRandIndexTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	super setUp.
	partitionA := #( 0 1 1 1 0 0 ).
	partitionB := #( 1 1 1 0 0 0).

]

{ #category : #test }
MLRandIndexTest >> testBuildMatrix [

	| actual expected |

	actual := MLRandIndex new buildMatrix: partitionA.
	expected :=  #(#(0 1 1 1 0 0 ) #(1 0 0 0 1 1 ) #(1 0 0 0 1 1 ) #(1 0 0 0 1 1 ) #(0 1 1 1 0 0 ) #(0 1 1 1 0 0 ) ).
	self assert: actual equals: expected.

	actual := MLRandIndex new buildMatrix: partitionB.	
	expected := #(#(0 0 0 1 1 1 ) #(0 0 0 1 1 1 ) #(0 0 0 1 1 1 ) #(1 1 1 0 0 0 ) #(1 1 1 0 0 0 ) #(1 1 1 0 0 0 ) ).
	self assert: actual equals: expected.
	

]

{ #category : #test }
MLRandIndexTest >> testClusterA [

	| instance |
	instance := MLRandIndex new clusterA: partitionA.
	self assert: instance clusterA equals: #( 0 1 1 1 0 0 ).
	instance clusterA: Array empty.
	self assert: instance clusterA equals: Array empty.

]

{ #category : #test }
MLRandIndexTest >> testClusterAClusterB [

	| score |
	
	score := (MLRandIndex clusterA: partitionA clusterB: partitionB).
	self 
		assert: (score truncateTo: 0.01)
		equals: 0.46.
]

{ #category : #test }
MLRandIndexTest >> testClusterB [

	| instance |
	instance := MLRandIndex new clusterB: partitionB.
	self assert: instance clusterB equals: #( 1 1 1 0 0 0).
	instance clusterB: Array empty.
	self assert: instance clusterB equals: Array empty.

]

{ #category : #test }
MLRandIndexTest >> testComputeMetric [

	| instance |
	
	instance := (MLRandIndex new clusterA: partitionA; clusterB: partitionB).
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

{ #category : #test }
MLRandIndexTest >> testDefaultNumberOfWishedDecimal [

	self assert: (MLRandIndex new defaultNumberOfWishedDecimal isKindOf: Number)
]

{ #category : #test }
MLRandIndexTest >> testNumberOfWishedDecimal [

	| instance |
	
	instance := MLRandIndex new.
	self assert: (instance numberOfWishedDecimal isKindOf: Number).
	instance numberOfWishedDecimal: 5.
	self assert: instance numberOfWishedDecimal equals: 5.
	
]
