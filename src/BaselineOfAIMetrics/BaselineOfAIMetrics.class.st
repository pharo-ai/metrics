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
			package: 'AIMetrics' 			with: [ spec requires: #('PolyMath') ];
			package: 'AIMetrics-Tests' 	with: [ spec requires: #('AIMetrics') ]
	]
]
