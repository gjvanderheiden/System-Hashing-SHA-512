Class {
	#name : #SixtyFourBitRegister,
	#superclass : #Object,
	#instVars : [
		'bigNonNeg'
	],
	#category : #'System-Hashing-SHA512-SHA512'
}

{ #category : #'instance creation' }
SixtyFourBitRegister class >> new [
 ^super new load: 0.
]

{ #category : #accessing }
SixtyFourBitRegister >> += aSixtyFourBitRegister [
	
	bigNonNeg := bigNonNeg + aSixtyFourBitRegister internalValue.
	bigNonNeg := bigNonNeg bitAnd: 16rFFFFFFFFFFFFFFFF
	
]

{ #category : #accessing }
SixtyFourBitRegister >> asByteArray [
 ^ bigNonNeg asByteArrayOfSize: 8. 
]

{ #category : #accessing }
SixtyFourBitRegister >> asInteger [
  ^ bigNonNeg
]

{ #category : #accessing }
SixtyFourBitRegister >> bitAnd: aSixtyFourBitRegister [
   bigNonNeg := bigNonNeg bitAnd: aSixtyFourBitRegister internalValue
]

{ #category : #accessing }
SixtyFourBitRegister >> bitInvert [
  self bitXor: 16rFFFFFFFFFFFFFFFF.

]

{ #category : #accessing }
SixtyFourBitRegister >> bitOr: aSixtyFourBitRegister [
  bigNonNeg := bigNonNeg bitOr: aSixtyFourBitRegister internalValue.
]

{ #category : #accessing }
SixtyFourBitRegister >> bitXor: aSixtyFourBitRegister [
  
	self loadFrom: (self asByteArray bitXor: aSixtyFourBitRegister asByteArray).
	
]

{ #category : #accessing }
SixtyFourBitRegister >> copy [
	"Use the clone primitive for speed."

	<primitive: 148>
	^ super copy
]

{ #category : #accessing }
SixtyFourBitRegister >> displayString [ 
	self asByteArray displayString
]

{ #category : #accessing }
SixtyFourBitRegister >> internalValue [
  ^ bigNonNeg
]

{ #category : #accessing }
SixtyFourBitRegister >> leftRotateBy: bits [

	"  --<- ******** <--
      |_______________|"

	bits negative
		ifFalse: [ 
			| rightIn |
			rightIn := self copy rightShift: 64 - bits.
			self leftShift: bits.
			self bitOr: rightIn.
			bigNonNeg := bigNonNeg bitAnd: 16rFFFFFFFFFFFFFFFF ]
		ifTrue: [ self rightRotateBy: bits absoluteValue  ]
]

{ #category : #accessing }
SixtyFourBitRegister >> leftShift: numberOfShifts [
 bigNonNeg := bigNonNeg bitShift: numberOfShifts.
 bigNonNeg := bigNonNeg bitAnd:16rFFFFFFFFFFFFFFFF
]

{ #category : #accessing }
SixtyFourBitRegister >> load: anInteger [
	"Set my contents to the value of given integer."
	bigNonNeg := anInteger asInteger.
	
]

{ #category : #accessing }
SixtyFourBitRegister >> loadFrom: aByteArray [

	aByteArray size > 8
		ifTrue: [ self loadFrom: (aByteArray copyFrom: 1 to: 8) ]
		ifFalse: [ bigNonNeg := aByteArray asInteger ]
]

{ #category : #accessing }
SixtyFourBitRegister >> loadFrom: aByteArray at: fromIndex [
  |end|
  end := (fromIndex + 8) min: aByteArray size.
  self loadFrom:( aByteArray copyFrom: fromIndex to: end)
]

{ #category : #printing }
SixtyFourBitRegister >> printOn: aStream [

	"Append a sequence of characters to aStream that identify the receiver."

	super printOn: aStream.
	aStream
		print: self asByteArray hex.
]

{ #category : #accessing }
SixtyFourBitRegister >> rightRotateBy: bits [

	" ROTRn(x)=(x >> n) BITOR (x << w - n)."

	bits negative
		ifFalse: [ 
			| leftIn |
			leftIn := self copy leftShift: 64 - bits.
			self rightShift: bits.
			self bitOr: leftIn.
			bigNonNeg := bigNonNeg bitAnd: 16rFFFFFFFFFFFFFFFF ]
		ifTrue: [ self leftRotateBy: bits absoluteValue  ]
]

{ #category : #accessing }
SixtyFourBitRegister >> rightShift: numberOfShifts [
 bigNonNeg := bigNonNeg bitShift: numberOfShifts negated.
]
