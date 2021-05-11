Trait {
	#name : #TGtWithFileBrowserFolderViewModel,
	#instVars : [
		'fileBrowserFolderViewModel'
	],
	#category : #'GToolkit-FileBrowser-Support'
}

{ #category : #'api - file browser folder view model' }
TGtWithFileBrowserFolderViewModel >> fileBrowserFolderViewModel [
	"Return a not-null fileBrowserFolderViewModel assigned to the receiver"
	<modelGetter: #folder>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ fileBrowserFolderViewModel notNil ]
		description: [ 'fileBrowserFolderViewModel should be initialized' ].

	^ fileBrowserFolderViewModel
]

{ #category : #'api - file browser folder view model' }
TGtWithFileBrowserFolderViewModel >> fileBrowserFolderViewModel: aFileBrowserFolderViewModel [
	"Set a not-null fileBrowserFolderViewModel assigned to the receiver"
	<modelSetter: #folder>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aFileBrowserFolderViewModel notNil ]
		description: [ 'fileBrowserFolderViewModel must not be nil' ].

	fileBrowserFolderViewModel == aFileBrowserFolderViewModel
		ifTrue: [ ^ self ].

	fileBrowserFolderViewModel ifNotNil: [ self unsubscribeFromFileBrowserFolderViewModel ].
	fileBrowserFolderViewModel := aFileBrowserFolderViewModel.

	self onFileBrowserFolderViewModelChanged.
	self subscribeToFileBrowserFolderViewModel.
	self onPostFileBrowserFolderViewModelChanged
]

{ #category : #'api - file browser folder view model' }
TGtWithFileBrowserFolderViewModel >> hasFileBrowserFolderViewModel [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<modelTester: #folder>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ fileBrowserFolderViewModel notNil
]

{ #category : #'api - file browser folder view model' }
TGtWithFileBrowserFolderViewModel >> onFileBrowserFolderViewModelChanged [
	"Is sent when a new fileBrowserFolderViewModel is assigned to the receiver.
	Note: #onFileBrowserFolderViewModelChanged is sent before #subscribeToFileBrowserFolderViewModel
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostFileBrowserFolderViewModelChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : #'api - file browser folder view model' }
TGtWithFileBrowserFolderViewModel >> onPostFileBrowserFolderViewModelChanged [
	"I am an optional hook method that is sent after #subscribeToFileBrowserFolderViewModel.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : #'api - file browser folder view model' }
TGtWithFileBrowserFolderViewModel >> subscribeToFileBrowserFolderViewModel [
	"Is sent after a new fileBrowserFolderViewModel is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromFileBrowserFolderViewModel if the receiver subscribes to them"
	<modelSubscriber: #folder>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : #'api - file browser folder view model' }
TGtWithFileBrowserFolderViewModel >> unsubscribeFromFileBrowserFolderViewModel [
	"Is sent before a new fileBrowserFolderViewModel is assigned to the receiver.
	Objects that subscribe to fileBrowserFolderViewModel are required to implement this method."
	<modelUnsubscriber: #folder>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]
