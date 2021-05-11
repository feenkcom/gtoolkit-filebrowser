Trait {
	#name : #TGtWithFileBrowserFoldersModel,
	#instVars : [
		'fileBrowserFoldersModel'
	],
	#category : #'GToolkit-FileBrowser-Support'
}

{ #category : #'api - file browser folders model' }
TGtWithFileBrowserFoldersModel >> fileBrowserFoldersModel [
	"Return a not-null fileBrowserFoldersModel assigned to the receiver"
	<modelGetter: #folders>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ fileBrowserFoldersModel notNil ]
		description: [ 'fileBrowserFoldersModel should be initialized' ].

	^ fileBrowserFoldersModel
]

{ #category : #'api - file browser folders model' }
TGtWithFileBrowserFoldersModel >> fileBrowserFoldersModel: aFileBrowserFoldersModel [
	"Set a not-null fileBrowserFoldersModel assigned to the receiver"
	<modelSetter: #folders>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aFileBrowserFoldersModel notNil ]
		description: [ 'fileBrowserFoldersModel must not be nil' ].

	fileBrowserFoldersModel == aFileBrowserFoldersModel
		ifTrue: [ ^ self ].

	fileBrowserFoldersModel ifNotNil: [ self unsubscribeFromFileBrowserFoldersModel ].
	fileBrowserFoldersModel := aFileBrowserFoldersModel.

	self onFileBrowserFoldersModelChanged.
	self subscribeToFileBrowserFoldersModel.
	self onPostFileBrowserFoldersModelChanged
]

{ #category : #'api - file browser folders model' }
TGtWithFileBrowserFoldersModel >> hasFileBrowserFoldersModel [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<modelTester: #folders>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ fileBrowserFoldersModel notNil
]

{ #category : #'api - file browser folders model' }
TGtWithFileBrowserFoldersModel >> onFileBrowserFoldersModelChanged [
	"Is sent when a new fileBrowserFoldersModel is assigned to the receiver.
	Note: #onFileBrowserFoldersModelChanged is sent before #subscribeToFileBrowserFoldersModel
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostFileBrowserFoldersModelChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : #'api - file browser folders model' }
TGtWithFileBrowserFoldersModel >> onPostFileBrowserFoldersModelChanged [
	"I am an optional hook method that is sent after #subscribeToFileBrowserFoldersModel.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : #'api - file browser folders model' }
TGtWithFileBrowserFoldersModel >> subscribeToFileBrowserFoldersModel [
	"Is sent after a new fileBrowserFoldersModel is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromFileBrowserFoldersModel if the receiver subscribes to them"
	<modelSubscriber: #folders>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : #'api - file browser folders model' }
TGtWithFileBrowserFoldersModel >> unsubscribeFromFileBrowserFoldersModel [
	"Is sent before a new fileBrowserFoldersModel is assigned to the receiver.
	Objects that subscribe to fileBrowserFoldersModel are required to implement this method."
	<modelUnsubscriber: #folders>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]
