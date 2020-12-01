"
The **Rand index** is a `Float` between 0.0 and 1.0 representing the number of agreements between two data clusterings, presumably from two different (clustering) methods on the same data set. You may use this class to compare how two partitions agreed. A value of 1.0 means that clusterings between two methods were the same, and these partitions agree perfectly, and 0.0 means that the two data clusterings disagree on any pair of points.

Subclasses may implement enhaced or alternative indexes of this external evaluation method.

## Definition

The mathematical definition of the index is: 
&
R(C_1,C_2) = \frac{a+b}{a+b+c+d} = \frac{a+b}{{n \choose 2 }}
&

where:

- $a$ is the number of pairs of elements that are in the same subset in both sets $C_1$ and $C_2$.
- $b$ is the number of pairs of elements that are in different subsets in both sets $C_1$ and $C_2$.
- $c$ is the number of pairs of elements that are in the same subset in $C_1$ but in different ones in $C_2$.
- $d$ is the number of pairs of elements that are in different subsets in $C_1$ but in the same in $C_2$.
- ${a + b}$ the number of correct similar pairs plus the number of correct dissimilar pairs.
- ${n \\choose 2}$ is the number of total possible pairs (without ordering).

## Public API and Key Messages

The Rand Index could be instantiated with two Collections directly from a class method. By convention, the first collection (clusterA) are the ""ground truth labels"" and the second collection (clusterB) contains the labels from your clustering algorithm results. i.e. the predictions.

```language=Pharo&caption=Usage on two exact clustering results&label=code1
MLRandIndex 
	clusterA: #(1 1 2 3 3) 
	clusterB: #(1 1 2 3 3).
```

Another form of usage is instantiating the metric and sending the #computeMetric message.

```language=Pharo&caption=Usage on two exact clustering results&label=code1
MLRandIndex new
	clusterA: #(1 1 2 3 3);
	clusterB: #(1 1 2 2 3);
	computeMetric.
```

## Notes

Subclasses inherits a few helper methods and a very basic protocol. Essentially, the #computeMetric method should be implemented.



"
Class {
	#name : #MLRandIndex,
	#superclass : #MLClusteringMetric,
	#category : #'MLMetrics-ClusterMeasure-RandIndex'
}

{ #category : #'instance creation' }
MLRandIndex class >> clusterA: firstCluster clusterB: secondCluster [

	^ self new
		initializeWithClusterA: firstCluster clusterB: secondCluster;
		computeMetric

	
]

{ #category : #accessing }
MLRandIndex class >> names [
	" See superimplementor's comment "
	
	^ #(
		'Rand Index'
		'RI'
		'General Rand Index'
		'Unadjusted Rand Index'
		)
]

{ #category : #accessing }
MLRandIndex >> buildMatrix: aCollection [
	"Answer a <Collection> of points that are in the same vs different groups.
	Different groups are 1, same groups are 0"

	^ aCollection collect: [ :index | 
		(index - aCollection) abs 
			collect: [ :each | each min: 1 ] ]
]

{ #category : #accessing }
MLRandIndex >> computeMetric [
	"Answer a <Float> with the Rand index between cluster assignments in c1 and cluster assignments in c2"
	
	| x y sg binCoeff |
	x := self buildMatrix: self clusterA.
	y := self buildMatrix: self clusterB.
	sg := (x - y) abs sumMatrix / 2.
	binCoeff := x size take: 2.
	^ ((1 - (sg / binCoeff)) asFloat) round: self numberOfWishedDecimal

]

{ #category : #initialization }
MLRandIndex >> initializeWithClusterA: firstCluster clusterB: secondCluster [
	"Private - Initialize the receiver"

	super initializeWithClusterA: firstCluster clusterB: secondCluster.
	self assert: [ firstCluster size = secondCluster size ].

]
