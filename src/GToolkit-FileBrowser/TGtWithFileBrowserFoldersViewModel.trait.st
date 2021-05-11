Trait {
	#name : #TGtWithFileBrowserFoldersViewModel,
	#instVars : [
		'fileBrowserFoldersViewModel'
	],
	#category : #'GToolkit-FileBrowser-Support'
}

{ #category : #'api - file browser folders view model' }
TGtWithFileBrowserFoldersViewModel >> fileBrowserFoldersViewModel [
	"Return a not-null fileBrowserFoldersViewModel assigned to the receiver"
	<modelGetter: #folders>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ fileBrowserFoldersViewModel notNil ]
		description: [ 'fileBrowserFoldersViewModel should be initialized' ].

	^ fileBrowserFoldersViewModel
]

{ #category : #'api - file browser folders view model' }
TGtWithFileBrowserFoldersViewModel >> fileBrowserFoldersViewModel: aFileBrowserFoldersViewModel [
	"Set a not-null fileBrowserFoldersViewModel assigned to the receiver"
	<modelSetter: #folders>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aFileBrowserFoldersViewModel notNil ]
		description: [ 'fileBrowserFoldersViewModel must not be nil' ].

	fileBrowserFoldersViewModel == aFileBrowserFoldersViewModel
		ifTrue: [ ^ self ].

	fileBrowserFoldersViewModel ifNotNil: [ self unsubscribeFromFileBrowserFoldersViewModel ].
	fileBrowserFoldersViewModel := aFileBrowserFoldersViewModel.

	self onFileBrowserFoldersViewModelChanged.
	self subscribeToFileBrowserFoldersViewModel.
	self onPostFileBrowserFoldersViewModelChanged
]

{ #category : #'api - file browser folders view model' }
TGtWithFileBrowserFoldersViewModel >> hasFileBrowserFoldersViewModel [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<modelTester: #folders>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ fileBrowserFoldersViewModel notNil
]

{ #category : #'api - file browser folders view model' }
TGtWithFileBrowserFoldersViewModel >> onFileBrowserFoldersViewModelChanged [
	"Is sent when a new fileBrowserFoldersViewModel is assigned to the receiver.
	Note: #onFileBrowserFoldersViewModelChanged is sent before #subscribeToFileBrowserFoldersViewModel
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostFileBrowserFoldersViewModelChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : #'api - file browser folders view model' }
TGtWithFileBrowserFoldersViewModel >> onPostFileBrowserFoldersViewModelChanged [
	"I am an optional hook method that is sent after #subscribeToFileBrowserFoldersViewModel.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : #'api - file browser folders view model' }
TGtWithFileBrowserFoldersViewModel >> subscribeToFileBrowserFoldersViewModel [
	"Is sent after a new fileBrowserFoldersViewModel is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromFileBrowserFoldersViewModel if the receiver subscribes to them"
	<modelSubscriber: #folders>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : #'api - file browser folders view model' }
TGtWithFileBrowserFoldersViewModel >> unsubscribeFromFileBrowserFoldersViewModel [
	"Is sent before a new fileBrowserFoldersViewModel is assigned to the receiver.
	Objects that subscribe to fileBrowserFoldersViewModel are required to implement this method."
	<modelUnsubscriber: #folders>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]
