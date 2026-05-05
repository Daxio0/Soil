Class {
	#name : #SoilAutomaticWriteTracking,
	#superclass : #SoilCommitStrategy,
	#category : #'Soil-Core'
}

{ #category : #testing }
SoilAutomaticWriteTracking >> isReadOnly [ 
	^ false 
]

{ #category : #public }
SoilAutomaticWriteTracking >> markDirty: anObject [ 
	"do nothing"
]

{ #category : #'as yet unclassified' }
SoilAutomaticWriteTracking >> prepareCommit [ 
	transaction objectMap do: [ :each | 
		each hasChanged ifTrue: [ 
			transaction addRecordToCommit: each ] ]
]
