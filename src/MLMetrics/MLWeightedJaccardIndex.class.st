"
==MLWeightedJaccardIndex== implements the vector-based version of the Jaccard index, which is easier to read and interpret when you have assignment information for each partition in your clustering results.

## Public API and Key Messages

```language=Pharo&caption=Usage on two different clustering results&label=code1
MLWeightedJaccardIndex
	clusterA: #(0 0 0 0)
	clusterB: #(0 1 2 3)
```

"
Class {
	#name : #MLWeightedJaccardIndex,
	#superclass : #MLRandIndex,
	#category : #'MLMetrics-ClusterMeasure-RandIndex'
}

{ #category : #accessing }
MLWeightedJaccardIndex >> computeMetric [
	" Answer a <Float> with the Fowlkes-Mallos index between the receiver's cluster assignments in clusterA and clusterB "
	
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
