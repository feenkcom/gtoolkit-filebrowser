Class {
	#name : #GtFileBrowserTreeFolderRowElement,
	#superclass : #BrHorizontalPane,
	#traits : 'TGtWithFileBrowserFolderViewModel',
	#classTraits : 'TGtWithFileBrowserFolderViewModel classTrait',
	#category : #'GToolkit-FileBrowser-Views'
}

{ #category : #'private - instance creation' }
GtFileBrowserTreeFolderRowElement >> createPhlowFolderTool [
	^ GtPhlowCompositeTool new
		addTool: (GtFileBrowserFolderTool forFolderModel: self fileBrowserFolderViewModel fileBrowserFolderModel);
		addTool: (GtInspectorTool forObject: self fileBrowserFolderViewModel fileBrowserFolderModel fileReference)
]

{ #category : #accessing }
GtFileBrowserTreeFolderRowElement >> fileBrowserTreeNode: aBrTreeNode [
	self fileBrowserFolderViewModel: aBrTreeNode value
]

{ #category : #initialization }
GtFileBrowserTreeFolderRowElement >> initialize [
	super initialize.
	
	self addAptitude: BrGlamorousListItemAptitude.
	
	self hMatchParent.
	self vFitContent.
	
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
			anEvent currentTarget phlow spawnTool: self createPhlowFolderTool ]
]

{ #category : #'api - file browser folder view model' }
GtFileBrowserTreeFolderRowElement >> onFileBrowserFolderViewModelChanged [
	"Is sent when a new fileBrowserFolderViewModel is assigned to the receiver.
	Note: #onFileBrowserFolderViewModelChanged is sent before #subscribeToFileBrowserFolderViewModel
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostFileBrowserFolderViewModelChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
	
	self updateFolderSelection
]

{ #category : #'api - file browser folder view model' }
GtFileBrowserTreeFolderRowElement >> subscribeToFileBrowserFolderViewModel [
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
GtFileBrowserTreeFolderRowElement >> unsubscribeFromFileBrowserFolderViewModel [
	"Is sent before a new fileBrowserFolderViewModel is assigned to the receiver.
	Objects that subscribe to fileBrowserFolderViewModel are required to implement this method."
	<modelUnsubscriber: #folder>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
	
	self fileBrowserFolderViewModel unsubscribe: self
]

{ #category : #'private - update' }
GtFileBrowserTreeFolderRowElement >> updateFolderSelection [
	
	self fileBrowserFolderViewModel isOnlySelectedFolder
		ifTrue: [ self states addState: BlElementState selected ]
		ifFalse: [ self states removeState: BlElementState selected ].
		
	self fileBrowserFolderViewModel isOnlySelectedFolder
		ifTrue: [ self phlow selectTool: self createPhlowFolderTool ]
]
