"
Tracks objects encountered during serialization, assigning each a unique integer index based on insertion order. 
Used to detect and handle object sharing: if an object is added a second time, its existing index is returned rather than a new one being allocated. Backed by an IdentityDictionary to ensure identity-based (not equality-based) comparison.

API:

add: anObject
	registers the object and returns its index. If already present, returns the existing index.

identityIndexOf: anObject
	 returns the index of the object, or 0 if not present. The zero return can therefore be used as a membership test.
"
Class {
	#name : #SoilObjectTable,
	#superclass : #Object,
	#instVars : [
		'table'
	],
	#category : #'Soil-Serializer-Base'
}

{ #category : #api }
SoilObjectTable >> add: anObject [
	^ table
		at: anObject
		ifAbsentPut: [ table size + 1 ]
]

{ #category : #api }
SoilObjectTable >> identityIndexOf: anObject [
	 ^ table at: anObject ifAbsent: 0
]

{ #category : #initialization }
SoilObjectTable >> initialize [
	table := IdentityDictionary new
]

{ #category : #testing }
SoilObjectTable >> isEmpty [
	^ table isEmpty
]

{ #category : #accessing }
SoilObjectTable >> size [
	^ table size
]
