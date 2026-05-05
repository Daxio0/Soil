Class {
	#name : #SoilNoWritesCommitStrategy,
	#superclass : #SoilCommitStrategy,
	#category : #'Soil-Core'
}

{ #category : #testing }
SoilNoWritesCommitStrategy >> isReadOnly [ 
	^ true 
]

{ #category : #public }
SoilNoWritesCommitStrategy >> markDirty: anObject [ 
	SoilTransactionIsReadOnly signal: 'attempt to call markDirty: on a read-only transaction'

]
