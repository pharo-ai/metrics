Class {
	#name : #AIEuclideanDistanceTest,
	#superclass : #TestCase,
	#category : #'AI-Metrics-Tests-DistanceMeasure-Core'
}

{ #category : #tests }
AIEuclideanDistanceTest >> testEuclideanDistance [
	| result actual |
	
	result := #(0 3 4 5) euclideanDistance: #(7 6 3 -1).
	actual := 9.74679434481.
	self assert: (result closeTo: actual). 
]
