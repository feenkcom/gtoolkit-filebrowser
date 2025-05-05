Class {
	#name : #GtFileBrowserFolderModelExamples,
	#superclass : #Object,
	#category : #'GToolkit-FileBrowser-Examples'
}

{ #category : #examples }
GtFileBrowserFolderModelExamples >> addFolder [
	<gtExample>
	<return: #GtFileBrowserFolderModel>
	| folderModel aNewFolderModel folderAddedAnnouncement |
	folderModel := self currentFolder.
	folderModel fileBrowserFoldersModel
		when: GtFileBrowserFolderModelAddedAnnouncement
		do: [ :anAnnouncement | folderAddedAnnouncement := anAnnouncement ].

	aNewFolderModel := folderModel addNewFolder.
	self assert: folderAddedAnnouncement notNil.

	^ aNewFolderModel
]

{ #category : #examples }
GtFileBrowserFolderModelExamples >> currentFolder [
	<gtExample>
	<return: #GtFileBrowserFolderModel>
	^ GtFileBrowserFolderModel new fileReference: '.' asFileReference
]
