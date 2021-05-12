Class {
	#name : #GtFileBrowserFolderModel,
	#superclass : #Object,
	#traits : 'TGtFileBrowserFolderModel',
	#classTraits : 'TGtFileBrowserFolderModel classTrait',
	#instVars : [
		'fileReference',
		'parentFileBrowserFoldersModel',
		'announcer',
		'fileBrowserFilesModel',
		'fileBrowserFoldersModel'
	],
	#category : #'GToolkit-FileBrowser-Models'
}

{ #category : #'api - enumerating' }
GtFileBrowserFolderModel >> allParentFileBrowserFolderModelDo: aBlock [
	"Evaluate a given block with all parents of the same type as the receiver"
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#allParentObjectsDoTemplate'>
	| aCurrentParent |
	
	aCurrentParent := self.
	
	aCurrentParent hasParentFileBrowserFoldersModel
		ifFalse: [ ^ self ].
	aCurrentParent := aCurrentParent parentFileBrowserFoldersModel.
	aCurrentParent hasParentFileBrowserFolderModel
		ifFalse: [ ^ self ].
	aCurrentParent := aCurrentParent parentFileBrowserFolderModel.
	aBlock value: aCurrentParent.
	aCurrentParent allParentFileBrowserFolderModelDo: aBlock
]

{ #category : #'api - announcer' }
GtFileBrowserFolderModel >> announce: anAnnouncement [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#announceTemplate'>
	announcer ifNotNil: [ :anAnnouncer | anAnnouncer announce: anAnnouncement ]
]

{ #category : #'private - instance creation' }
GtFileBrowserFolderModel >> createFileBrowserFilesModel [
	"Create a nested child object for a domain child (or children) and return the result"
	<return: #GtFileBrowserFilesModel>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForOneTemplate>>#createChildObjectsTemplate'>
	| childObject |

	childObject := GtFileBrowserFilesModel new.
	childObject parentFileBrowserFolderModel: self.
	childObject fileReferences: self fileReference files.
	^ childObject
]

{ #category : #'private - instance creation' }
GtFileBrowserFolderModel >> createFileBrowserFoldersModel [
	"Create a nested child object for a domain child (or children) and return the result"
	<return: #GtFileBrowserFoldersModel>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForOneTemplate>>#createChildObjectsTemplate'>
	| childObject |

	childObject := GtFileBrowserFoldersModel new.
	childObject parentFileBrowserFolderModel: self.
	childObject fileReferences: self fileReference directories.
	^ childObject
]

{ #category : #'api - accessing' }
GtFileBrowserFolderModel >> fileBrowserFilesModel [
	"Return a composite object (${class:nil}$) created for a collection of children from the domain model.
	Note: The object is lazily instantiated."
	<return: #GtFileBrowserFilesModel>
	<childObjectGetter: #files>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForOneTemplate>>#childObjectsTemplate'>

	^ fileBrowserFilesModel ifNil: [ fileBrowserFilesModel := self createFileBrowserFilesModel ]
]

{ #category : #'api - accessing' }
GtFileBrowserFolderModel >> fileBrowserFoldersModel [
	"Return a composite object (${class:nil}$) created for a collection of children from the domain model.
	Note: The object is lazily instantiated."
	<return: #GtFileBrowserFoldersModel>
	<childObjectGetter: #folders>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForOneTemplate>>#childObjectsTemplate'>

	^ fileBrowserFoldersModel ifNil: [ fileBrowserFoldersModel := self createFileBrowserFoldersModel ]
]

{ #category : #'api - file reference' }
GtFileBrowserFolderModel >> fileReference [
	"Return a not-null fileReference assigned to the receiver"
	<modelGetter: #fileReference>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ fileReference notNil ]
		description: [ 'fileReference should be initialized' ].

	^ fileReference
]

{ #category : #'api - file reference' }
GtFileBrowserFolderModel >> fileReference: aFileReference [
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

{ #category : #'gt-extentions' }
GtFileBrowserFolderModel >> gtFilesListViewFor: aView [
	<gtView>
	<generatedFrom: #'GtRobocoderMetamodelPhlowListViewDerive>>#listForOneTemplate'>

	^ aView list
		priority: 5;
		title: 'Files';
		items: [ self fileBrowserFilesModel fileBrowserFileModels ]
]

{ #category : #'gt-extentions' }
GtFileBrowserFolderModel >> gtFoldersListViewFor: aView [
	<gtView>
	<generatedFrom: #'GtRobocoderMetamodelPhlowListViewDerive>>#listForOneTemplate'>

	^ aView list
		priority: 5;
		title: 'Folders';
		items: [ self fileBrowserFoldersModel fileBrowserFolderModels ]
]

{ #category : #'api - file reference' }
GtFileBrowserFolderModel >> hasFileReference [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<modelTester: #fileReference>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ fileReference notNil
]

{ #category : #'api - testing' }
GtFileBrowserFolderModel >> hasParentFileBrowserFoldersModel [
	"Return true if the parent object is attached"
	<return: #Boolean>
	<parentObjectTester: #folders>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectTesterTemplate'>

	^ parentFileBrowserFoldersModel notNil
]

{ #category : #'api - testing' }
GtFileBrowserFolderModel >> isFileBrowserFileModel [
	"Return true if the receiver represents fileBrowserFileModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
GtFileBrowserFolderModel >> isFileBrowserFilesModel [
	"Return true if the receiver represents fileBrowserFilesModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
GtFileBrowserFolderModel >> isFileBrowserFolderModel [
	"Return true if the receiver represents fileBrowserFolderModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ true
]

{ #category : #'api - testing' }
GtFileBrowserFolderModel >> isFileBrowserFoldersModel [
	"Return true if the receiver represents fileBrowserFoldersModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - file reference' }
GtFileBrowserFolderModel >> onFileReferenceChanged [
	"Is sent when a new fileReference is assigned to the receiver.
	Note: #onFileReferenceChanged is sent before #subscribeToFileReference
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostFileReferenceChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : #'api - file reference' }
GtFileBrowserFolderModel >> onPostFileReferenceChanged [
	"I am an optional hook method that is sent after #subscribeToFileReference.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : #'api - accessing' }
GtFileBrowserFolderModel >> parentFileBrowserFoldersModel [
	"Return a parent object which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<return: #GtFileBrowserFoldersModel>
	<parentObjectGetter: #folders>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectGetterTemplate'>

	self
		assert: [ parentFileBrowserFoldersModel notNil ]
		description: [ 'Parent is not assigned!' ].

	^ parentFileBrowserFoldersModel
]

{ #category : #'api - accessing' }
GtFileBrowserFolderModel >> parentFileBrowserFoldersModel: aGtFileBrowserFoldersModel [
	"Assign a parent object (${class:GtFileBrowserFoldersModel}$) which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<parentObjectSetter: #folders>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectSetterTemplate'>

	self
		assert: [ aGtFileBrowserFoldersModel notNil ]
		description: [ 'Parent view model must not be nil' ].

	parentFileBrowserFoldersModel := aGtFileBrowserFoldersModel
]

{ #category : #printing }
GtFileBrowserFolderModel >> printOn: aStream [
	<generatedFrom: #'GtRobocoderMetamodelPrintDerive>>#printOnTemplate'>
	aStream print: self fileReference
]

{ #category : #'api - file reference' }
GtFileBrowserFolderModel >> subscribeToFileReference [
	"Is sent after a new fileReference is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromFileReference if the receiver subscribes to them"
	<modelSubscriber: #fileReference>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : #'api - announcer' }
GtFileBrowserFolderModel >> unsubscribe: anObject [
	"Unsubscribe all subscriptions of anObject from the receiver"

	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#unsubscribeTemplate'>
	^ announcer ifNotNil: [ :anAnnouncer | anAnnouncer unsubscribe: anObject ]
]

{ #category : #'api - file reference' }
GtFileBrowserFolderModel >> unsubscribeFromFileReference [
	"Is sent before a new fileReference is assigned to the receiver.
	Objects that subscribe to fileReference are required to implement this method."
	<modelUnsubscriber: #fileReference>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]

{ #category : #'api - announcer' }
GtFileBrowserFolderModel >> when: anAnnouncementClass do: aBlock [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenDoTemplate'>
	(announcer ifNil: [ announcer := Announcer new ])
		when: anAnnouncementClass do: aBlock
]

{ #category : #'api - announcer' }
GtFileBrowserFolderModel >> when: anAnnouncementClass send: aSelector to: anObject [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenSendToTemplate'>
	(announcer ifNil: [ announcer := Announcer new ]) weak
		when: anAnnouncementClass send: aSelector to: anObject
]

{ #category : #'api - enumerating' }
GtFileBrowserFolderModel >> withAllParentFileBrowserFolderModel [
	"Collect and return the receiver and all its parents in the bottom to top order starting with the receiver"
	<return: #Array>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#withAllParentObjectsTemplate'>

	^ Array streamContents: [ :aStream |
		self withAllParentFileBrowserFolderModelDo: [ :eachParent | aStream nextPut: eachParent ] ]
]

{ #category : #'api - enumerating' }
GtFileBrowserFolderModel >> withAllParentFileBrowserFolderModelDo: aBlock [
	"Evaluate a given block with the receiver and all its parents of the same type"

	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#withAllParentObjectsDoTemplate'>
	aBlock value: self.
	self allParentFileBrowserFolderModelDo: aBlock
]
