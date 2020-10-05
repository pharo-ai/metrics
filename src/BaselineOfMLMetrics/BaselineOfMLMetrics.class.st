Class {
	#name : #BaselineOfMLMetrics,
	#superclass : #BaselineOf,
	#category : #BaselineOfMLMetrics
}

{ #category : #baselines }
BaselineOfMLMetrics >> baseline: spec [
	<baseline>

	spec for: #(common) do: [ 
		"Packages"
		spec
			package: 'MLMetrics';
			package: 'MLMetrics-Tests' with: [ spec requires: #('MLMetrics') ]
	]
]
