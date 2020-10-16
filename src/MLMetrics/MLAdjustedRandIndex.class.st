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
	
	| ctab sumnij sumai sumbj nTwo |
	ctab := self clusterA asPMVector crossTabulateWith: self clusterB asPMVector.
	sumnij := (ctab take: 2) sum sum.
	sumai := (ctab sum take: 2) sum.
	sumbj := (ctab sumColumns take: 2) sum.
	nTwo := self clusterA size take: 2.
	^ ((sumnij - ((sumai * sumbj) / nTwo)) / (0.5 * (sumai + sumbj) - ((sumai * sumbj) / nTwo))).

]
