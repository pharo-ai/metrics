"
Abstract class grouping common behavior for both internal and external clustering evaluation metrics. It also can be used to query different features of metric algorithms (here represented by subclasses).

## Public API and Key Messages

Any subclass expects to be instantiated with, at least, the following messages:

- clusterA 									By convention, it represents the collection where the curated or annotated labels in your trained collection.
- clusterB 									By convention, it represent the collection where the predictions labels are contained.

You could also configure:								
	
- numberOfWishedDecimal: 				Set the number of wished decimals you want to get in the result.

## Class side
- availableMetricNames 					Answer a <Collection> of <String> with synonyms for each of the index subclasses.

## Internal Representation and Key Implementation Points.

Instance Variables
	clusterA:		<Collection>
	clusterB:		<Collection>
	round:			<Integer>



"
Class {
	#name : #AIClusteringMetric,
	#superclass : #Object,
	#instVars : [
		'clusterA',
		'clusterB',
		'round'
	],
	#category : #'AI-Metrics-ClusterMeasure-Core'
}

{ #category : #'instance creation' }
AIClusteringMetric class >> availableMetricNames [
	"Answer a <Collection> of receiver's names"
	
	^ self allSubclasses
		reject: [:each | each isAbstract ] 
		thenCollect: [:each | each names ]
]

{ #category : #accessing }
AIClusteringMetric class >> names [
	"Answer a <Collection> of receiver's names in English language"
	
	^ self subclassResponsibility
]

{ #category : #accessing }
AIClusteringMetric >> clusterA [
	^ clusterA
]

{ #category : #accessing }
AIClusteringMetric >> clusterA: anObject [
	clusterA := anObject
]

{ #category : #accessing }
AIClusteringMetric >> clusterB [
	^ clusterB
]

{ #category : #accessing }
AIClusteringMetric >> clusterB: anObject [
	clusterB := anObject
]

{ #category : #accessing }
AIClusteringMetric >> defaultNumberOfWishedDecimal [

	^ 3
]

{ #category : #initialization }
AIClusteringMetric >> initializeWithClusterA: firstCluster clusterB: secondCluster [
	"Private - Initialize the receiver"

	self assert: [ firstCluster noneSatisfy: [:each | each isNil ]].
	self assert: [ secondCluster noneSatisfy: [:each | each isNil ]].
	self clusterA: firstCluster.
	self clusterB: secondCluster.
]

{ #category : #accessing }
AIClusteringMetric >> numberOfWishedDecimal [
	"Answer the <Number> of the wished decimal in the result"

	^ round ifNil: [ round := self defaultNumberOfWishedDecimal ]
]

{ #category : #accessing }
AIClusteringMetric >> numberOfWishedDecimal: anInteger [

	round := anInteger
]
