Class {
	#name : #BaseloneOfSystemHashingSHA512,
	#superclass : #BaselineOf,
	#category : #BaselineOfSystemHashingSHA512
}

{ #category : #baselines }
BaseloneOfSystemHashingSHA512 >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			"Dependencies"
			
			
			"Packages"
			spec
				package: 'System-Hashing-SHA512'  ]
]
