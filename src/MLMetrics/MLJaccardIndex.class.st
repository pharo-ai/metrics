Class {
	#name : #MLJaccardIndex,
	#superclass : #MLRandIndex,
	#category : #'MLMetrics-ClusterMeasure-RandIndex'
}

{ #category : #'instance creation' }
MLJaccardIndex class >> names [
	" See superimplementor's comment "
	
	^ #(
		'Jaccard Index'
		'Intersection over union'
		)
]

{ #category : #accessing }
MLJaccardIndex >> computeMetric [
	" See superimplementor's comment "

	^ (self clusterA isEmpty and: [ self clusterB isEmpty ])
		ifTrue: [ 1 ]
		ifFalse: [ 
			((self clusterA intersection: self clusterB) size / 
				(self clusterA union: self clusterB) size) asFloat 
					round: self numberOfWishedDecimal ]

]
