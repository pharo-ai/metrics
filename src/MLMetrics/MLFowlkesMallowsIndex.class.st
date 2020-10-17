Class {
	#name : #MLFowlkesMallowsIndex,
	#superclass : #MLRandIndex,
	#category : #'MLMetrics-ClusterMeasure-RandIndex'
}

{ #category : #'instance creation' }
MLFowlkesMallowsIndex class >> names [
	" See superimplementor's comment "

	^ #(
		'Fowlkes–Mallows index'
		'FMI'
		'FM'
		'Gmean'
		'G-mean'
		)
]

{ #category : #accessing }
MLFowlkesMallowsIndex >> computeMetric [
	" Answer a <Float> with the Fowlkes-Mallos index between the receiver's cluster assignments in clusterA and clusterB "
	
	| ctab tp tp_plus_fp tp_plus_fn fp fn |

	ctab := self clusterA asPMVector crossTabulateWith: self clusterB asPMVector.
	tp := (ctab take: 2) sum sum.
	tp_plus_fp := (ctab sum take: 2) sum.
	tp_plus_fn := (ctab sumColumns take: 2) sum.
	fp := tp_plus_fp - tp.
	fn := tp_plus_fn - tp.
	^ (((tp/((tp + fp))) * (tp/(tp + fn))) sqrt) round: self numberOfWishedDecimal


]
