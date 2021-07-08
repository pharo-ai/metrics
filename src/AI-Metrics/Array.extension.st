Extension { #name : #Array }

{ #category : #'*AI-Metrics' }
Array >> elementwiseProd: anArray [
	^ self * anArray 
]

{ #category : #'*AI-Metrics' }
Array >> sumMatrix [
	"Answer an <Integer> with the sum of all the receiver's vectors"

	^ self sum sum

]
