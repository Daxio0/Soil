Class {
	#name : #SoilReadWriteStrategy,
	#superclass : #SoilCommitStrategy,
	#category : #'Soil-Core'
}

{ #category : #testing }
SoilReadWriteStrategy class >> isAbstract [ 
	^ self == SoilReadWriteStrategy 
]

{ #category : #accessing }
SoilReadWriteStrategy >> errorOnWriteAttempts [ 
	self error: 'a read-write transaction does not error on write attempts'
]

{ #category : #testing }
SoilReadWriteStrategy >> hasModifications [ 
	"before committing a transaction collects changes in the journal. While committing
	recordsToCommit gets populated. We want to ask for modifications regardless of the 
	phase of the transaction so we check both"
	^ (transaction recordsToCommit notNil and: [ transaction recordsToCommit notEmpty ]) 
		or: [ transaction journal notNil and: [ transaction journal size > 1 ] ]
]

{ #category : #accessing }
SoilReadWriteStrategy >> ignoreWriteAttempts [
	self error: 'a read-write transaction does not ignore write attempts'
]

{ #category : #testing }
SoilReadWriteStrategy >> isReadOnly [
	^ false 
]
