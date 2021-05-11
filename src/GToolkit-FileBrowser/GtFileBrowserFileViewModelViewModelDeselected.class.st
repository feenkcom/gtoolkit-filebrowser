Class {
	#name : #GtFileBrowserFileViewModelViewModelDeselected,
	#superclass : #Announcement,
	#instVars : [
		'fileBrowserFileViewModel'
	],
	#category : #'GToolkit-FileBrowser-Events'
}

{ #category : #generated }
GtFileBrowserFileViewModelViewModelDeselected >> fileBrowserFileViewModel [
	<objectGetter: #file>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectGetterTemplate'>

	^ fileBrowserFileViewModel
]

{ #category : #generated }
GtFileBrowserFileViewModelViewModelDeselected >> fileBrowserFileViewModel: aFileBrowserFileViewModel [
	<objectSetter: #file>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectSetterTemplate'>

	fileBrowserFileViewModel := aFileBrowserFileViewModel
]
