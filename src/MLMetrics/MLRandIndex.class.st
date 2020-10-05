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

	^ aCollection collect: [ :index | 
		(index - aCollection) abs 
			collect: [ :each | each min: 1 ] ]
]

{ #category : #accessing }
MLRandIndex >> score: firstClusterAssignments with: secondClusterAssignments [
	" Answer a <Float> with the rand index between firstClusterAssignments and secondClusterAssignments "
	
	| x y sg binCoeff |
	x := self buildMatrix: firstClusterAssignments.
	y := self buildMatrix: secondClusterAssignments.
	sg := (x - y) abs sum sum / 2.
	binCoeff := x size take: 2.
	^ (1 - (sg / binCoeff)) asFloat

]
