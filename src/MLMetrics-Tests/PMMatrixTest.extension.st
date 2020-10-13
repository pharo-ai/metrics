Extension { #name : #PMMatrixTest }

{ #category : #'*MLMetrics-Tests' }
PMMatrixTest >> testTake [

	| m expected |
	m := PMMatrix rows: #((1 2)(3 3)).
	expected := PMMatrix rows: #((0 1) (3 3)).
	self assert: (m take: 2) equals: expected.

	m := PMMatrix rows: #((1 2)).
	expected := PMMatrix rows: #((0 1)).
	self assert: (m take: 2) equals: expected.
	
	m := PMMatrix rows: #().
	expected := PMMatrix rows: #().
	self assert: (m take: 2) equals: expected.
]
