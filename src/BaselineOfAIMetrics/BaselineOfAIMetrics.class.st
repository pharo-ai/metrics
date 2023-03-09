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
		"External dependencies"
		spec
    			baseline: 'AIExternalVectorMatrix' with: [ spec repository: 'github://pharo-ai/external-dependencies' ].
		
		"Packages"
		spec
			package: 'AI-Metrics' with: [ spec requires: #( 'AIExternalVectorMatrix' ) ];
			package: 'AI-Metrics-Tests' with: [ spec requires: #('AI-Metrics') ];
			package: 'AI-Metrics-Regression';
			package: 'AI-Metrics-Regression-Tests' with: [ spec requires: #('AI-Metrics-Regression') ];
			package: 'AI-Metrics-Classification';
			package: 'AI-Metrics-Classification-Tests' with: [ spec requires: #('AI-Metrics-Classification') ]
	].

	self defineGroups: spec
]

{ #category : #groups }
BaselineOfAIMetrics >> defineGroups: spec [

	spec
		group: 'Core' with: #( 'AI-Metrics' 'AI-Metrics-Regression' 'AI-Metrics-Classification' );
		group: 'Tests' with: #( 'AI-Metrics' 'AI-Metrics-Tests' 'AI-Metrics-Regression' 'AI-Metrics-Regression-Tests' 'AI-Metrics-Classification-Tests' ).

	spec group: 'Regression' with: #( 'AI-Metrics-Regression' ).
	spec group: 'Classification' with: #( 'AI-Metrics-Classification' ).
	spec group: 'default' with: #( 'Core' 'Tests' )
]
