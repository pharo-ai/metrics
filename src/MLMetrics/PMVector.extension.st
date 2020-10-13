Extension { #name : #PMVector }

{ #category : #'*MLMetrics' }
PMVector >> take: anInteger [ 
	" Answer a <PMMatrix> with the receiver's binomial coefficient at each element for anInteger "
	
	^ self collect: [ : each | each take: anInteger ].
]
