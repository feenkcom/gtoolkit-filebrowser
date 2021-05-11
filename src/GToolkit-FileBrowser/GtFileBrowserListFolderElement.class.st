"
I represent a file in a content list of a folder ${class:GtFileBrowserFolderElement}$
"
Class {
	#name : #GtFileBrowserListFolderElement,
	#superclass : #BrHorizontalPane,
	#traits : 'TGtWithFileBrowserFolderViewModel',
	#classTraits : 'TGtWithFileBrowserFolderViewModel classTrait',
	#instVars : [
		'icon',
		'label'
	],
	#category : #'GToolkit-FileBrowser-Views'
}

{ #category : #'private - instance creation' }
GtFileBrowserListFolderElement >> createIcon [
	^ BrGlamorousVectorIcons folder asElement
]

{ #category : #'private - instance creation' }
GtFileBrowserListFolderElement >> createLabel [
	^ BrLabel new
		aptitude: BrGlamorousLabelAptitude;
		beNormalSize
]

{ #category : #initialization }
GtFileBrowserListFolderElement >> initialize [
	super initialize.
	self alignCenterLeft.
	self hMatchParent.
	self vFitContent.
	self cellSpacing: 8.
	self addAptitude: BrGlamorousListItemAptitude.

	icon := self createIcon.
	label := self createLabel.
	
	self addChildren: { icon . label }.

	self addAptitude:
		(BrGlamorousWithContextMenuAptitude
			content: [ BrGlamorousSimpleContextMenuContent new
				items: {('Delete' -> [ :anEvent | self fileBrowserFolderViewModel fileBrowserFolderModel deleteFolder ])} ]).

	self
		when: BlClickEvent
		do: [ :anEvent |
			anEvent consumed: true.
			anEvent currentTarget fileBrowserFolderViewModel selectFolderWithoutOtherEntities ].

	self
		when: BlDoubleClickEvent
		do: [ :anEvent | 
			anEvent consumed: true.
			anEvent currentTarget phlow
				spawnTool: (GtPhlowCompositeTool new
					addTool: (GtFileBrowserFolderTool new fileBrowserFolderViewModel: self fileBrowserFolderViewModel);
					addTool: (GtInspectorTool forObject: self fileBrowserFolderViewModel fileBrowserFolderModel fileReference)) ]
]

{ #category : #'api - file browser folder view model' }
GtFileBrowserListFolderElement >> onFileBrowserFolderViewModelChanged [
	"Is sent when a new fileBrowserFolderViewModel is assigned to the receiver.
	Note: #onFileBrowserFolderViewModelChanged is sent before #subscribeToFileBrowserFolderViewModel
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostFileBrowserFolderViewModelChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
	
	label text: self fileBrowserFolderViewModel fileBrowserFolderModel fileReference basename.
	self updateFolderSelection
]

{ #category : #'api - file browser folder view model' }
GtFileBrowserListFolderElement >> subscribeToFileBrowserFolderViewModel [
	"Is sent after a new fileBrowserFolderViewModel is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromFileBrowserFolderViewModel if the receiver subscribes to them"
	<modelSubscriber: #folder>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
	
	self fileBrowserFolderViewModel
		when: GtFileBrowserSelectedFileViewModelChanged, GtFileBrowserSelectedFolderViewModelChanged,
				GtFileBrowserFileViewModelViewModelDeselected, GtFileBrowserFileViewModelViewModelSelected,
				GtFileBrowserFolderViewModelViewModelDeselected, GtFileBrowserFolderViewModelViewModelSelected
			send: #updateFolderSelection
			to: self
]

{ #category : #'api - file browser folder view model' }
GtFileBrowserListFolderElement >> unsubscribeFromFileBrowserFolderViewModel [
	"Is sent before a new fileBrowserFolderViewModel is assigned to the receiver.
	Objects that subscribe to fileBrowserFolderViewModel are required to implement this method."
	<modelUnsubscriber: #folder>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
	
	self fileBrowserFolderViewModel unsubscribe: self
]

{ #category : #'private - update' }
GtFileBrowserListFolderElement >> updateFolderSelection [
	
	self fileBrowserFolderViewModel isOnlySelectedFolder
		ifTrue: [ self states addState: BlElementState selected ]
		ifFalse: [ self states removeState: BlElementState selected ]
]
