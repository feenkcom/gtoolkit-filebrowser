Trait {
	#name : #TGtWithFileBrowserFileViewModel,
	#instVars : [
		'fileBrowserFileViewModel'
	],
	#category : #'GToolkit-FileBrowser-Support'
}

{ #category : #'api - file browser file view model' }
TGtWithFileBrowserFileViewModel >> fileBrowserFileViewModel [
	"Return a not-null fileBrowserFileViewModel assigned to the receiver"
	<modelGetter: #file>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ fileBrowserFileViewModel notNil ]
		description: [ 'fileBrowserFileViewModel should be initialized' ].

	^ fileBrowserFileViewModel
]

{ #category : #'api - file browser file view model' }
TGtWithFileBrowserFileViewModel >> fileBrowserFileViewModel: aFileBrowserFileViewModel [
	"Set a not-null fileBrowserFileViewModel assigned to the receiver"
	<modelSetter: #file>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aFileBrowserFileViewModel notNil ]
		description: [ 'fileBrowserFileViewModel must not be nil' ].

	fileBrowserFileViewModel == aFileBrowserFileViewModel
		ifTrue: [ ^ self ].

	fileBrowserFileViewModel ifNotNil: [ self unsubscribeFromFileBrowserFileViewModel ].
	fileBrowserFileViewModel := aFileBrowserFileViewModel.

	self onFileBrowserFileViewModelChanged.
	self subscribeToFileBrowserFileViewModel.
	self onPostFileBrowserFileViewModelChanged
]

{ #category : #'api - file browser file view model' }
TGtWithFileBrowserFileViewModel >> hasFileBrowserFileViewModel [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<modelTester: #file>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ fileBrowserFileViewModel notNil
]

{ #category : #'api - file browser file view model' }
TGtWithFileBrowserFileViewModel >> onFileBrowserFileViewModelChanged [
	"Is sent when a new fileBrowserFileViewModel is assigned to the receiver.
	Note: #onFileBrowserFileViewModelChanged is sent before #subscribeToFileBrowserFileViewModel
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostFileBrowserFileViewModelChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : #'api - file browser file view model' }
TGtWithFileBrowserFileViewModel >> onPostFileBrowserFileViewModelChanged [
	"I am an optional hook method that is sent after #subscribeToFileBrowserFileViewModel.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : #'api - file browser file view model' }
TGtWithFileBrowserFileViewModel >> subscribeToFileBrowserFileViewModel [
	"Is sent after a new fileBrowserFileViewModel is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromFileBrowserFileViewModel if the receiver subscribes to them"
	<modelSubscriber: #file>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : #'api - file browser file view model' }
TGtWithFileBrowserFileViewModel >> unsubscribeFromFileBrowserFileViewModel [
	"Is sent before a new fileBrowserFileViewModel is assigned to the receiver.
	Objects that subscribe to fileBrowserFileViewModel are required to implement this method."
	<modelUnsubscriber: #file>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]
