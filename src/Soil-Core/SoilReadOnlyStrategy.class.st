Class {
	#name : #SoilReadOnlyStrategy,
	#superclass : #SoilCommitStrategy,
	#instVars : [
		'ignoreWriteAttempts'
	],
	#category : #'Soil-Core'
}

{ #category : #accessing }
SoilReadOnlyStrategy >> beAutoMigrating [
	self error: ' a read-only transaction does not do auto migration'
]

{ #category : #accessing }
SoilReadOnlyStrategy >> errorOnWriteAttempts [ 
	ignoreWriteAttempts := false
]

{ #category : #accessing }
SoilReadOnlyStrategy >> ignoreWriteAttempts [ 
	ignoreWriteAttempts := true
]

{ #category : #testing }
SoilReadOnlyStrategy >> isAutoMigrating [
	^ false
]

{ #category : #testing }
SoilReadOnlyStrategy >> isReadOnly [ 
	^ true 
]

{ #category : #public }
SoilReadOnlyStrategy >> markDirty: anObject [ 
	ignoreWriteAttempts ifFalse: [  
		SoilWriteOnReadOnlyTransaction new 
			object: anObject;
			signal ]
]

{ #category : #'as yet unclassified' }
SoilReadOnlyStrategy >> prepareCommit [ 
	ignoreWriteAttempts ifFalse: [ 
		transaction objectMap do: [ :each | 
			each hasChanged ifTrue: [
				 SoilWriteOnReadOnlyTransaction new 
					object: each object;
					signal ] ] ]
]
