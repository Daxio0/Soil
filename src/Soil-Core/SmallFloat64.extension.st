Extension { #name : #SmallFloat64 }

{ #category : #'*Soil-Core' }
SmallFloat64 >> soilRecursiveHashWith: aSet [ 
	^ self basicIdentityHash * 16rC2B2AE3D27D4EB4F 
]
