Extension { #name : #Character }

{ #category : #'*Soil-Core' }
Character >> soilRecursiveHashWith: aSet [ 
	^ self basicIdentityHash * 16r9E3779B185EBCA87
]
