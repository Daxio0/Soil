Class {
	#name : #SoilWriteOnReadOnlyTransaction,
	#superclass : #SoilError,
	#instVars : [
		'object'
	],
	#category : #'Soil-Core-Model'
}

{ #category : #accessing }
SoilWriteOnReadOnlyTransaction >> messageText [ 
	^'attempt to write on ', object asString, ' while in a read-only transaction'
]

{ #category : #accessing }
SoilWriteOnReadOnlyTransaction >> object [

	^ object
]

{ #category : #accessing }
SoilWriteOnReadOnlyTransaction >> object: anObject [

	object := anObject
]
