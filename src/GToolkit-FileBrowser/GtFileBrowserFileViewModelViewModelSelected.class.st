Class {
	#name : #GtFileBrowserFileViewModelViewModelSelected,
	#superclass : #Announcement,
	#instVars : [
		'fileBrowserFileViewModel'
	],
	#category : #'GToolkit-FileBrowser-Events'
}

{ #category : #generated }
GtFileBrowserFileViewModelViewModelSelected >> fileBrowserFileViewModel [
	<objectGetter: #file>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectGetterTemplate'>

	^ fileBrowserFileViewModel
]

{ #category : #generated }
GtFileBrowserFileViewModelViewModelSelected >> fileBrowserFileViewModel: aFileBrowserFileViewModel [
	<objectSetter: #file>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectSetterTemplate'>

	fileBrowserFileViewModel := aFileBrowserFileViewModel
]
