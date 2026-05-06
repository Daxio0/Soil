Class {
	#name : #SoilCommitStrategy,
	#superclass : #Object,
	#instVars : [
		'transaction',
		'autoMigration'
	],
	#category : #'Soil-Core'
}

{ #category : #'as yet unclassified' }
SoilCommitStrategy >> beAutoMigrating [
	autoMigration := true
]

{ #category : #testing }
SoilCommitStrategy >> isAutoMigrating [
	^ autoMigration 
]

{ #category : #testing }
SoilCommitStrategy >> isReadOnly [ 
	self subclassResponsibility 
]

{ #category : #public }
SoilCommitStrategy >> markDirty: anObject [ 
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
SoilCommitStrategy >> prepareCommit [ 
	self subclassResponsibility 
]

{ #category : #accessing }
SoilCommitStrategy >> transaction [

	^ transaction
]

{ #category : #accessing }
SoilCommitStrategy >> transaction: anObject [

	transaction := anObject
]
