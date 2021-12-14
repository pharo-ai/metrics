"
The **Adjusted Rand Index** is an enhacement of the Rand Index implemented in `MLRandIndex`. This class can be used to obtain a `Float` between -1.0 and 1.0, where positive values mean that pairs in the known clusters and predicted clusters are similar, being 1.0 the perfect agreement and 0.0 a chance agreement, and negative values mean that pairs in the known clusters and predicted clusters are highly different. In short, the higher the value of ARI, the better the predictive ability of the evaluated clustering method. The ""adjusted"" part comes from the fact that a random result is scored as 0.

This class contains an implementation of the **Hubert and Arabie** or _HA_ variant of the index. You could use the following standard interpretation of resulting index:

- An index greater than 0.90 are considered excellent recovery
- An index greater than 0.80 are considered good recovery 
- An index greater than 0.65 are considered moderate recovery 
- An index less than 0.65 are considered poor recovery

## Definition

The mathematical definition of the index is: 

&
ARI_h_a = \dfrac{\sum_{i,j}{n_{ij} \choose 2} - \sum_{i}{n_{i.} \choose 2}\sum_{j}{n_{.j} \choose 2} / {n \choose 2}}{\frac{1}{2}[\sum_{i}{n_{i.} \choose 2}+\sum_{j}{n_{.j} \choose 2}]-\sum_{i}{n_{i.} \choose 2}\sum_{j}{n_{.j} \choose 2} / {n \choose 2}}
&

## Public API and Key Messages

The ARI also may be instantiated with two Collections using a class method. By convention, the first collection (**clusterA**) are the ""ground truth labels"" and the second collection (**clusterB**) contains the labels from your clustering algorithm results. i.e. the predictions.

```language=Pharo&caption=Usage on two exact clustering results&label=code1
MLAdjustedRandIndex 
    clusterA: #(1 1 2 3 3) 
    clusterB: #(1 1 2 3 3).
```

"
Class {
	#name : #AIAdjustedRandIndex,
	#superclass : #AIRandIndex,
	#category : #'AI-Metrics-ClusterMeasure-RandIndex'
}

{ #category : #accessing }
AIAdjustedRandIndex class >> names [
	" See superimplementor's comment "

	^ #(
		'Adjusted Rand Index'
		'HA'
		'ARI'
		)
]

{ #category : #accessing }
AIAdjustedRandIndex >> computeMetric [
	" Answer a <Float> with the adjusted Rand index between cluster assignments in c1 and cluster assignments in c2 "
	
	| ctab sumnij sumai sumbj nTwo expectedIndex maximumIndex |
	ctab := self clusterA asPMVector crossTabulateWith: self clusterB asPMVector.
	sumnij := (ctab take: 2) sum sum.
	sumai := (ctab sum take: 2) sum.
	sumbj := (ctab sumColumns take: 2) sum.
	nTwo := self clusterA size numberOfCombinationsTaken: 2.
	expectedIndex := (sumai * sumbj) / nTwo.
	maximumIndex := 0.5 * (sumai + sumbj).
	^ (expectedIndex = maximumIndex and: [ sumnij ~= 0 ])
		ifTrue: [ 1 ]
		ifFalse: [ ((sumnij - expectedIndex) / (maximumIndex - expectedIndex)) round: self numberOfWishedDecimal ].

]
