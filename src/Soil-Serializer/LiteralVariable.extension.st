Extension { #name : #LiteralVariable }

{ #category : #'*Soil-Serializer' }
LiteralVariable class >> soilTransientInstVars [
	"We store LiteralVariables, but without the value. This way materialization can re-lookup by name"
	^ #(value)
]
