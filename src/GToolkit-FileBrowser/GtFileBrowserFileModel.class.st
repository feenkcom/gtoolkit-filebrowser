Class {
	#name : #GtFileBrowserFileModel,
	#superclass : #Object,
	#instVars : [
		'fileReference',
		'parentFileBrowserFilesModel',
		'announcer'
	],
	#category : #'GToolkit-FileBrowser-Models'
}

{ #category : #'api - announcer' }
GtFileBrowserFileModel >> announce: anAnnouncement [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#announceTemplate'>
	announcer ifNotNil: [ :anAnnouncer | anAnnouncer announce: anAnnouncement ]
]

{ #category : #'api - file reference' }
GtFileBrowserFileModel >> fileReference [
	"Return a not-null fileReference assigned to the receiver"
	<modelGetter: #fileReference>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ fileReference notNil ]
		description: [ 'fileReference should be initialized' ].

	^ fileReference
]

{ #category : #'api - file reference' }
GtFileBrowserFileModel >> fileReference: aFileReference [
	"Set a not-null fileReference assigned to the receiver"
	<modelSetter: #fileReference>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aFileReference notNil ]
		description: [ 'fileReference must not be nil' ].

	fileReference == aFileReference
		ifTrue: [ ^ self ].

	fileReference ifNotNil: [ self unsubscribeFromFileReference ].
	fileReference := aFileReference.

	self onFileReferenceChanged.
	self subscribeToFileReference.
	self onPostFileReferenceChanged
]

{ #category : #'api - file reference' }
GtFileBrowserFileModel >> hasFileReference [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<modelTester: #fileReference>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ fileReference notNil
]

{ #category : #'api - testing' }
GtFileBrowserFileModel >> hasParentFileBrowserFilesModel [
	"Return true if the parent object is attached"
	<return: #Boolean>
	<parentObjectTester: #files>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectTesterTemplate'>

	^ parentFileBrowserFilesModel notNil
]

{ #category : #'api - testing' }
GtFileBrowserFileModel >> isFileBrowserFileModel [
	"Return true if the receiver represents fileBrowserFileModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ true
]

{ #category : #'api - testing' }
GtFileBrowserFileModel >> isFileBrowserFilesModel [
	"Return true if the receiver represents fileBrowserFilesModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
GtFileBrowserFileModel >> isFileBrowserFolderModel [
	"Return true if the receiver represents fileBrowserFolderModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
GtFileBrowserFileModel >> isFileBrowserFoldersModel [
	"Return true if the receiver represents fileBrowserFoldersModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - file reference' }
GtFileBrowserFileModel >> onFileReferenceChanged [
	"Is sent when a new fileReference is assigned to the receiver.
	Note: #onFileReferenceChanged is sent before #subscribeToFileReference
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostFileReferenceChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : #'api - file reference' }
GtFileBrowserFileModel >> onPostFileReferenceChanged [
	"I am an optional hook method that is sent after #subscribeToFileReference.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : #'api - accessing' }
GtFileBrowserFileModel >> parentFileBrowserFilesModel [
	"Return a parent object which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<return: #GtFileBrowserFilesModel>
	<parentObjectGetter: #files>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectGetterTemplate'>

	self
		assert: [ parentFileBrowserFilesModel notNil ]
		description: [ 'Parent is not assigned!' ].

	^ parentFileBrowserFilesModel
]

{ #category : #'api - accessing' }
GtFileBrowserFileModel >> parentFileBrowserFilesModel: aGtFileBrowserFilesModel [
	"Assign a parent object (${class:GtFileBrowserFilesModel}$) which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<parentObjectSetter: #files>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectSetterTemplate'>

	self
		assert: [ aGtFileBrowserFilesModel notNil ]
		description: [ 'Parent view model must not be nil' ].

	parentFileBrowserFilesModel := aGtFileBrowserFilesModel
]

{ #category : #printing }
GtFileBrowserFileModel >> printOn: aStream [
	<generatedFrom: #'GtRobocoderMetamodelPrintDerive>>#printOnTemplate'>
	aStream print: self fileReference
]

{ #category : #'api - file reference' }
GtFileBrowserFileModel >> subscribeToFileReference [
	"Is sent after a new fileReference is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromFileReference if the receiver subscribes to them"
	<modelSubscriber: #fileReference>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : #'api - announcer' }
GtFileBrowserFileModel >> unsubscribe: anObject [
	"Unsubscribe all subscriptions of anObject from the receiver"

	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#unsubscribeTemplate'>
	^ announcer ifNotNil: [ :anAnnouncer | anAnnouncer unsubscribe: anObject ]
]

{ #category : #'api - file reference' }
GtFileBrowserFileModel >> unsubscribeFromFileReference [
	"Is sent before a new fileReference is assigned to the receiver.
	Objects that subscribe to fileReference are required to implement this method."
	<modelUnsubscriber: #fileReference>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]

{ #category : #'api - announcer' }
GtFileBrowserFileModel >> when: anAnnouncementClass do: aBlock [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenDoTemplate'>
	(announcer ifNil: [ announcer := Announcer new ])
		when: anAnnouncementClass do: aBlock
]

{ #category : #'api - announcer' }
GtFileBrowserFileModel >> when: anAnnouncementClass send: aSelector to: anObject [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenSendToTemplate'>
	(announcer ifNil: [ announcer := Announcer new ]) weak
		when: anAnnouncementClass send: aSelector to: anObject
]
