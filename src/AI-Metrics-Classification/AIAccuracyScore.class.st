Class {
	#name : #AIAccuracyScore,
	#superclass : #AIClassificationMetric,
	#category : #'AI-Metrics-Classification'
}

{ #category : #accessing }
AIAccuracyScore class >> metricName [

	^ 'Accuracy Score %'
]

{ #category : #api }
AIAccuracyScore >> computeForActual: actualValues predicted: predictedValues [

	| totalAccuracy |
	totalAccuracy := actualValues with: predictedValues collect: [ :actual :predicted | 
		actual = predicted
			ifTrue: [ 1 ]
			ifFalse: [ 0 ] ].
	^ totalAccuracy average
]
