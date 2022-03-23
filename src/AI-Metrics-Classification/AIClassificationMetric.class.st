Class {
	#name : #AIClassificationMetric,
	#superclass : #Object,
	#category : #'AI-Metrics-Classification'
}

{ #category : #accessing }
AIClassificationMetric class >> metricName [

	^ self subclassResponsibility
]

{ #category : #api }
AIClassificationMetric >> computeForActual: actualValues predicted: predictedValues [

	^ self subclassResponsibility
]
