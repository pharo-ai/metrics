Class {
	#name : #MLAdjustedRandIndex,
	#superclass : #MLRandIndex,
	#category : #'MLMetrics-ClusterMeasure-RandIndex'
}

{ #category : #'instance creation' }
MLAdjustedRandIndex class >> names [
	" See superimplementor's comment "

	^ #(
		'Adjusted Rand Index'
		'HA'
		'ARI'
		)
]

{ #category : #accessing }
MLAdjustedRandIndex >> computeMetric [
	" Answer a <Float> with the adjusted rand index between cluster assignments in c1 and cluster assignments in c2 "
	
	| ctab sumnij sumai sumbj nTwo expectedIndex maximumIndex |
	ctab := self clusterA asPMVector crossTabulateWith: self clusterB asPMVector.
	sumnij := (ctab take: 2) sum sum.
	sumai := (ctab sum take: 2) sum.
	sumbj := (ctab sumColumns take: 2) sum.
	nTwo := self clusterA size take: 2.
	expectedIndex := (sumai * sumbj) / nTwo.
	maximumIndex := 0.5 * (sumai + sumbj).
	^ (expectedIndex = maximumIndex and: [ sumnij ~= 0 ])
		ifTrue: [ 1 ]
		ifFalse: [ ((sumnij - expectedIndex) / (maximumIndex - expectedIndex)) round: self numberOfWishedDecimal ].

]
