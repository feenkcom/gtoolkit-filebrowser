Trait {
	#name : #TGtWithFileBrowserFileModel,
	#instVars : [
		'fileBrowserFileModel'
	],
	#category : #'GToolkit-FileBrowser-Support'
}

{ #category : #'api - file browser file model' }
TGtWithFileBrowserFileModel >> fileBrowserFileModel [
	"Return a not-null fileBrowserFileModel assigned to the receiver"
	<modelGetter: #file>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ fileBrowserFileModel notNil ]
		description: [ 'fileBrowserFileModel should be initialized' ].

	^ fileBrowserFileModel
]

{ #category : #'api - file browser file model' }
TGtWithFileBrowserFileModel >> fileBrowserFileModel: aFileBrowserFileModel [
	"Set a not-null fileBrowserFileModel assigned to the receiver"
	<modelSetter: #file>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aFileBrowserFileModel notNil ]
		description: [ 'fileBrowserFileModel must not be nil' ].

	fileBrowserFileModel == aFileBrowserFileModel
		ifTrue: [ ^ self ].

	fileBrowserFileModel ifNotNil: [ self unsubscribeFromFileBrowserFileModel ].
	fileBrowserFileModel := aFileBrowserFileModel.

	self onFileBrowserFileModelChanged.
	self subscribeToFileBrowserFileModel.
	self onPostFileBrowserFileModelChanged
]

{ #category : #'api - file browser file model' }
TGtWithFileBrowserFileModel >> hasFileBrowserFileModel [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<modelTester: #file>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ fileBrowserFileModel notNil
]

{ #category : #'api - file browser file model' }
TGtWithFileBrowserFileModel >> onFileBrowserFileModelChanged [
	"Is sent when a new fileBrowserFileModel is assigned to the receiver.
	Note: #onFileBrowserFileModelChanged is sent before #subscribeToFileBrowserFileModel
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostFileBrowserFileModelChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : #'api - file browser file model' }
TGtWithFileBrowserFileModel >> onPostFileBrowserFileModelChanged [
	"I am an optional hook method that is sent after #subscribeToFileBrowserFileModel.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : #'api - file browser file model' }
TGtWithFileBrowserFileModel >> subscribeToFileBrowserFileModel [
	"Is sent after a new fileBrowserFileModel is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromFileBrowserFileModel if the receiver subscribes to them"
	<modelSubscriber: #file>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : #'api - file browser file model' }
TGtWithFileBrowserFileModel >> unsubscribeFromFileBrowserFileModel [
	"Is sent before a new fileBrowserFileModel is assigned to the receiver.
	Objects that subscribe to fileBrowserFileModel are required to implement this method."
	<modelUnsubscriber: #file>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]
