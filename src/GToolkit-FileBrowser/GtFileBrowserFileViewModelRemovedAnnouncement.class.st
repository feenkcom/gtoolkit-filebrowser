Class {
	#name : #GtFileBrowserFileViewModelRemovedAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'fileBrowserFileViewModel'
	],
	#category : #'GToolkit-FileBrowser-Events'
}

{ #category : #generated }
GtFileBrowserFileViewModelRemovedAnnouncement >> fileBrowserFileViewModel [
	<objectGetter: #file>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectGetterTemplate'>

	^ fileBrowserFileViewModel
]

{ #category : #generated }
GtFileBrowserFileViewModelRemovedAnnouncement >> fileBrowserFileViewModel: aFileBrowserFileViewModel [
	<objectSetter: #file>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectSetterTemplate'>

	fileBrowserFileViewModel := aFileBrowserFileViewModel
]
