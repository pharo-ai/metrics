"
The r2 score is the coefficient of determination, usually denoted as R².

It represents the proportion of variance (of y) that has been explained by the independent variables in the model.
It provides an indication of goodness of fit and therefore a measure of how well unseen samples are likely to be predicted by the model, through the proportion of explained variance.

As such variance is dataset dependent, R² may not be meaningfully comparable across different datasets.
Best possible score is 1.0 and it can be negative (because the model can be arbitrarily worse).
A constant model that always predicts the expected value of y, disregarding the input features, would get a R² score of 0.0.

Source: https://scikit-learn.org/stable/modules/model_evaluation.html
	
R2 = 1 - (Σ (true - predicted) squared) / (Σ (true - mean)

mean = (1/n) * Σ actual
"
Class {
	#name : #AIR2Score,
	#superclass : #AIRegressionMetric,
	#category : #'AI-Metrics-Regression'
}

{ #category : #api }
AIR2Score >> computeForActual: actualValues predicted: predictedValues [

	| meanSquaredError meanOfObservedData squaredSumOfActual r2Coefficient |
	meanSquaredError := 0.
	actualValues with: predictedValues do: [ :actual :predicted | 
		meanSquaredError := meanSquaredError + (actual - predicted) squared ].

	meanOfObservedData := actualValues average.

	squaredSumOfActual := actualValues
		inject: 0
		into: [ :sum :actual | sum + (actual - meanOfObservedData) squared ].

	r2Coefficient := 1 - (meanSquaredError / squaredSumOfActual).
	^ r2Coefficient
]
