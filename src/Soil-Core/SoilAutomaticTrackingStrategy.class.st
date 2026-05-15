Class {
	#name : #SoilAutomaticTrackingStrategy,
	#superclass : #SoilReadWriteStrategy,
	#category : #'Soil-Core'
}

{ #category : #public }
SoilAutomaticTrackingStrategy >> markDirty: anObject [ 
	"do nothing"
]

{ #category : #'as yet unclassified' }
SoilAutomaticTrackingStrategy >> prepareCommit [ 
	transaction objectMap do: [ :each | 
		each hasChanged ifTrue: [ 
			transaction addRecordToCommit: each ] ].
	self serializeObjects 
]

{ #category : #'as yet unclassified' }
SoilAutomaticTrackingStrategy >> recordMaterialized: record materializer: materializer [
	super recordMaterialized: record materializer: materializer.
	record makeFingerprint 
]
