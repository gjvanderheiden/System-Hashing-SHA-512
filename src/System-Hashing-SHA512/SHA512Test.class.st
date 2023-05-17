Class {
	#name : #SHA512Test,
	#superclass : #TestCase,
	#category : #'System-Hashing-SHA512-Test'
}

{ #category : #test }
SHA512Test >> testExpandDelta1 [

	|expected input result |
	input := SixtyFourBitRegister new loadFrom: (ByteArray readHexFrom: '8000000000000000').
	expected := ByteArray readHexFrom: '0200100000000004'.
	
	result := SHA512 new expandDelta1: input.
	self assert: result asByteArray equals: expected.
	
]

{ #category : #test }
SHA512Test >> testHashStream [

	| result expected |
	result := SHA512 new hashStream: (ReadStream on: '').
	expected := ByteArray readHexFrom:
		            'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e'.

	self assert: result equals: expected.

	result := SHA512 new hashStream: (ReadStream on: 'abc').
	expected := ByteArray readHexFrom:
		            'ddaf35a193617abacc417349ae20413112e6fa4e89a97ea20a9eeee64b55d39a2192992a274fc1a836ba3c23a3feebbd454d4423643ce80e2a9ac94fa54ca49f'.
	self assert: result equals: expected.

	result := SHA512 new hashStream: (ReadStream on:
			           'abcdefghbcdefghicdefghijdefghijkefghijklfghijklmghijklmnhijklmnoijklmnopjklmnopqklmnopqrlmnopqrsmnopqrstnopqrstu').
	expected := ByteArray readHexFrom:
		            '8e959b75dae313da8cf4f72814fc143f8f7779c6eb9f7fa17299aeadb6889018501d289e4900f7e4331b99dec4b5433ac7d329eeb6dd26545e96e55b874be909'.
	self assert: result equals: expected
]

{ #category : #test }
SHA512Test >> testHashStreamTwice [

	| result expected |
	result := SHA512 new hashStream: (ReadStream on: 'aa' utf8Encoded).
   
	expected := 'f6c5600ed1dbdcfdf829081f5417dccbbd2b9288e0b427e65c8cf67e274b69009cd142475e15304f599f429f260a661b5df4de26746459a3cef7f32006e5d1c1'.

	self assert: result hex equals: expected.

		            


]
