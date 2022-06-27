Class {
	#name : #MyTest,
	#superclass : #Object,
	#instVars : [
		'window',
		'button1'
	],
	#category : #GFMorphTest
}

{ #category : #accessing }
MyTest class >> start [
	<sampleInstance>
	^ self new start
]

{ #category : #'instance creation' }
MyTest >> newButton1 [
	^ button1 := (SimpleButtonMorph newWithLabel: 'Button1')
		topLeft: 10@50;
		target: self;
		actionSelector: #onButton1Click;
		yourself
]

{ #category : #'as yet unclassified' }
MyTest >> onButton1Click [
	self inform: 'Button1 clicked.'
]

{ #category : #accessing }
MyTest >> start [
	^ window := (StandardWindow new model: self)
		title: 'test window';
		addMorph: (self newButton1);
		openInWorld;
		yourself

]
