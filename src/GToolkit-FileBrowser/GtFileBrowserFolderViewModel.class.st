Class {
	#name : #GtFileBrowserFolderViewModel,
	#superclass : #Object,
	#traits : 'TGtWithFileBrowserFolderModel',
	#classTraits : 'TGtWithFileBrowserFolderModel classTrait',
	#instVars : [
		'fileBrowserFilesViewModel',
		'fileBrowserFoldersViewModel',
		'announcer',
		'parentFileBrowserFoldersViewModel'
	],
	#category : #'GToolkit-FileBrowser-View Models'
}

{ #category : #'api - announcer' }
GtFileBrowserFolderViewModel >> announce: anAnnouncement [
	<generatedFrom: #'GtRobocoderMetamodelNotifierDerive>>#announceTemplate'>
	announcer ifNotNil: [ :anAnnouncer | anAnnouncer announce: anAnnouncement ].

	"Dispatch anAnnouncement to the parent objects if they are assigned"
	self hasParentFileBrowserFoldersViewModel
		ifTrue: [ self parentFileBrowserFoldersViewModel announce: anAnnouncement ].
]

{ #category : #'private - instance creation' }
GtFileBrowserFolderViewModel >> createFileBrowserFilesViewModel [
	"Create a nested child object for a domain child (or children) and return the result"
	<return: #GtFileBrowserFilesViewModel>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForOneTemplate>>#createChildObjectsTemplate'>
	| childObject |

	childObject := GtFileBrowserFilesViewModel new.
	childObject parentFileBrowserFolderViewModel: self.
	childObject fileBrowserFilesModel: self fileBrowserFolderModel fileBrowserFilesModel.
	^ childObject
]

{ #category : #'private - instance creation' }
GtFileBrowserFolderViewModel >> createFileBrowserFoldersViewModel [
	"Create a nested child object for a domain child (or children) and return the result"
	<return: #GtFileBrowserFoldersViewModel>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForOneTemplate>>#createChildObjectsTemplate'>
	| childObject |

	childObject := GtFileBrowserFoldersViewModel new.
	childObject parentFileBrowserFolderViewModel: self.
	childObject fileBrowserFoldersModel: self fileBrowserFolderModel fileBrowserFoldersModel.
	^ childObject
]

{ #category : #'api - selection' }
GtFileBrowserFolderViewModel >> deselectOtherEntities [
	"Deselect any selected child"
	<propertyUnsetOthers: #selectedFolderViewModel>
	<generatedFrom: #'TGtRobocoderMetamodelPropertyForChildTemplate>>#unsetOtherObjectsTemplate'>

	self fileBrowserFilesViewModel deselectFileViewModel.
	self fileBrowserFoldersViewModel deselectFolderViewModel.
]

{ #category : #'api - accessing' }
GtFileBrowserFolderViewModel >> fileBrowserFilesViewModel [
	"Return a composite object (${class:nil}$) created for a collection of children from the domain model.
	Note: The object is lazily instantiated."
	<return: #GtFileBrowserFilesViewModel>
	<childObjectGetter: #files>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForOneTemplate>>#childObjectsTemplate'>

	^ fileBrowserFilesViewModel ifNil: [ fileBrowserFilesViewModel := self createFileBrowserFilesViewModel ]
]

{ #category : #'api - accessing' }
GtFileBrowserFolderViewModel >> fileBrowserFoldersViewModel [
	"Return a composite object (${class:nil}$) created for a collection of children from the domain model.
	Note: The object is lazily instantiated."
	<return: #GtFileBrowserFoldersViewModel>
	<childObjectGetter: #folders>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForOneTemplate>>#childObjectsTemplate'>

	^ fileBrowserFoldersViewModel ifNil: [ fileBrowserFoldersViewModel := self createFileBrowserFoldersViewModel ]
]

{ #category : #'gt-extentions' }
GtFileBrowserFolderViewModel >> gtFilesListViewFor: aView [
	<gtView>
	<generatedFrom: #'GtRobocoderMetamodelPhlowListViewDerive>>#listForOneTemplate'>

	^ aView list
		priority: 5;
		title: 'Files';
		items: [ self fileBrowserFilesViewModel fileBrowserFileViewModels ]
]

{ #category : #'gt-extentions' }
GtFileBrowserFolderViewModel >> gtFoldersListViewFor: aView [
	<gtView>
	<generatedFrom: #'GtRobocoderMetamodelPhlowListViewDerive>>#listForOneTemplate'>

	^ aView list
		priority: 5;
		title: 'Folders';
		items: [ self fileBrowserFoldersViewModel fileBrowserFolderViewModels ]
]

{ #category : #'api - selection' }
GtFileBrowserFolderViewModel >> hasOtherSelectedEntities [
	"Return true if there are other selected entities that are the children"
	<return: #Boolean>
	<propertyTestOthers: #selectedFolderViewModel>
	<generatedFrom: #'TGtRobocoderMetamodelPropertyForChildTemplate>>#hasOtherPropertyTesterTemplate'>

	^ self fileBrowserFilesViewModel hasSelectedFileViewModel or: [ self fileBrowserFoldersViewModel hasSelectedFolderViewModel ]
]

{ #category : #'api - testing' }
GtFileBrowserFolderViewModel >> hasParentFileBrowserFoldersViewModel [
	"Return true if the parent object is attached"
	<return: #Boolean>
	<parentObjectTester: #folders>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectTesterTemplate'>

	^ parentFileBrowserFoldersViewModel notNil
]

{ #category : #'api - testing' }
GtFileBrowserFolderViewModel >> isFileBrowserFileViewModel [
	"Return true if the receiver represents fileBrowserFileViewModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
GtFileBrowserFolderViewModel >> isFileBrowserFilesViewModel [
	"Return true if the receiver represents fileBrowserFilesViewModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
GtFileBrowserFolderViewModel >> isFileBrowserFolderViewModel [
	"Return true if the receiver represents fileBrowserFolderViewModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ true
]

{ #category : #'api - testing' }
GtFileBrowserFolderViewModel >> isFileBrowserFoldersViewModel [
	"Return true if the receiver represents fileBrowserFoldersViewModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - selection' }
GtFileBrowserFolderViewModel >> isOnlySelectedFolder [
	"Return true if only this folder is selected and not any of the children"
	<return: #Boolean>
	<generatedFrom: #'TGtRobocoderMetamodelPropertyForChildTemplate>>#onlyPropertyStatusTesterTemplate'>

	^ self isSelectedFolder and: [ self hasOtherSelectedEntities not ]
]

{ #category : #'api - selection' }
GtFileBrowserFolderViewModel >> isSelectedFolder [
	"Return true if this folder is selected"
	<return: #Boolean>
	<generatedFrom: #'TGtRobocoderMetamodelPropertyForChildTemplate>>#propertyStatusTesterTemplate'>

	^ self parentFileBrowserFoldersViewModel hasSelectedFolderViewModel
		and: [ self parentFileBrowserFoldersViewModel selectedFolderViewModel == self ]
]

{ #category : #'api - selection' }
GtFileBrowserFolderViewModel >> notifyFolderDeselected [
	<propertyUnsetNotifier: #selectedFolderViewModel>
	<generatedFrom: #'TGtRobocoderMetamodelPropertyForChildTemplate>>#notifyPropertyUnsetTemplate'>

	self announce: (GtFileBrowserFolderViewModelViewModelDeselected new fileBrowserFolderViewModel: self)
]

{ #category : #'api - selection' }
GtFileBrowserFolderViewModel >> notifyFolderSelected [
	<propertySetNotifier: #selectedFolderViewModel>
	<generatedFrom: #'TGtRobocoderMetamodelPropertyForChildTemplate>>#notifyPropertySetTemplate'>

	self announce: (GtFileBrowserFolderViewModelViewModelSelected new fileBrowserFolderViewModel: self)
]

{ #category : #'api - accessing' }
GtFileBrowserFolderViewModel >> objectName [
	"Return a symbolic name of the receiver which helps to create various type based mappings.
	Note: The symbolic name of the object is the exact name that was used
	in the metamodel declaration from which this class was generated"
	<return: #Symbol>
	<generatedFrom: #'GtRobocoderMetamodelNameDerive>>#objectNameTemplate'>

	^ #folder
]

{ #category : #'api - accessing' }
GtFileBrowserFolderViewModel >> parentFileBrowserFoldersViewModel [
	"Return a parent object which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<return: #GtFileBrowserFoldersViewModel>
	<parentObjectGetter: #folders>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectGetterTemplate'>

	self
		assert: [ parentFileBrowserFoldersViewModel notNil ]
		description: [ 'Parent is not assigned!' ].

	^ parentFileBrowserFoldersViewModel
]

{ #category : #'api - accessing' }
GtFileBrowserFolderViewModel >> parentFileBrowserFoldersViewModel: aGtFileBrowserFoldersViewModel [
	"Assign a parent object (${class:GtFileBrowserFoldersViewModel}$) which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<parentObjectSetter: #folders>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectSetterTemplate'>

	self
		assert: [ aGtFileBrowserFoldersViewModel notNil ]
		description: [ 'Parent view model must not be nil' ].

	parentFileBrowserFoldersViewModel := aGtFileBrowserFoldersViewModel
]

{ #category : #printing }
GtFileBrowserFolderViewModel >> printOn: aStream [
	<generatedFrom: #'GtRobocoderMetamodelPrintDerive>>#printOnTemplate'>
	aStream print: self fileBrowserFolderModel
]

{ #category : #'api - selection' }
GtFileBrowserFolderViewModel >> selectFolder [
	"Just select a folder without changing children"
	<propertySetter: #selectedFolderViewModel>
	<generatedFrom: #'TGtRobocoderMetamodelPropertyForChildTemplate>>#setObjectTemplate'>
	
	self hasParentFileBrowserFoldersViewModel
		ifTrue: [ self parentFileBrowserFoldersViewModel selectFolderViewModel: self ]
]

{ #category : #'api - selection' }
GtFileBrowserFolderViewModel >> selectFolderWithoutOtherEntities [
	"Select a folder and deselect other selected children"

	<generatedFrom: #'TGtRobocoderMetamodelPropertyForChildTemplate>>#setObjectWithoutOtherEntitiesTemplate'>
	self deselectOtherEntities.
	self selectFolder
]

{ #category : #'api - announcer' }
GtFileBrowserFolderViewModel >> unsubscribe: anObject [
	"Unsubscribe all subscriptions of anObject from the receiver"

	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#unsubscribeTemplate'>
	^ announcer ifNotNil: [ :anAnnouncer | anAnnouncer unsubscribe: anObject ]
]

{ #category : #'api - announcer' }
GtFileBrowserFolderViewModel >> when: anAnnouncementClass do: aBlock [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenDoTemplate'>
	^ (announcer ifNil: [ announcer := Announcer new ])
		when: anAnnouncementClass do: aBlock
]

{ #category : #'api - announcer' }
GtFileBrowserFolderViewModel >> when: anAnnouncementClass send: aSelector to: anObject [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenSendToTemplate'>
	^ (announcer ifNil: [ announcer := Announcer new ]) weak
		when: anAnnouncementClass send: aSelector to: anObject
]
