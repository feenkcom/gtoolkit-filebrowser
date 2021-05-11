Class {
	#name : #GtFileBrowserFileViewModelAddedAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'fileBrowserFileViewModel'
	],
	#category : #'GToolkit-FileBrowser-Events'
}

{ #category : #generated }
GtFileBrowserFileViewModelAddedAnnouncement >> fileBrowserFileViewModel [
	<objectGetter: #file>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectGetterTemplate'>

	^ fileBrowserFileViewModel
]

{ #category : #generated }
GtFileBrowserFileViewModelAddedAnnouncement >> fileBrowserFileViewModel: aFileBrowserFileViewModel [
	<objectSetter: #file>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectSetterTemplate'>

	fileBrowserFileViewModel := aFileBrowserFileViewModel
]
