Class {
	#name : #GtFileBrowserFolderViewModelAddedAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'fileBrowserFolderViewModel'
	],
	#category : #'GToolkit-FileBrowser-Events'
}

{ #category : #generated }
GtFileBrowserFolderViewModelAddedAnnouncement >> fileBrowserFolderViewModel [
	<objectGetter: #folder>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectGetterTemplate'>

	^ fileBrowserFolderViewModel
]

{ #category : #generated }
GtFileBrowserFolderViewModelAddedAnnouncement >> fileBrowserFolderViewModel: aFileBrowserFolderViewModel [
	<objectSetter: #folder>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectSetterTemplate'>

	fileBrowserFolderViewModel := aFileBrowserFolderViewModel
]
