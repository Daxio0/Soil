Extension { #name : #BitsLayout }

{ #category : #'*Soil-Core' }
BitsLayout >> soilRecursiveHash: anObject with: aSet [
	| hash |
	(aSet includes: anObject) ifTrue: [ ^ 0 ].
	aSet add: anObject.

	hash := anObject basicIdentityHash.
	1 to: anObject basicSize do: [ :n |
		hash := hash bitXor: ((anObject basicAt: n) basicIdentityHash) * n ].
	^ hash
]
