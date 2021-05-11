Trait {
	#name : #TGtWithFileBrowserFilesViewModel,
	#instVars : [
		'fileBrowserFilesViewModel'
	],
	#category : #'GToolkit-FileBrowser-Support'
}

{ #category : #'api - file browser files view model' }
TGtWithFileBrowserFilesViewModel >> fileBrowserFilesViewModel [
	"Return a not-null fileBrowserFilesViewModel assigned to the receiver"
	<modelGetter: #files>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ fileBrowserFilesViewModel notNil ]
		description: [ 'fileBrowserFilesViewModel should be initialized' ].

	^ fileBrowserFilesViewModel
]

{ #category : #'api - file browser files view model' }
TGtWithFileBrowserFilesViewModel >> fileBrowserFilesViewModel: aFileBrowserFilesViewModel [
	"Set a not-null fileBrowserFilesViewModel assigned to the receiver"
	<modelSetter: #files>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aFileBrowserFilesViewModel notNil ]
		description: [ 'fileBrowserFilesViewModel must not be nil' ].

	fileBrowserFilesViewModel == aFileBrowserFilesViewModel
		ifTrue: [ ^ self ].

	fileBrowserFilesViewModel ifNotNil: [ self unsubscribeFromFileBrowserFilesViewModel ].
	fileBrowserFilesViewModel := aFileBrowserFilesViewModel.

	self onFileBrowserFilesViewModelChanged.
	self subscribeToFileBrowserFilesViewModel.
	self onPostFileBrowserFilesViewModelChanged
]

{ #category : #'api - file browser files view model' }
TGtWithFileBrowserFilesViewModel >> hasFileBrowserFilesViewModel [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<modelTester: #files>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ fileBrowserFilesViewModel notNil
]

{ #category : #'api - file browser files view model' }
TGtWithFileBrowserFilesViewModel >> onFileBrowserFilesViewModelChanged [
	"Is sent when a new fileBrowserFilesViewModel is assigned to the receiver.
	Note: #onFileBrowserFilesViewModelChanged is sent before #subscribeToFileBrowserFilesViewModel
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostFileBrowserFilesViewModelChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : #'api - file browser files view model' }
TGtWithFileBrowserFilesViewModel >> onPostFileBrowserFilesViewModelChanged [
	"I am an optional hook method that is sent after #subscribeToFileBrowserFilesViewModel.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : #'api - file browser files view model' }
TGtWithFileBrowserFilesViewModel >> subscribeToFileBrowserFilesViewModel [
	"Is sent after a new fileBrowserFilesViewModel is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromFileBrowserFilesViewModel if the receiver subscribes to them"
	<modelSubscriber: #files>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : #'api - file browser files view model' }
TGtWithFileBrowserFilesViewModel >> unsubscribeFromFileBrowserFilesViewModel [
	"Is sent before a new fileBrowserFilesViewModel is assigned to the receiver.
	Objects that subscribe to fileBrowserFilesViewModel are required to implement this method."
	<modelUnsubscriber: #files>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]
