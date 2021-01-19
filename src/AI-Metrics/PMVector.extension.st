Extension { #name : #PMVector }

{ #category : #'*AI-Metrics' }
PMVector >> crossTabulateWith: aPMVector [ 

	^ PMMatrix rows: (self uniqueValues collect: [ :each1 |
		aPMVector uniqueValues collect: [ :each2 |
			(1 to: self size) 
				inject: 0 
				into: [ :accum :i |
					(((self at: i) = each1) & ((aPMVector at: i) = each2))
						ifTrue: [ accum + 1 ]
						ifFalse: [ accum ] ] ] ]).

]

{ #category : #'*AI-Metrics' }
PMVector >> uniqueValues [
	
	^ self asSet asArray
]
