Trait {
	#name : #TGtWithFileBrowserFolderModel,
	#instVars : [
		'fileBrowserFolderModel'
	],
	#category : #'GToolkit-FileBrowser-Support'
}

{ #category : #'api - file browser folder model' }
TGtWithFileBrowserFolderModel >> fileBrowserFolderModel [
	"Return a not-null fileBrowserFolderModel assigned to the receiver"
	<modelGetter: #folder>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ fileBrowserFolderModel notNil ]
		description: [ 'fileBrowserFolderModel should be initialized' ].

	^ fileBrowserFolderModel
]

{ #category : #'api - file browser folder model' }
TGtWithFileBrowserFolderModel >> fileBrowserFolderModel: aFileBrowserFolderModel [
	"Set a not-null fileBrowserFolderModel assigned to the receiver"
	<modelSetter: #folder>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aFileBrowserFolderModel notNil ]
		description: [ 'fileBrowserFolderModel must not be nil' ].

	fileBrowserFolderModel == aFileBrowserFolderModel
		ifTrue: [ ^ self ].

	fileBrowserFolderModel ifNotNil: [ self unsubscribeFromFileBrowserFolderModel ].
	fileBrowserFolderModel := aFileBrowserFolderModel.

	self onFileBrowserFolderModelChanged.
	self subscribeToFileBrowserFolderModel.
	self onPostFileBrowserFolderModelChanged
]

{ #category : #'api - file browser folder model' }
TGtWithFileBrowserFolderModel >> hasFileBrowserFolderModel [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<modelTester: #folder>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ fileBrowserFolderModel notNil
]

{ #category : #'api - file browser folder model' }
TGtWithFileBrowserFolderModel >> onFileBrowserFolderModelChanged [
	"Is sent when a new fileBrowserFolderModel is assigned to the receiver.
	Note: #onFileBrowserFolderModelChanged is sent before #subscribeToFileBrowserFolderModel
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostFileBrowserFolderModelChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : #'api - file browser folder model' }
TGtWithFileBrowserFolderModel >> onPostFileBrowserFolderModelChanged [
	"I am an optional hook method that is sent after #subscribeToFileBrowserFolderModel.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : #'api - file browser folder model' }
TGtWithFileBrowserFolderModel >> subscribeToFileBrowserFolderModel [
	"Is sent after a new fileBrowserFolderModel is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromFileBrowserFolderModel if the receiver subscribes to them"
	<modelSubscriber: #folder>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : #'api - file browser folder model' }
TGtWithFileBrowserFolderModel >> unsubscribeFromFileBrowserFolderModel [
	"Is sent before a new fileBrowserFolderModel is assigned to the receiver.
	Objects that subscribe to fileBrowserFolderModel are required to implement this method."
	<modelUnsubscriber: #folder>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]
