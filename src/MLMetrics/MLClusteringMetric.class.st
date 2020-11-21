"
Abstract class grouping common behavior for both internal and external clustering evaluation metrics. It also can be used to query different features of metric algorithms (here represented by subclasses).

External evaluation indices are used when true class labels are known. Examples are: ==MLMirkinIndex==, ==MLAdjustedRandIndex==, ==MLRandIndex==.
Internal evaluation indices when true class labels are unknown. Example are: ==MLSilhouetteIndex== and ==MLCalinskiHarabaszIndex==.

## Public API and Key Messages

- clusterA: 									By convention, it represents the collection where the curated or annotated labels in your trained collection.
- clusterB: 									By convention, it represent the collection where the predictions labels are contained.
- numberOfWishedDecimal: 				Set the number of wished decimals you want to get in the result.
- (class side) availableMetricNames 	Answer a <Collection> of <String> with synonyms for each of the index subclasses.

## Internal Representation and Key Implementation Points.

Instance Variables
	clusterA:		<Collection>
	clusterB:		<Collection>
	round:			<Integer>



"
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

{ #category : #accessing }
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
