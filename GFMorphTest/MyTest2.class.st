Class {
	#name : #MyTest2,
	#superclass : #SpPresenter,
	#instVars : [
		'button1',
		'button2',
		'radio1',
		'radio2',
		'radio3',
		'label1'
	],
	#category : #GFMorphTest
}

{ #category : #examples }
MyTest2 class >> example [
	^ self new open
]

{ #category : #accessing }
MyTest2 class >> title [
	^ 'My Test 2'
]

{ #category : #initialization }
MyTest2 >> connectPresenters [
	radio1 whenActivatedDo: [ self updateLabel ].
	radio1 whenDeactivatedDo: [ self updateLabel ].
	radio2 whenChangedDo: [ self updateLabel ].
	radio3 whenChangedDo: [ self updateLabel ]
]

{ #category : #layout }
MyTest2 >> defaultLayout [
	^ SpGridLayout build: [ :builder |
		builder
			beColumnHomogeneous;
			beRowHomogeneous;
			borderWidth: 3;
			add: button1;
			add: button2;
			nextRow;
			add: (SpBoxLayout newTopToBottom
				add: radio1 expand: false;
				add: radio2 expand: false;
				add: radio3 expand: false;
				yourself);
			nextRow;
			add: label1
	]

]

{ #category : #initialization }
MyTest2 >> initializePresenters [
	super initializePresenters.

	button1 := self newButton
		label: 'BUTTON1';
		action: [
			self inform: 'BUTTON1 CLICKED!'
		];
		yourself.
	button2 := self newButton label: 'CANCEL'.
	
	radio1 := self newRadioButton.
	radio2 := self newRadioButton.
	radio3 := self newRadioButton.
	label1 := self newLabel.
	radio1 associatedRadioButtons: { radio2. radio3 }.
	
	radio1 label: 'RADIO 1'.
	radio2 label: 'RADIO 2'.
	radio3 label: 'RADIO 3'.

	self updateLabel.

	self focusOrder
		add: button1;
		add: button2;
		add: radio1;
		add: radio2;
		add: radio3.

]

{ #category : #updating }
MyTest2 >> updateLabel [
	label1 label: (String streamContents: [ :s |
		{ radio1. radio2. radio3 } do: [ :each |
			s << each label; << ' : '; << (each state ifTrue: [ 'V' ] ifFalse: [ 'X' ])
		] separatedBy: [
			s << ' - '
		]
	])
]
