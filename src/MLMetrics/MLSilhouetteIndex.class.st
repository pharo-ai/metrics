"
The **Silhouette Coeffecient** (also known as the **Silhouette Index**) is a `Float` value between -1.0 and 1.0 and represents a measure of how well observations are separated from neighboring clusters. A high value means that the object is well suited to its own cluster, and poorly suited to the adjacent cluster. It is useful when ground-truth labels are not known, which makes this metric an intrinsic evaluation type. Advantages of the Silhouette Index are that can used with any clustering algorithm, and may provide a concise graphical representation of how well each object has been categorized.

## Definition

The definition of the index is: 

&
s = \frac{b - a}{max(a, b)}
&

where:

- $a$ (also called the _cluster cohesion_) represents the average intra-cluster distance, i.e. the distance between a data point and all other points in the same cluster.
- $b$ (also called the _cluster separation_) represents the average inter-cluster distance, i.e. the distance between a data point and all other points in the cluster nearest to the data point's cluster.

## Public API and Key Messages

```language=Pharo&caption=Usage on two different clustering results&label=code1
MLSilhouetteIndex
	clusterA: #(0 0 0 0)
	clusterB: #(0 1 2 3)
```

"
Class {
	#name : #MLSilhouetteIndex,
	#superclass : #MLClusteringMetric,
	#category : #'MLMetrics-ClusterMeasure-RandIndex'
}
