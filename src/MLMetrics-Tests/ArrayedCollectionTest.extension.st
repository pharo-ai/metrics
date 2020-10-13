Extension { #name : #ArrayedCollectionTest }

{ #category : #'*MLMetrics-Tests' }
ArrayedCollectionTest >> testWhich [

	self assertCollection: (Array empty which: [ : elem | elem = 0 ]) asArray equals: Array empty.
	self assertCollection: (($a to: $z) which: [ : elem | elem = $r ]) asArray equals: #(18).
	self assertCollection: (#(true false true false false true) which: [ : elem | elem ]) asArray equals: #(1 3 6).


]
