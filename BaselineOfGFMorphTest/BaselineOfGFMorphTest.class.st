Class {
	#name : #BaselineOfGFMorphTest,
	#superclass : #BaselineOf,
	#category : #BaselineOfGFMorphTest
}

{ #category : #baselines }
BaselineOfGFMorphTest >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec package: 'GFMorphTest'
		]
]

{ #category : #accessing }
BaselineOfGFMorphTest >> projectClass [
	^ MetacelloCypressBaselineProject
]
