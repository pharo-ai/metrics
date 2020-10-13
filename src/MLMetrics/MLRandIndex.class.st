"
The Rand index in data clustering, is a measure of the similarity between two data clusterings.


"
Class {
	#name : #MLRandIndex,
	#superclass : #Object,
	#category : #'MLMetrics-ClusterMeasure-RandIndex'
}

{ #category : #'as yet unclassified' }
MLRandIndex class >> score: firstCluster with: secondCluster [

	^ self new
		score: firstCluster 
		with: secondCluster
	
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
MLRandIndex >> score: c1 with: c2 [
	" Answer a <Float> with the rand index between cluster assignments in c1 and cluster assignments in c2 "
	
	| x y sg binCoeff |
	x := self buildMatrix: c1.
	y := self buildMatrix: c2.
	sg := (x - y) abs sumMatrix / 2.
	binCoeff := x size take: 2.
	^ (1 - (sg / binCoeff)) asFloat

]
