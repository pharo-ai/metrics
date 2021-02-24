Class {
	#name : #AICosineSimilarityTest,
	#superclass : #TestCase,
	#category : #'AI-Metrics-Tests-DistanceMeasure-Core'
}

{ #category : #tests }
AICosineSimilarityTest >> testCosineSimilarity [
	| result actual |
	
	result := #(3 45 7 2) cosineSimilarity: #(2 54 13 15).
	actual := 0.9722.
	self assert: (result closeTo: actual). 
]
