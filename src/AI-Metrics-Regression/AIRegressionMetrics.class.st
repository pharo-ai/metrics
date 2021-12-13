"
I am a class that allows to evalute the performance of a regression model (linear, logistic regression, etc). See my tests for case usages
"
Class {
	#name : #AIRegressionMetrics,
	#superclass : #Object,
	#category : #'AI-Metrics-Regression'
}

{ #category : #api }
AIRegressionMetrics class >> meanAbsoluteErrorActual: actualValues expected: expectedValues [

	"The mean_absolute_error function computes mean absolute error, a risk metric corresponding to the expected value of the absolute error loss or -norm loss.
	Source: https://scikit-learn.org/stable/modules/model_evaluation.html#mean-squared-error"
	
	"(1/n) * Σ (actual - expected) absoluteValue "

	| sum |
	sum := 0.
	actualValues
		with: expectedValues
		do: [ :actual :expected | sum := sum + (actual - expected) abs ].
	^ sum / actualValues size
]

{ #category : #api }
AIRegressionMetrics class >> meanSquaredErrorActual: actualValues expected: expectedValues [

	"The mean_squared_error function computes mean square error, a risk metric corresponding to the expected value of the squared (quadratic) error or loss.
	Source: https://scikit-learn.org/stable/modules/model_evaluation.html#mean-squared-error"
	
	"(1/n) * Σ (actual - expected)^2 "

	| sum |
	sum := self squaredErrorSumActual: actualValues expected: expectedValues.
	^ sum / actualValues size
]

{ #category : #api }
AIRegressionMetrics class >> r2CoefficientActual: actualValues expected: expectedValues [

	"The r2_score function computes the coefficient of determination, usually denoted as R².

	It represents the proportion of variance (of y) that has been explained by the independent variables in the model.
	It provides an indication of goodness of fit and therefore a measure of how well unseen samples are likely to be predicted by the model, through the proportion of explained variance.

	As such variance is dataset dependent, R² may not be meaningfully comparable across different datasets.
	Best possible score is 1.0 and it can be negative (because the model can be arbitrarily worse).
	A constant model that always predicts the expected value of y, disregarding the input features, would get a R² score of 0.0.
	Source: https://scikit-learn.org/stable/modules/model_evaluation.html#mean-squared-error"
	
	"R2 = 1 - (Σ (actual - expeted) squared) / (Σ (actual - mean) "
	"mean = (1/n) * Σ actual"
	
	| meanSquaredError meanOfObservedData squaredSumOfActual r2Coefficient |
	meanSquaredError := self squaredErrorSumActual:  actualValues expected: expectedValues.
	meanOfObservedData := actualValues average.
	squaredSumOfActual := actualValues
		inject: 0
		into: [ :sum :actual | sum + (actual - meanOfObservedData) squared ].
	
	r2Coefficient := 1 - (meanSquaredError / squaredSumOfActual).
	^ r2Coefficient
]

{ #category : #running }
AIRegressionMetrics class >> squaredErrorSumActual: actualValues expected: expectedValues [

	| sum |
	sum := 0.
	actualValues
		with: expectedValues
		do: [ :actual :expected | sum := sum + (actual - expected) squared ].
	^ sum 
]
