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
	| record |
	"look up the non-proxy object in the local cache"
	record := transaction objectMap 
		at: anObject theNonSoilProxy
		ifAbsent: [ SoilNotAClusterRoot signal: 'cannot mark dirty a non-existing root' ].
	record beChanged. 
	
]
