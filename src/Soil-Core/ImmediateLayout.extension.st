Extension { #name : #ImmediateLayout }

{ #category : #'*Soil-Core' }
ImmediateLayout >> soilRecursiveHash: anObject with: aSet [
	^ anObject basicIdentityHash 
]
