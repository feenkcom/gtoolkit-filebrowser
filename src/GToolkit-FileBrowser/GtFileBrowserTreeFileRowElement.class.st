Class {
	#name : #GtFileBrowserTreeFileRowElement,
	#superclass : #BrHorizontalPane,
	#traits : 'TGtWithFileBrowserFileViewModel',
	#classTraits : 'TGtWithFileBrowserFileViewModel classTrait',
	#category : #'GToolkit-FileBrowser-Views'
}

{ #category : #'private - instance creation' }
GtFileBrowserTreeFileRowElement >> createPhlowFileTool [
	^ GtPhlowCompositeTool new
		addTool: (GtInspectorTool forObject: self fileBrowserFileViewModel fileBrowserFileModel fileReference)
]

{ #category : #accessing }
GtFileBrowserTreeFileRowElement >> fileBrowserTreeNode: aBrTreeNode [
	self fileBrowserFileViewModel: aBrTreeNode value
]

{ #category : #initialization }
GtFileBrowserTreeFileRowElement >> initialize [
	super initialize.
	
	self addAptitude: BrGlamorousListItemAptitude.
	
	self hMatchParent.
	self vFitContent.
	
	self
		when: BlClickEvent
		do: [ :anEvent |
			anEvent consumed: true.
			anEvent currentTarget fileBrowserFileViewModel selectFileWithoutOtherEntities ].

	self
		when: BlDoubleClickEvent
		do: [ :anEvent |
			anEvent consumed: true.
			anEvent currentTarget phlow spawnTool: self createPhlowFileTool ]
]

{ #category : #'api - file browser file view model' }
GtFileBrowserTreeFileRowElement >> onFileBrowserFileViewModelChanged [
	"Is sent when a new fileBrowserFileViewModel is assigned to the receiver.
	Note: #onFileBrowserFileViewModelChanged is sent before #subscribeToFileBrowserFileViewModel
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostFileBrowserFileViewModelChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
	
	self updateFileSelection
]

{ #category : #'api - file browser file view model' }
GtFileBrowserTreeFileRowElement >> subscribeToFileBrowserFileViewModel [
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
GtFileBrowserTreeFileRowElement >> unsubscribeFromFileBrowserFileViewModel [
	"Is sent before a new fileBrowserFileViewModel is assigned to the receiver.
	Objects that subscribe to fileBrowserFileViewModel are required to implement this method."
	<modelUnsubscriber: #file>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
	
	self fileBrowserFileViewModel unsubscribe: self
]

{ #category : #'private - update' }
GtFileBrowserTreeFileRowElement >> updateFileSelection [
	
	self fileBrowserFileViewModel isOnlySelectedFile
		ifTrue: [ self states addState: BlElementState selected ]
		ifFalse: [ self states removeState: BlElementState selected ].
		
	self fileBrowserFileViewModel isOnlySelectedFile
		ifTrue: [ self phlow selectTool: self createPhlowFileTool ]
]
