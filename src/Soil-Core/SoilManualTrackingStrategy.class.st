Class {
	#name : #SoilManualTrackingStrategy,
	#superclass : #SoilReadWriteStrategy,
	#category : #'Soil-Core'
}

{ #category : #public }
SoilManualTrackingStrategy >> markDirty: anObject [ 
	transaction addObjectToBeCommited: anObject 
]

{ #category : #'as yet unclassified' }
SoilManualTrackingStrategy >> prepareCommit [ 
	self serializeObjects 
]
