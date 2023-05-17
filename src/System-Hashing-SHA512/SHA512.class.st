Class {
	#name : #SHA512,
	#superclass : #HashFunction,
	#instVars : [
		'totalA',
		'totalB',
		'totalC',
		'totalD',
		'totalE',
		'totalF',
		'totalG',
		'totalH'
	],
	#category : #'System-Hashing-SHA512-SHA512'
}

{ #category : #accessing }
SHA512 class >> blockSize [
	^ 128
]

{ #category : #constants }
SHA512 class >> h0 [
	"2 raisedTo: 32 times the square root of the first 8 primes 2..19"
	"#(2 3 5 7 11 13 17 19) collect: [:x | ((x sqrt) * (2.0 raisedTo: 32)) truncated hex] // 32 bits"
	^16r6a09e667f3bcc908
]

{ #category : #constants }
SHA512 class >> h1 [
	"2 raisedTo: 32 times the square root of the first 8 primes 2..19"
	"#(2 3 5 7 11 13 17 19) collect: [:x | ((x sqrt) * (2.0 raisedTo: 32)) truncated hex] // 32 bits"
	^16rbb67ae8584caa73b
]

{ #category : #constants }
SHA512 class >> h2 [
	"2 raisedTo: 32 times the square root of the first 8 primes 2..19"
	"#(2 3 5 7 11 13 17 19) collect: [:x | ((x sqrt) * (2.0 raisedTo: 32)) truncated hex] // 32 bits"
	^16r3c6ef372fe94f82b
]

{ #category : #constants }
SHA512 class >> h3 [
	"2 raisedTo: 32 times the square root of the first 8 primes 2..19"
	"#(2 3 5 7 11 13 17 19) collect: [:x | ((x sqrt) * (2.0 raisedTo: 32)) truncated hex] // 32 bits"
	^16ra54ff53a5f1d36f1
]

{ #category : #constants }
SHA512 class >> h4 [
	"2 raisedTo: 32 times the square root of the first 8 primes 2..19"
	"#(2 3 5 7 11 13 17 19) collect: [:x | ((x sqrt) * (2.0 raisedTo: 32)) truncated hex] // 32 bits"
	^16r510e527fade682d1
]

{ #category : #constants }
SHA512 class >> h5 [
	"2 raisedTo: 32 times the square root of the first 8 primes 2..19"
	"#(2 3 5 7 11 13 17 19) collect: [:x | ((x sqrt) * (2.0 raisedTo: 32)) truncated hex] // 32 bits"
	^16r9b05688c2b3e6c1f
]

{ #category : #constants }
SHA512 class >> h6 [
	"2 raisedTo: 32 times the square root of the first 8 primes 2..19"
	"#(2 3 5 7 11 13 17 19) collect: [:x | ((x sqrt) * (2.0 raisedTo: 32)) truncated hex] // 32 bits"
	^16r1f83d9abfb41bd6b
]

{ #category : #constants }
SHA512 class >> h7 [
	"2 raisedTo: 32 times the square root of the first 8 primes 2..19"
	"#(2 3 5 7 11 13 17 19) collect: [:x | ((x sqrt) * (2.0 raisedTo: 32)) truncated hex] // 32 bits"
	^16r5be0cd19137e2179
]

{ #category : #accessing }
SHA512 class >> hashSize [
	^ 64
]

{ #category : #constants }
SHA512 class >> roundConstants [

	^ #( 16r428a2f98d728ae22 16r7137449123ef65cd 16rb5c0fbcfec4d3b2f
	     16re9b5dba58189dbbc 16r3956c25bf348b538 16r59f111f1b605d019
	     16r923f82a4af194f9b 16rab1c5ed5da6d8118 16rd807aa98a3030242
	     16r12835b0145706fbe 16r243185be4ee4b28c 16r550c7dc3d5ffb4e2
	     16r72be5d74f27b896f 16r80deb1fe3b1696b1 16r9bdc06a725c71235
	     16rc19bf174cf692694 16re49b69c19ef14ad2 16refbe4786384f25e3
	     16r0fc19dc68b8cd5b5 16r240ca1cc77ac9c65 16r2de92c6f592b0275
	     16r4a7484aa6ea6e483 16r5cb0a9dcbd41fbd4 16r76f988da831153b5
	     16r983e5152ee66dfab 16ra831c66d2db43210 16rb00327c898fb213f
	     16rbf597fc7beef0ee4 16rc6e00bf33da88fc2 16rd5a79147930aa725
	     16r06ca6351e003826f 16r142929670a0e6e70 16r27b70a8546d22ffc
	     16r2e1b21385c26c926 16r4d2c6dfc5ac42aed 16r53380d139d95b3df
	     16r650a73548baf63de 16r766a0abb3c77b2a8 16r81c2c92e47edaee6
	     16r92722c851482353b 16ra2bfe8a14cf10364 16ra81a664bbc423001
	     16rc24b8b70d0f89791 16rc76c51a30654be30 16rd192e819d6ef5218
	     16rd69906245565a910 16rf40e35855771202a 16r106aa07032bbd1b8
	     16r19a4c116b8d2d0c8 16r1e376c085141ab53 16r2748774cdf8eeb99
	     16r34b0bcb5e19b48a8 16r391c0cb3c5c95a63 16r4ed8aa4ae3418acb
	     16r5b9cca4f7763e373 16r682e6ff3d6b2b8a3 16r748f82ee5defb2fc
	     16r78a5636f43172f60 16r84c87814a1f0ab72 16r8cc702081a6439ec
	     16r90befffa23631e28 16ra4506cebde82bde9 16rbef9a3f7b2c67915
	     16rc67178f2e372532b 16rca273eceea26619c 16rd186b8c721c0c207
	     16reada7dd6cde0eb1e 16rf57d4f7fee6ed178 16r06f067aa72176fba
	     16r0a637dc5a2c898a6 16r113f9804bef90dae 16r1b710b35131c471b
	     16r28db77f523047d84 16r32caab7b40c72493 16r3c9ebe0a15c9bebc
	     16r431d67c49c100d4c 16r4cc5d4becb3e42b6 16r597f299cfc657e2a
	     16r5fcb6fab3ad6faec 16r6c44198c4a475817 )
]

{ #category : #accessing }
SHA512 >> expandDelta0: w [

	^ w copy
		  rightRotateBy: 1;
		  bitXor: (w copy rightRotateBy: 8);
		  bitXor: (w copy rightShift: 7)
]

{ #category : #accessing }
SHA512 >> expandDelta1: w [ 

	^ w copy rightRotateBy: 19;
		   bitXor: (w copy rightRotateBy: 61);
			bitXor: (w copy rightShift: 6).
]

{ #category : #private }
SHA512 >> expandedBlock: aByteArray [
	"Convert the given 64 byte buffer into 80 64-bit registers and answer the result." 
	| out src |
	out := Array new: 80.
	src := 1.
	1 to: 16 do: [:i |
		out at: i put: (SixtyFourBitRegister  new loadFrom: aByteArray at: src).
		src := src + 8].

	17 to: 80 do: [:t | | delta0 delta1 wt |
		delta0 := self expandDelta0: (out at: t - 15).
		delta1 := self expandDelta1: (out at: t - 2).
		wt := delta1 += ( out at: t-7 ) ;
		             += delta0;
		             += (out at: t-16) .
		out at: t put: wt].
	^ out
]

{ #category : #accessing }
SHA512 >> finalHash [
	"Concatenate the final totals to build the 512-bit integer result."
	"Details: If the primitives are supported, the results are in the totals array. Otherwise, they are in the instance variables totalA through totalE."

		^ (totalA copy asInteger bitShift: 448) +
		  (totalB copy asInteger bitShift: 384) +
		  (totalC copy asInteger bitShift: 320) +	
		  (totalD copy asInteger bitShift: 256) +
		  (totalE copy asInteger bitShift: 192) +
		  (totalF copy asInteger bitShift: 128) +
		  (totalG copy asInteger bitShift:  64) +
		  (totalH copy asInteger).
]

{ #category : #accessing }
SHA512 >> hashStream: aPositionableStream [
	"Hash the contents of the given stream from the current position to the end using SHA-512. The SHA-512 algorithm is defined in FIPS PUB 180-4."
	"SHA512 new hashStream: (ReadStream on: 'foo')"

	| startPosition buf bitLength |


	aPositionableStream atEnd ifTrue: [ self processFinalBuffer: #() bitLength: 0 ].

	startPosition := aPositionableStream position.
	[ aPositionableStream atEnd ] whileFalse: [
		buf := aPositionableStream next: 128 into: (ByteArray new: 128).
		(aPositionableStream atEnd not and: [ buf size = 128 ])
			ifTrue: [ self processBuffer: buf ]
			ifFalse: [
				bitLength := (aPositionableStream position - startPosition) * 8.
				self processFinalBuffer: buf bitLength: bitLength ] ].

	^self finalHash asByteArrayOfSize: 64
]

{ #category : #private }
SHA512 >> initialize [
	
	self initializeTotals.
]

{ #category : #private }
SHA512 >> initializeTotals [
	"Initialize totalA through totalE to their seed values."

	"total registers for use when primitives are absent"
	totalA := SixtyFourBitRegister new loadFrom: self class h0.
	totalB := SixtyFourBitRegister new loadFrom: self class h1.
	totalC := SixtyFourBitRegister new loadFrom: self class h2.
	totalD := SixtyFourBitRegister new loadFrom: self class h3.
	totalE := SixtyFourBitRegister new loadFrom: self class h4.
	totalF := SixtyFourBitRegister new loadFrom: self class h5.
	totalG := SixtyFourBitRegister new loadFrom: self class h6.
	totalH := SixtyFourBitRegister new loadFrom: self class h7.

]

{ #category : #private }
SHA512 >> processBuffer: aByteArray [
	"Process given 64-byte buffer, accumulating the results in totalA through totalE."

	| a b c d e f g h w |

	"initialize registers a through e from the current totals" 
	a := totalA copy.
	b := totalB copy.
	c := totalC copy.
	d := totalD copy.
	e := totalE copy.
	f := totalF copy.
	g := totalG copy.
	h := totalH copy.

	"expand and process the buffer"
	w := self expandedBlock: aByteArray.
	1 to: 80 do: [:i | | s0 maj t1 s1 ch t2 |
		s0 := (a copy rightRotateBy: 28).
		s0 bitXor: (a copy rightRotateBy: 34);
			bitXor: (a copy rightRotateBy: 39).
		maj := (a copy bitAnd: b).
		maj bitXor: (c copy bitAnd: a);
			bitXor: (b copy bitAnd: c).	
		t2 := s0 copy += maj.
		
		s1 := (e copy rightRotateBy: 14).
		s1 bitXor: (e copy rightRotateBy: 18);
			bitXor: (e copy rightRotateBy: 41).
		ch := (e copy bitAnd: f).
		ch bitXor: ((e copy bitInvert) bitAnd: 	g).
		t1 := h copy += s1 += ch += (SixtyFourBitRegister  new load: (self class roundConstants at: i)) += (w at: i) copy. 
		
		h := g.
		g := f.
		f := e.
		e := d copy += t1.
		d := c.
		c := b.
		b := a.
		a := t1 += t2.
	].

	"add a through h into total accumulators"
	totalA += a.
	totalB += b.
	totalC += c.
	totalD += d.
	totalE += e.
	totalF += f.
	totalG += g.
	totalH += h.
]

{ #category : #private }
SHA512 >> processFinalBuffer: buffer bitLength: bitLength [
	"Process given buffer, whose length may be <= 64bytes, accumulating the results in totalA through totalE. Also process the final padding bits and length."

	| out |
	out := ByteArray new: 128.
	out replaceFrom: 1 to: buffer size with: buffer startingAt: 1.
	buffer size < 112 ifTrue: [  "padding and length fit in last data block"
		out at: buffer size + 1 put: 16r80.  "trailing one bit"
		self storeLength: bitLength in: out.  "end with length"
		self processBuffer: out.
		^ self].

	"process the final data block"
	buffer size < 128 ifTrue: [
		out at: buffer size + 1 put: 16r80].  "trailing one bit"
	self processBuffer: out.

	"process one additional block of padding ending with the length"
	out := ByteArray new: 128.  "filled with zeros"
	buffer size = 128 ifTrue: [
		"add trailing one bit that didn't fit in final data block"
		out at: 1 put: 16r80].
	self storeLength: bitLength in: out.
	self processBuffer: out.
]

{ #category : #private }
SHA512 >> storeLength: bitLength in: aByteArray [
	"Fill in the final 16 bytes of the given ByteArray with a 128-bit big-endian representation of the original message length in bits."

	| n i |
	n := bitLength.
	i := aByteArray size.
	[n > 0] whileTrue: [
		aByteArray at: i put: (n bitAnd: 16rFF).
		n := n bitShift: -8.
		i := i - 1].
]
