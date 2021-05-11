Class {
	#name : #GtFileBrowserFolderViewModelRemovedAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'fileBrowserFolderViewModel'
	],
	#category : #'GToolkit-FileBrowser-Events'
}

{ #category : #generated }
GtFileBrowserFolderViewModelRemovedAnnouncement >> fileBrowserFolderViewModel [
	<objectGetter: #folder>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectGetterTemplate'>

	^ fileBrowserFolderViewModel
]

{ #category : #generated }
GtFileBrowserFolderViewModelRemovedAnnouncement >> fileBrowserFolderViewModel: aFileBrowserFolderViewModel [
	<objectSetter: #folder>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectSetterTemplate'>

	fileBrowserFolderViewModel := aFileBrowserFolderViewModel
]
