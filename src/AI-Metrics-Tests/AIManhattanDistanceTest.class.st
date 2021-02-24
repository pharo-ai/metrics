Class {
	#name : #AIManhattanDistanceTest,
	#superclass : #TestCase,
	#category : #'AI-Metrics-Tests-DistanceMeasure-Core'
}

{ #category : #tests }
AIManhattanDistanceTest >> testManhattanDistance [
	| result actual |
	
	result := #(10 20 10) manhattanDistance: #(10 20 20).
	actual := 10.
	self assert: (result closeTo: actual). 
]
