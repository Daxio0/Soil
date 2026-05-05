Class {
	#name : #SoilReadWriteStrategy,
	#superclass : #SoilCommitStrategy,
	#instVars : [
		'autoMigration'
	],
	#category : #'Soil-Core'
}

{ #category : #'as yet unclassified' }
SoilReadWriteStrategy >> beAutoMigrating [
	autoMigration := true
]

{ #category : #accessing }
SoilReadWriteStrategy >> errorOnWriteAttempts [ 
	self error: 'a read-write transaction does not error on write attempts'
]

{ #category : #accessing }
SoilReadWriteStrategy >> ignoreWriteAttempts [
	self error: 'a read-write transaction does not ignore write attempts'
]

{ #category : #initialization }
SoilReadWriteStrategy >> initialize [ 
	super initialize.
	autoMigration := false
]

{ #category : #testing }
SoilReadWriteStrategy >> isAutoMigrating [
	^ autoMigration 
]
