"
I am a class that allows to evalute the performance of a regression model (linear, logistic regression, etc). See my tests for case usages
"
Class {
	#name : #AIRegressionMetrics,
	#superclass : #Object,
	#category : #'AI-Metrics-Regression'
}

{ #category : #api }
AIRegressionMetrics class >> maxErrorActual: actualValues expected: expectedValues [

	"The max_error function computes the maximum residual error , a metric that captures the worst case error between the predicted value and the true value.
	In a perfectly fitted single output regression model, max_error would be 0 on the training set and though this would be highly unlikely in the real world,
	this metric shows the extent of error that the model had when it was fitted.
	Source: https://scikit-learn.org/stable/modules/model_evaluation.html"

	"maxError = max(| true - predicted |)"

	| maxError |
	maxError := (actualValues first - expectedValues first) abs.
	expectedValues with: actualValues do: [ :expected :actual | 
		| difference |
		difference := (actual - expected) abs.
		maxError := maxError max: difference ].
	^ maxError
]

{ #category : #api }
AIRegressionMetrics class >> meanAbsoluteErrorActual: actualValues expected: expectedValues [

	"The mean_absolute_error function computes mean absolute error, a risk metric corresponding to the expected value of the absolute error loss or -norm loss.
	Source: https://scikit-learn.org/stable/modules/model_evaluation.html"
	
	"(1/n) * Σ (true - predicted) absoluteValue "

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
	Source: https://scikit-learn.org/stable/modules/model_evaluation.html"
	
	"(1/n) * Σ (true - predicted)^2 "

	| sum |
	sum := self squaredErrorSumActual: actualValues expected: expectedValues.
	^ sum / actualValues size
]

{ #category : #api }
AIRegressionMetrics class >> meanSquaredLogarithmicErrorActual: actualValues expected: expectedValues [

	"The mean_squared_log_error function computes a risk metric corresponding to the expected value of the squared logarithmic (quadratic) error or loss.
	Source: https://scikit-learn.org/stable/modules/model_evaluation.html"
	
	"MSLE = (1/n) * Σ ln(1+ true) - ln(1 + predicted) "

	actualValues with: expectedValues
]

{ #category : #api }
AIRegressionMetrics class >> r2CoefficientActual: actualValues expected: expectedValues [

	"The r2_score function computes the coefficient of determination, usually denoted as R².

	It represents the proportion of variance (of y) that has been explained by the independent variables in the model.
	It provides an indication of goodness of fit and therefore a measure of how well unseen samples are likely to be predicted by the model, through the proportion of explained variance.

	As such variance is dataset dependent, R² may not be meaningfully comparable across different datasets.
	Best possible score is 1.0 and it can be negative (because the model can be arbitrarily worse).
	A constant model that always predicts the expected value of y, disregarding the input features, would get a R² score of 0.0.
	Source: https://scikit-learn.org/stable/modules/model_evaluation.html"
	
	"R2 = 1 - (Σ (true - predicted) squared) / (Σ (true - mean) "
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
