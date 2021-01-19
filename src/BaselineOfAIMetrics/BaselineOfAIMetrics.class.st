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
			package: 'AI-Metrics' 			with: [ spec requires: #('PolyMath') ];
			package: 'AI-Metrics-Tests' 	with: [ spec requires: #('AI-Metrics') ]
	]
]
