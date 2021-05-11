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
	^ BrGlamorousVectorIcons clipboard asElement
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
	self cellSpacing: 8.
	self addAptitude: BrGlamorousListItemAptitude.
	
	icon := self createIcon.
	label := self createLabel.
	
	self addChildren: { icon . label }.
	
	self
		when: BlDoubleClickEvent
		do: [ :anEvent |
			anEvent consumed: true.
			anEvent currentTarget phlow spawnTool: (GtPhlowCompositeTool new
				addTool: (GtInspectorTool forObject: self fileBrowserFileViewModel)) ].
]

{ #category : #'api - file browser file view model' }
GtFileBrowserListFileElement >> onFileBrowserFileViewModelChanged [
	"Is sent when a new fileBrowserFileViewModel is assigned to the receiver.
	Note: #onFileBrowserFileViewModelChanged is sent before #subscribeToFileBrowserFileViewModel
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostFileBrowserFileViewModelChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
	
	label text: self fileBrowserFileViewModel fileBrowserFileModel fileReference basename
]
