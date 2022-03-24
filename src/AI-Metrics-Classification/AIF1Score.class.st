Class {
	#name : #AIF1Score,
	#superclass : #AIClassificationMetric,
	#category : #'AI-Metrics-Classification'
}

{ #category : #api }
AIF1Score >> computeForActual: actualValues predicted: predictedValues [

	| precision recall |
	precision := AIPrecisionScore new computeForActual: actualValues predicted: predictedValues.
	recall := AIRecallScore new computeForActual: actualValues predicted: predictedValues.
	
	^ 2 * (precision * recall) / (precision + recall)
]
