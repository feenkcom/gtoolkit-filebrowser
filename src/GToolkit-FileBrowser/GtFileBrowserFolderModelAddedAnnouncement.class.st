Class {
	#name : #GtFileBrowserFolderModelAddedAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'fileBrowserFolderModel'
	],
	#category : #'GToolkit-FileBrowser-Events'
}

{ #category : #generated }
GtFileBrowserFolderModelAddedAnnouncement >> fileBrowserFolderModel [
	<objectGetter: #folder>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectGetterTemplate'>

	^ fileBrowserFolderModel
]

{ #category : #generated }
GtFileBrowserFolderModelAddedAnnouncement >> fileBrowserFolderModel: aFileBrowserFolderModel [
	<objectSetter: #folder>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectSetterTemplate'>

	fileBrowserFolderModel := aFileBrowserFolderModel
]
