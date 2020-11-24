"
The **Jaccard Index**, also known as the **Jaccard similarity coefficient**, is a `Float` value between 0.0 and 1.0. It was originally designed as a general similarity measure between two non-empty sets, but it can be used as an evaluation measure of the degree of overlap between vectors. Intuitively, it can be thought as the size of the intersection divided by the size of the union. As usual, the closer to 1.0, the more similar the two datasets, the closer to 0.0 the more dissimilar. This metric should not be confused with the **Jaccard distance**, which provides a ""dissimilarity"" measure.

This class implements the **set-based version** of the Jaccard index, which is easier to read and interpret when you have flat clustering results, i.e. without assignments information.

## Definition

The mathematical definition of the index is: 

&
\[ J_\mathcal{W}(\mathbf{x}, \mathbf{y}) = \frac{\sum_i \min(x_i, y_i)}{\sum_i \max(x_i, y_i)} \]
&

The definition for the set-based version is:

&
\[ J(A,B) = {{|A \cap B|}\over{|A \cup B|}} = {{|A \cap B|}\over{|A| + |B| - |A \cap B|}} \]	
&

## Public API and Key Messages

```language=Pharo&caption=Usage on two different clustering results&label=code1
MLJaccardIndex
	clusterA: #(0 0 0 0)
	clusterB: #(0 1 2 3)
```

"
Class {
	#name : #MLJaccardIndex,
	#superclass : #MLClusteringMetric,
	#category : #'MLMetrics-ClusterMeasure-RandIndex'
}

{ #category : #accessing }
MLJaccardIndex class >> names [
	" See superimplementor's comment "
	
	^ #(
		'Jaccard Index'
		'Intersection over union'
		'Tanimoto coefficient'
		'IOU'
		)
]

{ #category : #accessing }
MLJaccardIndex >> computeMetric [
	" Answer a <Float> with the Jaccard index between the receiver's cluster assignments in clusterA and clusterB "

	^ (self clusterA isEmpty and: [ self clusterB isEmpty ])
		ifTrue: [ 1 ]
		ifFalse: [ 
			((self clusterA intersection: self clusterB) size / 
				(self clusterA union: self clusterB) size) asFloat 
					round: self numberOfWishedDecimal ]

]
