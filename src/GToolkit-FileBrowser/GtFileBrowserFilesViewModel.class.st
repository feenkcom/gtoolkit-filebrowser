Class {
	#name : #GtFileBrowserFilesViewModel,
	#superclass : #Object,
	#traits : 'TGtWithFileBrowserFilesModel + TGtWithSelectedFileViewModel',
	#classTraits : 'TGtWithFileBrowserFilesModel classTrait + TGtWithSelectedFileViewModel classTrait',
	#instVars : [
		'fileBrowserFileViewModels',
		'announcer',
		'parentFileBrowserFolderViewModel'
	],
	#category : #'GToolkit-FileBrowser-View Models'
}

{ #category : #'api - adding' }
GtFileBrowserFilesViewModel >> addFileBrowserFileModel: aFileBrowserFile [
	"Request the model to add a given child object.
	I do nothing and simply delegate the addition to the model. If the operation will trigger
	an announcement and I react to it, it will lead to an update"

	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#addDelegateTemplate'>
	self fileBrowserFilesModel addFileBrowserFileModel: aFileBrowserFile
]

{ #category : #'api - announcer' }
GtFileBrowserFilesViewModel >> announce: anAnnouncement [
	<generatedFrom: #'GtRobocoderMetamodelNotifierDerive>>#announceTemplate'>
	announcer ifNotNil: [ :anAnnouncer | anAnnouncer announce: anAnnouncement ].

	"Dispatch anAnnouncement to the parent objects if they are assigned"
	self hasParentFileBrowserFolderViewModel
		ifTrue: [ self parentFileBrowserFolderViewModel announce: anAnnouncement ].
]

{ #category : #'private - instance creation' }
GtFileBrowserFilesViewModel >> createFileBrowserFileViewModelFor: aChildModel [
	<return: #GtFileBrowserFileViewModel>
	<childObjectCreator: #file>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#createChildTemplate'>
	| aNewChild |
	
	aNewChild := GtFileBrowserFileViewModel new.
	aNewChild parentFileBrowserFilesViewModel: self.
	aNewChild fileBrowserFileModel: aChildModel.
	^ aNewChild
]

{ #category : #'private - instance creation' }
GtFileBrowserFilesViewModel >> createFileBrowserFileViewModels [
	"For each child from the domain model create an object and return a resulting collection"
	<return: #Collection of: #GtFileBrowserFileViewModel>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#createChildObjectsTemplate'>

	^ self fileBrowserFilesModel fileBrowserFileModels collect: [ :eachModel |
		self createFileBrowserFileViewModelsFor: eachModel ] as: OrderedCollection
]

{ #category : #'private - instance creation' }
GtFileBrowserFilesViewModel >> createFileBrowserFileViewModelsFor: aChildModel [
	<return: #GtFileBrowserFileViewModel>
	<childObjectCreator: #file>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#createChildTemplate'>
	| aNewChild |
	
	aNewChild := GtFileBrowserFileViewModel new.
	aNewChild parentFileBrowserFilesViewModel: self.
	aNewChild fileBrowserFileModel: aChildModel.
	^ aNewChild
]

{ #category : #'api - accessing' }
GtFileBrowserFilesViewModel >> fileBrowserFileViewModels [
	"Return a collection of objects (${class:GtFileBrowserFileViewModel}$) created for each child from the domain model.
	Note: The children are lazily instantiated."
	<return: #Collection of: #GtFileBrowserFileViewModel>
	<childObjectGetter: #file>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#childObjectsTemplate'>

	^  fileBrowserFileViewModels ifNil: [ fileBrowserFileViewModels := self createFileBrowserFileViewModels ]
]

{ #category : #'api - accessing' }
GtFileBrowserFilesViewModel >> findFileBrowserFileViewModel: aFile [
	"Find a child object based on the child model and return the child if it was found, nil otherwise.
	aNoneBlock otherwise."
	<return: #GtFileBrowserFileViewModel or: nil>
	<childObjectDetector: #file>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#findObjectTemplate'>

	^ self
		findFileBrowserFileViewModel: aFile
		ifFound: [ :aFileBrowserFileViewModel | aFileBrowserFileViewModel ]
		ifNone: [ nil ]
]

{ #category : #'api - accessing' }
GtFileBrowserFilesViewModel >> findFileBrowserFileViewModel: aFile ifFound: aFoundBlock ifNone: aNoneBlock [
	"Find a child object based on the child model and evaluate aFoundBlock if such child was found,
	aNoneBlock otherwise."
	<return: #Object>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#findObjectIfFoundIfNoneTemplate'>

	^ self fileBrowserFileViewModels
		detect: [ :eachFileBrowserFileViewModel |
			eachFileBrowserFileViewModel fileBrowserFileModel = aFile ]
		ifFound: aFoundBlock
		ifNone: aNoneBlock
]

{ #category : #'api - accessing' }
GtFileBrowserFilesViewModel >> findFileBrowserFileViewModels: aFile [
	"Find a child object based on the child model and return the child if it was found, nil otherwise.
	aNoneBlock otherwise."
	<return: #GtFileBrowserFileViewModel or: nil>
	<childObjectDetector: #file>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#findObjectTemplate'>

	^ self
		findFileBrowserFileViewModels: aFile
		ifFound: [ :aFileBrowserFileViewModels | aFileBrowserFileViewModels ]
		ifNone: [ nil ]
]

{ #category : #'api - accessing' }
GtFileBrowserFilesViewModel >> findFileBrowserFileViewModels: aFile ifFound: aFoundBlock ifNone: aNoneBlock [
	"Find a child object based on the child model and evaluate aFoundBlock if such child was found,
	aNoneBlock otherwise."
	<return: #Object>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#findObjectIfFoundIfNoneTemplate'>

	^ self fileBrowserFileViewModels
		detect: [ :eachFileBrowserFileViewModels |
			eachFileBrowserFileViewModels fileBrowserFileModel = aFile ]
		ifFound: aFoundBlock
		ifNone: aNoneBlock
]

{ #category : #'gt-extentions' }
GtFileBrowserFilesViewModel >> gtFileListViewFor: aView [
	<gtView>
	<generatedFrom: #'GtRobocoderMetamodelPhlowListViewDerive>>#listForManyTemplate'>

	^ aView list
		priority: 5;
		title: 'File';
		items: [ self fileBrowserFileViewModels ]
]

{ #category : #'api - testing' }
GtFileBrowserFilesViewModel >> hasParentFileBrowserFolderViewModel [
	"Return true if the parent object is attached"
	<return: #Boolean>
	<parentObjectTester: #folder>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectTesterTemplate'>

	^ parentFileBrowserFolderViewModel notNil
]

{ #category : #'api - testing' }
GtFileBrowserFilesViewModel >> includesFileBrowserFileViewModel: aFileBrowserFileViewModel [
	"Check and return true if a given child object exists among my children, false otherwise.
	The comparison happens by identity"
	<return: #Boolean>
	<childObjectFinder: #file>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#includesObjectTemplate'>

	^ self fileBrowserFileViewModels anySatisfy: [ :eachFileBrowserFileViewModel |
		eachFileBrowserFileViewModel == aFileBrowserFileViewModel ]
]

{ #category : #'api - testing' }
GtFileBrowserFilesViewModel >> includesFileBrowserFileViewModels: aFileBrowserFileViewModels [
	"Check and return true if a given child object exists among my children, false otherwise.
	The comparison happens by identity"
	<return: #Boolean>
	<childObjectFinder: #file>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#includesObjectTemplate'>

	^ self fileBrowserFileViewModels anySatisfy: [ :eachFileBrowserFileViewModels |
		eachFileBrowserFileViewModels == aFileBrowserFileViewModels ]
]

{ #category : #'api - testing' }
GtFileBrowserFilesViewModel >> isFileBrowserFileViewModel [
	"Return true if the receiver represents fileBrowserFileViewModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
GtFileBrowserFilesViewModel >> isFileBrowserFilesViewModel [
	"Return true if the receiver represents fileBrowserFilesViewModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ true
]

{ #category : #'api - testing' }
GtFileBrowserFilesViewModel >> isFileBrowserFolderViewModel [
	"Return true if the receiver represents fileBrowserFolderViewModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
GtFileBrowserFilesViewModel >> isFileBrowserFoldersViewModel [
	"Return true if the receiver represents fileBrowserFoldersViewModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'private - notifying' }
GtFileBrowserFilesViewModel >> notifyFileBrowserFileViewModelAdded: aFileBrowserFileViewModel [
	"Notifies that a given child object was added to the receiver"
	
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#notifyObjectAddedTemplate'>
	self announce: (GtFileBrowserFileViewModelAddedAnnouncement new
		fileBrowserFileViewModel: aFileBrowserFileViewModel) 
]

{ #category : #'private - notifying' }
GtFileBrowserFilesViewModel >> notifyFileBrowserFileViewModelRemoved: aFileBrowserFileViewModel [
	"Notifies that a given child object was removed from the receiver"
	
	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#notifyObjectRemovedTemplate'>
	self announce: (GtFileBrowserFileViewModelRemovedAnnouncement new
		fileBrowserFileViewModel: aFileBrowserFileViewModel) 
]

{ #category : #'api - selected file view model' }
GtFileBrowserFilesViewModel >> notifySelectedFileViewModelChanged [
	"Override this notify method to announce changes to the property"
	<propertyChangeNotifier: #selectedFileViewModel>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#notifyPropertyChangedTemplate'>

	self announce: GtFileBrowserSelectedFileViewModelChanged new
]

{ #category : #'api - accessing' }
GtFileBrowserFilesViewModel >> objectName [
	"Return a symbolic name of the receiver which helps to create various type based mappings.
	Note: The symbolic name of the object is the exact name that was used
	in the metamodel declaration from which this class was generated"
	<return: #Symbol>
	<generatedFrom: #'GtRobocoderMetamodelNameDerive>>#objectNameTemplate'>

	^ #files
]

{ #category : #'private - event handling' }
GtFileBrowserFilesViewModel >> onFileBrowserFileAdded: aGtFileBrowserFileModelAddedAnnouncement [
	"Is sent when a new File is added to the model of the receiver due to
	the handled ${class:GtFileBrowserFileModelAddedAnnouncement}$ announcement."
	<modelEventHandler: #file event: #GtFileBrowserFileModelAddedAnnouncement>
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#onAddedEventHanderTemplate'>
	| aNewChildObject |

	aNewChildObject := self createFileBrowserFileViewModelsFor: aGtFileBrowserFileModelAddedAnnouncement fileBrowserFileModel.
	self fileBrowserFileViewModels add: aNewChildObject.
	self onFileBrowserFileViewModelAdded: aNewChildObject
]

{ #category : #'private - event handling' }
GtFileBrowserFilesViewModel >> onFileBrowserFileRemoved: aGtFileBrowserFileModelRemovedAnnouncement [
	"Is sent when an existing File is removed from the model of the receiver due to
	the handled ${class:GtFileBrowserFileModelRemovedAnnouncement}$ announcement."
	<modelEventHandler: #file event: #GtFileBrowserFileModelRemovedAnnouncement>
	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#onRemovedEventHanderTemplate'>
	| aChildObject |
	
	aChildObject := (self findFileBrowserFileViewModels: aGtFileBrowserFileModelRemovedAnnouncement fileBrowserFileModel)
		ifNil: [ ^ self ].

	self fileBrowserFileViewModels
		remove: aChildObject
		ifAbsent: [ ^ self ].

	self onFileBrowserFileViewModelRemoved: aChildObject
]

{ #category : #'api - adding' }
GtFileBrowserFilesViewModel >> onFileBrowserFileViewModelAdded: aFileBrowserFileViewModel [
	"Is sent after a given child object was added to the receiver"
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#objectAddedHookTemplate'>
	aFileBrowserFileViewModel parentFileBrowserFilesViewModel: self.
	self notifyFileBrowserFileViewModelAdded: aFileBrowserFileViewModel.
]

{ #category : #'api - adding' }
GtFileBrowserFilesViewModel >> onFileBrowserFileViewModelRemoved: aFileBrowserFileViewModel [
	"Is sent after a given child object was removed from the receiver"

	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#objectRemovedHookTemplate'>
	self notifyFileBrowserFileViewModelRemoved: aFileBrowserFileViewModel.
]

{ #category : #'api - selected file view model' }
GtFileBrowserFilesViewModel >> onNewSelectedFileViewModelSet: aNewSelectedFileViewModel [
	"Is sent after a new value of the selectedFileViewModel is assigned"
	<propertySetHook: #selectedFileViewModel>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#onNewPropertySetHookTemplate'>

	self hasParentFileBrowserFolderViewModel
		ifTrue: [ self parentFileBrowserFolderViewModel selectFolder ].
	aNewSelectedFileViewModel notifyFileSelected
]

{ #category : #'api - selected file view model' }
GtFileBrowserFilesViewModel >> onPreviousSelectedFileViewModelUnset: aPreviousSelectedFileViewModel [
	"Is sent after a previous value of the selectedFileViewModel is de-assigned"
	<propertyUnsetHook: #selectedFileViewModel>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#onPreviousPropertyUnsetHookTemplate'>

	aPreviousSelectedFileViewModel deselectOtherEntities.
	aPreviousSelectedFileViewModel notifyFileDeselected
]

{ #category : #'api - accessing' }
GtFileBrowserFilesViewModel >> parentFileBrowserFolderViewModel [
	"Return a parent object which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<return: #GtFileBrowserFolderViewModel>
	<parentObjectGetter: #folder>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectGetterTemplate'>

	self
		assert: [ parentFileBrowserFolderViewModel notNil ]
		description: [ 'Parent is not assigned!' ].

	^ parentFileBrowserFolderViewModel
]

{ #category : #'api - accessing' }
GtFileBrowserFilesViewModel >> parentFileBrowserFolderViewModel: aGtFileBrowserFolderViewModel [
	"Assign a parent object (${class:GtFileBrowserFolderViewModel}$) which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<parentObjectSetter: #folder>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectSetterTemplate'>

	self
		assert: [ aGtFileBrowserFolderViewModel notNil ]
		description: [ 'Parent view model must not be nil' ].

	parentFileBrowserFolderViewModel := aGtFileBrowserFolderViewModel
]

{ #category : #printing }
GtFileBrowserFilesViewModel >> printOn: aStream [
	<generatedFrom: #'GtRobocoderMetamodelPrintDerive>>#printOnTemplate'>
	aStream print: self fileBrowserFilesModel
]

{ #category : #'api - adding' }
GtFileBrowserFilesViewModel >> removeFileBrowserFileModel: aFileBrowserFile [
	"Request the model to remove a given child object.
	I do nothing and simply delegate the removal from the model. If the operation will trigger
	an announcement and I react to it, it will lead to an update"

	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#removeDelegateTemplate'>
	self fileBrowserFilesModel removeFileBrowserFileModel: aFileBrowserFile
]

{ #category : #'api - file browser files model' }
GtFileBrowserFilesViewModel >> subscribeToFileBrowserFilesModel [
	"Is sent after a new fileBrowserFilesModel is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromFileBrowserFilesModel if the receiver subscribes to them"
	<modelSubscriber: #files>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
	self fileBrowserFilesModel when: GtFileBrowserFileModelAddedAnnouncement send: #onFileBrowserFileAdded: to: self.
	self fileBrowserFilesModel when: GtFileBrowserFileModelRemovedAnnouncement send: #onFileBrowserFileRemoved: to: self.
]

{ #category : #'api - announcer' }
GtFileBrowserFilesViewModel >> unsubscribe: anObject [
	"Unsubscribe all subscriptions of anObject from the receiver"

	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#unsubscribeTemplate'>
	^ announcer ifNotNil: [ :anAnnouncer | anAnnouncer unsubscribe: anObject ]
]

{ #category : #'api - file browser files model' }
GtFileBrowserFilesViewModel >> unsubscribeFromFileBrowserFilesModel [
	"Is sent before a new fileBrowserFilesModel is assigned to the receiver.
	Objects that subscribe to fileBrowserFilesModel are required to implement this method."
	<modelUnsubscriber: #files>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
	self fileBrowserFilesModel unsubscribe: self.
]

{ #category : #'api - announcer' }
GtFileBrowserFilesViewModel >> when: anAnnouncementClass do: aBlock [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenDoTemplate'>
	^ (announcer ifNil: [ announcer := Announcer new ])
		when: anAnnouncementClass do: aBlock
]

{ #category : #'api - announcer' }
GtFileBrowserFilesViewModel >> when: anAnnouncementClass send: aSelector to: anObject [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenSendToTemplate'>
	^ (announcer ifNil: [ announcer := Announcer new ]) weak
		when: anAnnouncementClass send: aSelector to: anObject
]
