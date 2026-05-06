Class {
	#name : #SoilReadWriteStrategy,
	#superclass : #SoilCommitStrategy,
	#category : #'Soil-Core'
}

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
