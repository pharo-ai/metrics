"
I am a class that allows to evalute the performance of a regression model (linear, logistic regression, etc). See my tests for case usages
"
Class {
	#name : #AIRegressionMetrics,
	#superclass : #Object,
	#category : #'AI-Metrics-Regression'
}

{ #category : #api }
AIRegressionMetrics class >> coefficientOfDeterminationActual: actualValues expected: expectedValues [

	" 1 - (Σ (actual - expeted) squared) / (Σ (actual - mean) "
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

{ #category : #api }
AIRegressionMetrics class >> meanAbsoluteErrorActual: actualValues expected: expectedValues [

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

	"(1/n) * Σ (actual - expected)^2 "

	| sum |
	sum := self squaredErrorSumActual: actualValues expected: expectedValues.
	^ sum / actualValues size
]

{ #category : #api }
AIRegressionMetrics class >> multidimensionalMeanAbsoluteErrorActual: actualValues expected: expectedValues [

	"(1/n) * Σ (actual - expected) absoluteValue "

	| vectorialSum |
	vectorialSum := (1 to: actualValues size) sum: [ :i | 
		((actualValues at: i) - (expectedValues at: i)) abs ].

	^ (vectorialSum / actualValues size) average
]

{ #category : #api }
AIRegressionMetrics class >> multidimensionalMeanSquaredErrorActual: actualValues expected: expectedValues [

	"(1/n) * Σ (actual - expected)^2 "

	| sum |
	sum := self  multidimensionalSquaredErrorSumActual: actualValues expected: expectedValues.
	^ (sum / actualValues size) average
]

{ #category : #running }
AIRegressionMetrics class >> multidimensionalSquaredErrorSumActual: actualValues expected: expectedValues [

	| vectorialSum |
	vectorialSum := (1 to: actualValues size) sum: [ :i | 
		((actualValues at: i) - (expectedValues at: i)) squared ].
	
	^ vectorialSum
]

{ #category : #api }
AIRegressionMetrics class >> r2CoefficientActual: actualValues expected: expectedValues [

	^ self coefficientOfDeterminationActual: actualValues expected: expectedValues
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
