Extension { #name : #Array }

{ #category : #'*AI-Metrics' }
Array >> cosineSimilarity: anArray [
	|num size1 size2|
	num := (self * anArray) sum.
	size1 := (self * self) sum sqrt.
	size2 := (anArray * anArray ) sum sqrt.
	
	^ num/(size1*size2)
]

{ #category : #'*AI-Metrics' }
Array >> elementwiseProd: anArray [
	^ self * anArray 
]

{ #category : #'*AI-Metrics' }
Array >> euclideanDistance: anArray [
	^((self - anArray) raisedTo: 2) sum sqrt.
]

{ #category : #'*AI-Metrics' }
Array >> manhattanDistance: anArray [
	^(self - anArray) abs sum. 
]

{ #category : #'*AI-Metrics' }
Array >> sumMatrix [
	"Answer an <Integer> with the sum of all the receiver's vectors"

	^ self sum sum

]
