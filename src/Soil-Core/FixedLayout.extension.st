Extension { #name : #FixedLayout }

{ #category : #'*Soil-Core' }
FixedLayout >> soilRecursiveHash: anObject with: aSet [
	| hash transient slots |
	(aSet includes: anObject) ifTrue: [ ^ 0 ].
	aSet add: anObject.
	hash := anObject basicIdentityHash.
	slots := self allSlots.
	host hasSoilTransientInstVars 
		ifTrue: [  
			transient := host soilTransientInstVars.
			1 to: slots size do: [ :n | | slot |
				slot := slots at: n.
				(transient includes: slot name) ifFalse: [  
				hash := hash bitXor: ((slot read: anObject) soilRecursiveHashWith: aSet) + n ] ].
			^ hash ]
		ifFalse: [ 
			1 to: slots size do: [ :n | | slot |
				slot := slots at: n. 
				hash := hash bitXor: ((slot read: anObject) soilRecursiveHashWith: aSet) + n ].
			^ hash ]

]
