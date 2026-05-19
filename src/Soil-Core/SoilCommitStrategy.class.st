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
SoilCommitStrategy >> hasChanges [ 
	self subclassResponsibility 
]

{ #category : #initialization }
SoilCommitStrategy >> initialize [ 
	super initialize.
	autoMigration := false
]

{ #category : #testing }
SoilCommitStrategy >> isAutoMigrating [
	^ autoMigration 
]

{ #category : #testing }
SoilCommitStrategy >> isWritable [
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

{ #category : #'as yet unclassified' }
SoilCommitStrategy >> recordMaterialized: record materializer: materializer [
	(autoMigration and: [ materializer clusterCanBeMigrated ]) 
		ifTrue: [ self addRecord: record. ].

]

{ #category : #initialization }
SoilCommitStrategy >> reset [ 
]

{ #category : #accessing }
SoilCommitStrategy >> transaction [

	^ transaction
]

{ #category : #accessing }
SoilCommitStrategy >> transaction: anObject [

	transaction := anObject
]
