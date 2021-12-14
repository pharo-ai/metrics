"
I am the baseline of the project
"
Class {
	#name : #BaselineOfAIMetrics,
	#superclass : #BaselineOf,
	#category : #BaselineOfAIMetrics
}

{ #category : #baselines }
BaselineOfAIMetrics >> baseline: spec [
	<baseline>

	spec for: #(common) do: [ 
		"Baselines"
    	spec
    		baseline: 'PolyMath'
  	 	 	with: [ 
				spec 
					repository: 'github://PolyMathOrg/PolyMath:master/src';
					loads: #('Core') ].
		"Packages"
		spec
			package: 'AI-Metrics' with: [ spec requires: #('PolyMath') ];
			package: 'AI-Metrics-Regression';
			package: 'AI-Metrics-Regression-Tests' with: [ spec requires: #('AI-Metrics-Regression') ];
			package: 'AI-Metrics-Tests' with: [ spec requires: #('AI-Metrics') ]
	].

	self defineGroups: spec
]

{ #category : #groups }
BaselineOfAIMetrics >> defineGroups: spec [

	spec
		group: 'Core' with: #( 'AI-Metrics' 'AI-Metrics-Regression');
		group: 'Tests' with: #( 'AI-Metrics' 'AI-Metrics-Tests' 'AI-Metrics-Regression' 'AI-Metrics-Regression-Tests' ).
	spec
		group: 'Regression'
		with: #( 'AI-Metrics-Regression' ).
	spec group: 'default' with: #( 'Core' 'Tests' )
]
