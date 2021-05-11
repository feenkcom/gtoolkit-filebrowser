Class {
	#name : #GtFileBrowserFolderModelRemovedAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'fileBrowserFolderModel'
	],
	#category : #'GToolkit-FileBrowser-Events'
}

{ #category : #generated }
GtFileBrowserFolderModelRemovedAnnouncement >> fileBrowserFolderModel [
	<objectGetter: #folder>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectGetterTemplate'>

	^ fileBrowserFolderModel
]

{ #category : #generated }
GtFileBrowserFolderModelRemovedAnnouncement >> fileBrowserFolderModel: aFileBrowserFolderModel [
	<objectSetter: #folder>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectSetterTemplate'>

	fileBrowserFolderModel := aFileBrowserFolderModel
]
