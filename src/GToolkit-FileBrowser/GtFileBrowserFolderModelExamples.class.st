Class {
	#name : #GtFileBrowserFolderModelExamples,
	#superclass : #Object,
	#category : #'GToolkit-FileBrowser-Examples'
}

{ #category : #examples }
GtFileBrowserFolderModelExamples >> addFolder [
	<gtExample>
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
	
	^ GtFileBrowserFolderModel new fileReference: '.' asFileReference
]
