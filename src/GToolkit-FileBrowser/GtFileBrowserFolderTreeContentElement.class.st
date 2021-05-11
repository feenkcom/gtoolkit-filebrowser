Class {
	#name : #GtFileBrowserFolderTreeContentElement,
	#superclass : #BrVerticalPane,
	#traits : 'TGtWithFileBrowserFolderViewModel',
	#classTraits : 'TGtWithFileBrowserFolderViewModel classTrait',
	#instVars : [
		'tree'
	],
	#category : #'GToolkit-FileBrowser-Views'
}

{ #category : #initialization }
GtFileBrowserFolderTreeContentElement >> initialize [
	super initialize.

	self matchParent.

	tree := BrSimpleTree new.
	tree withoutSelection.
	tree nodeType: [ :aTypeFactory :eachFolderOrFileViewModel | eachFolderOrFileViewModel value objectName ].
	tree nodeStencil: [ :anItemType |
		anItemType = #folder
			ifTrue: [ GtFileBrowserListFolderElement new ]
			ifFalse: [ GtFileBrowserListFileElement new ] ].
	tree nodeDataBinder: [ :eachElement :eachFolderOrFileViewModel |
		eachFolderOrFileViewModel value objectName = #folder
			ifTrue: [ eachElement fileBrowserFolderViewModel: eachFolderOrFileViewModel value ]
			ifFalse: [ eachElement fileBrowserFileViewModel: eachFolderOrFileViewModel value ] ].

	self addChild: tree
]

{ #category : #'private - event handling' }
GtFileBrowserFolderTreeContentElement >> onContentChanged [
	| theFolders theFiles |
	
	theFolders := self fileBrowserFolderViewModel fileBrowserFoldersViewModel fileBrowserFolderViewModels asArray.
	theFolders sort: [ :a :b | a fileBrowserFolderModel fileReference basename asLowercase < b fileBrowserFolderModel fileReference basename asLowercase ].

	theFiles := self fileBrowserFolderViewModel fileBrowserFilesViewModel fileBrowserFileViewModels asArray.
	theFiles sort: [ :a :b | a fileBrowserFileModel fileReference basename asLowercase < b fileBrowserFileModel fileReference basename asLowercase ].

	tree items: theFolders, theFiles immediate: [ :eachNode |
		eachNode value objectName = #folder
			ifTrue: [ eachNode fileBrowserFoldersViewModel fileBrowserFolderViewModels asArray ]
			ifFalse: [ #() ] ]
]

{ #category : #'api - file browser folder view model' }
GtFileBrowserFolderTreeContentElement >> onFileBrowserFolderViewModelChanged [
	"Is sent when a new fileBrowserFolderViewModel is assigned to the receiver.
	Note: #onFileBrowserFolderViewModelChanged is sent before #subscribeToFileBrowserFolderViewModel
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostFileBrowserFolderViewModelChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
	
	self onContentChanged
]

{ #category : #'api - file browser folder view model' }
GtFileBrowserFolderTreeContentElement >> subscribeToFileBrowserFolderViewModel [
	"Is sent after a new fileBrowserFolderViewModel is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromFileBrowserFolderViewModel if the receiver subscribes to them"
	<modelSubscriber: #folder>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
	
	self fileBrowserFolderViewModel
		when: GtFileBrowserFolderViewModelAddedAnnouncement, GtFileBrowserFolderViewModelRemovedAnnouncement,
			GtFileBrowserFileViewModelAddedAnnouncement, GtFileBrowserFileViewModelRemovedAnnouncement
		send: #onContentChanged
		to: self
]

{ #category : #'api - file browser folder view model' }
GtFileBrowserFolderTreeContentElement >> unsubscribeFromFileBrowserFolderViewModel [
	"Is sent before a new fileBrowserFolderViewModel is assigned to the receiver.
	Objects that subscribe to fileBrowserFolderViewModel are required to implement this method."
	<modelUnsubscriber: #folder>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
	
	self fileBrowserFolderViewModel unsubscribe: self
]
