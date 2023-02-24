Class {
	#name : #BaselineOfSystemHashingSHA512,
	#superclass : #BaselineOf,
	#category : #BaselineOfSystemHashingSHA512
}

{ #category : #baselines }
BaselineOfSystemHashingSHA512 >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			"Dependencies"
			
			
			"Packages"
			spec
				package: 'System-Hashing-SHA512'  ]
]
