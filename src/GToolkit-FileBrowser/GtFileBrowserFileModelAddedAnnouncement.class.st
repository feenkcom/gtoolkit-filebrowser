Class {
	#name : #GtFileBrowserFileModelAddedAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'fileBrowserFileModel'
	],
	#category : #'GToolkit-FileBrowser-Events'
}

{ #category : #generated }
GtFileBrowserFileModelAddedAnnouncement >> fileBrowserFileModel [
	<objectGetter: #file>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectGetterTemplate'>

	^ fileBrowserFileModel
]

{ #category : #generated }
GtFileBrowserFileModelAddedAnnouncement >> fileBrowserFileModel: aFileBrowserFileModel [
	<objectSetter: #file>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectSetterTemplate'>

	fileBrowserFileModel := aFileBrowserFileModel
]
