Class {
	#name : #GtFileBrowserListFileElement,
	#superclass : #BrHorizontalPane,
	#traits : 'TGtWithFileBrowserFileViewModel',
	#classTraits : 'TGtWithFileBrowserFileViewModel classTrait',
	#instVars : [
		'icon',
		'label'
	],
	#category : #'GToolkit-FileBrowser-Views'
}

{ #category : #'private - instance creation' }
GtFileBrowserListFileElement >> createIcon [
	^ BrGlamorousIcons file asElement
]

{ #category : #'private - instance creation' }
GtFileBrowserListFileElement >> createLabel [
	^ BrLabel new
		aptitude: BrGlamorousLabelAptitude;
		beNormalSize
]

{ #category : #initialization }
GtFileBrowserListFileElement >> initialize [
	super initialize.

	self alignCenterLeft.
	self hMatchParent.
	self vFitContent.
	self cellSpacing: 3.
	self addAptitude: BrGlamorousListItemAptitude.
	
	icon := self createIcon.
	label := self createLabel.
	
	self addChildren: { icon . label }.
	
	self
		when: BlClickEvent
		do: [ :anEvent |
			anEvent consumed: true.
			anEvent currentTarget fileBrowserFileViewModel selectFileWithoutOtherEntities ].

	self
		when: BlDoubleClickEvent
		do: [ :anEvent |
			anEvent consumed: true.
			anEvent currentTarget phlow spawnTool: (GtPhlowCompositeTool new
				addTool: (GtInspectorTool forObject: self fileBrowserFileViewModel fileBrowserFileModel fileReference)) ].
]

{ #category : #'api - file browser file view model' }
GtFileBrowserListFileElement >> onFileBrowserFileViewModelChanged [
	"Is sent when a new fileBrowserFileViewModel is assigned to the receiver.
	Note: #onFileBrowserFileViewModelChanged is sent before #subscribeToFileBrowserFileViewModel
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostFileBrowserFileViewModelChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
	
	label text: self fileBrowserFileViewModel fileBrowserFileModel fileReference basename.
	self updateFileSelection
]

{ #category : #'api - file browser file view model' }
GtFileBrowserListFileElement >> subscribeToFileBrowserFileViewModel [
	"Is sent after a new fileBrowserFileViewModel is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromFileBrowserFileViewModel if the receiver subscribes to them"
	<modelSubscriber: #file>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
	
	self fileBrowserFileViewModel
		when: GtFileBrowserSelectedFileViewModelChanged, GtFileBrowserSelectedFolderViewModelChanged,
				GtFileBrowserFileViewModelViewModelDeselected, GtFileBrowserFileViewModelViewModelSelected,
				GtFileBrowserFolderViewModelViewModelDeselected, GtFileBrowserFolderViewModelViewModelSelected
			send: #updateFileSelection
			to: self
]

{ #category : #'api - file browser file view model' }
GtFileBrowserListFileElement >> unsubscribeFromFileBrowserFileViewModel [
	"Is sent before a new fileBrowserFileViewModel is assigned to the receiver.
	Objects that subscribe to fileBrowserFileViewModel are required to implement this method."
	<modelUnsubscriber: #file>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
	
	self fileBrowserFileViewModel unsubscribe: self
]

{ #category : #'private - update' }
GtFileBrowserListFileElement >> updateFileSelection [
	
	self fileBrowserFileViewModel isOnlySelectedFile
		ifTrue: [ self states addState: BlElementState selected ]
		ifFalse: [ self states removeState: BlElementState selected ]
]
