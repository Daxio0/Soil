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
