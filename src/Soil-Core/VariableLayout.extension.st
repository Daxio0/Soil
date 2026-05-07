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
	
	host hasSoilTransientInstVars 
		ifTrue: [  | slots transient |
			slots := self allSlots.
			transient := host soilTransientInstVars.
			1 to: slots size do: [ :n | | slot |
				slot := slots at: n.
				(transient includes: slot name) ifFalse: [  
				hash := hash bitXor: ((slot read: anObject) soilRecursiveHashWith: aSet) * n ] ]]
		ifFalse: [ 
			1 to: anObject class instSize do: [ :n | 
				hash := hash bitXor: ((anObject instVarAt: n) soilRecursiveHashWith: aSet) * n ]].
	
	^ hash 
]
