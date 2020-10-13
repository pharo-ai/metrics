Extension { #name : #SequenceableCollection }

{ #category : #'*MLMetrics' }
SequenceableCollection >> which: aBlock [ 
	" Answer a <Collection> with the true indices of each element "

	| indices |
	indices := OrderedCollection new.
	self doWithIndex: [ : elem : index | (aBlock value: elem) ifTrue: [ indices add: index ] ].
	^ indices
]
