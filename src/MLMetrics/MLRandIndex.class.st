"
The Rand index in data clustering, is a measure of the similarity between two data clusterings.


"
Class {
	#name : #MLRandIndex,
	#superclass : #MLClusteringMetric,
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
	" See superimplementor's comment "
	
	^ #(
		'Rand Index'
		'RI'
		'General Rand Index'
		)
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
MLRandIndex >> computeMetric [
	" Answer a <Float> with the rand index between cluster assignments in c1 and cluster assignments in c2 "
	
	| x y sg binCoeff |
	x := self buildMatrix: self clusterA.
	y := self buildMatrix: self clusterB.
	sg := (x - y) abs sumMatrix / 2.
	binCoeff := x size take: 2.
	^ ((1 - (sg / binCoeff)) asFloat) round: self numberOfWishedDecimal

]

{ #category : #initialization }
MLRandIndex >> initializeWithClusterA: firstCluster clusterB: secondCluster [
	" Private - Initialize the receiver "

	super initializeWithClusterA: firstCluster clusterB: secondCluster.
	self assert: [ firstCluster size = secondCluster size ].

]
