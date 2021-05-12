Class {
	#name : #GtFileBrowserFolderElement,
	#superclass : #BrVerticalPane,
	#traits : 'TGtWithFileBrowserFolderViewModel',
	#classTraits : 'TGtWithFileBrowserFolderViewModel classTrait',
	#instVars : [
		'toolbar',
		'content'
	],
	#category : #'GToolkit-FileBrowser-Views'
}

{ #category : #'private - instance creation' }
GtFileBrowserFolderElement >> createFolderContent [
	^ GtFileBrowserFolderTreeContentElement new
]

{ #category : #'private - instance creation' }
GtFileBrowserFolderElement >> createFolderToolbar [
	^ GtFileBrowserFolderToolbarElement new
]

{ #category : #initialization }
GtFileBrowserFolderElement >> initialize [
	super initialize.
	
	self matchParent.
	self background: Color white.
	
	self padding: (BlInsets all: 10).

	toolbar := self createFolderToolbar. 
	toolbar
		hMatchParent
		vFitContent;
		margin: (BlInsets top: 0 left: 13 bottom: 15 right: 0).
	content := self createFolderContent.
	content matchParent.
	
	self addChildren: { 
		toolbar.
		content
	}
]

{ #category : #'api - file browser folder view model' }
GtFileBrowserFolderElement >> onFileBrowserFolderViewModelChanged [
	"Is sent when a new fileBrowserFolderViewModel is assigned to the receiver.
	Note: #onFileBrowserFolderViewModelChanged is sent before #subscribeToFileBrowserFolderViewModel
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostFileBrowserFolderViewModelChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
	
	toolbar fileBrowserFolderViewModel: self fileBrowserFolderViewModel.
	content fileBrowserFolderViewModel: self fileBrowserFolderViewModel
]
