Extension { #name : #VariableLayout }

{ #category : #'*Soil-Core' }
VariableLayout >> soilRecursiveHash: anObject with: aSet [
	| hash |
	(aSet includes: anObject) ifTrue: [ ^ 0 ].
	aSet add: anObject.

	hash := anObject basicIdentityHash.
	1 to: anObject basicSize do: [ :idx |
		"bitXor: all elements. Take the position in the collection into account in
		order to detect if elements change position in the collection"
		hash := hash bitXor: ((anObject basicAt: idx) soilRecursiveHashWith: aSet) * idx ].
	^ hash 
]
