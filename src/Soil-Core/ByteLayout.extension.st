Extension { #name : #ByteLayout }

{ #category : #'*Soil-Core' }
ByteLayout >> soilRecursiveHash: anObject with: aSet [
	| hash |
	(aSet includes: anObject) ifTrue: [ ^ 0 ].
	aSet add: anObject.

	hash := self basicIdentityHash.
	1 to: anObject size do: [ :n |
		hash := hash bitXor: ((anObject at: n) basicIdentityHash) + n ].
	^ hash
]
