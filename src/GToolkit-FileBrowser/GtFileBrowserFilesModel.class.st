Class {
	#name : #GtFileBrowserFilesModel,
	#superclass : #Object,
	#instVars : [
		'fileReferences',
		'parentFileBrowserFolderModel',
		'announcer',
		'fileBrowserFileModels'
	],
	#category : #'GToolkit-FileBrowser-Models'
}

{ #category : #'api - adding' }
GtFileBrowserFilesModel >> addFileBrowserFileModel: aFileBrowserFileModel [
	"Add a given object as a child to the receiver and notify subscribers about it.
	Do nothing if an object is already one of my children."
	<objectAdder: #file>
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#addObjectTemplate'>

	(self includesFileBrowserFileModel: aFileBrowserFileModel)
		ifTrue: [ ^ self ].
	
	self primitiveAddFileBrowserFileModel: aFileBrowserFileModel.
	self fileBrowserFileModels add: aFileBrowserFileModel.
	self onFileBrowserFileModelAdded: aFileBrowserFileModel
]

{ #category : #'api - announcer' }
GtFileBrowserFilesModel >> announce: anAnnouncement [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#announceTemplate'>
	announcer ifNotNil: [ :anAnnouncer | anAnnouncer announce: anAnnouncement ]
]

{ #category : #'private - instance creation' }
GtFileBrowserFilesModel >> createFileBrowserFileModelFor: aChildModel [
	<return: #GtFileBrowserFileModel>
	<childObjectCreator: #file>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#createChildTemplate'>
	| aNewChild |
	
	aNewChild := GtFileBrowserFileModel new.
	aNewChild parentFileBrowserFilesModel: self.
	aNewChild fileReference: aChildModel.
	^ aNewChild
]

{ #category : #'private - instance creation' }
GtFileBrowserFilesModel >> createFileBrowserFileModels [
	"For each child from the domain model create an object and return a resulting collection"
	<return: #Collection of: #GtFileBrowserFileModel>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#createChildObjectsTemplate'>

	^ self fileReferences yourself collect: [ :eachModel |
		self createFileBrowserFileModelFor: eachModel ] as: OrderedCollection
]

{ #category : #'api - accessing' }
GtFileBrowserFilesModel >> fileBrowserFileModels [
	"Return a collection of objects (${class:GtFileBrowserFileModel}$) created for each child from the domain model.
	Note: The children are lazily instantiated."
	<return: #Collection of: #GtFileBrowserFileModel>
	<childObjectGetter: #file>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#childObjectsTemplate'>

	^  fileBrowserFileModels ifNil: [ fileBrowserFileModels := self createFileBrowserFileModels ]
]

{ #category : #'api - file references' }
GtFileBrowserFilesModel >> fileReferences [
	"Return a not-null fileReferences assigned to the receiver"
	<modelGetter: #fileReferences>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ fileReferences notNil ]
		description: [ 'fileReferences should be initialized' ].

	^ fileReferences
]

{ #category : #'api - file references' }
GtFileBrowserFilesModel >> fileReferences: aFileReferences [
	"Set a not-null fileReferences assigned to the receiver"
	<modelSetter: #fileReferences>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aFileReferences notNil ]
		description: [ 'fileReferences must not be nil' ].

	fileReferences == aFileReferences
		ifTrue: [ ^ self ].

	fileReferences ifNotNil: [ self unsubscribeFromFileReferences ].
	fileReferences := aFileReferences.

	self onFileReferencesChanged.
	self subscribeToFileReferences.
	self onPostFileReferencesChanged
]

{ #category : #'api - accessing' }
GtFileBrowserFilesModel >> findFileBrowserFileModel: aFile [
	"Find a child object based on the child model and return the child if it was found, nil otherwise.
	aNoneBlock otherwise."
	<return: #GtFileBrowserFileModel or: nil>
	<childObjectDetector: #file>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#findObjectTemplate'>

	^ self
		findFileBrowserFileModel: aFile
		ifFound: [ :aFileBrowserFileModel | aFileBrowserFileModel ]
		ifNone: [ nil ]
]

{ #category : #'api - accessing' }
GtFileBrowserFilesModel >> findFileBrowserFileModel: aFile ifFound: aFoundBlock ifNone: aNoneBlock [
	"Find a child object based on the child model and evaluate aFoundBlock if such child was found,
	aNoneBlock otherwise."
	<return: #Object>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#findObjectIfFoundIfNoneTemplate'>

	^ self fileBrowserFileModels
		detect: [ :eachFileBrowserFileModel |
			eachFileBrowserFileModel fileReference = aFile ]
		ifFound: aFoundBlock
		ifNone: aNoneBlock
]

{ #category : #'gt-extentions' }
GtFileBrowserFilesModel >> gtFileListViewFor: aView [
	<gtView>
	<generatedFrom: #'GtRobocoderMetamodelPhlowListViewDerive>>#listForManyTemplate'>

	^ aView list
		priority: 5;
		title: 'File';
		items: [ self fileBrowserFileModels ]
]

{ #category : #'api - file references' }
GtFileBrowserFilesModel >> hasFileReferences [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<modelTester: #fileReferences>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ fileReferences notNil
]

{ #category : #'api - testing' }
GtFileBrowserFilesModel >> hasParentFileBrowserFolderModel [
	"Return true if the parent object is attached"
	<return: #Boolean>
	<parentObjectTester: #folder>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectTesterTemplate'>

	^ parentFileBrowserFolderModel notNil
]

{ #category : #'api - testing' }
GtFileBrowserFilesModel >> includesFileBrowserFileModel: aFileBrowserFileModel [
	"Check and return true if a given child object exists among my children, false otherwise.
	The comparison happens by identity"
	<return: #Boolean>
	<childObjectFinder: #file>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#includesObjectTemplate'>

	^ self fileBrowserFileModels anySatisfy: [ :eachFileBrowserFileModel |
		eachFileBrowserFileModel == aFileBrowserFileModel ]
]

{ #category : #'api - testing' }
GtFileBrowserFilesModel >> isFileBrowserFileModel [
	"Return true if the receiver represents fileBrowserFileModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
GtFileBrowserFilesModel >> isFileBrowserFilesModel [
	"Return true if the receiver represents fileBrowserFilesModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ true
]

{ #category : #'api - testing' }
GtFileBrowserFilesModel >> isFileBrowserFolderModel [
	"Return true if the receiver represents fileBrowserFolderModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
GtFileBrowserFilesModel >> isFileBrowserFoldersModel [
	"Return true if the receiver represents fileBrowserFoldersModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'private - notifying' }
GtFileBrowserFilesModel >> notifyFileBrowserFileModelAdded: aFileBrowserFileModel [
	"Notifies that a given child object was added to the receiver"
	
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#notifyObjectAddedTemplate'>
	self announce: (GtFileBrowserFileModelAddedAnnouncement new
		fileBrowserFileModel: aFileBrowserFileModel) 
]

{ #category : #'private - notifying' }
GtFileBrowserFilesModel >> notifyFileBrowserFileModelRemoved: aFileBrowserFileModel [
	"Notifies that a given child object was removed from the receiver"
	
	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#notifyObjectRemovedTemplate'>
	self announce: (GtFileBrowserFileModelRemovedAnnouncement new
		fileBrowserFileModel: aFileBrowserFileModel) 
]

{ #category : #'api - adding' }
GtFileBrowserFilesModel >> onFileBrowserFileModelAdded: aFileBrowserFileModel [
	"Is sent after a given child object was added to the receiver"
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#objectAddedHookTemplate'>
	aFileBrowserFileModel parentFileBrowserFilesModel: self.
	self notifyFileBrowserFileModelAdded: aFileBrowserFileModel.
]

{ #category : #'api - adding' }
GtFileBrowserFilesModel >> onFileBrowserFileModelRemoved: aFileBrowserFileModel [
	"Is sent after a given child object was removed from the receiver"

	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#objectRemovedHookTemplate'>
	self notifyFileBrowserFileModelRemoved: aFileBrowserFileModel.
]

{ #category : #'api - file references' }
GtFileBrowserFilesModel >> onFileReferencesChanged [
	"Is sent when a new fileReferences is assigned to the receiver.
	Note: #onFileReferencesChanged is sent before #subscribeToFileReferences
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostFileReferencesChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : #'api - file references' }
GtFileBrowserFilesModel >> onPostFileReferencesChanged [
	"I am an optional hook method that is sent after #subscribeToFileReferences.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : #'api - accessing' }
GtFileBrowserFilesModel >> parentFileBrowserFolderModel [
	"Return a parent object which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<return: #GtFileBrowserFolderModel>
	<parentObjectGetter: #folder>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectGetterTemplate'>

	self
		assert: [ parentFileBrowserFolderModel notNil ]
		description: [ 'Parent is not assigned!' ].

	^ parentFileBrowserFolderModel
]

{ #category : #'api - accessing' }
GtFileBrowserFilesModel >> parentFileBrowserFolderModel: aGtFileBrowserFolderModel [
	"Assign a parent object (${class:GtFileBrowserFolderModel}$) which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<parentObjectSetter: #folder>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectSetterTemplate'>

	self
		assert: [ aGtFileBrowserFolderModel notNil ]
		description: [ 'Parent view model must not be nil' ].

	parentFileBrowserFolderModel := aGtFileBrowserFolderModel
]

{ #category : #'private - adding' }
GtFileBrowserFilesModel >> primitiveAddFileBrowserFileModel: aFileBrowserFileModel [
	"Is sent right before adding aFileBrowserFileModel as my child.
	Override this method to implement primitive addition behavior such as for example adding a new folder, file or class"
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#primitiveAddTemplate'>
]

{ #category : #'private - removing' }
GtFileBrowserFilesModel >> primitiveRemoveFileBrowserFileModel: aFileBrowserFileModel [
	"Is sent right before removing aFileBrowserFileModel from my children.
	Override this method to implement primitive removal behavior such as for example removing a folder, file or class"
	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#primitiveRemoveTemplate'>
]

{ #category : #printing }
GtFileBrowserFilesModel >> printOn: aStream [
	<generatedFrom: #'GtRobocoderMetamodelPrintDerive>>#printOnTemplate'>
	aStream print: self fileReferences
]

{ #category : #'api - adding' }
GtFileBrowserFilesModel >> removeFileBrowserFileModel: aFileBrowserFileModel [
	"Remove a given object as a child to the receiver and notify subscribers about it.
	Do nothing if an object is already one of my children."
	<objectAdder: #file>
	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#removeObjectTemplate'>

	(self includesFileBrowserFileModel: aFileBrowserFileModel)
		ifFalse: [ ^ self ].
	
	self primitiveRemoveFileBrowserFileModel: aFileBrowserFileModel.
	self fileBrowserFileModels
		remove: aFileBrowserFileModel
		ifAbsent: [ ^ self ].
	self onFileBrowserFileModelRemoved: aFileBrowserFileModel
]

{ #category : #'api - file references' }
GtFileBrowserFilesModel >> subscribeToFileReferences [
	"Is sent after a new fileReferences is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromFileReferences if the receiver subscribes to them"
	<modelSubscriber: #fileReferences>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : #'api - announcer' }
GtFileBrowserFilesModel >> unsubscribe: anObject [
	"Unsubscribe all subscriptions of anObject from the receiver"

	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#unsubscribeTemplate'>
	^ announcer ifNotNil: [ :anAnnouncer | anAnnouncer unsubscribe: anObject ]
]

{ #category : #'api - file references' }
GtFileBrowserFilesModel >> unsubscribeFromFileReferences [
	"Is sent before a new fileReferences is assigned to the receiver.
	Objects that subscribe to fileReferences are required to implement this method."
	<modelUnsubscriber: #fileReferences>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]

{ #category : #'api - announcer' }
GtFileBrowserFilesModel >> when: anAnnouncementClass do: aBlock [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenDoTemplate'>
	(announcer ifNil: [ announcer := Announcer new ])
		when: anAnnouncementClass do: aBlock
]

{ #category : #'api - announcer' }
GtFileBrowserFilesModel >> when: anAnnouncementClass send: aSelector to: anObject [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenSendToTemplate'>
	(announcer ifNil: [ announcer := Announcer new ]) weak
		when: anAnnouncementClass send: aSelector to: anObject
]
