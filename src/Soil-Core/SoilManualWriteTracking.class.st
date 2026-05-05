Class {
	#name : #SoilManualWriteTracking,
	#superclass : #SoilCommitStrategy,
	#category : #'Soil-Core'
}

{ #category : #testing }
SoilManualWriteTracking >> isReadOnly [
	^ false 
]

{ #category : #public }
SoilManualWriteTracking >> markDirty: anObject [ 
	transaction addObjectToBeCommited: anObject 
]
