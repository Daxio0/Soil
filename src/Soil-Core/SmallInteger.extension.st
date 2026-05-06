Extension { #name : #SmallInteger }

{ #category : #'*Soil-Core' }
SmallInteger >> soilRecursiveHashWith: aSet [ 
	^ self basicIdentityHash * 16r165667B19E3779F9
]
