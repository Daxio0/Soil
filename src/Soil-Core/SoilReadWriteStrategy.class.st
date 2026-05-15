Class {
	#name : #SoilReadWriteStrategy,
	#superclass : #SoilCommitStrategy,
	#instVars : [
		'recordsToCommit'
	],
	#category : #'Soil-Core'
}

{ #category : #testing }
SoilReadWriteStrategy class >> isAbstract [ 
	^ self == SoilReadWriteStrategy 
]

{ #category : #adding }
SoilReadWriteStrategy >> addRecordToCommit: record [ 
	(recordsToCommit includes: record) ifFalse: [  
		recordsToCommit add: record ]
]

{ #category : #accessing }
SoilReadWriteStrategy >> errorOnWriteAttempts [ 
	self error: 'a read-write transaction does not error on write attempts'
]

{ #category : #testing }
SoilReadWriteStrategy >> hasModifications [ 
	^ recordsToCommit notNil and: [ recordsToCommit notEmpty ]
]

{ #category : #testing }
SoilReadWriteStrategy >> hasRecordsToCommit [ 
	^ recordsToCommit notEmpty
]

{ #category : #accessing }
SoilReadWriteStrategy >> ignoreWriteAttempts [
	self error: 'a read-write transaction does not ignore write attempts'
]

{ #category : #initialization }
SoilReadWriteStrategy >> initialize [ 
	super initialize.
	self reset
]

{ #category : #testing }
SoilReadWriteStrategy >> isReadOnly [
	^ false 
]

{ #category : #accessing }
SoilReadWriteStrategy >> recordsToCommit [
	^ recordsToCommit
]

{ #category : #public }
SoilReadWriteStrategy >> reset [ 
	recordsToCommit := OrderedCollection new
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
	[ index <= recordsToCommit size ] whileTrue: [ | record |
		record := (recordsToCommit at: index) asNewClusterVersion.
		recordsToCommit at: index put: record.
		record serializeObject.
		index := index + 1 ]
]
