Class {
	#name : #AIClassificationMetric,
	#superclass : #Object,
	#category : #'AI-Metrics-Classification'
}

{ #category : #api }
AIClassificationMetric >> computeForActual: actualValues predicted: predictedValues [

	^ self subclassResponsibility
]
