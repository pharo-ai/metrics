Class {
	#name : #MLRandIndexTest,
	#superclass : #TestCase,
	#instVars : [
		'clusterAssignment1',
		'clusterAssignment2'
	],
	#category : #'MLMetrics-Tests'
}

{ #category : #accessing }
MLRandIndexTest >> clusterAssignment1 [
	^ clusterAssignment1
]

{ #category : #accessing }
MLRandIndexTest >> clusterAssignment1: anObject [
	clusterAssignment1 := anObject
]

{ #category : #accessing }
MLRandIndexTest >> clusterAssignment2 [
	^ clusterAssignment2
]

{ #category : #accessing }
MLRandIndexTest >> clusterAssignment2: anObject [
	clusterAssignment2 := anObject
]

{ #category : #running }
MLRandIndexTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	super setUp.
	clusterAssignment1 := #( 0 1 1 1 0 0 ).
	clusterAssignment2 := #( 1 1 1 0 0 0).

]

{ #category : #test }
MLRandIndexTest >> testScoreWith [

	| score |
	
	score := (MLRandIndex score: self clusterAssignment1 with: self clusterAssignment2).
	self 
		assert: (score truncateTo: 0.01)
		equals: 0.46.
]
