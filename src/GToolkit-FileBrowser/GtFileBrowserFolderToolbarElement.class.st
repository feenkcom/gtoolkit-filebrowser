Class {
	#name : #GtFileBrowserFolderToolbarElement,
	#superclass : #BrHorizontalPane,
	#traits : 'TGtWithFileBrowserFolderViewModel',
	#classTraits : 'TGtWithFileBrowserFolderViewModel classTrait',
	#instVars : [
		'addButton'
	],
	#category : #'GToolkit-FileBrowser-Views'
}

{ #category : #initialization }
GtFileBrowserFolderToolbarElement >> initialize [
	super initialize.
	
	self addChild: (BlElement new
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical exact: 0 ]).

	addButton := BrButton new
		aptitude: BrGlamorousButtonWithIconAptitude + BrGlamorousButtonWithLabelTooltipAptitude;
		label: 'New folder';
		icon: BrGlamorousVectorIcons add;
		action: [
			self hasFileBrowserFolderViewModel
				ifTrue: [ self fileBrowserFolderViewModel fileBrowserFolderModel addNewFolder ] ].

	self addChild: addButton
]
