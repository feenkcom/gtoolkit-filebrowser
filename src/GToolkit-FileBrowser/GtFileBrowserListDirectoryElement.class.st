"
I represent a file in a content list of a folder {{gtClass:GtFileBrowserDirectoryElement}}


"
Class {
	#name : #GtFileBrowserListDirectoryElement,
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
GtFileBrowserListDirectoryElement >> createIcon [
	^ BrGlamorousVectorIcons folder asElement
]

{ #category : #'private - instance creation' }
GtFileBrowserListDirectoryElement >> createLabel [
	^ BrLabel new
		aptitude: BrGlamorousLabelAptitude;
		beNormalSize
]

{ #category : #initialization }
GtFileBrowserListDirectoryElement >> initialize [
	super initialize.
	self alignCenterLeft.
	self hMatchParent.
	self vFitContent.
	self cellSpacing: 3.

	icon := self createIcon.
	label := self createLabel.
	
	self addChildren: { icon . label }.

	
]

{ #category : #'api - file browser folder view model' }
GtFileBrowserListDirectoryElement >> onFileBrowserFolderViewModelChanged [
	"Is sent when a new fileBrowserFolderViewModel is assigned to the receiver.
	Note: #onFileBrowserFolderViewModelChanged is sent before #subscribeToFileBrowserFolderViewModel
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostFileBrowserFolderViewModelChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
	
	label text: self fileBrowserFolderViewModel fileBrowserFolderModel fileReference basename
]
