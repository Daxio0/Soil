Extension { #name : #EphemeronLayout }

{ #category : #'*Soil-Core' }
EphemeronLayout >> soilRecursiveHash: anObject with: aSet [
	| hash transient slots |
	(aSet includes: anObject) ifTrue: [ ^ 0 ].
	aSet add: anObject.
	hash := anObject basicIdentityHash bitXor: slotScope basicIdentityHash.
	host hasSoilTransientInstVars 
		ifTrue: [
			slots := self allSlots.
			transient := host soilTransientInstVars.
			1 to: slots size do: [ :n | | slot |
				slot := slots at: n.
				(transient includes: slot name) ifFalse: [  
				hash := hash bitXor: ((slot read: anObject) soilRecursiveHashWith: aSet) * n ] ] ]
		ifFalse: [ 
			1 to: anObject class instSize do: [ :n | 
				hash := hash bitXor: ((anObject instVarAt: n) soilRecursiveHashWith: aSet) * n ]].
		^ hash
]
