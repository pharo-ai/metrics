Class {
	#name : #MLClusteringMetric,
	#superclass : #Object,
	#instVars : [
		'clusterA',
		'clusterB',
		'round'
	],
	#category : #'MLMetrics-ClusterMeasure-Core'
}

{ #category : #'instance creation' }
MLClusteringMetric class >> availableMetricNames [
	" Answer a <Collection> of receiver's names "
	
	^ self allSubclasses
		reject: #isAbstract 
		thenCollect: #names
]

{ #category : #'instance creation' }
MLClusteringMetric class >> names [
	" Answer a <Collection> of receiver's names in English language "
	
	self subclassResponsibility
]

{ #category : #accessing }
MLClusteringMetric >> clusterA [
	^ clusterA
]

{ #category : #accessing }
MLClusteringMetric >> clusterA: anObject [
	clusterA := anObject
]

{ #category : #accessing }
MLClusteringMetric >> clusterB [
	^ clusterB
]

{ #category : #accessing }
MLClusteringMetric >> clusterB: anObject [
	clusterB := anObject
]

{ #category : #accessing }
MLClusteringMetric >> defaultNumberOfWishedDecimal [

	^ 3
]

{ #category : #initialization }
MLClusteringMetric >> initializeWithClusterA: firstCluster clusterB: secondCluster [
	" Private - Initialize the receiver "

	self assert: [ firstCluster noneSatisfy: #isNil ].
	self assert: [ secondCluster noneSatisfy: #isNil ].
	self clusterA: firstCluster.
	self clusterB: secondCluster.
]

{ #category : #accessing }
MLClusteringMetric >> numberOfWishedDecimal [
	" Answer the <Number> of the wished decimal in the result "

	^ round
		ifNil: [ round := self defaultNumberOfWishedDecimal ]
]

{ #category : #accessing }
MLClusteringMetric >> numberOfWishedDecimal: anInteger [

	round := anInteger
]
