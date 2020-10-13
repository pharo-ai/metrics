Class {
	#name : #BaselineOfMLMetrics,
	#superclass : #BaselineOf,
	#category : #BaselineOfMLMetrics
}

{ #category : #baselines }
BaselineOfMLMetrics >> baseline: spec [
	<baseline>

	spec for: #(common) do: [ 
		"Baselines"
    	spec
    		baseline: 'PolyMath'
  	 	 	with: [ spec repository: 'github://PolyMathOrg/PolyMath:master/src' ].
		"Packages"
		spec
			package: 'MLMetrics' 			with: [ spec requires: #('PolyMath') ];
			package: 'MLMetrics-Tests' 	with: [ spec requires: #('MLMetrics') ]
	]
]
