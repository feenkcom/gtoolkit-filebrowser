Class {
	#name : #GtFileBrowserFoldersViewModel,
	#superclass : #Object,
	#traits : 'TGtWithFileBrowserFoldersModel + TGtWithSelectedFolderViewModel',
	#classTraits : 'TGtWithFileBrowserFoldersModel classTrait + TGtWithSelectedFolderViewModel classTrait',
	#instVars : [
		'fileBrowserFolderViewModels',
		'parentFileBrowserFolderViewModel',
		'announcer'
	],
	#category : #'GToolkit-FileBrowser-View Models'
}

{ #category : #'api - adding' }
GtFileBrowserFoldersViewModel >> addFileBrowserFolderModel: aFileBrowserFolder [
	"Request the model to add a given child object.
	I do nothing and simply delegate the addition to the model. If the operation will trigger
	an announcement and I react to it, it will lead to an update"

	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#addDelegateTemplate'>
	self fileBrowserFoldersModel addFileBrowserFolderModel: aFileBrowserFolder
]

{ #category : #'api - enumerating' }
GtFileBrowserFoldersViewModel >> allParentFileBrowserFoldersViewModelDo: aBlock [
	"Evaluate a given block with all parents of the same type as the receiver"
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#allParentObjectsDoTemplate'>
	| aCurrentParent |
	
	aCurrentParent := self.
	
	aCurrentParent hasParentFileBrowserFolderViewModel
		ifFalse: [ ^ self ].
	aCurrentParent := aCurrentParent parentFileBrowserFolderViewModel.
	aCurrentParent hasParentFileBrowserFoldersViewModel
		ifFalse: [ ^ self ].
	aCurrentParent := aCurrentParent parentFileBrowserFoldersViewModel.
	aBlock value: aCurrentParent.
	aCurrentParent allParentFileBrowserFoldersViewModelDo: aBlock
]

{ #category : #'api - announcer' }
GtFileBrowserFoldersViewModel >> announce: anAnnouncement [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#announceTemplate'>
	announcer ifNotNil: [ :anAnnouncer | anAnnouncer announce: anAnnouncement ].
	"Dispatch anAnnouncement to the parent objects if they are assigned"
	self hasParentFileBrowserFolderViewModel
		ifTrue: [ self parentFileBrowserFolderViewModel announce: anAnnouncement ].
]

{ #category : #'private - instance creation' }
GtFileBrowserFoldersViewModel >> createFileBrowserFolderViewModelFor: aChildModel [
	<return: #GtFileBrowserFolderViewModel>
	<childObjectCreator: #folder>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#createChildTemplate'>
	| aNewChild |
	
	aNewChild := GtFileBrowserFolderViewModel new.
	aNewChild parentFileBrowserFoldersViewModel: self.
	aNewChild fileBrowserFolderModel: aChildModel.
	^ aNewChild
]

{ #category : #'private - instance creation' }
GtFileBrowserFoldersViewModel >> createFileBrowserFolderViewModels [
	"For each child from the domain model create an object and return a resulting collection"
	<return: #Collection of: #GtFileBrowserFolderViewModel>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#createChildObjectsTemplate'>

	^ self fileBrowserFoldersModel fileBrowserFolderModels collect: [ :eachModel |
		self createFileBrowserFolderViewModelsFor: eachModel ] as: OrderedCollection
]

{ #category : #'private - instance creation' }
GtFileBrowserFoldersViewModel >> createFileBrowserFolderViewModelsFor: aChildModel [
	<return: #GtFileBrowserFolderViewModel>
	<childObjectCreator: #folder>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#createChildTemplate'>
	| aNewChild |
	
	aNewChild := GtFileBrowserFolderViewModel new.
	aNewChild parentFileBrowserFoldersViewModel: self.
	aNewChild fileBrowserFolderModel: aChildModel.
	^ aNewChild
]

{ #category : #'api - selection' }
GtFileBrowserFoldersViewModel >> deselectAllFromTopMostParent [
	"Deselect any selected child starting from the top most parent"
	<propertyUnsetFromParent: #selectedFolderViewModel>
	<generatedFrom: #'TGtRobocoderMetamodelPropertyForParentTemplate>>#unsetAllFromTopMostParentTemplate'>
	
	self topMostParentsWithSelectionDo: [ :eachParent | eachParent deselectChildren ]
]

{ #category : #'api - selection' }
GtFileBrowserFoldersViewModel >> deselectChildren [
	"Deselect any selected child"
	<propertyUnsetChildren: #selectedFolderViewModel>
	<generatedFrom: #'TGtRobocoderMetamodelPropertyForParentTemplate>>#unsetChildrenTemplate'>
	self deselectFolderViewModel.
]

{ #category : #'api - accessing' }
GtFileBrowserFoldersViewModel >> fileBrowserFolderViewModels [
	"Return a collection of objects (${class:GtFileBrowserFolderViewModel}$) created for each child from the domain model.
	Note: The children are lazily instantiated."
	<return: #Collection of: #GtFileBrowserFolderViewModel>
	<childObjectGetter: #folder>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#childObjectsTemplate'>

	^  fileBrowserFolderViewModels ifNil: [ fileBrowserFolderViewModels := self createFileBrowserFolderViewModels ]
]

{ #category : #'api - accessing' }
GtFileBrowserFoldersViewModel >> findFileBrowserFolderViewModel: aFolder [
	"Find a child object based on the child model and return the child if it was found, nil otherwise.
	aNoneBlock otherwise."
	<return: #GtFileBrowserFolderViewModel or: nil>
	<childObjectDetector: #folder>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#findObjectTemplate'>

	^ self
		findFileBrowserFolderViewModel: aFolder
		ifFound: [ :aFileBrowserFolderViewModel | aFileBrowserFolderViewModel ]
		ifNone: [ nil ]
]

{ #category : #'api - accessing' }
GtFileBrowserFoldersViewModel >> findFileBrowserFolderViewModel: aFolder ifFound: aFoundBlock ifNone: aNoneBlock [
	"Find a child object based on the child model and evaluate aFoundBlock if such child was found,
	aNoneBlock otherwise."
	<return: #Object>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#findObjectIfFoundIfNoneTemplate'>

	^ self fileBrowserFolderViewModels
		detect: [ :eachFileBrowserFolderViewModel |
			eachFileBrowserFolderViewModel fileBrowserFolderModel = aFolder ]
		ifFound: aFoundBlock
		ifNone: aNoneBlock
]

{ #category : #'api - accessing' }
GtFileBrowserFoldersViewModel >> findFileBrowserFolderViewModels: aFolder [
	"Find a child object based on the child model and return the child if it was found, nil otherwise.
	aNoneBlock otherwise."
	<return: #GtFileBrowserFolderViewModel or: nil>
	<childObjectDetector: #folder>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#findObjectTemplate'>

	^ self
		findFileBrowserFolderViewModels: aFolder
		ifFound: [ :aFileBrowserFolderViewModels | aFileBrowserFolderViewModels ]
		ifNone: [ nil ]
]

{ #category : #'api - accessing' }
GtFileBrowserFoldersViewModel >> findFileBrowserFolderViewModels: aFolder ifFound: aFoundBlock ifNone: aNoneBlock [
	"Find a child object based on the child model and evaluate aFoundBlock if such child was found,
	aNoneBlock otherwise."
	<return: #Object>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#findObjectIfFoundIfNoneTemplate'>

	^ self fileBrowserFolderViewModels
		detect: [ :eachFileBrowserFolderViewModels |
			eachFileBrowserFolderViewModels fileBrowserFolderModel = aFolder ]
		ifFound: aFoundBlock
		ifNone: aNoneBlock
]

{ #category : #'gt-extentions' }
GtFileBrowserFoldersViewModel >> gtFolderListViewFor: aView [
	<gtView>
	<generatedFrom: #'GtRobocoderMetamodelPhlowListViewDerive>>#listForManyTemplate'>

	^ aView list
		priority: 5;
		title: 'Folder';
		items: [ self fileBrowserFolderViewModels ]
]

{ #category : #'api - testing' }
GtFileBrowserFoldersViewModel >> hasParentFileBrowserFolderViewModel [
	"Return true if the parent object is attached"
	<return: #Boolean>
	<parentObjectTester: #folder>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectTesterTemplate'>

	^ parentFileBrowserFolderViewModel notNil
]

{ #category : #'api - testing' }
GtFileBrowserFoldersViewModel >> includesFileBrowserFolderViewModel: aFileBrowserFolderViewModel [
	"Check and return true if a given child object exists among my children, false otherwise.
	The comparison happens by identity"
	<return: #Boolean>
	<childObjectFinder: #folder>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#includesObjectTemplate'>

	^ self fileBrowserFolderViewModels anySatisfy: [ :eachFileBrowserFolderViewModel |
		eachFileBrowserFolderViewModel == aFileBrowserFolderViewModel ]
]

{ #category : #'api - testing' }
GtFileBrowserFoldersViewModel >> includesFileBrowserFolderViewModels: aFileBrowserFolderViewModels [
	"Check and return true if a given child object exists among my children, false otherwise.
	The comparison happens by identity"
	<return: #Boolean>
	<childObjectFinder: #folder>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithModelTemplate>>#includesObjectTemplate'>

	^ self fileBrowserFolderViewModels anySatisfy: [ :eachFileBrowserFolderViewModels |
		eachFileBrowserFolderViewModels == aFileBrowserFolderViewModels ]
]

{ #category : #'api - testing' }
GtFileBrowserFoldersViewModel >> isFileBrowserFileViewModel [
	"Return true if the receiver represents fileBrowserFileViewModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
GtFileBrowserFoldersViewModel >> isFileBrowserFilesViewModel [
	"Return true if the receiver represents fileBrowserFilesViewModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
GtFileBrowserFoldersViewModel >> isFileBrowserFolderViewModel [
	"Return true if the receiver represents fileBrowserFolderViewModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
GtFileBrowserFoldersViewModel >> isFileBrowserFoldersViewModel [
	"Return true if the receiver represents fileBrowserFoldersViewModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ true
]

{ #category : #'private - notifying' }
GtFileBrowserFoldersViewModel >> notifyFileBrowserFolderViewModelAdded: aFileBrowserFolderViewModel [
	"Notifies that a given child object was added to the receiver"
	
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#notifyObjectAddedTemplate'>
	self announce: (GtFileBrowserFolderViewModelAddedAnnouncement new
		fileBrowserFolderViewModel: aFileBrowserFolderViewModel) 
]

{ #category : #'private - notifying' }
GtFileBrowserFoldersViewModel >> notifyFileBrowserFolderViewModelRemoved: aFileBrowserFolderViewModel [
	"Notifies that a given child object was removed from the receiver"
	
	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#notifyObjectRemovedTemplate'>
	self announce: (GtFileBrowserFolderViewModelRemovedAnnouncement new
		fileBrowserFolderViewModel: aFileBrowserFolderViewModel) 
]

{ #category : #'api - selected folder view model' }
GtFileBrowserFoldersViewModel >> notifySelectedFolderViewModelChanged [
	"Override this notify method to announce changes to the property"
	<propertyChangeNotifier: #selectedFolderViewModel>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#notifyPropertyChangedTemplate'>

	self announce: GtFileBrowserSelectedFolderViewModelChanged new
]

{ #category : #'api - accessing' }
GtFileBrowserFoldersViewModel >> objectName [
	"Return a symbolic name of the receiver which helps to create various type based mappings.
	Note: The symbolic name of the object is the exact name that was used
	in the metamodel declaration from which this class was generated"
	<return: #Symbol>
	<generatedFrom: #'GtRobocoderMetamodelNameDerive>>#objectNameTemplate'>

	^ #folders
]

{ #category : #'private - event handling' }
GtFileBrowserFoldersViewModel >> onFileBrowserFolderAdded: aGtFileBrowserFolderModelAddedAnnouncement [
	"Is sent when a new Folder is added to the model of the receiver due to
	the handled ${class:GtFileBrowserFolderModelAddedAnnouncement}$ announcement."
	<modelEventHandler: #folder event: #GtFileBrowserFolderModelAddedAnnouncement>
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#onAddedEventHanderTemplate'>
	| aNewChildObject |

	aNewChildObject := self createFileBrowserFolderViewModelsFor: aGtFileBrowserFolderModelAddedAnnouncement fileBrowserFolderModel.
	self fileBrowserFolderViewModels add: aNewChildObject.
	self onFileBrowserFolderViewModelAdded: aNewChildObject
]

{ #category : #'private - event handling' }
GtFileBrowserFoldersViewModel >> onFileBrowserFolderRemoved: aGtFileBrowserFolderModelRemovedAnnouncement [
	"Is sent when an existing Folder is removed from the model of the receiver due to
	the handled ${class:GtFileBrowserFolderModelRemovedAnnouncement}$ announcement."
	<modelEventHandler: #folder event: #GtFileBrowserFolderModelRemovedAnnouncement>
	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#onRemovedEventHanderTemplate'>
	| aChildObject |
	
	aChildObject := (self findFileBrowserFolderViewModels: aGtFileBrowserFolderModelRemovedAnnouncement fileBrowserFolderModel)
		ifNil: [ ^ self ].

	self fileBrowserFolderViewModels
		remove: aChildObject
		ifAbsent: [ ^ self ].

	self onFileBrowserFolderViewModelRemoved: aChildObject
]

{ #category : #'api - adding' }
GtFileBrowserFoldersViewModel >> onFileBrowserFolderViewModelAdded: aFileBrowserFolderViewModel [
	"Is sent after a given child object was added to the receiver"
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#objectAddedHookTemplate'>
	aFileBrowserFolderViewModel parentFileBrowserFoldersViewModel: self.
	self notifyFileBrowserFolderViewModelAdded: aFileBrowserFolderViewModel.
]

{ #category : #'api - adding' }
GtFileBrowserFoldersViewModel >> onFileBrowserFolderViewModelRemoved: aFileBrowserFolderViewModel [
	"Is sent after a given child object was removed from the receiver"

	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#objectRemovedHookTemplate'>
	self notifyFileBrowserFolderViewModelRemoved: aFileBrowserFolderViewModel.
]

{ #category : #'api - selected folder view model' }
GtFileBrowserFoldersViewModel >> onNewSelectedFolderViewModelSet: aNewSelectedFolderViewModel [
	"Is sent after a new value of the selectedFolderViewModel is assigned"
	<propertySetHook: #selectedFolderViewModel>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#onNewPropertySetHookTemplate'>

	self hasParentFileBrowserFolderViewModel
		ifTrue: [ self parentFileBrowserFolderViewModel selectFolder ].
	aNewSelectedFolderViewModel notifyFolderSelected
]

{ #category : #'api - selected folder view model' }
GtFileBrowserFoldersViewModel >> onPreviousSelectedFolderViewModelUnset: aPreviousSelectedFolderViewModel [
	"Is sent after a previous value of the selectedFolderViewModel is de-assigned"
	<propertyUnsetHook: #selectedFolderViewModel>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#onPreviousPropertyUnsetHookTemplate'>

	aPreviousSelectedFolderViewModel deselectChildren.
	aPreviousSelectedFolderViewModel notifyFolderDeselected
]

{ #category : #'api - accessing' }
GtFileBrowserFoldersViewModel >> parentFileBrowserFolderViewModel [
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
GtFileBrowserFoldersViewModel >> parentFileBrowserFolderViewModel: aGtFileBrowserFolderViewModel [
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
GtFileBrowserFoldersViewModel >> printOn: aStream [
	<generatedFrom: #'GtRobocoderMetamodelPrintDerive>>#printOnTemplate'>
	aStream print: self fileBrowserFoldersModel
]

{ #category : #'api - adding' }
GtFileBrowserFoldersViewModel >> removeFileBrowserFolderModel: aFileBrowserFolder [
	"Request the model to remove a given child object.
	I do nothing and simply delegate the removal from the model. If the operation will trigger
	an announcement and I react to it, it will lead to an update"

	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#removeDelegateTemplate'>
	self fileBrowserFoldersModel removeFileBrowserFolderModel: aFileBrowserFolder
]

{ #category : #'api - file browser folders model' }
GtFileBrowserFoldersViewModel >> subscribeToFileBrowserFoldersModel [
	"Is sent after a new fileBrowserFoldersModel is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromFileBrowserFoldersModel if the receiver subscribes to them"
	<modelSubscriber: #folders>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
	self fileBrowserFoldersModel when: GtFileBrowserFolderModelAddedAnnouncement send: #onFileBrowserFolderAdded: to: self.
	self fileBrowserFoldersModel when: GtFileBrowserFolderModelRemovedAnnouncement send: #onFileBrowserFolderRemoved: to: self.
]

{ #category : #'api - selection' }
GtFileBrowserFoldersViewModel >> topMostParentsWithSelectionDo: aBlock [
	"Evaluate a given block with each top most parent that has a selectedFolderViewModel property"
	<propertyTopMostParents: #selectedFolderViewModel>
	<generatedFrom: #'TGtRobocoderMetamodelPropertyForParentTemplate>>#topMostParentsWithPropertyDoTemplate'>
	
	| aCurrentParent aParentFound |
	
	aParentFound := false.
	
	aCurrentParent := self.
	(aCurrentParent notNil and: [ aCurrentParent hasParentFileBrowserFolderViewModel ])
		ifFalse: [ aCurrentParent := nil ]
		ifTrue: [ aCurrentParent := aCurrentParent parentFileBrowserFolderViewModel ].
	
	aCurrentParent
		ifNotNil: [
			aParentFound := true.
			aCurrentParent topMostParentsWithSelectionDo: aBlock ].
	
	
	"there is no assigned parent, meaning I am the topmost"
	aParentFound
		ifFalse: [ aBlock value: self ].
]

{ #category : #'api - announcer' }
GtFileBrowserFoldersViewModel >> unsubscribe: anObject [
	"Unsubscribe all subscriptions of anObject from the receiver"

	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#unsubscribeTemplate'>
	^ announcer ifNotNil: [ :anAnnouncer | anAnnouncer unsubscribe: anObject ]
]

{ #category : #'api - file browser folders model' }
GtFileBrowserFoldersViewModel >> unsubscribeFromFileBrowserFoldersModel [
	"Is sent before a new fileBrowserFoldersModel is assigned to the receiver.
	Objects that subscribe to fileBrowserFoldersModel are required to implement this method."
	<modelUnsubscriber: #folders>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
	self fileBrowserFoldersModel unsubscribe: self.
]

{ #category : #'api - announcer' }
GtFileBrowserFoldersViewModel >> when: anAnnouncementClass do: aBlock [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenDoTemplate'>
	^ (announcer ifNil: [ announcer := Announcer new ])
		when: anAnnouncementClass do: aBlock
]

{ #category : #'api - announcer' }
GtFileBrowserFoldersViewModel >> when: anAnnouncementClass send: aSelector to: anObject [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenSendToTemplate'>
	^ (announcer ifNil: [ announcer := Announcer new ]) weak
		when: anAnnouncementClass send: aSelector to: anObject
]

{ #category : #'api - enumerating' }
GtFileBrowserFoldersViewModel >> withAllParentFileBrowserFoldersViewModel [
	"Collect and return the receiver and all its parents in the bottom to top order starting with the receiver"
	<return: #Array>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#withAllParentObjectsTemplate'>

	^ Array streamContents: [ :aStream |
		self withAllParentFileBrowserFoldersViewModelDo: [ :eachParent | aStream nextPut: eachParent ] ]
]

{ #category : #'api - enumerating' }
GtFileBrowserFoldersViewModel >> withAllParentFileBrowserFoldersViewModelDo: aBlock [
	"Evaluate a given block with the receiver and all its parents of the same type"

	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#withAllParentObjectsDoTemplate'>
	aBlock value: self.
	self allParentFileBrowserFoldersViewModelDo: aBlock
]
