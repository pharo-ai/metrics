"
The **Fowlkes–Mallows Index**, also known as G-measure, is a `Float` value between 0.0 and 1.0. It is the geometric mean of precision and recall between two clusterings. The index can be used either for comparing both flat and hierarchical clusterings.

## Definition

The definition of the index is: 
&
\text{FMI} = \frac{\text{TP}}{\sqrt{(\text{TP} + \text{FP}) (\text{TP} + \text{FN})}}
&

## Public API and Key Messages

```language=Pharo&caption=Usage on two exact clustering results&label=code1
MLFowlkesMallowsIndex
	clusterA: #(1 1 2 3 3)
	clusterB: #(1 1 2 2 3)
```

"
Class {
	#name : #MLFowlkesMallowsIndex,
	#superclass : #MLRandIndex,
	#category : #'MLMetrics-ClusterMeasure-RandIndex'
}

{ #category : #accessing }
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
	" Answer a <Float> with the Fowlkes-Mallows index between the receiver's cluster assignments in clusterA and clusterB "
	
	| ctab tp tp_plus_fp tp_plus_fn fp fn |

	ctab := self clusterA asPMVector crossTabulateWith: self clusterB asPMVector.
	tp := (ctab take: 2) sum sum.
	tp_plus_fp := (ctab sum take: 2) sum.
	tp_plus_fn := (ctab sumColumns take: 2) sum.
	fp := tp_plus_fp - tp.
	fn := tp_plus_fn - tp.
	^ (((tp/((tp + fp))) * (tp/(tp + fn))) sqrt) asFloat round: self numberOfWishedDecimal


]
