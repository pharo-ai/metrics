Extension { #name : #PMVector }

{ #category : #'*MLMetrics' }
PMVector >> crossTabulateWith: aPMVector [ 

	^ PMMatrix rows: (self uniqueValues collect: [ :each1 |
		aPMVector uniqueValues collect: [ :each2 |
			(1 to: self size) 
				inject: 0 
				into: [ :accum :i |
					(((self at: i) = each1) and: ((aPMVector at: i) = each2))
						ifTrue: [ accum + 1 ]
						ifFalse: [ accum ] ] ] ]).

]

{ #category : #'*MLMetrics' }
PMVector >> take: anInteger [ 
	" Answer a <PMMatrix> with the receiver's binomial coefficient at each element for anInteger "
	
	^ self collect: [ : each | each take: anInteger ].
]

{ #category : #'*MLMetrics' }
PMVector >> uniqueValues [
	
	^ self asSet asArray.
]
