Class {
	#name : #GtFileBrowserFolderTool,
	#superclass : #GtPhlowTool,
	#traits : 'TGtWithFileBrowserFolderViewModel',
	#classTraits : 'TGtWithFileBrowserFolderViewModel classTrait',
	#category : #'GToolkit-FileBrowser-Tools'
}

{ #category : #'instance creation' }
GtFileBrowserFolderTool class >> forFolder: aStringOrFileReference [
	| aFolderFileReference aFolderModel aRootFolder aRootFolderModel |

	aFolderFileReference := aStringOrFileReference asFileReference.
	self
		assert: [ aFolderFileReference isDirectory ]
		description: [ 'Folder tool can only be creater for a folder' ].
	
	aRootFolder := Path root asFileReference.
	aRootFolderModel := GtFileBrowserFolderModel new fileReference: aRootFolder.
	aFolderModel := aRootFolderModel.

	aFolderFileReference asAbsolute withParents allButFirstDo: [ :eachPath |
		aFolderModel := aFolderModel fileBrowserFoldersModel findFileBrowserFolderModel: eachPath asFileReference.
		aFolderModel ifNil: [ self error: 'Not able to read the path to the given folder' ] ].

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
	
	aFolderElement := GtFileBrowserDirectoryElement new
		fileBrowserFolderViewModel: self fileBrowserFolderViewModel.
	
	^ aOneArgBlock cull: aFolderElement cull: self
]

{ #category : #accessing }
GtFileBrowserFolderTool >> icon [
	<return: #BlElement>
	^ BrGlamorousVectorIcons folder
]

{ #category : #accessing }
GtFileBrowserFolderTool >> tabLook [
	^ BrGlamorousTabSwitcherWithIconAptitude
]
