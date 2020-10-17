"
The Rand index in data clustering, is a measure of the similarity between two data clusterings.


"
Class {
	#name : #MLRandIndex,
	#superclass : #Object,
	#instVars : [
		'clusterA',
		'clusterB',
		'round'
	],
	#category : #'MLMetrics-ClusterMeasure-RandIndex'
}

{ #category : #'instance creation' }
MLRandIndex class >> clusterA: firstCluster clusterB: secondCluster [

	^ self new
		initializeWithClusterA: firstCluster clusterB: secondCluster;
		computeMetric

	
]

{ #category : #'instance creation' }
MLRandIndex class >> names [
	" Answer a <Collection> of receiver's names in English language "
	
	self subclassResponsibility
]

{ #category : #accessing }
MLRandIndex >> buildMatrix: aCollection [
	" Answer a <Collection> of points that are in the same vs different groups.
	Different groups are 1, same groups are 0 "

	^ aCollection collect: [ :index | 
		(index - aCollection) abs 
			collect: [ :each | each min: 1 ] ]
]

{ #category : #accessing }
MLRandIndex >> clusterA [
	^ clusterA
]

{ #category : #accessing }
MLRandIndex >> clusterA: anObject [
	clusterA := anObject
]

{ #category : #accessing }
MLRandIndex >> clusterB [
	^ clusterB
]

{ #category : #accessing }
MLRandIndex >> clusterB: anObject [
	clusterB := anObject
]

{ #category : #accessing }
MLRandIndex >> computeMetric [
	" Answer a <Float> with the rand index between cluster assignments in c1 and cluster assignments in c2 "
	
	| x y sg binCoeff |
	x := self buildMatrix: self clusterA.
	y := self buildMatrix: self clusterB.
	sg := (x - y) abs sumMatrix / 2.
	binCoeff := x size take: 2.
	^ ((1 - (sg / binCoeff)) asFloat) round: self numberOfWishedDecimal

]

{ #category : #accessing }
MLRandIndex >> defaultNumberOfWishedDecimal [

	^ 3
]

{ #category : #accessing }
MLRandIndex >> initializeWithClusterA: firstCluster clusterB: secondCluster [
	" Private - Initialize the receiver "

	self assert: [ firstCluster size = secondCluster size ].
	self assert: [ firstCluster noneSatisfy: #isNil ].
	self assert: [ secondCluster noneSatisfy: #isNil ].
	self clusterA: firstCluster.
	self clusterB: secondCluster.
]

{ #category : #accessing }
MLRandIndex >> numberOfWishedDecimal [
	" Answer the <Number> of the wished decimal in the result "

	^ round
		ifNil: [ round := self defaultNumberOfWishedDecimal ]
]

{ #category : #accessing }
MLRandIndex >> numberOfWishedDecimal: anInteger [

	round := anInteger
]
