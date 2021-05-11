Class {
	#name : #GtFileBrowserSelectedFolderViewModelChanged,
	#superclass : #Announcement,
	#instVars : [
		'selectedFolderViewModel'
	],
	#category : #'GToolkit-FileBrowser-Events'
}

{ #category : #generated }
GtFileBrowserSelectedFolderViewModelChanged >> selectedFolderViewModel [
	<objectGetter: #folder>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectGetterTemplate'>

	^ selectedFolderViewModel
]

{ #category : #generated }
GtFileBrowserSelectedFolderViewModelChanged >> selectedFolderViewModel: aSelectedFolderViewModel [
	<objectSetter: #folder>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectSetterTemplate'>

	selectedFolderViewModel := aSelectedFolderViewModel
]
