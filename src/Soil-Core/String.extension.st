Extension { #name : #String }

{ #category : #'*Soil-Core' }
String >> asIndexKeyOfSize: anInteger [ 
	^ self asByteArray asIndexKeyOfSize: anInteger 
]

{ #category : #'*Soil-Core' }
String >> soilRecursiveHashWith: aSet [ 
	"for performance reasons we could not support modifying strings"
	^ self basicIdentityHash 
]
