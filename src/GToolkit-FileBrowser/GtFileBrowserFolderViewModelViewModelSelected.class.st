Class {
	#name : #GtFileBrowserFolderViewModelViewModelSelected,
	#superclass : #Announcement,
	#instVars : [
		'fileBrowserFolderViewModel'
	],
	#category : #'GToolkit-FileBrowser-Events'
}

{ #category : #generated }
GtFileBrowserFolderViewModelViewModelSelected >> fileBrowserFolderViewModel [
	<objectGetter: #folder>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectGetterTemplate'>

	^ fileBrowserFolderViewModel
]

{ #category : #generated }
GtFileBrowserFolderViewModelViewModelSelected >> fileBrowserFolderViewModel: aFileBrowserFolderViewModel [
	<objectSetter: #folder>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectSetterTemplate'>

	fileBrowserFolderViewModel := aFileBrowserFolderViewModel
]
