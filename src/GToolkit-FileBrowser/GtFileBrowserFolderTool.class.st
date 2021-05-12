Class {
	#name : #GtFileBrowserFolderTool,
	#superclass : #GtPhlowTool,
	#traits : 'TGtWithFileBrowserFolderViewModel',
	#classTraits : 'TGtWithFileBrowserFolderViewModel classTrait',
	#category : #'GToolkit-FileBrowser-Tools'
}

{ #category : #'instance creation' }
GtFileBrowserFolderTool class >> forFolder: aStringOrFileReference [
	| aFolderFileReference aFolderModel |
	
	aFolderFileReference := aStringOrFileReference asFileReference.
	self
		assert: [ aFolderFileReference isDirectory ]
		description: [ 'Folder tool can only be creater for a folder' ].
	
	aFolderModel := GtFileBrowserFolderModel new fileReference: aFolderFileReference.
	^ self forFolderModel: aFolderModel
]

{ #category : #'instance creation' }
GtFileBrowserFolderTool class >> forFolderModel: aGtFileBrowserFolderModel [
	| aFolderViewModel |
	
	aFolderViewModel := GtFileBrowserFolderViewModel new
		fileBrowserFolderModel: aGtFileBrowserFolderModel.
	
	^ self new fileBrowserFolderViewModel: aFolderViewModel
]

{ #category : #'api - converting' }
GtFileBrowserFolderTool >> asElementDo: aOneArgBlock [
	"Create a tool element and execute the block."
	| aFolderElement |
	
	aFolderElement := GtFileBrowserFolderElement new
		fileBrowserFolderViewModel: self fileBrowserFolderViewModel.
	
	^ aOneArgBlock cull: aFolderElement cull: self
]
