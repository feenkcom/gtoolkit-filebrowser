Trait {
	#name : #TGtWithFileBrowserFilesModel,
	#instVars : [
		'fileBrowserFilesModel'
	],
	#category : #'GToolkit-FileBrowser-Support'
}

{ #category : #'api - file browser files model' }
TGtWithFileBrowserFilesModel >> fileBrowserFilesModel [
	"Return a not-null fileBrowserFilesModel assigned to the receiver"
	<modelGetter: #files>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ fileBrowserFilesModel notNil ]
		description: [ 'fileBrowserFilesModel should be initialized' ].

	^ fileBrowserFilesModel
]

{ #category : #'api - file browser files model' }
TGtWithFileBrowserFilesModel >> fileBrowserFilesModel: aFileBrowserFilesModel [
	"Set a not-null fileBrowserFilesModel assigned to the receiver"
	<modelSetter: #files>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aFileBrowserFilesModel notNil ]
		description: [ 'fileBrowserFilesModel must not be nil' ].

	fileBrowserFilesModel == aFileBrowserFilesModel
		ifTrue: [ ^ self ].

	fileBrowserFilesModel ifNotNil: [ self unsubscribeFromFileBrowserFilesModel ].
	fileBrowserFilesModel := aFileBrowserFilesModel.

	self onFileBrowserFilesModelChanged.
	self subscribeToFileBrowserFilesModel.
	self onPostFileBrowserFilesModelChanged
]

{ #category : #'api - file browser files model' }
TGtWithFileBrowserFilesModel >> hasFileBrowserFilesModel [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<modelTester: #files>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ fileBrowserFilesModel notNil
]

{ #category : #'api - file browser files model' }
TGtWithFileBrowserFilesModel >> onFileBrowserFilesModelChanged [
	"Is sent when a new fileBrowserFilesModel is assigned to the receiver.
	Note: #onFileBrowserFilesModelChanged is sent before #subscribeToFileBrowserFilesModel
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostFileBrowserFilesModelChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : #'api - file browser files model' }
TGtWithFileBrowserFilesModel >> onPostFileBrowserFilesModelChanged [
	"I am an optional hook method that is sent after #subscribeToFileBrowserFilesModel.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : #'api - file browser files model' }
TGtWithFileBrowserFilesModel >> subscribeToFileBrowserFilesModel [
	"Is sent after a new fileBrowserFilesModel is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromFileBrowserFilesModel if the receiver subscribes to them"
	<modelSubscriber: #files>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : #'api - file browser files model' }
TGtWithFileBrowserFilesModel >> unsubscribeFromFileBrowserFilesModel [
	"Is sent before a new fileBrowserFilesModel is assigned to the receiver.
	Objects that subscribe to fileBrowserFilesModel are required to implement this method."
	<modelUnsubscriber: #files>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]
