"
This class implements the **vector-based version** of the Jaccard index implemented in `MLJaccardIndex`. It is easier to read and interpret when you have assignment information for each partition in your clustering results.

## Public API and Key Messages

```language=Pharo&caption=Usage on two different clustering results&label=code1
MLWeightedJaccardIndex
	clusterA: #(0 0 0 0)
	clusterB: #(0 1 2 3)
```

"
Class {
	#name : #AIWeightedJaccardIndex,
	#superclass : #AIRandIndex,
	#category : #'AI-Metrics-ClusterMeasure-RandIndex'
}

{ #category : #accessing }
AIWeightedJaccardIndex class >> names [
	" See superimplementor's comment "
	
	^ #(
		'Mirkin Index'
		)
]

{ #category : #accessing }
AIWeightedJaccardIndex >> computeMetric [
	"Answer a <Float> with the weighted Jaccard index between the receiver's cluster assignments in clusterA and clusterB"
	
	| minCol features |
	features := self clusterA union: self clusterB.
	minCol := OrderedCollection new: features size.
	features do: [ : elem | 
		(self clusterA includes: elem)
			ifTrue: [ 
				(self clusterB includes: elem)
					ifTrue: [ minCol add: 1 ]
					ifFalse: [ minCol add: 0 ] ]
			ifFalse: [ minCol add: 0 ] ].
	^ (minCol sum / features size) asFloat round: self numberOfWishedDecimal

]
