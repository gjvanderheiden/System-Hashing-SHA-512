Class {
	#name : #SixtyFourBitRegisterTest,
	#superclass : #TestCase,
	#category : #'System-Hashing-SHA512-Test'
}

{ #category : #test }
SixtyFourBitRegisterTest >> testAsByteArray [

	|input output register|

	input := ByteArray readHexFrom: '100000000000'.
	register := SixtyFourBitRegister new loadFrom: input.
	output := register asByteArray.
	self assert: output equals: (ByteArray readHexFrom: '0000100000000000').

]

{ #category : #test }
SixtyFourBitRegisterTest >> testBitInvert [

	|expected register|
	
   expected := ByteArray readHexFrom: '64FA9773D4C193E0'.
   register := SixtyFourBitRegister new loadFrom:  (ByteArray readHexFrom: '9B05688C2B3E6C1F').
	register bitInvert.
	
	self assert: register asByteArray  equals: expected 
]

{ #category : #tests }
SixtyFourBitRegisterTest >> testBitXor [
	|regA regB regC result|
	
	regA := SixtyFourBitRegister new loadFrom: (ByteArray readHexFrom:  '0200000000000000').
	regB := SixtyFourBitRegister new load:  4.
	regC := SixtyFourBitRegister new loadFrom: (ByteArray readHexFrom:  '0000100000000000').
  
	
	result:= regA  copy bitXor: regB;
	   bitXor: regC.
	
	"Did copy  bitXor leave regA, regB and regC alone?"
	self assert: regA asByteArray equals:   (ByteArray readHexFrom: '0200000000000000').
   self assert: regB asByteArray equals:   (ByteArray readHexFrom: '0000000000000004').
   self assert: regC asByteArray equals:   (ByteArray readHexFrom: '0000100000000000').   

   self assert: result asByteArray equals: (ByteArray readHexFrom: '0200100000000004')
]

{ #category : #test }
SixtyFourBitRegisterTest >> testLoad [

	|register|
	register := SixtyFourBitRegister new.
	self assert: register asInteger equals:  0.
	
	register load: 4.
	self assert: register asInteger equals: 4.
	
]

{ #category : #test }
SixtyFourBitRegisterTest >> testLoadFrom [

	|byteArray register|
	byteArray := ByteArray readHexFrom: '0101'.
	
	register := SixtyFourBitRegister new loadFrom: byteArray.
	self assert: register asInteger equals: 257.
   
   byteArray := ByteArray readHexFrom: 'FFFFFFFFFFFFFFFF'.
   register := SixtyFourBitRegister new loadFrom: byteArray.
   self assert: register asInteger equals: 18446744073709551615.

   byteArray := ByteArray readHexFrom: 'FFFFFFFFFFFFFFFFFFFF'.
   register := SixtyFourBitRegister new loadFrom: byteArray.
   self assert: register asInteger equals: 18446744073709551615.

	byteArray:= ByteArray readHexFrom: '100000000000'.
	register := SixtyFourBitRegister new loadFrom: byteArray.
	self assert: register asInteger equals: 17592186044416.

]

{ #category : #test }
SixtyFourBitRegisterTest >> testLoadFromAt [

	|byteArray register|
	byteArray := ByteArray readHexFrom: '0101'.
	
	register := SixtyFourBitRegister new loadFrom: byteArray at:1.
	self assert: register asInteger equals: 257.
	
   register := SixtyFourBitRegister new loadFrom: byteArray at:2.
	self assert: register asInteger equals: 1.
	
   byteArray := ByteArray readHexFrom: 'FFFFFFFFFFFFFFFF'.
   register := SixtyFourBitRegister new loadFrom: byteArray at:1.
   self assert: register asInteger equals: 18446744073709551615.

   byteArray := ByteArray readHexFrom: 'FFFFFFFFFFFFFFFFFFFF'.
   register := SixtyFourBitRegister new loadFrom: byteArray at:2.
   self assert: register asInteger equals: 18446744073709551615.

]

{ #category : #test }
SixtyFourBitRegisterTest >> testPlusEqualsSign [

	|regA regB|
	regA := SixtyFourBitRegister new load:3.
	regB := SixtyFourBitRegister new load:7.
	regA += regB.
	self assert: regA asInteger  equals: 10.
	self assert: regB asInteger  equals: 7.
]

{ #category : #test }
SixtyFourBitRegisterTest >> testRightRotateBy [
	| register |
	
   register := SixtyFourBitRegister new.
   register load: #[ 16r00 16r00 16r00 16r00 16r00 16r00 16r00 16r80] asInteger.
   register rightRotateBy: 1.
   self assert: register asByteArray equals: #[0 0 0 0 0 0 0 16r40].
   register rightRotateBy: 1.
   self assert: register asByteArray equals: #[0 0 0 0 0 0 0 16r20].
   register rightRotateBy: 5.
   self assert: register asByteArray equals: #[0 0 0 0 0 0 0 16r01].
   register rightRotateBy: 1.
   self assert: register asByteArray equals: #[16r80 0 0 0 0 0 0 0].

]

{ #category : #tests }
SixtyFourBitRegisterTest >> testleftRotateBy [
	| register |
	
   register := SixtyFourBitRegister new.
   register load: #[16r80 16r00 16r00 16r00 16r00 16r00 16r00 16r00] asInteger.
   register leftRotateBy: 1.
   self assert: register asByteArray equals: #[0 0 0 0 0 0 0 16r01]
    
]
