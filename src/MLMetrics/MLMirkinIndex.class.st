"
The ''Mirkin Index'' is another external validity index which is a specialization of the unadjusted Rand Index. 

## Definition

## Public API and Key Messages

```language=Pharo&caption=Mirkin usage&label=code1
MLMirkinIndex
	clusterA: #(0 0 0 0)
	clusterB: #(0 1 2 3)
```
"
Class {
	#name : #MLMirkinIndex,
	#superclass : #MLRandIndex,
	#category : #'MLMetrics-ClusterMeasure-RandIndex'
}

{ #category : #accessing }
MLMirkinIndex class >> names [
	" See superimplementor's comment "
	
	^ #(
		'Mirkin Index'
		'Equivalence Mismatch Distance'
		)
]

{ #category : #accessing }
MLMirkinIndex >> computeMetric [
	"Answer a <Float> representing the Mirkin index between the receiver's cluster assignments in clusterA and clusterB"
	
	| ctab tp tp_plus_fp tp_plus_fn fp fn |

	ctab := self clusterA asPMVector crossTabulateWith: self clusterB asPMVector.
	tp := (ctab take: 2) sum sum.
	tp_plus_fp := (ctab sum take: 2) sum.
	tp_plus_fn := (ctab sumColumns take: 2) sum.
	fp := tp_plus_fp - tp.
	fn := tp_plus_fn - tp.
	^ (2 * (fp + fn)) asFloat round: self numberOfWishedDecimal


]
