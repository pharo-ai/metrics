Extension { #name : #PMMatrix }

{ #category : #'*MLMetrics' }
PMMatrix >> sumColumns [
	" Answer an <PMVector> with the sum of all the receiver's columns "

	| a |
	a := PMVector new: self numberOfColumns.
	1 to: a size do: [ :n | a at: n put: (self columnAt: n) sum ].
	^ a
]

{ #category : #'*MLMetrics' }
PMMatrix >> sumMatrix [
	" Answer an <Integer> with the sum of all the receiver's vectors "

	^ self sum sum
]

{ #category : #'*MLMetrics' }
PMMatrix >> take: anInteger [ 
	" Answer a <PMMatrix> with the receiver's binomial coefficient at each element for anInteger "
	
	^ self collect: [ : each | each take: anInteger ].
]
