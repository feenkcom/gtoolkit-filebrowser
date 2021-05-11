Class {
	#name : #GtFileBrowserFolderTool,
	#superclass : #GtPhlowTool,
	#traits : 'TGtWithFileBrowserFolderViewModel',
	#classTraits : 'TGtWithFileBrowserFolderViewModel classTrait',
	#category : #'GToolkit-FileBrowser-Tools'
}

{ #category : #'instance creation' }
GtFileBrowserFolderTool class >> forFolder: aStringOrFileReference [
	| aFolderFileReference aFolderModel aFolderViewModel |
	
	aFolderFileReference := aStringOrFileReference asFileReference.
	self
		assert: [ aFolderFileReference isDirectory ]
		description: [ 'Folder tool can only be creater for a folder' ].
	
	aFolderModel := GtFileBrowserFolderModel new fileReference: aFolderFileReference.
	aFolderViewModel := GtFileBrowserFolderViewModel new fileBrowserFolderModel: aFolderModel.
	
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
