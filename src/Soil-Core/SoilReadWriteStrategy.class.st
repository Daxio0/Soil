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

{ #category : #accessing }
SoilReadWriteStrategy >> serializeObjects [ 
	| index |
	"serialize initial records. While serializing there can be new records 
	popping up (an object not registered yet in the transaction but is a
	cluster root"

	index := 1.
	"process the loop in a way new records that appear while serializing
	are taken into account"
	[ index <= transaction recordsToCommit size ] whileTrue: [ | record |
		record := (transaction recordsToCommit at: index) asNewClusterVersion.
		transaction recordsToCommit at: index put: record.
		record serializeObject.
		index := index + 1 ]
]
