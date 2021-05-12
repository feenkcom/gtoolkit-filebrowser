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

{ #category : #private }
GtFileBrowserFolderTreeContentElement >> getContentsOfFolder: aGtFileBrowserFolderModel [
	| theFolders theFiles |

	theFolders := aGtFileBrowserFolderModel fileBrowserFoldersViewModel fileBrowserFolderViewModels asArray.
	theFolders sort: [ :a :b | a fileBrowserFolderModel fileReference basename asLowercase < b fileBrowserFolderModel fileReference basename asLowercase ].

	theFiles := aGtFileBrowserFolderModel fileBrowserFilesViewModel fileBrowserFileViewModels asArray.
	theFiles sort: [ :a :b | a fileBrowserFileModel fileReference basename asLowercase < b fileBrowserFileModel fileReference basename asLowercase ].
	
	^ theFolders, theFiles
]

{ #category : #initialization }
GtFileBrowserFolderTreeContentElement >> initialize [
	super initialize.

	self matchParent.

	tree := BrColumnedTree new.
	tree nodeType: [ :aTypeFactory :eachFolderOrFileViewModel | eachFolderOrFileViewModel value objectName ].

	tree column
		title: 'Name';
		cellStencil: [ :anItemType |
			anItemType = #folder
				ifTrue: [ GtFileBrowserListFolderElement new ]
				ifFalse: [ GtFileBrowserListFileElement new ] ];
		dataBinder: [ :eachElement :eachFolderOrFileViewModel |
			eachFolderOrFileViewModel value isFileBrowserFolderViewModel
				ifTrue: [ eachElement fileBrowserFolderViewModel: eachFolderOrFileViewModel value ]
				ifFalse: [ eachElement fileBrowserFileViewModel: eachFolderOrFileViewModel value ] ].
			
	tree column
		title: 'Size';
		cellStencil: [ :anItemType |
			BrLabel new
				hMatchParent;
				aptitude: (BrGlamorousLabelAptitude new foreground: Color gray) ];
		dataBinder: [ :eachElement :eachFolderOrFileViewModel |
			| eachSize |
			eachSize := eachFolderOrFileViewModel value isFileBrowserFileViewModel
				ifTrue: [
					| eachFileReference |
					eachFileReference := eachFolderOrFileViewModel value fileBrowserFileModel fileReference.
					[ eachFileReference humanReadableSize asString ]
						on: FileException, FileSystemError
						do: [ :anException | anException return: '' ] ]
				ifFalse: [ '' ].			
			eachElement text: eachSize ].
		
	tree column
		title: 'Creation';
		cellStencil: [ :anItemType |
			BrLabel new
				hMatchParent;
				aptitude: (BrGlamorousLabelAptitude new foreground: Color gray) ];
		dataBinder: [ :eachElement :eachFolderOrFileViewModel |
			| eachFileReference eachCreation |
			eachFileReference := eachFolderOrFileViewModel value isFileBrowserFolderViewModel
				ifTrue: [ eachFolderOrFileViewModel value fileBrowserFolderModel fileReference ]
				ifFalse: [ eachFolderOrFileViewModel value fileBrowserFileModel fileReference ].
			
			eachCreation := [ String
					streamContents: [ :s | 
						eachFileReference creationTime printYMDOn: s.
						s nextPut: Character space.
						eachFileReference creationTime printHMSOn: s ] ]
				on: FileException, FileSystemError
				do: [ :anException | anException return: '' ].
			
			eachElement text: eachCreation ].

	self addChild: tree
]

{ #category : #'private - event handling' }
GtFileBrowserFolderTreeContentElement >> onContentChanged [
	tree items: (self getContentsOfFolder: self fileBrowserFolderViewModel) lazy: [ :eachNode |
		eachNode value objectName = #folder
			ifTrue: [ self getContentsOfFolder: eachNode ]
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
