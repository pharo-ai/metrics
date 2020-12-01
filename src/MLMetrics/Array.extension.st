Extension { #name : #Array }

{ #category : #'*MLMetrics' }
Array >> sumMatrix [
	"Answer an <Integer> with the sum of all the receiver's vectors"

	^ self sum sum

]
