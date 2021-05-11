Class {
	#name : #GtFileBrowserSelectedFileViewModelChanged,
	#superclass : #Announcement,
	#instVars : [
		'selectedFileViewModel'
	],
	#category : #'GToolkit-FileBrowser-Events'
}

{ #category : #generated }
GtFileBrowserSelectedFileViewModelChanged >> selectedFileViewModel [
	<objectGetter: #file>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectGetterTemplate'>

	^ selectedFileViewModel
]

{ #category : #generated }
GtFileBrowserSelectedFileViewModelChanged >> selectedFileViewModel: aSelectedFileViewModel [
	<objectSetter: #file>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectSetterTemplate'>

	selectedFileViewModel := aSelectedFileViewModel
]
