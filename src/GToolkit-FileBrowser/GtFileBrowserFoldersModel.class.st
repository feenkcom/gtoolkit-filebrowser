Class {
	#name : #GtFileBrowserFoldersModel,
	#superclass : #Object,
	#instVars : [
		'fileReferences',
		'parentFileBrowserFolderModel',
		'announcer',
		'fileBrowserFolderModels'
	],
	#category : #'GToolkit-FileBrowser-Models'
}

{ #category : #'api - adding' }
GtFileBrowserFoldersModel >> addFileBrowserFolderModel: aFileBrowserFolderModel [
	"Add a given object as a child to the receiver and notify subscribers about it.
	Do nothing if an object is already one of my children."
	<objectAdder: #folder>
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#addObjectTemplate'>

	(self includesFileBrowserFolderModel: aFileBrowserFolderModel)
		ifTrue: [ ^ self ].
	
	self primitiveAddFileBrowserFolderModel: aFileBrowserFolderModel.
	self fileBrowserFolderModels add: aFileBrowserFolderModel.
	self onFileBrowserFolderModelAdded: aFileBrowserFolderModel
]

{ #category : #'api - enumerating' }
GtFileBrowserFoldersModel >> allParentFileBrowserFoldersModelDo: aBlock [
	"Evaluate a given block with all parents of the same type as the receiver"
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#allParentObjectsDoTemplate'>
	| aCurrentParent |
	
	aCurrentParent := self.
	
	aCurrentParent hasParentFileBrowserFolderModel
		ifFalse: [ ^ self ].
	aCurrentParent := aCurrentParent parentFileBrowserFolderModel.
	aCurrentParent hasParentFileBrowserFoldersModel
		ifFalse: [ ^ self ].
	aCurrentParent := aCurrentParent parentFileBrowserFoldersModel.
	aBlock value: aCurrentParent.
	aCurrentParent allParentFileBrowserFoldersModelDo: aBlock
]

{ #category : #'api - announcer' }
GtFileBrowserFoldersModel >> announce: anAnnouncement [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#announceTemplate'>
	announcer ifNotNil: [ :anAnnouncer | anAnnouncer announce: anAnnouncement ]
]

{ #category : #'private - instance creation' }
GtFileBrowserFoldersModel >> createFileBrowserFolderModelFor: aChildModel [
	<return: #GtFileBrowserFolderModel>
	<childObjectCreator: #folder>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#createChildTemplate'>
	| aNewChild |
	
	aNewChild := GtFileBrowserFolderModel new.
	aNewChild parentFileBrowserFoldersModel: self.
	aNewChild fileReference: aChildModel.
	^ aNewChild
]

{ #category : #'private - instance creation' }
GtFileBrowserFoldersModel >> createFileBrowserFolderModels [
	"For each child from the domain model create an object and return a resulting collection"
	<return: #Collection of: #GtFileBrowserFolderModel>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#createChildObjectsTemplate'>

	^ self fileReferences yourself collect: [ :eachModel |
		self createFileBrowserFolderModelFor: eachModel ] as: OrderedCollection
]

{ #category : #'api - accessing' }
GtFileBrowserFoldersModel >> fileBrowserFolderModels [
	"Return a collection of objects (${class:GtFileBrowserFolderModel}$) created for each child from the domain model.
	Note: The children are lazily instantiated."
	<return: #Collection of: #GtFileBrowserFolderModel>
	<childObjectGetter: #folder>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#childObjectsTemplate'>

	^  fileBrowserFolderModels ifNil: [ fileBrowserFolderModels := self createFileBrowserFolderModels ]
]

{ #category : #'api - file references' }
GtFileBrowserFoldersModel >> fileReferences [
	"Return a not-null fileReferences assigned to the receiver"
	<modelGetter: #fileReferences>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ fileReferences notNil ]
		description: [ 'fileReferences should be initialized' ].

	^ fileReferences
]

{ #category : #'api - file references' }
GtFileBrowserFoldersModel >> fileReferences: aFileReferences [
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
GtFileBrowserFoldersModel >> findFileBrowserFolderModel: aFolder [
	"Find a child object based on the child model and return the child if it was found, nil otherwise.
	aNoneBlock otherwise."
	<return: #GtFileBrowserFolderModel or: nil>
	<childObjectDetector: #folder>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#findObjectTemplate'>

	^ self
		findFileBrowserFolderModel: aFolder
		ifFound: [ :aFileBrowserFolderModel | aFileBrowserFolderModel ]
		ifNone: [ nil ]
]

{ #category : #'api - accessing' }
GtFileBrowserFoldersModel >> findFileBrowserFolderModel: aFolder ifFound: aFoundBlock ifNone: aNoneBlock [
	"Find a child object based on the child model and evaluate aFoundBlock if such child was found,
	aNoneBlock otherwise."

	<return: #Object>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#findObjectIfFoundIfNoneTemplate'>
	^ self fileBrowserFolderModels
		detect: [ :eachFileBrowserFolderModel | 
			aFolder fileSystem isCaseSensitive
				ifTrue: [ eachFileBrowserFolderModel fileReference = aFolder ]
				ifFalse: [ eachFileBrowserFolderModel fileReference pathString sameAs: aFolder pathString ] ]
		ifFound: aFoundBlock
		ifNone: aNoneBlock
]

{ #category : #'gt-extentions' }
GtFileBrowserFoldersModel >> gtFolderListViewFor: aView [
	<gtView>
	<generatedFrom: #'GtRobocoderMetamodelPhlowListViewDerive>>#listForManyTemplate'>

	^ aView list
		priority: 5;
		title: 'Folder';
		items: [ self fileBrowserFolderModels ]
]

{ #category : #'api - file references' }
GtFileBrowserFoldersModel >> hasFileReferences [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<modelTester: #fileReferences>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ fileReferences notNil
]

{ #category : #'api - testing' }
GtFileBrowserFoldersModel >> hasParentFileBrowserFolderModel [
	"Return true if the parent object is attached"
	<return: #Boolean>
	<parentObjectTester: #folder>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectTesterTemplate'>

	^ parentFileBrowserFolderModel notNil
]

{ #category : #'api - testing' }
GtFileBrowserFoldersModel >> includesFileBrowserFolderModel: aFileBrowserFolderModel [
	"Check and return true if a given child object exists among my children, false otherwise.
	The comparison happens by identity"
	<return: #Boolean>
	<childObjectFinder: #folder>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#includesObjectTemplate'>

	^ self fileBrowserFolderModels anySatisfy: [ :eachFileBrowserFolderModel |
		eachFileBrowserFolderModel == aFileBrowserFolderModel ]
]

{ #category : #'api - testing' }
GtFileBrowserFoldersModel >> isFileBrowserFileModel [
	"Return true if the receiver represents fileBrowserFileModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
GtFileBrowserFoldersModel >> isFileBrowserFilesModel [
	"Return true if the receiver represents fileBrowserFilesModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
GtFileBrowserFoldersModel >> isFileBrowserFolderModel [
	"Return true if the receiver represents fileBrowserFolderModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
GtFileBrowserFoldersModel >> isFileBrowserFoldersModel [
	"Return true if the receiver represents fileBrowserFoldersModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ true
]

{ #category : #'private - notifying' }
GtFileBrowserFoldersModel >> notifyFileBrowserFolderModelAdded: aFileBrowserFolderModel [
	"Notifies that a given child object was added to the receiver"
	
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#notifyObjectAddedTemplate'>
	self announce: (GtFileBrowserFolderModelAddedAnnouncement new
		fileBrowserFolderModel: aFileBrowserFolderModel) 
]

{ #category : #'private - notifying' }
GtFileBrowserFoldersModel >> notifyFileBrowserFolderModelRemoved: aFileBrowserFolderModel [
	"Notifies that a given child object was removed from the receiver"
	
	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#notifyObjectRemovedTemplate'>
	self announce: (GtFileBrowserFolderModelRemovedAnnouncement new
		fileBrowserFolderModel: aFileBrowserFolderModel) 
]

{ #category : #'api - adding' }
GtFileBrowserFoldersModel >> onFileBrowserFolderModelAdded: aFileBrowserFolderModel [
	"Is sent after a given child object was added to the receiver"
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#objectAddedHookTemplate'>
	aFileBrowserFolderModel parentFileBrowserFoldersModel: self.
	self notifyFileBrowserFolderModelAdded: aFileBrowserFolderModel.
]

{ #category : #'api - adding' }
GtFileBrowserFoldersModel >> onFileBrowserFolderModelRemoved: aFileBrowserFolderModel [
	"Is sent after a given child object was removed from the receiver"

	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#objectRemovedHookTemplate'>
	self notifyFileBrowserFolderModelRemoved: aFileBrowserFolderModel.
]

{ #category : #'api - file references' }
GtFileBrowserFoldersModel >> onFileReferencesChanged [
	"Is sent when a new fileReferences is assigned to the receiver.
	Note: #onFileReferencesChanged is sent before #subscribeToFileReferences
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostFileReferencesChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : #'api - file references' }
GtFileBrowserFoldersModel >> onPostFileReferencesChanged [
	"I am an optional hook method that is sent after #subscribeToFileReferences.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : #'api - accessing' }
GtFileBrowserFoldersModel >> parentFileBrowserFolderModel [
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
GtFileBrowserFoldersModel >> parentFileBrowserFolderModel: aGtFileBrowserFolderModel [
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
GtFileBrowserFoldersModel >> primitiveAddFileBrowserFolderModel: aFileBrowserFolderModel [
	"Is sent right before adding aFileBrowserFolderModel as my child.
	Override this method to implement primitive addition behavior such as for example adding a new folder, file or class"
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#primitiveAddTemplate'>

	aFileBrowserFolderModel fileReference createDirectory
]

{ #category : #'private - removing' }
GtFileBrowserFoldersModel >> primitiveRemoveFileBrowserFolderModel: aFileBrowserFolderModel [
	"Is sent right before removing aFileBrowserFolderModel from my children.
	Override this method to implement primitive removal behavior such as for example removing a folder, file or class"
	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#primitiveRemoveTemplate'>
	
	aFileBrowserFolderModel fileReference ensureDeleteAll
]

{ #category : #printing }
GtFileBrowserFoldersModel >> printOn: aStream [
	<generatedFrom: #'GtRobocoderMetamodelPrintDerive>>#printOnTemplate'>
	aStream print: self fileReferences
]

{ #category : #'api - adding' }
GtFileBrowserFoldersModel >> removeFileBrowserFolderModel: aFileBrowserFolderModel [
	"Remove a given object as a child to the receiver and notify subscribers about it.
	Do nothing if an object is already one of my children."
	<objectAdder: #folder>
	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#removeObjectTemplate'>

	(self includesFileBrowserFolderModel: aFileBrowserFolderModel)
		ifFalse: [ ^ self ].
	
	self primitiveRemoveFileBrowserFolderModel: aFileBrowserFolderModel.
	self fileBrowserFolderModels
		remove: aFileBrowserFolderModel
		ifAbsent: [ ^ self ].
	self onFileBrowserFolderModelRemoved: aFileBrowserFolderModel
]

{ #category : #'api - file references' }
GtFileBrowserFoldersModel >> subscribeToFileReferences [
	"Is sent after a new fileReferences is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromFileReferences if the receiver subscribes to them"
	<modelSubscriber: #fileReferences>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : #'api - announcer' }
GtFileBrowserFoldersModel >> unsubscribe: anObject [
	"Unsubscribe all subscriptions of anObject from the receiver"

	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#unsubscribeTemplate'>
	^ announcer ifNotNil: [ :anAnnouncer | anAnnouncer unsubscribe: anObject ]
]

{ #category : #'api - file references' }
GtFileBrowserFoldersModel >> unsubscribeFromFileReferences [
	"Is sent before a new fileReferences is assigned to the receiver.
	Objects that subscribe to fileReferences are required to implement this method."
	<modelUnsubscriber: #fileReferences>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]

{ #category : #'api - announcer' }
GtFileBrowserFoldersModel >> when: anAnnouncementClass do: aBlock [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenDoTemplate'>
	(announcer ifNil: [ announcer := Announcer new ])
		when: anAnnouncementClass do: aBlock
]

{ #category : #'api - announcer' }
GtFileBrowserFoldersModel >> when: anAnnouncementClass send: aSelector to: anObject [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenSendToTemplate'>
	(announcer ifNil: [ announcer := Announcer new ]) weak
		when: anAnnouncementClass send: aSelector to: anObject
]

{ #category : #'api - enumerating' }
GtFileBrowserFoldersModel >> withAllParentFileBrowserFoldersModel [
	"Collect and return the receiver and all its parents in the bottom to top order starting with the receiver"
	<return: #Array>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#withAllParentObjectsTemplate'>

	^ Array streamContents: [ :aStream |
		self withAllParentFileBrowserFoldersModelDo: [ :eachParent | aStream nextPut: eachParent ] ]
]

{ #category : #'api - enumerating' }
GtFileBrowserFoldersModel >> withAllParentFileBrowserFoldersModelDo: aBlock [
	"Evaluate a given block with the receiver and all its parents of the same type"

	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#withAllParentObjectsDoTemplate'>
	aBlock value: self.
	self allParentFileBrowserFoldersModelDo: aBlock
]
