Class {
	#name : #SoilCommitStrategy,
	#superclass : #Object,
	#instVars : [
		'transaction'
	],
	#category : #'Soil-Core'
}

{ #category : #testing }
SoilCommitStrategy >> isAutoMigrating [ 
	self subclassResponsibility 
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
