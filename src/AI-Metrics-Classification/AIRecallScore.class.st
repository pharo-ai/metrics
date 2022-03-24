Class {
	#name : #AIRecallScore,
	#superclass : #AIClassificationMetric,
	#category : #'AI-Metrics-Classification'
}

{ #category : #api }
AIRecallScore >> computeForActual: actualValues predicted: predictedValues [
	
	"I know that I am ugly. But don't change me. I am like that for optimisation purposes"

	| truePositives falsePositives |
	truePositives := 0.
	falsePositives := 0.

	1 to: actualValues size do: [ :index | 
		| actual predicted |
		actual := actualValues at: index.
		predicted := predictedValues at: index.
		(self isTruePositiveForActual: actual predicted: predicted) ifTrue: [ 
			truePositives := truePositives + 1 ].
		(self isFalseNegativeForActual: actual predicted: predicted) 
			ifTrue: [ falsePositives := falsePositives + 1 ] ].

	^ truePositives / (truePositives + falsePositives)
]

{ #category : #testing }
AIRecallScore >> isFalseNegativeForActual: actual predicted: predicted [

	(predicted = 0 and: [ actual = 1 ]) ifTrue: [ ^ true ].
	^ false
]

{ #category : #testing }
AIRecallScore >> isTruePositiveForActual: actual predicted: predicted [

	(predicted = 1 and: [ actual = 1 ]) ifTrue: [ ^ true ].
	^ false
]
