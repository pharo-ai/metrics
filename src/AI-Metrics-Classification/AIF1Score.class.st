"
Compute the F1 score, also known as balanced F-score or F-measure.

The F1 score can be interpreted as a harmonic mean of the precision and recall, where an F1 score reaches its best value at 1 and worst score at 0. The relative contribution of precision and recall to the F1 score are equal. The formula for the F1 score is:

`F1 = 2 * (precision * recall) / (precision + recall)`

In the multi-class and multi-label case, this is the average of the F1 score of each class with weighting depending on the average parameter.
"
Class {
	#name : #AIF1Score,
	#superclass : #AIClassificationMetric,
	#category : #'AI-Metrics-Classification'
}

{ #category : #accessing }
AIF1Score class >> metricName [

	^ 'F1 Score'
]

{ #category : #api }
AIF1Score >> computeForActual: actualValues predicted: predictedValues [

	| precision recall |
	precision := AIPrecisionScore new computeForActual: actualValues predicted: predictedValues.
	recall := AIRecallScore new computeForActual: actualValues predicted: predictedValues.
	
	^ 2 * (precision * recall) / (precision + recall)
]
