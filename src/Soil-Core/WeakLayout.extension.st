Extension { #name : #WeakLayout }

{ #category : #'*Soil-Core' }
WeakLayout >> soilRecursiveHash: anObject with: aSet [
	| hash |
	"this message is copied to WeakLayout because in Pharo 11 WeakLayout 
	is not a subclass of VariableLayout"
	(aSet includes: anObject) ifTrue: [ ^ 0 ].
	aSet add: anObject.

	hash := anObject basicIdentityHash.
	1 to: anObject basicSize do: [ :n |
		hash := hash bitXor: ((anObject basicAt: n) soilRecursiveHashWith: aSet) * n ].
	^ hash 
]
