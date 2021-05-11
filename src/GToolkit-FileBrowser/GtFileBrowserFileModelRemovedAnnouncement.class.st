Class {
	#name : #GtFileBrowserFileModelRemovedAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'fileBrowserFileModel'
	],
	#category : #'GToolkit-FileBrowser-Events'
}

{ #category : #generated }
GtFileBrowserFileModelRemovedAnnouncement >> fileBrowserFileModel [
	<objectGetter: #file>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectGetterTemplate'>

	^ fileBrowserFileModel
]

{ #category : #generated }
GtFileBrowserFileModelRemovedAnnouncement >> fileBrowserFileModel: aFileBrowserFileModel [
	<objectSetter: #file>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectSetterTemplate'>

	fileBrowserFileModel := aFileBrowserFileModel
]
