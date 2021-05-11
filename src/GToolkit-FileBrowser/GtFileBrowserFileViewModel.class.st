Class {
	#name : #GtFileBrowserFileViewModel,
	#superclass : #Object,
	#traits : 'TGtWithFileBrowserFileModel',
	#classTraits : 'TGtWithFileBrowserFileModel classTrait',
	#instVars : [
		'announcer',
		'parentFileBrowserFilesViewModel'
	],
	#category : #'GToolkit-FileBrowser-View Models'
}

{ #category : #'api - announcer' }
GtFileBrowserFileViewModel >> announce: anAnnouncement [
	<generatedFrom: #'GtRobocoderMetamodelNotifierDerive>>#announceTemplate'>
	announcer ifNotNil: [ :anAnnouncer | anAnnouncer announce: anAnnouncement ].

	"Dispatch anAnnouncement to the parent objects if they are assigned"
	self hasParentFileBrowserFilesViewModel
		ifTrue: [ self parentFileBrowserFilesViewModel announce: anAnnouncement ].
]

{ #category : #'api - selection' }
GtFileBrowserFileViewModel >> deselectOtherEntities [
	"Deselect any selected child"
	<propertyUnsetOthers: #selectedFileViewModel>
	<generatedFrom: #'TGtRobocoderMetamodelPropertyForChildTemplate>>#unsetOtherObjectsTemplate'>
]

{ #category : #'api - selection' }
GtFileBrowserFileViewModel >> hasOtherSelectedEntities [
	"Return true if there are other selected entities that are the children"
	<return: #Boolean>
	<propertyTestOthers: #selectedFileViewModel>
	<generatedFrom: #'TGtRobocoderMetamodelPropertyForChildTemplate>>#hasOtherPropertyTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
GtFileBrowserFileViewModel >> hasParentFileBrowserFilesViewModel [
	"Return true if the parent object is attached"
	<return: #Boolean>
	<parentObjectTester: #files>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectTesterTemplate'>

	^ parentFileBrowserFilesViewModel notNil
]

{ #category : #'api - testing' }
GtFileBrowserFileViewModel >> isFileBrowserFileViewModel [
	"Return true if the receiver represents fileBrowserFileViewModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ true
]

{ #category : #'api - testing' }
GtFileBrowserFileViewModel >> isFileBrowserFilesViewModel [
	"Return true if the receiver represents fileBrowserFilesViewModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
GtFileBrowserFileViewModel >> isFileBrowserFolderViewModel [
	"Return true if the receiver represents fileBrowserFolderViewModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
GtFileBrowserFileViewModel >> isFileBrowserFoldersViewModel [
	"Return true if the receiver represents fileBrowserFoldersViewModel, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - selection' }
GtFileBrowserFileViewModel >> isOnlySelectedFile [
	"Return true if only this file is selected and not any of the children"
	<return: #Boolean>
	<generatedFrom: #'TGtRobocoderMetamodelPropertyForChildTemplate>>#onlyPropertyStatusTesterTemplate'>

	^ self isSelectedFile and: [ self hasOtherSelectedEntities not ]
]

{ #category : #'api - selection' }
GtFileBrowserFileViewModel >> isSelectedFile [
	"Return true if this file is selected"
	<return: #Boolean>
	<generatedFrom: #'TGtRobocoderMetamodelPropertyForChildTemplate>>#propertyStatusTesterTemplate'>

	^ self parentFileBrowserFilesViewModel hasSelectedFileViewModel
		and: [ self parentFileBrowserFilesViewModel selectedFileViewModel == self ]
]

{ #category : #'api - selection' }
GtFileBrowserFileViewModel >> notifyFileDeselected [
	<propertyUnsetNotifier: #selectedFileViewModel>
	<generatedFrom: #'TGtRobocoderMetamodelPropertyForChildTemplate>>#notifyPropertyUnsetTemplate'>

	self announce: (GtFileBrowserFileViewModelViewModelDeselected new fileBrowserFileViewModel: self)
]

{ #category : #'api - selection' }
GtFileBrowserFileViewModel >> notifyFileSelected [
	<propertySetNotifier: #selectedFileViewModel>
	<generatedFrom: #'TGtRobocoderMetamodelPropertyForChildTemplate>>#notifyPropertySetTemplate'>

	self announce: (GtFileBrowserFileViewModelViewModelSelected new fileBrowserFileViewModel: self)
]

{ #category : #'api - accessing' }
GtFileBrowserFileViewModel >> objectName [
	"Return a symbolic name of the receiver which helps to create various type based mappings.
	Note: The symbolic name of the object is the exact name that was used
	in the metamodel declaration from which this class was generated"
	<return: #Symbol>
	<generatedFrom: #'GtRobocoderMetamodelNameDerive>>#objectNameTemplate'>

	^ #file
]

{ #category : #'api - accessing' }
GtFileBrowserFileViewModel >> parentFileBrowserFilesViewModel [
	"Return a parent object which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<return: #GtFileBrowserFilesViewModel>
	<parentObjectGetter: #files>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectGetterTemplate'>

	self
		assert: [ parentFileBrowserFilesViewModel notNil ]
		description: [ 'Parent is not assigned!' ].

	^ parentFileBrowserFilesViewModel
]

{ #category : #'api - accessing' }
GtFileBrowserFileViewModel >> parentFileBrowserFilesViewModel: aGtFileBrowserFilesViewModel [
	"Assign a parent object (${class:GtFileBrowserFilesViewModel}$) which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<parentObjectSetter: #files>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectSetterTemplate'>

	self
		assert: [ aGtFileBrowserFilesViewModel notNil ]
		description: [ 'Parent view model must not be nil' ].

	parentFileBrowserFilesViewModel := aGtFileBrowserFilesViewModel
]

{ #category : #printing }
GtFileBrowserFileViewModel >> printOn: aStream [
	<generatedFrom: #'GtRobocoderMetamodelPrintDerive>>#printOnTemplate'>
	aStream print: self fileBrowserFileModel
]

{ #category : #'api - selection' }
GtFileBrowserFileViewModel >> selectFile [
	"Just select a file without changing children"
	<propertySetter: #selectedFileViewModel>
	<generatedFrom: #'TGtRobocoderMetamodelPropertyForChildTemplate>>#setObjectTemplate'>
	
	self hasParentFileBrowserFilesViewModel
		ifTrue: [ self parentFileBrowserFilesViewModel selectFileViewModel: self ]
]

{ #category : #'api - selection' }
GtFileBrowserFileViewModel >> selectFileWithoutOtherEntities [
	"Select a file and deselect other selected children"

	<generatedFrom: #'TGtRobocoderMetamodelPropertyForChildTemplate>>#setObjectWithoutOtherEntitiesTemplate'>
	self deselectOtherEntities.
	self selectFile
]

{ #category : #'api - announcer' }
GtFileBrowserFileViewModel >> unsubscribe: anObject [
	"Unsubscribe all subscriptions of anObject from the receiver"

	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#unsubscribeTemplate'>
	^ announcer ifNotNil: [ :anAnnouncer | anAnnouncer unsubscribe: anObject ]
]

{ #category : #'api - announcer' }
GtFileBrowserFileViewModel >> when: anAnnouncementClass do: aBlock [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenDoTemplate'>
	^ (announcer ifNil: [ announcer := Announcer new ])
		when: anAnnouncementClass do: aBlock
]

{ #category : #'api - announcer' }
GtFileBrowserFileViewModel >> when: anAnnouncementClass send: aSelector to: anObject [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenSendToTemplate'>
	^ (announcer ifNil: [ announcer := Announcer new ]) weak
		when: anAnnouncementClass send: aSelector to: anObject
]
