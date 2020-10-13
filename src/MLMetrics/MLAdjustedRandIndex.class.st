Class {
	#name : #MLAdjustedRandIndex,
	#superclass : #MLRandIndex,
	#category : #'MLMetrics-ClusterMeasure-RandIndex'
}

{ #category : #accessing }
MLAdjustedRandIndex >> buildContingencyMatrix: c1 and: c2 [
	" Answer a contingency matrix between c1 and c2 "

	| ctab a |
	a := c1 max.
	ctab := PMMatrix rows: a columns: a.
	1 to: a do: [ : i |
		1 to: a do: [ : j | 
			| w1 w2 w3 |
			w1 := c1 which: [ : elem | elem = j ].
			w2 := w1 collect: [ : each1 | c2 at: each1 ].
			w3 := w2 which: [ : elem | elem = i ].
			ctab 
				at: i 
				at: j
				put: w3 size ] ].
	^ ctab
	

]

{ #category : #accessing }
MLAdjustedRandIndex >> score: c1 with: c2 [
	" Answer a <Float> with the adjusted rand index between cluster assignments in c1 and cluster assignments in c2 "
	
	| ctab sumnij sumai sumbj nTwo |
	ctab := self buildContingencyMatrix: c1 and: c2.
	sumnij := (ctab take: 2) sumMatrix.
	sumai := (ctab sumColumns take: 2) sum.
	sumbj := (ctab sum take: 2) sum.
	nTwo := c1 size take: 2.
	^ ((sumnij - ((sumai * sumbj) / nTwo)) / 
			(0.5 * (sumai + sumbj) - ((sumai * sumbj) / nTwo))) abs.

]
