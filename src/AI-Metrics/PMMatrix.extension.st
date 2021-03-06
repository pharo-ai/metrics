Extension { #name : #PMMatrix }

{ #category : #'*AI-Metrics' }
PMMatrix >> sumColumns [
	" Answer an <PMVector> with the sum of all the receiver's columns "

	| a |
	a := PMVector new: self numberOfColumns.
	1 to: a size do: [ :n | a at: n put: (self columnAt: n) sum ].
	^ a
]
