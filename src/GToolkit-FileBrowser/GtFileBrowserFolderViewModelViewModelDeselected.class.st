Class {
	#name : #GtFileBrowserFolderViewModelViewModelDeselected,
	#superclass : #Announcement,
	#instVars : [
		'fileBrowserFolderViewModel'
	],
	#category : #'GToolkit-FileBrowser-Events'
}

{ #category : #generated }
GtFileBrowserFolderViewModelViewModelDeselected >> fileBrowserFolderViewModel [
	<objectGetter: #folder>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectGetterTemplate'>

	^ fileBrowserFolderViewModel
]

{ #category : #generated }
GtFileBrowserFolderViewModelViewModelDeselected >> fileBrowserFolderViewModel: aFileBrowserFolderViewModel [
	<objectSetter: #folder>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectSetterTemplate'>

	fileBrowserFolderViewModel := aFileBrowserFolderViewModel
]
